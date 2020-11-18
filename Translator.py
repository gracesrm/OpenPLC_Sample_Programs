import os,glob
import in_place
import hashlib

# Find st files and copy to destination folder
def getFileList(unspt_f):
  os.system("rm -rf ST_Tests ST_unspt ST_spt")
  os.system(f"rm -f {unspt_f}")
  os.system("mkdir ST_Tests ST_unspt ST_spt")
  print("Making directory for ST files")
  os.system("cp $(find . -name *.st) ST_Tests/")
  print("Copying ST files to ST_Tests")
  st_file_list = glob.glob("ST_Tests/*.st")

  st_f_set = set()
  for st_f in st_file_list:
    md5sum = hashlib.md5(open(st_f,'rb').read()).hexdigest()
    if md5sum in st_f_set:
      os.system(f'rm -f {st_f}')
      st_file_list.remove(st_f)
    st_f_set.add(md5sum)

  print(f"{len(st_file_list)} ST files found")
  return st_file_list


# Find st files containing 'program'
# Copy necessary 'function blocks' to the program file
def programCleaning(prog_file):
  # skip_code, fb_code, prog_code = False, False, False
  prog_name = []
  with in_place.InPlace(prog_file) as f:
    for codeline in f:           
      if skipUnsupportedCode(codeline):
        return False, []
      codeline = syntaxTranslation(codeline)
      f.write(codeline)

      if 'PROGRAM' in codeline.upper():
        if 'END_PROGRAM' not in codeline.upper():
          prog_name.append(codeline.split()[1])

        # TODO: add to program_dict
        # if prog_name not in program_dict:
        #   program_dict[prog_name] = {prog_file}
        # else:
        #   program_dict[prog_name].append(prog_file)
      
      '''
      if 'FUNCTION_BLOCK' in codeline:
        # TODO: add fb name to function_block_dict
        fb_name = codeline.split(' ')[1]
        fb_name = f'{prog_file}&{fb_name}'
        function_block_dict[fb_name] = fb_name
        fb_code = True
        if 'END_FUNCTION_BLOCK' in codeline:
          fb_code = False
      '''
            
  return True, prog_name


### To analyze the function blocks
def programAnalysis(prog_file, fb_def_dict, fb_decl_dict):
  with open(prog_file, 'r') as f:
    for codeline in f.readlines():
      und, fb_name = undefined_FBs(f, codeline)
      if und:
        print(f'{prog_file} has FB {fb_name} undefined')
      fb_def_dict = functionblock_def_Stat(codeline, fb_def_dict)
      fb_decl_dict = functionblockStat(codeline, fb_decl_dict)
  return fb_def_dict, fb_decl_dict


def undefined_FBs(f, codeline):
  common_var_types = ['INT', 'UINT', 'USINT', 'BOOL', 'TON', 'TIME', 'STRING', 'DATE', 'REAL', 'LREAL', 'DWORD', 'ANY', 'BYTE', 'R_TRIG', 'SINT']
  try:
    fb_name = codeline.split(';')[0].split(': ')[1].split(":")[0].strip()
    if fb_name.startswith('('):
      return False, fb_name
    if fb_name.startswith('ARRAY') or fb_name.startswith('INT') or fb_name.startswith('SINT'):
      return False, fb_name
    if fb_name not in common_var_types:
      for line in f:
        if f'FUNCTION_BLOCK {fb_name}' in line:
          return False
      return True, fb_name
  except:
    return False, ''


# what are the function blocks defined 
def functionblock_def_Stat(codeline, function_block_dict):
  if 'FUNCTION_BLOCK' in codeline and 'END_FUNCTION_BLOCK' not in codeline:
    fb_name = codeline.split(' ')[1].replace('\n','')
    if fb_name not in function_block_dict:
      function_block_dict[fb_name] = 0
    function_block_dict[fb_name] += 1

  return function_block_dict


# what are the function blocks used, and for how many times?
def functionblockStat(codeline, function_block_dict):
  common_var_types = ['INT', 'UINT', 'USINT', 'BOOL', 'TON', 'TIME', 'STRING', 'DATE', 'REAL', 'LREAL', 'DWORD', 'ANY', 'BYTE', 'R_TRIG', 'SINT']
  try:
    fb_name = codeline.split(';')[0].split(': ')[1].split(":")[0].strip()
    if fb_name.startswith('('):
      return function_block_dict
    if fb_name.startswith('ARRAY') or fb_name.startswith('INT') or fb_name.startswith('SINT'):
      return function_block_dict
    if fb_name not in common_var_types:
      if fb_name not in function_block_dict:
        function_block_dict[fb_name] = 0
      function_block_dict[fb_name] += 1
  except:
    exit
  return function_block_dict


### Syntax translation
def syntaxTranslation(codeline):
  # replace 'ELSEIF' with 'ELSIF'
  codeline = codeline.replace('ELSEIF', 'ELSIF')
  codeline = codeline.replace('{*', '(*')   # some code uses {* *} as comment
  codeline = codeline.replace('*}', '*)')
  codeline = codeline.replace("$", "_")
  codeline = codeline.replace("__", "_2")

  if "//" in codeline:
    codeline = codeline.replace("//", "(* ")
    codeline = codeline + " *)"
    return codeline
  # those do not need ';' in OpenPLC: END_TYPE, END_RESOURCE, END_CONFIGURATION
  # those not supported in OpenPLC: END_STEP, END_ACTION, END_METHOD,END_INTERFACE
  end_kws = ["END_IF", "END_CASE", "END_WHILE", "END_FOR", "END_REPEAT", "END_STRUCT"]
  # adding ';' to END_IF, END_CASE if not present
  for end_kw in end_kws:
    if end_kw in codeline.upper():
      if f"{end_kw};" not in codeline.upper():
        codeline = codeline.replace(end_kw, f"{end_kw};")
  # remove disturbing comments to eliminate compile errors
  trash_info = ["(*LrWXP*)", "(*IRWXp*)", "(*ORWxp*)"]
  for ti in trash_info:
    if ti.upper() in codeline.upper():
      codeline = codeline.upper().replace(ti.upper(), '')
  # timing precision 
  if "TIME#" in codeline and ".0" in codeline:
    codeline = codeline.replace(".0", "")
  
  # function block name and instances should not be the same
  codeline = codeline.upper().replace("CRANE : CRANE;", "CRANE : CRANE_FB;")
  codeline = codeline.upper().replace("FUNCTION_BLOCK CRANE", "FUNCTION_BLOCK CRANE_FB")
  codeline = codeline.upper().replace("STAMP : STAMP;", "STAMP : STAMP_FB;")
  codeline = codeline.upper().replace("FUNCTION_BLOCK STAMP", "FUNCTION_BLOCK STAMP_FB")
  codeline = codeline.replace("UINT := #", "UINT := UINT#")
  codeline = codeline.replace("USINT", "UINT")

  return codeline

### Skip and log unsupported code
def skipUnsupportedCode(codeline):
  # unsupported = ["END_STEP", "END_ACTION", "END_METHOD", "END_INTERFACE", "IMPLEMENTS", "EXTENDS"]
  unsupported = ["METHOD", "INTERFACE", "IMPLEMENTS", "EXTENDS", "CLASS"]
  for uns in unsupported:
    if uns in codeline.upper():
      return True
  return False

def logUnsupportedFiles(unspt_f, prog_file):
  pn = prog_file.split('/')[-1]
  cmd = f"mv {prog_file} ./ST_unspt/{pn}"
  os.system(cmd)
  print(f"Skipping {prog_file}")
  print(f"Logging {prog_file} to {unspt_f}")
  cmd = f"echo {prog_file} >> {unspt_f}"
  os.system(cmd)


### Add configuration and resources to the program
def addConfRes(unspt_f, prog_name, prog_file):
  if not prog_name:
    logUnsupportedFiles(unspt_f, prog_file)
    return prog_file
  ln1 = "CONFIGURATION Config0"
  ln2 = "  RESOURCE Res0 ON PLC"
  ln3 = "    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);"
  ln5 = "  END_RESOURCE"
  ln6 = "END_CONFIGURATION"
  with open(prog_file, 'a+') as f:
    f.write('\n\n')
    f.write(f'{ln1}\n')
    f.write(f'{ln2}\n')
    f.write(f'{ln3}\n')
    for i, pn in enumerate(prog_name):
      print(f"Writing configuration to {pn} in {prog_file}")
      ln4 = f"    PROGRAM instance{i} WITH task0 : {pn};"
      f.write(f'{ln4}\n')
    f.write(f'{ln5}\n')
    f.write(f'{ln6}\n')
  return prog_file


###
def main():
  unspt_f = "unsupported.log"
  st_file_list = getFileList(unspt_f)
  ### For Analysis Purpose, comment out
  # fb_def_dict, fb_decl_dict = dict(), dict()
  for prog_file in st_file_list:
    ### For Analysis Purpose, comment out
    # fb_def_dict, fb_decl_dict = programAnalysis(prog_file, fb_def_dict, fb_decl_dict)
    spt, prog_name = programCleaning(prog_file)
    if spt:
      prog_file = addConfRes(unspt_f, prog_name, prog_file)
    else: 
      logUnsupportedFiles(unspt_f, prog_file)
  ### For Analysis Purpose, comment out
  # print(f'{len(fb_def_dict)} function blocks defined: ', fb_def_dict)
  # print(f'{len(fb_decl_dict)} function blocks declared: ', fb_decl_dict)




if __name__ == "__main__":
    main()