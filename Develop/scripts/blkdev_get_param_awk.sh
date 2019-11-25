# cmd_1
DISK="sdc";
if [[ ! -b "/dev/$DISK" ]]; then
  DISK="$( ls -l /dev/mapper/ |awk "/ vg00-lv_test / {gsub(\"../\",\"\",\$11);
  print \$11}" )";
fi; 
cat "/sys/block/$DISK/stat"

# one_line_1
DISK="sdc"; if [[ ! -b "/dev/$DISK" ]]; then DISK="$( ls -l /dev/mapper/ |awk "/ vg00-lv_test / {gsub(\"../\",\"\",\$11); print \$11}" )"; fi; cat "/sys/block/$DISK/stat"




# cmd_2
DISK="vg00-lv_test";
if [[ ! -b "/dev/$DISK" ]]; then
  DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$11);
  print \$11}" )";
fi; 
awk "/ $DISK / {print  \$0}" /proc/diskstats;

# one_line_2
DISK="vg00-lv_test"; if [[ ! -b "/dev/$DISK" ]]; then DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$11); print \$11}" )"; fi; awk "/ $DISK / {print  \$0}" /proc/diskstats;



# cmd_3
DISK="vg00-lv_test2";
if [[ ! -b "/dev/$DISK" ]]; then
  DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$11);
  print \$11}" )";
fi; 
if [[ "$DISK" != "" ]]; then 
  awk "/ $DISK / {print  \$0}" /proc/diskstats;
else
  exit 100;
fi

# one_line_3
DISK="$1"; if [[ ! -b "/dev/$DISK" ]]; then DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$$11); print \$$11}" )"; fi;  if [[ "$DISK" != "" ]]; then awk "/ $DISK / {print  \$$0}" /proc/diskstats; else exit 100; fi



# cmd_4
DISK="vg00-lv_test";
if [[ ! -b "/dev/$DISK" ]]; then
  DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$11);
  print \$11}" )";
fi;
if [[ "$DISK" != "" ]]; then
  grep -m1 " $DISK " /proc/diskstats |\
    awk '
      BEGIN { printf("{\n\t\"data\":["); }
      {
        printf("\n\t\t{\"Read_Operation\":\"" $4 "\"},");
        printf("\n\t\t{\"Read_merge\":\"" $5 "\"},");
        printf("\n\t\t{\"Read_sector\":\"" $6 "\"},");
        printf("\n\t\t{\"Read_time\":\"" $7 "\"},");
        printf("\n\t\t{\"Write_Operation\":\"" $8 "\"},");
        printf("\n\t\t{\"Write_merge\":\"" $9 "\"},");
        printf("\n\t\t{\"Write_sector\":\"" $10 "\"},");
        printf("\n\t\t{\"Write_time\":\"" $11 "\"},");
        printf("\n\t\t{\"IO_Queue\":\"" $12 "\"},");
        printf("\n\t\t{\"IO_time\":\"" $13 "\"},");
        printf("\n\t\t{\"IO_time_weight\":\"" $14 "\"}");
      }
      END { printf("\n\t]\n}\n"); }
    '
else
  exit 100;
fi

# one_line_4
DISK="$1"; if [[ ! -b "/dev/$DISK" ]]; then DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$$11); print \$$11}" )"; fi; if [[ "$DISK" != "" ]]; then   grep -m1 " $DISK " /proc/diskstats | awk 'BEGIN { printf("{\n\t\"data\":["); }  { printf("\n\t\t{\"Read_Operation\":\"" $$4 "\"},"); printf("\n\t\t{\"Read_merge\":\"" $$5 "\"},"); printf("\n\t\t{\"Read_sector\":\"" $$6 "\"},"); printf("\n\t\t{\"Read_time\":\"" $$7 "\"},"); printf("\n\t\t{\"Write_Operation\":\"" $$8 "\"},"); printf("\n\t\t{\"Write_merge\":\"" $$9 "\"},"); printf("\n\t\t{\"Write_sector\":\"" $$10 "\"},"); printf("\n\t\t{\"Write_time\":\"" $$11 "\"},"); printf("\n\t\t{\"IO_Queue\":\"" $$12 "\"},"); printf("\n\t\t{\"IO_time\":\"" $$13 "\"},"); printf("\n\t\t{\"IO_time_weight\":\"" $$14 "\"}"); }   END { printf("\n\t]\n}\n"); }'; else exit 100; fi



# cmd_5
DISK="vg00-lv_test";
if [[ ! -b "/dev/$DISK" ]]; then
  DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$11);
  print \$11}" )";
fi;
if [[ "$DISK" != "" ]]; then
  grep -m1 " $DISK " /proc/diskstats |\
    awk '
      BEGIN { printf("{"); }
      {
        printf("\n\t\"Name\":\"" $3 "\",");
        printf("\n\t\"Read_Operation\":" $4 ",");
        printf("\n\t\"Read_merge\":" $5 ",");
        printf("\n\t\"Read_sector\":" $6 ",");
        printf("\n\t\"Read_time\":" $7 ",");
        printf("\n\t\"Write_Operation\":" $8 ",");
        printf("\n\t\"Write_merge\":" $9 ",");
        printf("\n\t\"Write_sector\":" $10 ",");
        printf("\n\t\"Write_time\":" $11 ",");
        printf("\n\t\"IO_Queue\":" $12 ",");
        printf("\n\t\"IO_time\":" $13 ",");
        printf("\n\t\"IO_time_weight\":" $14 "");
      }
      END { printf("\n}\n"); }
    '
else
  exit 100;
fi

# one_line_5
UserParameter=custom.blkdev.all_stat[*],DISK="$1"; if [[ ! -b "/dev/$DISK" ]]; then DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$$11);print \$$11}" )"; fi; if [[ "$DISK" != "" ]]; then grep -m1 " $DISK " /proc/diskstats |awk 'BEGIN { printf("{"); }   {printf("\n\t\"Name\":\"" $$3 "\","); printf("\n\t\"Read_Operation\":" $$4 ","); printf("\n\t\"Read_merge\":" $$5 ","); printf("\n\t\"Read_sector\":" $$6 ","); printf("\n\t\"Read_time\":" $$7 ","); printf("\n\t\"Write_Operation\":" $$8 ","); printf("\n\t\"Write_merge\":" $$9 ","); printf("\n\t\"Write_sector\":" $$10 ","); printf("\n\t\"Write_time\":" $$11 ","); printf("\n\t\"IO_Queue\":" $$12 ","); printf("\n\t\"IO_time\":" $$13 ","); printf("\n\t\"IO_time_weight\":" $$14 ""); }    END { printf("\n}\n"); }'; else exit 100; fi



# cmd_6
DISK="vg00-lv_test";
if [[ ! -b "/dev/$DISK" ]]; then
  DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$11); print \$11}" )";
fi;
if [[ "$DISK" != "" ]]; then
  grep -m1 " $DISK " /proc/diskstats |\
   column \
     --json \
     --table-name ZBX_Disk_Stat \
     --table-columns major,minor,name,read_complete,read_merge,read_sector,read_time,write_complete,write_merge,write_sector,write_time,io_queue,io_time,io_time_weight,discard_complete,discard_merge,discard_sector,discard_time \
     --table-hide  major,minor,read_merge,write_merge,io_time,io_time_weight,discard_complete,discard_merge,discard_sector,discard_time
else
  exit 100;
fi |jq .

# one_line_6
serParameter=custom.blkdev.all_stat[*],DISK="$1"; if [[ ! -b "/dev/$DISK" ]]; then DISK="$( ls -l /dev/mapper/ |awk "/ $DISK / {gsub(\"../\",\"\",\$$11);print \$$11}" )"; fi; if [[ "$DISK" != "" ]]; then grep -m1 " $DISK " /proc/diskstats | column --json --table-name ZBX_Disk_Stat --table-columns major,minor,name,read_complete,read_merge,read_sector,read_time,write_complete,write_merge,write_sector,write_time,io_queue,io_time,io_time_weight,discard_complete,discard_merge,discard_sector,discard_time --table-hide  major,minor,read_merge,write_merge,io_time,io_time_weight,discard_complete,discard_merge,discard_sector,discard_time; else exit 100; fi
