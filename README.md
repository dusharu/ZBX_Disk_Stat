# ZBX_Disk_Stat
Send statistic from /proc/diskstats to Zabbix without any additional package and program

This is small project for my Home server

# Features
  * AutoDiscovery BlockDev and Filter by [global regexp](https://www.zabbix.com/documentation/3.4/manual/regular_expressions): block_dev_filter 
  * Collect Read\Write Operations per second
  * Collect Read\Write Sectors per second
  * Calculate Time for 1 Read\Write Operations
    * Trigger when IO_Time >30ms at last 5min
  * Collect IO Queue
  * Convert DM(Device Mapper) device to pretty Name
    * Get stat for `dm-1` but print for user `vg00-lv_root`
    * After reboot `dm-1` may change to `dm-2`, but stat will be correct

# Install
  1. Add parametrs to zabbix-agent.conf

```
#### enable Include in config
# /etc/zabbix/zabbix_agentd.conf
echo "Include=/etc/zabbix-agent.d/*.conf" >> /etc/zabbix/zabbix_agentd.conf

#### copy config 
mkdir -p /etc/zabbix-agent.d/ && cd /etc/zabbix-agent.d/
curl -O 'https://raw.githubusercontent.com/dusharu/ZBX_Disk_Stat/master/config_zabbix-agent/Disk_Stat.conf'


#### restart zabbix-agent
# RHEL/CentOS
systemctl restart zabbix-agentd
# Debian/Ubuntu
systemctl restart zabbix-agent
# Gentoo
/etc/init.d/zabbix-agentd restart
```
  2. [Import](https://www.zabbix.com/documentation/3.4/manual/xml_export_import/templates) [Template_ZBX/ZBX_Disk_Stat.xml](Template_ZBX/ZBX_Disk_Stat.xml)
  3. Create [global regexp](https://www.zabbix.com/documentation/3.4/manual/regular_expressions): block_dev_filter
     * ^$ - result FALSE - device was remove
     * .*snapshot.* - result FALSE - filter LVM snapshot
     * -real$ - result FALSE - [filter LVM snapshot](https://rwmj.wordpress.com/2010/09/28/how-lvm-does-snapshots/)
     * -cow$ - result FALSE - [filter LVM snapshot](https://rwmj.wordpress.com/2010/09/28/how-lvm-does-snapshots/)
     * ^xvd[a-z]*[0-9]+$ - result FALSE - filter partitions
     * ^[hs]d[a-z]*[0-9]+$ - result FALSE - filter partitions
     * ^loop[0-9]*$ - result FALSE - filter loop device
  4. Add host to group "Disk_Stat: io_block_dev"
  5. Wait before Zabbix Discovery and Get Some Data


# Screenshoot
Graph create by [Grafana](https://grafana.com/) and [Zabbix plugin](https://grafana.com/grafana/plugins/alexanderzobnin-zabbix-app)
![1-Disk_Stat_IOPS.png](/Screenshoots/1-Disk_Stat_IOPS.png)
![2-Disk_Stat_RW_Sectors.png](/Screenshoots/2-Disk_Stat_RW_Sectors.png)
![3-Disk_Stat_IO_time.png](/Screenshoots/3-Disk_Stat_IO_time.png)
![4-Disk_Stat_IO_Queue.png](/Screenshoots/4-Disk_Stat_IO_Queue.png)

# Files
  * config_zabbix-agent - config for zabbix Agent
  * Template_ZBX - Zabbix Template
  * Develop - information for Developers
  * README.md - information for Users
  * Screenshoots - Screensoot for README.md
  * LICENSE - license file

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
  3. [Wikipedia.org: maximum IOPS on different Disk](https://en.wikipedia.org/wiki/IOPS)
  4. [RAID calcuator](https://wintelguy.com/raidperf.pl)

# ToDo
  1. Add link with information about maximum IO_time
