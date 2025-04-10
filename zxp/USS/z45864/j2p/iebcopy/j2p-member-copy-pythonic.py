#!/usr/bin/env python3
import os
from zoautil_py import datasets, mvscmd
from zoautil_py.types import DDStatement, FileDefinition, DatasetDefinition
from mvs_command_support import create_input_dd

userid = os.environ["LOGNAME"]

def member_copy(input_data_set : str, output_data_set : str, member_list: list) ->int:
   dd_list=[]

   dd_list.append(DDStatement("INDS", DatasetDefinition(input_data_set.upper())))
   dd_list.append(DDStatement("OUTDS", DatasetDefinition(output_data_set.upper())))
   dd_list.append(DDStatement("SYSPRINT", FileDefinition(f"/z/{userid.lower()}/copy_output")))
   
   members=','.join(map(str,member_list))
   dd_list.append(create_input_dd([" COPY OUTDD=OUTDS,INDD=INDS",f"SELECT MEMBER=({members.upper()})"],ddname="SYSIN"))

   return_data = mvscmd.execute("IEBCOPY", dds=dd_list)

   return_dictionary = return_data.to_dict()

   if return_dictionary["rc"]==0:
      print("Members copied!")
   else:
      print(f"Error {return_dictionary['rc']} when trying to copy.")
      print(f"Error message is: {return_dictionary['stderr_response']}")
      print("Additional info can be found in copy_output")

   return return_dictionary['rc']

   cleanup_temporaries()

def main():
   return_code = member_copy()
   if 0 ==return_code:
      print("Program ended")
   else:
      print("Program Abended")

if __name__ == "__main__":
    main()
    