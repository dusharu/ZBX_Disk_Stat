# just copy to console
awk '
BEGIN {
  printf("{\n\t\"data\":[");
}
{
  if (FNR != 1) {printf ("\t},")};
  printf("\n\t\t{\t\"{#DEVBLK}\":\"");
  if (match($3, /^dm-[0-9]*/)) {
    system("ls -l /dev/mapper/ |grep -e \"../" $3  "$\" | awk \"{print \\$9}\"|tr -d \"\\n\"");
  } else {
    printf($3);
  };
  printf("\"");
}
END {
  {printf ("\t}\n")};
  printf("\t]\n}\n");
}' /proc/diskstats

#one line
awk ' BEGIN { printf("{\n\t\"data\":["); } { if (FNR != 1) {printf ("\t},")}; printf("\n\t\t{\t\"{#DEVBLK}\":\""); if (match($3, /^dm-[0-9]*/)) { system("ls -l /dev/mapper/ |grep -e \"../" $3  "$\" | awk \"{print \\$9}\"|tr -d \"\\n\""); } else { printf($3); }; printf("\""); } END { {printf ("\t}\n")} printf("\t]\n}\n"); }' /proc/diskstats

