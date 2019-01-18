# PassArrayInToBashScript

Parameter1:
  Ether an (Array or File) of Server FQDN's
  
Parameter2:
  Number of port you would like to test

Execute Scirpt with Arry:
  ./TestPort.sh -Argument1 "${array[@]} -Argument2 8080

Execute Script with File:
  ./TestPort.sh -Argument1 /PathTo/File.txt -Argument2 445
