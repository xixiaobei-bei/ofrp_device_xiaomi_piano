#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="piano"

# ========== 基础设备配置 ==========
export LC_ALL="C"
export FOX_AB_DEVICE=1                                  # AB 分区设备
export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1           # 有独立 recovery 分区
export FOX_VIRTUAL_AB_DEVICE=1                          # 虚拟 AB
export OF_USE_AIDL_BOOT_CONTROL=1                       # AIDL boot control HAL
export OF_DYNAMIC_FULL_SIZE=11811160064                  # super 分区总大小

# ========== 构建环境 ==========
export FOX_VANILLA_BUILD=1                              # 纯 vanilla 构建（不含 Magisk 等）
export OF_FORCE_PREBUILT_KERNEL=1                       # 使用预编译内核
export OF_TWRP_COMPATIBILITY_MODE=1                     # TWRP 兼容模式
export FOX_MAINTAINER_PATCH_VERSION=$(date +%y%m%d)      # 维护者版本日期
export OF_MAINTAINER="AviderMin"                        # 维护者名称

# ========== 压缩工具 ==========
export OF_USE_LZ4_COMPRESSION=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_ZSTD_BINARY=1
export FOX_USE_DATE_BINARY=1
export FOX_USE_GREP_BINARY=1
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_UPDATED_MAGISKBOOT=1                     # 更新版 MagiskBoot
export FOX_USE_FSCK_EROFS_BINARY=1                      # EROFS 文件系统检查
export FOX_USE_PATCHELF_BINARY=1                        # ELF 二进制修补工具
export FOX_MOVE_MAGISK_INSTALLER_TO_RAMDISK=1           # Magisk 安装器移到 ramdisk

# ========== 分区与存储配置 ==========
export OF_ENABLE_LPTOOLS=1                              # 逻辑分区工具
export OF_ENABLE_ALL_PARTITION_TOOLS=1                  # 全部分区工具
export OF_ENABLE_FS_COMPRESSION=1                       # 文件系统压缩支持
export OF_USE_DMCTL=1                                   # dmctl 设备映射控制
export OF_FORCE_DATA_FORMAT_F2FS=1                      # 强制 data 格式化 f2fs
export OF_UNBIND_SDCARD_F2FS=1                          # 解绑 sdcard f2fs
export FOX_SETTINGS_ROOT_DIRECTORY="/persist/OFRP"      # 设置存储路径
export FOX_ALLOW_EARLY_SETTINGS_LOAD=1                  # 允许早期加载设置
export FOX_MISCELLANEOUS_ROOT_DIRECTORY="/sdcard"       # 杂项文件根目录
export OF_WIPE_METADATA_AFTER_DATAFORMAT=1              # 格式化后清除 metadata

# ========== MIUI / HyperOS 相关 ==========
export OF_NO_MIUI_PATCH_WARNING=1                       # 跳过 MIUI 补丁检查
export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1                 # 默认关闭 MIUI OTA 恢复

# ========== 解密相关 ==========
export OF_NO_RELOAD_AFTER_DECRYPTION=1                  # 解密后不重载 UI
export OF_DISPLAY_FORMAT_FILESYSTEMS_DEBUG_INFO=1       # 显示文件系统调试信息

# ========== 显示与界面 ==========
export OF_USE_GREEN_LED=0                               # 关闭绿色 LED
export OF_HIDE_NOTCH=1                                  # 隐藏刘海
export OF_ALLOW_DISABLE_NAVBAR=0                        # 不允许禁用导航栏
export FOX_DELETE_AROMAFM=1                             # 删除 Aroma 文件管理器
export OF_OPTIONS_LIST_NUM=6                            # 选项列表数量
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1               # 跳过 Treble 兼容性检查

# ========== Root 方案支持 ==========
export FOX_ENABLE_KERNELSU_SUPPORT=1                    # KernelSU
export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1               # KernelSU Next
export FOX_ENABLE_SUKISU_SUPPORT=1                      # SukiSU

F=$(find "device" -maxdepth 2 -name "piano")
# Change splash to black
\cp -fp bootable/recovery/gui/theme/portrait_hdpi/splash.xml "$F"/recovery/root/twres/splash.xml
sed -i 's/value="#D34E38"/value="#000000"/g' "$F"/recovery/root/twres/splash.xml
sed -i 's/value="#FF8038"/value="#000000"/g' "$F"/recovery/root/twres/splash.xml

#