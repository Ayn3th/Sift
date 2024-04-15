#!/bin/bash

# 检查输入参数
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <path_to_directory_to_sync>"
    exit 1
fi

SOURCE_DIR="$1"  # 本地源目录路径，将会同步这个目录到远程机器

# 定义目标主机和它们的目标路径的数组
# 注意：假设远程目录路径和源目录保持一致
declare -A HOSTS_AND_PATHS=(
    ["root@192.168.6.129"]="$SOURCE_DIR"
    ["root@192.168.6.130"]="$SOURCE_DIR"
)

# 循环遍历每一个主机和路径
for host in "${!HOSTS_AND_PATHS[@]}"; do
    dest_path=${HOSTS_AND_PATHS[$host]}
    echo "Syncing $SOURCE_DIR to $host:$dest_path"
    rsync -avz --delete "$SOURCE_DIR" "$host:$dest_path"

    # 检查命令执行状态
    if [ $? -eq 0 ]; then
        echo "Directory successfully synced to $host."
    else
        echo "Failed to sync directory to $host."
    fi
done

