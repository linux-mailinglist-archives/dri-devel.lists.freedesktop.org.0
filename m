Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1121F4F47
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5389AEE;
	Wed, 10 Jun 2020 07:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E6389A91
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 07:38:28 +0000 (UTC)
IronPort-SDR: LxMuI3LQTUNuDZSEbUcr0mgzErQx2b7U8wzKHczTOMLHtmzjKwOrbaOCOusYkt2+sTuV9WEnwh
 emhgeusee5xg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 00:38:24 -0700
IronPort-SDR: 6+4534j3z7cY5WqN1JjMwvTho6ob+FELbX8gMX1P60xWYzHuCqsjIQOtSe6M676qSUcPvfO+Gp
 Xew36qcV33Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; 
 d="gz'50?scan'50,208,50";a="274873553"
Received: from lkp-server01.sh.intel.com (HELO 19cb45ee048e) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 10 Jun 2020 00:38:21 -0700
Received: from kbuild by 19cb45ee048e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jivJU-00005w-Jd; Wed, 10 Jun 2020 07:38:20 +0000
Date: Wed, 10 Jun 2020 15:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 4/4] drm: pl111: Update documentation
Message-ID: <202006101538.mV5c2loX%lkp@intel.com>
References: <20200609200446.153209-4-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20200609200446.153209-4-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master v5.7 next-20200609]
[cannot apply to drm-tip/drm-tip drm/drm-next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/drm-pl111-Credit-where-credit-is-due/20200610-041025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

include/kunit/test.h:182: warning: Function parameter or member 'debugfs' not described in 'kunit_suite'
include/kunit/test.h:182: warning: Function parameter or member 'log' not described in 'kunit_suite'
include/kunit/test.h:268: warning: Excess function parameter 'suites' description in 'kunit_test_suites'
include/net/mac80211.h:832: warning: Enum value 'IEEE80211_TX_CTRL_HW_80211_ENCAP' not described in enum 'mac80211_tx_control_flags'
net/mac80211/sta_info.h:104: warning: Enum value 'WLAN_STA_USES_ENCRYPTION' not described in enum 'ieee80211_sta_info_flags'
drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
include/linux/dma-buf.h:347: warning: Incorrect use of kernel-doc format:          * @move_notify
include/linux/gpio/driver.h:499: warning: Function parameter or member 'gc' not described in 'gpiochip_add_data'
include/linux/gpio/driver.h:499: warning: Excess function parameter 'chip' description in 'gpiochip_add_data'
include/linux/iio/iio.h:574: warning: Function parameter or member 'read_buf' not described in 'iio_dev'
include/linux/iio/iio.h:574: warning: Function parameter or member 'read_buf_len' not described in 'iio_dev'
drivers/infiniband/core/umem_odp.c:161: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_alloc_child'
drivers/infiniband/core/umem_odp.c:225: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_get'
drivers/infiniband/ulp/iser/iscsi_iser.h:401: warning: Function parameter or member 'all_list' not described in 'iser_fr_desc'
drivers/infiniband/ulp/iser/iscsi_iser.h:415: warning: Function parameter or member 'all_list' not described in 'iser_fr_pool'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd0' not described in 'opa_vesw_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd1' not described in 'opa_vesw_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd2' not described in 'opa_vesw_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd3' not described in 'opa_vesw_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd4' not described in 'opa_vesw_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd0' not described in 'opa_per_veswport_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd1' not described in 'opa_per_veswport_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd2' not described in 'opa_per_veswport_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd3' not described in 'opa_per_veswport_info'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:342: warning: Function parameter or member 'reserved' not described in 'opa_veswport_summary_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd0' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd1' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd2' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd3' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd4' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd5' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd6' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd7' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd8' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd9' not described in 'opa_veswport_error_counters'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:460: warning: Function parameter or member 'reserved' not described in 'opa_vnic_vema_mad'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:485: warning: Function parameter or member 'reserved' not described in 'opa_vnic_notice_attr'
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:500: warning: Function parameter or member 'reserved' not described in 'opa_vnic_vema_mad_trap'
include/linux/input/sparse-keymap.h:43: warning: Function parameter or member 'sw' not described in 'key_entry'
include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
include/linux/spi/spi.h:664: warning: Function parameter or member 'buswidth_override_bits' not described in 'spi_controller'
include/linux/spi/spi.h:943: warning: Function parameter or member 'timestamped' not described in 'spi_transfer'
drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
include/linux/usb.h:713: warning: Function parameter or member 'use_generic_driver' not described in 'usb_device'
include/linux/usb.h:1253: warning: Function parameter or member 'match' not described in 'usb_device_driver'
include/linux/usb.h:1253: warning: Function parameter or member 'id_table' not described in 'usb_device_driver'
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3389: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3486: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3389: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3486: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3389: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3486: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'tbo' description in 'amdgpu_gtt_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'place' description in 'amdgpu_gtt_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'tbo' description in 'amdgpu_gtt_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'place' description in 'amdgpu_gtt_mgr_del'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3389: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3486: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:331: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'
include/drm/drm_dp_helper.h:1767: warning: Function parameter or member 'hbr2_reset' not described in 'drm_dp_phy_test_params'
drivers/gpu/drm/drm_dp_helper.c:1599: warning: Function parameter or member 'dp_rev' not described in 'drm_dp_set_phy_test_pattern'
>> drivers/gpu/drm/pl111/pl111_drv.c:1: warning: 'ARM PrimeCell PL111 CLCD Driver' not found
include/linux/host1x.h:66: warning: Function parameter or member 'parent' not described in 'host1x_client'
include/linux/host1x.h:66: warning: Function parameter or member 'usecount' not described in 'host1x_client'
include/linux/host1x.h:66: warning: Function parameter or member 'lock' not described in 'host1x_client'
include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
include/linux/phylink.h:333: warning: Function parameter or member 'pcs_config' not described in 'int'
include/linux/phylink.h:333: warning: Excess function parameter 'config' description in 'int'
include/linux/phylink.h:333: warning: Excess function parameter 'mode' description in 'int'
include/linux/phylink.h:333: warning: Excess function parameter 'interface' description in 'int'
include/linux/phylink.h:333: warning: Excess function parameter 'advertising' description in 'int'
include/linux/phylink.h:342: warning: Function parameter or member 'pcs_an_restart' not described in 'void'
include/linux/phylink.h:342: warning: Excess function parameter 'config' description in 'void'
include/linux/phylink.h:358: warning: Function parameter or member 'pcs_link_up' not described in 'void'
include/linux/phylink.h:358: warning: Excess function parameter 'config' description in 'void'
include/linux/phylink.h:358: warning: Excess function parameter 'mode' description in 'void'
include/linux/phylink.h:358: warning: Excess function parameter 'interface' description in 'void'
include/linux/phylink.h:358: warning: Excess function parameter 'speed' description in 'void'
include/linux/phylink.h:358: warning: Excess function parameter 'duplex' description in 'void'
Documentation/PCI/boot-interrupts.rst:42: WARNING: Unexpected indentation.
Documentation/PCI/boot-interrupts.rst:52: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/PCI/boot-interrupts.rst:92: WARNING: Unexpected indentation.
Documentation/PCI/boot-interrupts.rst:98: WARNING: Unexpected indentation.
Documentation/PCI/boot-interrupts.rst:136: WARNING: Unexpected indentation.
Documentation/PCI/endpoint/pci-endpoint.rst:164: WARNING: duplicate label pci/endpoint/pci-endpoint:apis for the pci endpoint function driver, other instance in Documentation/PCI/endpoint/pci-endpoint.rst
Documentation/PCI/endpoint/pci-endpoint.rst:208: WARNING: duplicate label pci/endpoint/pci-endpoint:other apis, other instance in Documentation/PCI/endpoint/pci-endpoint.rst
Documentation/RCU/Design/Data-Structures/Data-Structures.rst:377: WARNING: duplicate label rcu/design/data-structures/data-structures:grace-period tracking, other instance in Documentation/RCU/Design/Data-Structures/Data-Structures.rst
Documentation/admin-guide/LSM/Smack.rst:380: WARNING: duplicate label admin-guide/lsm/smack:smack, other instance in Documentation/admin-guide/LSM/Smack.rst
Documentation/admin-guide/cgroup-v2.rst:2508: WARNING: duplicate label admin-guide/cgroup-v2:memory, other instance in Documentation/admin-guide/cgroup-v2.rst
Documentation/admin-guide/device-mapper/thin-provisioning.rst:158: WARNING: duplicate label admin-guide/device-mapper/thin-provisioning:thin provisioning, other instance in Documentation/admin-guide/device-mapper/thin-provisioning.rst
Documentation/admin-guide/hw-vuln/spectre.rst:421: WARNING: duplicate label admin-guide/hw-vuln/spectre:spectre variant 1, other instance in Documentation/admin-guide/hw-vuln/spectre.rst
Documentation/admin-guide/hw-vuln/spectre.rst:439: WARNING: duplicate label admin-guide/hw-vuln/spectre:spectre variant 2, other instance in Documentation/admin-guide/hw-vuln/spectre.rst
Documentation/admin-guide/kdump/vmcoreinfo.rst:391: WARNING: duplicate label admin-guide/kdump/vmcoreinfo:kerneloffset, other instance in Documentation/admin-guide/kdump/vmcoreinfo.rst
Documentation/admin-guide/kdump/vmcoreinfo.rst:434: WARNING: duplicate label admin-guide/kdump/vmcoreinfo:contig_page_data, other instance in Documentation/admin-guide/kdump/vmcoreinfo.rst
Documentation/admin-guide/kdump/vmcoreinfo.rst:481: WARNING: duplicate label admin-guide/kdump/vmcoreinfo:node_data|(node_data, max_numnodes), other instance in Documentation/admin-guide/kdump/vmcoreinfo.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:623: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:631: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:707: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:717: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:791: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:820: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:951: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:957: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1044: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1053: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1276: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1315: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1387: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1395: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1424: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:procfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/laptops/thinkpad-acpi.rst:1449: WARNING: duplicate label admin-guide/laptops/thinkpad-acpi:sysfs notes, other instance in Documentation/admin-guide/laptops/thinkpad-acpi.rst
Documentation/admin-guide/mm/userfaultfd.rst:139: WARNING: Inline emphasis start-string without end-string.
Documentation/admin-guide/mm/userfaultfd.rst:139: WARNING: Inline emphasis start-string without end-string.
Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
Documentation/admin-guide/sysctl/fs.rst:315: WARNING: duplicate label admin-guide/sysctl/fs:aio-nr & aio-max-nr, other instance in Documentation/admin-guide/sysctl/fs.rst
Documentation/arm64/amu.rst:26: WARNING: Unexpected indentation.
Documentation/arm64/amu.rst:60: WARNING: Unexpected indentation.
Documentation/arm64/amu.rst:81: WARNING: Unexpected indentation.
Documentation/arm64/amu.rst:108: WARNING: Unexpected indentation.
Documentation/arm64/booting.rst:253: WARNING: Unexpected indentation.
Documentation/arm64/booting.rst:259: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/bpf/prog_cgroup_sockopt.rst:57: WARNING: duplicate label bpf/prog_cgroup_sockopt:return type, other instance in Documentation/bpf/prog_cgroup_sockopt.rst
lib/bitmap.c:189: WARNING: Unexpected indentation.
lib/bitmap.c:190: WARNING: Block quote ends without a blank line; unexpected unindent.
lib/bitmap.c:190: WARNING: Unexpected indentation.
lib/bitmap.c:191: WARNING: Line block ends without a blank line.
kernel/rcu/update.c:65: WARNING: Inline emphasis start-string without end-string.
kernel/rcu/update.c:65: WARNING: Inline emphasis start-string without end-string.
kernel/rcu/update.c:70: WARNING: Inline emphasis start-string without end-string.
kernel/rcu/update.c:82: WARNING: Inline emphasis start-string without end-string.
Documentation/crypto/devel-algos.rst:109: WARNING: duplicate label crypto/devel-algos:registration specifics, other instance in Documentation/crypto/devel-algos.rst
Documentation/dev-tools/coccinelle.rst:391: WARNING: duplicate label dev-tools/coccinelle:example, other instance in Documentation/dev-tools/coccinelle.rst
Documentation/dev-tools/coccinelle.rst:437: WARNING: duplicate label dev-tools/coccinelle:example, other instance in Documentation/dev-tools/coccinelle.rst
Documentation/dev-tools/coccinelle.rst:474: WARNING: duplicate label dev-tools/coccinelle:example, other instance in Documentation/dev-tools/coccinelle.rst
Documentation/dev-tools/kunit/start.rst:109: WARNING: duplicate label dev-tools/kunit/start:running the tests, other instance in Documentation/dev-tools/kunit/start.rst
include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.
drivers/infiniband/core/verbs.c:2579: WARNING: Unexpected indentation.
drivers/infiniband/core/verbs.c:2581: WARNING: Block quote ends without a blank line; unexpected unindent.
drivers/infiniband/core/verbs.c:2613: WARNING: Unexpected indentation.
drivers/base/platform.c:153: WARNING: Unexpected indentation.
drivers/base/platform.c:232: WARNING: Unexpected indentation.
drivers/ata/libata-core.c:5212: WARNING: Unknown target name: "hw".
Documentation/driver-api/men-chameleon-bus.rst:59: WARNING: duplicate label driver-api/men-chameleon-bus:men chameleon bus, other instance in Documentation/driver-api/men-chameleon-bus.rst
drivers/message/fusion/mptbase.c:5057: WARNING: Definition list ends without a blank line; unexpected unindent.
Documentation/driver-api/parport-lowlevel.rst:246: WARNING: duplicate label driver-api/parport-lowlevel:synopsis, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:261: WARNING: duplicate label driver-api/parport-lowlevel:description, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:268: WARNING: duplicate label driver-api/parport-lowlevel:example, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:285: WARNING: duplicate label driver-api/parport-lowlevel:see also, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:295: WARNING: duplicate label driver-api/parport-lowlevel:synopsis, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:304: WARNING: duplicate label driver-api/parport-lowlevel:description, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:313: WARNING: duplicate label driver-api/parport-lowlevel:return value, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:319: WARNING: duplicate label driver-api/parport-lowlevel:errors, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:325: WARNING: duplicate label driver-api/parport-lowlevel:example, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:351: WARNING: duplicate label driver-api/parport-lowlevel:see also, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:361: WARNING: duplicate label driver-api/parport-lowlevel:synopsis, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:380: WARNING: duplicate label driver-api/parport-lowlevel:description, other instance in Documentation/driver-api/parport-lowlevel.rst
Documentation/driver-api/parport-lowlevel.rst:434: WARNING: duplicate label driver-api/parport-lowlevel:return value, other instance in Documentation/driver-api/parport-lowlevel.rst

vim +1 drivers/gpu/drm/pl111/pl111_drv.c

e559355a9da60a Thomas Gleixner 2019-06-01  @1  // SPDX-License-Identifier: GPL-2.0-only
bed41005e6174d Tom Cooksey     2017-04-12   2  /*
bed41005e6174d Tom Cooksey     2017-04-12   3   * (C) COPYRIGHT 2012-2013 ARM Limited. All rights reserved.
bed41005e6174d Tom Cooksey     2017-04-12   4   *
bed41005e6174d Tom Cooksey     2017-04-12   5   * Parts of this file were based on sources as follows:
bed41005e6174d Tom Cooksey     2017-04-12   6   *
bed41005e6174d Tom Cooksey     2017-04-12   7   * Copyright (c) 2006-2008 Intel Corporation
bed41005e6174d Tom Cooksey     2017-04-12   8   * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
bed41005e6174d Tom Cooksey     2017-04-12   9   * Copyright (C) 2011 Texas Instruments
bed41005e6174d Tom Cooksey     2017-04-12  10   */
bed41005e6174d Tom Cooksey     2017-04-12  11  

:::::: The code at line 1 was first introduced by commit
:::::: e559355a9da60a2388893d9e9da66c79fd604b9a treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 443

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--J/dobhs11T7y2rNN
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
zdHUf1nK2xLfaQAA

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--J/dobhs11T7y2rNN--
