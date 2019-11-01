#include "convert.mqh"

const string file_in = "gcq19_price-history-04-07-2019.csv";
const string file_out = "filename_out";

int file_in_handle = FileOpen(file_in,FILE_READ|FILE_TXT);
int file_out_handle = FileOpen(file_out,FILE_READ|FILE_WRITE|FILE_TXT);

while(!FileIsEnding(file_in_handle)) { 

 string str = FileReadString(file_in_handle);
 if (Convert(str)) FileWriteString(file_out_handle,str);

}

FileClose(file_in_handle);
FileClose(file_out_handle);
