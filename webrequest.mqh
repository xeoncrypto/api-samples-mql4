#include "convert.mqh"

const string   host = "api.example.com";
const string   path = "/dataset/b7c2308bn21cbydsnf3i";

const string   file_out = "filename_out";
int            file_out_handle = FileOpen(file_out,FILE_READ|FILE_SHARE_READ|FILE_WRITE|FILE_SHARE_WRITE|FILE_TXT);
//if (file_out_handle==INVALID_HANDLE) return;

uchar          http_request[];   
const string   http_request_method = "GET";
const string   http_request_header = "X-API-Key: e0d1c2115441534314f43b65ec4eecea4eeeec68a1e7e272b480b9a96";
const int      http_request_timeout = 5;
uchar          http_response[];
int            http_response_code;
string         http_response_headers;

http_response_code = WebRequest(http_request_method,"https://"+host+path,http_request_header,http_request_timeout*1000,http_request,http_response,http_response_headers);
//if (http_response_code!=200) return;

string str;

for (int i=0;i<ArraySize(http_response);i++) {

  if (Row(http_response[i])) {

    if (Convert(str)) FileWriteString(file_out_handle,str);
    str = "";

    continue;

  }   

  StringAdd(str,CharToString(http_response[i]));

}

ArrayFree(http_response);

//FileFlush(file_out_handle);

//loop

FileClose(file_out_handle);
