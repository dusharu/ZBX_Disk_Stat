export DISK=dm-3
watch -n1 ' grep " $DISK " /proc/diskstats |while read -r major minor name read_complete read_merge read_sector read_time write_complete write_merge write_sector write_time io_queue io_time io_time_weight discard_complete discard_merge discard_sector discard_time; do
    echo "major: $major";
    echo "minor: $minor";
    echo "name: $name";
    echo "read_complete: $read_complete";
    echo "read_merge: $read_merge";
    echo "read_sector: $read_sector";
    echo "read_time: $read_time"
    echo "write_complete: $write_complete";
    echo "write_merge: $write_merge";
    echo "write_sector: $write_sector";
    echo "write_time: $write_time";
    echo "io_queue: $io_queue";
    echo "io_time: $io_time";
    echo "io_time_weight: $io_time_weight"
    echo "discard_complete: $discard_complete";
    echo "discard_merge: $discard_merge";
    echo "discard_sector: $discard_sector";
    echo "discard_time: $discard_time";
  done '
