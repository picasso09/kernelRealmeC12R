dtb-$(CONFIG_ARCH_MEDIATEK) += auto2712p1v1-ivi-boot.dtb
dtb-$(CONFIG_ARCH_MEDIATEK) += auto2712p1v1-ivi-nand-boot.dtb

#ifdef  VENDOR_EDIT
#Wanghao@BSP.Kernel.Driver, 2020/04/28, change for dts file
ifeq ($(strip $(CONFIG_BUILD_ARM64_APPENDED_DTB_IMAGE)), y)
dtb-y += $(addsuffix .dtb, $(notdir $(subst $\",,$(CONFIG_BUILD_ARM64_APPENDED_DTB_IMAGE_NAMES))))
endif

ifeq ($(strip $(CONFIG_BUILD_ARM64_DTB_OVERLAY_IMAGE)), y)
dtb-y += $(addsuffix .dtb, $(notdir $(subst $\",,$(CONFIG_BUILD_ARM64_DTB_OVERLAY_IMAGE_NAMES))))
endif

always		:= $(dtb-y)
subdir-y	:= $(dts-dirs)
clean-files	:= *.dtb
#endif
