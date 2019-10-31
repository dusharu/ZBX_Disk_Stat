# ZBX_Disk_Stat
Send statistic from /proc/diskstats to Zabbix without any additional package and program
Small Project for Home_Server

# Features
  * AutoDiscovery BlockDev and Filter by [global regexp](https://www.zabbix.com/documentation/3.4/manual/regular_expressions): block_dev_filter 
  * Collect Read\Write Operations per second
  * Collect Read\Write Sectors per second
  * Calculate Time for 1 Read\Write Operations
  * Collect IO Queue
  * Convert DM(Device Mapper) device to Human Name
    * dm-1 -> vg00-lv_root

# Install
  1. Add parametrs to zabbix-agent.conf
  2. Import Template
  3. Check [global regexp](https://www.zabbix.com/documentation/3.4/manual/regular_expressions): block_dev_filter
    * ^$ - result FALSE - device was remove while 
    * .*snapshot.* - result FALSE - filter LVM snapshot
    * -real$ - result FALSE - [filter LVM snapshot](https://rwmj.wordpress.com/2010/09/28/how-lvm-does-snapshots/)
    * -cow$ - result FALSE - [filter LVM snapshot](https://rwmj.wordpress.com/2010/09/28/how-lvm-does-snapshots/)
    * ^xvd[a-z]*[0-9]+$ - result FALSE - filter partitions
    * ^[hs]d[a-z]*[0-9]+$ - result FALSE - filter partitions
    * ^loop[0-9]*$ - result FALSE - filter loop device
  4. Add host to group "Disk_Stat: io_block_dev"
  5. Wait before Zabbix Discovery and Get Some Data

```
#### enable Include in config
# /etc/zabbix/zabbix_agentd.conf
echo "Include=/etc/zabbix-agent.d/*.conf" >> /etc/zabbix/zabbix_agentd.conf

#### copy config 
mkdir -p /etc/zabbix-agent.d/ && cd /etc/zabbix-agent.d/
curl -O

#### restart zabbix-agent
# RHEL/CentOS
systemctl restart zabbix-agentd
# Debian/Ubuntu
systemctl restart zabbix-agent
# Gentoo
/etc/init.d/zabbix-agentd restart
```

# Screenshoot

# Debug Command
## Test Discovery
```
zabbix_get -s <IP|Server_Name> -k custom.blkdev.discovery |jq .
```
## Get statistic
```
zabbix_get -s 192.168.1.200 -k custom.blkdev.all_stat[vg00-lv_root] | jq .
```
# Docs
  1. [kernel.org: Describe /proc/diskstats](https://www.kernel.org/doc/Documentation/ABI/testing/procfs-diskstats)
  2. [kernel.org: I/O statistics fields](https://www.kernel.org/doc/Documentation/admin-guide/iostats.rst)

# ToDo
  1. Add trigers
  2. Add Graphs to Zabbix
  3. Add Some Theory to README
