//Time,Open,High,Low,Last,Change,Volume,"Open Int"
//03/22/19,1321.4,1326.6,1319.6,1324.8,5.1,2667,45914
//03/21/19,1326.1,1332.2,1316,1319.7,5.7,5166,45273

#define NEWLINE 0x0A
#define CARRIAGERETURN 0x0D

bool Row(uchar u) {

   if (u==CARRIAGERETURN || u==NEWLINE) return true;

   return false;

}

bool Convert(string &s) {
   
   if (StringLen(s)<1) return false;
    
   string column[];
   StringSplit(s,StringGetCharacter(",",0),column);
   
   if (ArraySize(column)<1) return false;
   
   string part_column_datetime[];
   StringSplit(column[0],StringGetCharacter("/",0),part_column_datetime);
   
   if (ArraySize(part_column_datetime)<3 || ArraySize(column)<7) return false;

   s = StringFormat("%s %I64i%s",            
       column[6], // For "Real Volume" column[6], for "Open Interest" column[7]
       (ulong)StringToTime(StringFormat("20%s.%s.%s",part_column_datetime[2],part_column_datetime[0],part_column_datetime[1])),
       CharToString(NEWLINE));
       
   return true;

}
