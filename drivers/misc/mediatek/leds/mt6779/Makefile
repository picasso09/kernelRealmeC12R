# SPDX-License-Identifier: GPL-2.0

obj-$(CONFIG_MTK_LEDS) := mtk_leds.o

#ifdef VENDOR_EDIT
#Bin.Liu@BSP.Fingerprint.Secure 2019/04/12, Add for led ic ktd2026
obj-$(CONFIG_OPPO_BACKLIGHT_KTD2026) += oppo_ktd2026/
#obj-$(CONFIG_OPPO_BACKLIGHT_KTD2026) += oppo_ktd2026b/
#Bin.Liu@BSP.Fingerprint.Secure 2019/04/12, Add for led ic aw2026
obj-$(CONFIG_AW2026_SLED) += oppo_aw2026/
#endif
ccflags-y += -I$(srctree)/drivers/misc/mediatek/video/include
