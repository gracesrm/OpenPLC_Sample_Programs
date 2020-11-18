## README

Put `Translator.py` outside of the ST file directory
- python3 Translator.py

Newly added to the translator: 
- [x] openplc time precision does not support floating point
- [x] function block name should not be the same with the FB instance
- [x] $ not supported, replaced with _, and further replaced __ with _2
- [x] comment // are not well addressed 


Manually check the unsupported files, adjust these to be supported
- whether used Function Blocks are declared
- type has to be defined before program
- real type has to have floating point
- Action name needs a : after

Put `compile_ST.py` in the folder of '~/OpenPLC_v3/webserver/scripts'
- compile and test
