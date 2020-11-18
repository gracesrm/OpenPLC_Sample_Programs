import os,glob,time


def compile_ST():
  src_path = "/home/test/OpenPLC_Sample_Programs/Github_Collection/verifaps-lib/ST_Tests_VM/ST_spt_w_manual/*.st"
  dest_path = "/home/test/OpenPLC_v3/webserver/st_files/"
  os.system(f"cp {src_path} {dest_path}")

  spt_file_list = glob.glob(src_path)

  for spt_f in spt_file_list:
    print("compiling " + str(spt_f))
    spt_f = spt_f.split("/")[-1]
    rtn = os.popen(f"./compile_program.sh {spt_f}").read()
    print(f"compilation results {rtn}")
    if "error" not in rtn:
      now_path = '/home/test/OpenPLC_Sample_Programs/Github_Collection/verifaps-lib/ST_Tests_VM/ST_spt_w_manual/' + spt_f
      succ_path = "/home/test/OpenPLC_Sample_Programs/Github_Collection/verifaps-lib/ST_Tests_VM/successed_ST/" + spt_f
      os.system(f"mv {now_path} {succ_path}")
    else:
      time.sleep(2)


if __name__ == "__main__":
  compile_ST()
