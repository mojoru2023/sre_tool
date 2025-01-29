
# 查询日志文件大小


find /var/lib/docker/containers/ -name "*.log" -exec du -h {} \; | awk '{print $2 ": " $1}'



# 清空日志文件 

find /var/lib/docker/containers/ -name "*.log" -exec truncate -s 0 {} \;
