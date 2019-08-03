Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A298049F
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 08:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F047B6E464;
	Sat,  3 Aug 2019 06:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEE26E464
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 06:22:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 23:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,340,1559545200"; 
 d="gz'50?scan'50,208,50";a="164142354"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 02 Aug 2019 23:22:24 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1htnQt-00071u-L6; Sat, 03 Aug 2019 14:22:23 +0800
Date: Sat, 3 Aug 2019 14:22:16 +0800
From: kbuild test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [radeon-alex:amd-19.30 1374/2148] htmldocs:
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:204: warning: Function parameter
 or member 'target_dev' not described in 'amdgpu_dma_buf_map_attach'
Message-ID: <201908031406.vYYlJnTB%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, kbuild-all@01.org,
 changzhu <Changfeng.Zhu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?unknown-8bit?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-19.30
head:   494cd065e68f6ba299e074e269b57773d7524e67
commit: 247814e2121b6f9d3b5f2ed04a7221b991fb441a [1374/2148] gpu: amdgpu: fix broken amdgpu_dma_buf.c references
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   Documentation/sphinx/kerneldoc.py:93: RemovedInSphinx20Warning: app.verbose() is now deprecated. Use sphinx.util.logging instead.
   env.app.verbose('calling kernel-doc '%s'' % (" ".join(cmd)))
   Documentation/sphinx/kerneldoc.py:125: RemovedInSphinx20Warning: AutodocReporter is now deprecated. Use sphinx.util.docutils.switch_source_input() instead.
   self.state.memo.reporter = AutodocReporter(result, self.state.memo.reporter)
   include/linux/interrupt.h:268: warning: Function parameter or member 'is_managed' not described in 'irq_affinity_desc'
   block/blk-core.c:685: warning: Excess function parameter 'request_count' description in 'blk_attempt_plug_merge'
   block/blk-core.c:685: warning: Excess function parameter 'request_count' description in 'blk_attempt_plug_merge'
   include/linux/rcupdate_wait.h:1: warning: no structured comments found
   include/linux/rcutree.h:1: warning: no structured comments found
   kernel/rcu/tree.c:710: warning: Excess function parameter 'irq' description in 'rcu_nmi_exit'
   include/linux/gfp.h:1: warning: no structured comments found
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.ibss' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.connect' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.keys' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.ie' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.ie_len' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.bssid' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.ssid' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.default_key' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.default_mgmt_key' not described in 'wireless_dev'
   include/net/cfg80211.h:4687: warning: Function parameter or member 'wext.prev_bssid_valid' not described in 'wireless_dev'
   include/net/mac80211.h:2393: warning: Function parameter or member 'radiotap_timestamp.units_pos' not described in 'ieee80211_hw'
   include/net/mac80211.h:2393: warning: Function parameter or member 'radiotap_timestamp.accuracy' not described in 'ieee80211_hw'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.rates' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.rts_cts_rate_idx' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.use_rts' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.use_cts_prot' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.short_preamble' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.skip_table' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.jiffies' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.vif' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.hw_key' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.flags' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'control.enqueue_time' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'ack' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'ack.cookie' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.rates' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.ack_signal' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.ampdu_ack_len' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.ampdu_len' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.antenna' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.tx_time' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.is_valid_ack_signal' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'status.status_driver_data' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'driver_rates' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'pad' not described in 'ieee80211_tx_info'
   include/net/mac80211.h:1004: warning: Function parameter or member 'rate_driver_data' not described in 'ieee80211_tx_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'rx_stats_avg' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'rx_stats_avg.signal' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'rx_stats_avg.chain_signal' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.filtered' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.retry_failed' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.retry_count' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.lost_packets' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.last_tdls_pkt_time' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.msdu_retries' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.msdu_failed' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.last_ack' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.last_ack_signal' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.ack_signal_filled' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.avg_ack_signal' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'tx_stats.packets' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'tx_stats.bytes' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'tx_stats.last_rate' not described in 'sta_info'
   net/mac80211/sta_info.h:590: warning: Function parameter or member 'tx_stats.msdu' not described in 'sta_info'
   kernel/rcu/tree.c:711: warning: Excess function parameter 'irq' description in 'rcu_nmi_exit'
   include/linux/dma-buf.h:313: warning: Function parameter or member 'cb_excl.cb' not described in 'dma_buf'
   include/linux/dma-buf.h:313: warning: Function parameter or member 'cb_excl.poll' not described in 'dma_buf'
   include/linux/dma-buf.h:313: warning: Function parameter or member 'cb_excl.active' not described in 'dma_buf'
   include/linux/dma-buf.h:313: warning: Function parameter or member 'cb_shared.cb' not described in 'dma_buf'
   include/linux/dma-buf.h:313: warning: Function parameter or member 'cb_shared.poll' not described in 'dma_buf'
   include/linux/dma-buf.h:313: warning: Function parameter or member 'cb_shared.active' not described in 'dma_buf'
   include/linux/dma-fence-array.h:54: warning: Function parameter or member 'work' not described in 'dma_fence_array'
   include/linux/firmware/intel/stratix10-svc-client.h:1: warning: no structured comments found
   include/linux/gpio/driver.h:371: warning: Function parameter or member 'init_valid_mask' not described in 'gpio_chip'
   include/linux/iio/hw-consumer.h:1: warning: no structured comments found
   include/linux/input/sparse-keymap.h:46: warning: Function parameter or member 'sw' not described in 'key_entry'
   drivers/mtd/nand/raw/nand_base.c:420: warning: Function parameter or member 'chip' not described in 'nand_fill_oob'
   drivers/mtd/nand/raw/nand_bbt.c:173: warning: Function parameter or member 'this' not described in 'read_bbt'
   drivers/mtd/nand/raw/nand_bbt.c:173: warning: Excess function parameter 'chip' description in 'read_bbt'
   include/linux/regulator/machine.h:199: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:228: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member 'esw.esw0' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member 'esw.esw1' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member 'esw.esw2' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member 'esw.esw3' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member 'esw.eadm' not described in 'irb'
   drivers/slimbus/stream.c:1: warning: no structured comments found
   include/linux/spi/spi.h:180: warning: Function parameter or member 'driver_override' not described in 'spi_device'
   drivers/target/target_core_device.c:1: warning: no structured comments found
   drivers/usb/typec/bus.c:1: warning: no structured comments found
   drivers/usb/typec/class.c:1: warning: no structured comments found
   include/linux/w1.h:281: warning: Function parameter or member 'of_match_table' not described in 'w1_family'
   fs/direct-io.c:257: warning: Excess function parameter 'offset' description in 'dio_complete'
   fs/file_table.c:1: warning: no structured comments found
   fs/libfs.c:477: warning: Excess function parameter 'available' description in 'simple_write_end'
   fs/posix_acl.c:646: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:646: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:646: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:204: warning: Function parameter or member 'target_dev' not described in 'amdgpu_dma_buf_map_attach'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:318: warning: Excess function parameter 'mm' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:318: warning: Excess function parameter 'start' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:318: warning: Excess function parameter 'end' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:205: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_read_lock'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:319: warning: Function parameter or member 'range' not described in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:319: warning: Excess function parameter 'mm' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:319: warning: Excess function parameter 'start' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:319: warning: Excess function parameter 'end' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:381: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_invalidate_range_start_gfx'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:438: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:353: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1574: warning: Excess function parameter 'nodes' description in 'amdgpu_vm_bo_split_mapping'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:354: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:500: warning: Function parameter or member 'start' not described in 'amdgpu_vm_pt_first_dfs'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:552: warning: Function parameter or member 'adev' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:552: warning: Function parameter or member 'vm' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:552: warning: Function parameter or member 'start' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:552: warning: Function parameter or member 'cursor' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:552: warning: Function parameter or member 'entry' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:827: warning: Function parameter or member 'level' not described in 'amdgpu_vm_bo_param'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'params' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'bo' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'level' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'pe' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'addr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'count' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'incr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1298: warning: Function parameter or member 'flags' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1575: warning: Function parameter or member 'mem' not described in 'amdgpu_vm_bo_split_mapping'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1575: warning: Excess function parameter 'nodes' description in 'amdgpu_vm_bo_split_mapping'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2855: warning: Function parameter or member 'pasid' not described in 'amdgpu_vm_make_compute'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:375: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:376: warning: Function parameter or member 'ih' not described in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:376: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:153: warning: Incorrect use of kernel-doc format: Documentation Makefile include scripts source @atomic_obj
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:236: warning: Function parameter or member 'atomic_obj' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:236: warning: Function parameter or member 'backlight_link' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:236: warning: Function parameter or member 'backlight_caps' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:236: warning: Function parameter or member 'freesync_module' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:236: warning: Function parameter or member 'fw_dmcu' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:236: warning: Function parameter or member 'dmcu_fw_version' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: no structured comments found
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_pin' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_unpin' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_res_obj' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_get_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_import_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_vmap' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_vunmap' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_mmap' not described in 'drm_driver'
   include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found
   drivers/gpu/drm/scheduler/sched_main.c:367: warning: Function parameter or member 'bad' not described in 'drm_sched_stop'
   drivers/gpu/drm/scheduler/sched_main.c:431: warning: Function parameter or member 'full_recovery' not described in 'drm_sched_start'
   drivers/gpu/drm/i915/i915_vma.h:49: warning: cannot understand function prototype: 'struct i915_vma '
   drivers/gpu/drm/i915/i915_vma.h:1: warning: no structured comments found
   drivers/gpu/drm/i915/intel_guc_fwif.h:536: warning: cannot understand function prototype: 'struct guc_log_buffer_state '
   drivers/gpu/drm/i915/i915_trace.h:1: warning: no structured comments found
   include/linux/skbuff.h:876: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
   include/net/sock.h:238: warning: Function parameter or member 'skc_addrpair' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_portpair' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_ipv6only' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_net_refcnt' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_v6_daddr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_v6_rcv_saddr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_cookie' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_listener' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_tw_dr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_rcv_wnd' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_tw_rcv_nxt' not described in 'sock_common'
   include/net/sock.h:513: warning: Function parameter or member 'sk_backlog.rmem_alloc' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_backlog.len' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_backlog.head' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_backlog.tail' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'adj_list.upper' not described in 'net_device'

vim +204 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c

2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  184  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  185  #if DRM_VERSION_CODE >= DRM_VERSION(4, 17, 0) || !defined(BUILD_AS_DKMS)
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  186  /**
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  187   * amdgpu_dma_buf_map_attach - &dma_buf_ops.attach implementation
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  188   * @dma_buf: Shared DMA buffer
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  189   * @attach: DMA-buf attachment
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  190   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  191   * Makes sure that the shared DMA buffer can be accessed by the target device.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  192   * For now, simply pins it to the GTT domain, where it should be accessible by
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  193   * all DMA devices.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  194   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  195   * Returns:
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  196   * 0 on success or a negative error code on failure.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  197   */
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  198  static int amdgpu_dma_buf_map_attach(struct dma_buf *dma_buf,
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  199  #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0)
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  200  					struct device *target_dev,
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  201  #endif
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  202  					struct dma_buf_attachment *attach)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  203  {
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16 @204  	struct drm_gem_object *obj = dma_buf->priv;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  205  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
2333bf9ad960eb7 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-03-21  206  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  207  	long r;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  208  
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  209  	r = drm_gem_map_attach(dma_buf,
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  210  #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0)
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  211  						target_dev,
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  212  #endif
54037055a21bd95 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   tianci yin      2019-01-18  213  						attach);
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  214  	if (r)
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  215  		return r;
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  216  
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  217  	r = amdgpu_bo_reserve(bo, false);
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  218  	if (unlikely(r != 0))
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  219  		goto error_detach;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  220  
9021d2edd259d99 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-19  221  
2333bf9ad960eb7 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-03-21  222  	if (attach->dev->driver != adev->dev->driver) {
8e94a46c1770884 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner   2016-11-09  223  		/*
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  224  		 * We only create shared fences for internal use, but importers
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  225  		 * of the dmabuf rely on exclusive fences for implicitly
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  226  		 * tracking write hazards. As any of the current fences may
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  227  		 * correspond to a write, we need to convert all existing
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  228  		 * fences on the reservation object into a single exclusive
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  229  		 * fence.
8e94a46c1770884 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner   2016-11-09  230  		 */
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  231  		r = __reservation_object_make_exclusive(bo->tbo.resv);
2acede2cb051602 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Chris Wilson    2019-01-30  232  		if (r)
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  233  			goto error_unreserve;
8e94a46c1770884 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner   2016-11-09  234  	}
8e94a46c1770884 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner   2016-11-09  235  
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  236  	/* pin buffer into GTT */
7b7c6c81b3a370b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Junwei Zhang    2018-06-25  237  	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
9021d2edd259d99 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-19  238  	if (r)
9021d2edd259d99 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-19  239  		goto error_unreserve;
9021d2edd259d99 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-19  240  
2333bf9ad960eb7 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-03-21  241  	if (attach->dev->driver != adev->dev->driver)
8e94a46c1770884 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner   2016-11-09  242  		bo->prime_shared_count++;
8e94a46c1770884 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner   2016-11-09  243  
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  244  error_unreserve:
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  245  	amdgpu_bo_unreserve(bo);
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  246  
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  247  error_detach:
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  248  	if (r)
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  249  		drm_gem_map_detach(dma_buf, attach);
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  250  	return r;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  251  }
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  252  
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  253  /**
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  254   * amdgpu_dma_buf_map_detach - &dma_buf_ops.detach implementation
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  255   * @dma_buf: Shared DMA buffer
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  256   * @attach: DMA-buf attachment
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  257   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  258   * This is called when a shared DMA buffer no longer needs to be accessible by
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  259   * another device. For now, simply unpins the buffer from GTT.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  260   */
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  261  static void amdgpu_dma_buf_map_detach(struct dma_buf *dma_buf,
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  262  				      struct dma_buf_attachment *attach)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  263  {
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  264  	struct drm_gem_object *obj = dma_buf->priv;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  265  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
2333bf9ad960eb7 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-03-21  266  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  267  	int ret = 0;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  268  
c81a1a74037f61c drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2017-04-28  269  	ret = amdgpu_bo_reserve(bo, true);
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  270  	if (unlikely(ret != 0))
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  271  		goto error;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  272  
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  273  	amdgpu_bo_unpin(bo);
2333bf9ad960eb7 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-03-21  274  	if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
8e94a46c1770884 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner   2016-11-09  275  		bo->prime_shared_count--;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  276  	amdgpu_bo_unreserve(bo);
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  277  
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  278  error:
5a13761fa68306b drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-02-16  279  	drm_gem_map_detach(dma_buf, attach);
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  280  }
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  281  #endif
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  282  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  283  #if DRM_VERSION_CODE < DRM_VERSION(4, 17, 0) && defined(BUILD_AS_DKMS)
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  284  int amdgpu_gem_prime_pin(struct drm_gem_object *obj)
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  285  {
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  286  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  287  	long ret = 0;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  288  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  289  	ret = amdgpu_bo_reserve(bo, false);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  290  	if (unlikely(ret != 0))
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  291  		return ret;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  292  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  293  	/*
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  294  	 * Wait for all shared fences to complete before we switch to future
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  295  	 * use of exclusive fence on this prime shared bo.
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  296  	 */
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  297  	ret = reservation_object_wait_timeout_rcu(bo->tbo.resv, true, false,
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  298  						  MAX_SCHEDULE_TIMEOUT);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  299  	if (unlikely(ret < 0)) {
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  300  		DRM_DEBUG_PRIME("Fence wait failed: %li\n", ret);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  301  		amdgpu_bo_unreserve(bo);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  302  		return ret;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  303  	}
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  304  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  305  	/* pin buffer into GTT */
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  306  	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  307  	if (likely(ret == 0))
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  308  		bo->prime_shared_count++;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  309  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  310  	amdgpu_bo_unreserve(bo);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  311  	return ret;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  312  }
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  313  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  314  void amdgpu_gem_prime_unpin(struct drm_gem_object *obj)
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  315  {
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  316  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  317  	int ret = 0;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  318  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  319  	ret = amdgpu_bo_reserve(bo, true);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  320  	if (unlikely(ret != 0))
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  321  		return;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  322  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  323  	amdgpu_bo_unpin(bo);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  324  	if (bo->prime_shared_count)
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  325  		bo->prime_shared_count--;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  326  	amdgpu_bo_unreserve(bo);
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  327  }
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  328  #endif
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  329  
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  330  /**
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  331   * amdgpu_gem_prime_res_obj - &drm_driver.gem_prime_res_obj implementation
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  332   * @obj: GEM BO
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  333   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  334   * Returns:
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  335   * The BO's reservation object.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  336   */
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  337  struct reservation_object *amdgpu_gem_prime_res_obj(struct drm_gem_object *obj)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  338  {
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  339  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  340  
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  341  	return bo->tbo.resv;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  342  }
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  343  
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  344  #if DRM_VERSION_CODE >= DRM_VERSION(4, 17, 0) || !defined(BUILD_AS_DKMS)
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  345  /**
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  346   * amdgpu_dma_buf_begin_cpu_access - &dma_buf_ops.begin_cpu_access implementation
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  347   * @dma_buf: Shared DMA buffer
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  348   * @direction: Direction of DMA transfer
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  349   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  350   * This is called before CPU access to the shared DMA buffer's memory. If it's
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  351   * a read access, the buffer is moved to the GTT domain if possible, for optimal
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  352   * CPU read performance.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  353   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  354   * Returns:
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  355   * 0 on success or a negative error code on failure.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  356   */
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  357  static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  358  					   enum dma_data_direction direction)
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  359  {
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  360  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(dma_buf->priv);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  361  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  362  	struct ttm_operation_ctx ctx = { true, false };
1d2361e5a6c60d7 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2018-04-18  363  	u32 domain = amdgpu_display_supported_domains(adev);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  364  	int ret;
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  365  	bool reads = (direction == DMA_BIDIRECTIONAL ||
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  366  		      direction == DMA_FROM_DEVICE);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  367  
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  368  	if (!reads || !(domain & AMDGPU_GEM_DOMAIN_GTT))
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  369  		return 0;
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  370  
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  371  	/* move to gtt */
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  372  	ret = amdgpu_bo_reserve(bo, false);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  373  	if (unlikely(ret != 0))
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  374  		return ret;
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  375  
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  376  	if (!bo->pin_count && (bo->allowed_domains & AMDGPU_GEM_DOMAIN_GTT)) {
c704ab18e0a26a5 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2018-07-16  377  		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  378  		ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  379  	}
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  380  
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  381  	amdgpu_bo_unreserve(bo);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  382  	return ret;
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  383  }
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  384  
1dde0ea95b78242 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Felix Kuehling  2018-11-20  385  const struct dma_buf_ops amdgpu_dmabuf_ops = {
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  386  	.attach = amdgpu_dma_buf_map_attach,
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  387  	.detach = amdgpu_dma_buf_map_detach,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  388  	.map_dma_buf = drm_gem_map_dma_buf,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  389  	.unmap_dma_buf = drm_gem_unmap_dma_buf,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  390  	.release = drm_gem_dmabuf_release,
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  391  	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  392  	.mmap = drm_gem_dmabuf_mmap,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  393  	.vmap = drm_gem_dmabuf_vmap,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  394  	.vunmap = drm_gem_dmabuf_vunmap,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  395  };
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  396  #endif
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  397  
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  398  /**
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  399   * amdgpu_gem_prime_export - &drm_driver.gem_prime_export implementation
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  400   * @dev: DRM device
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  401   * @gobj: GEM BO
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  402   * @flags: Flags such as DRM_CLOEXEC and DRM_RDWR.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  403   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  404   * The main work is done by the &drm_gem_prime_export helper, which in turn
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  405   * uses &amdgpu_gem_prime_res_obj.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  406   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  407   * Returns:
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  408   * Shared DMA buffer representing the GEM BO from the given device.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  409   */
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  410  struct dma_buf *amdgpu_gem_prime_export(struct drm_device *dev,
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  411  					struct drm_gem_object *gobj,
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  412  					int flags)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  413  {
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  414  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
4b277247b1df177 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2017-11-13  415  	struct dma_buf *buf;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  416  
e1eb899b45781b9 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2017-08-25  417  	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
e1eb899b45781b9 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2017-08-25  418  	    bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  419  		return ERR_PTR(-EPERM);
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  420  
4b277247b1df177 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2017-11-13  421  	buf = drm_gem_prime_export(dev, gobj, flags);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  422  	if (!IS_ERR(buf)) {
4b277247b1df177 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2017-11-13  423  		buf->file->f_mapping = dev->anon_inode->i_mapping;
ada38489ee77e6d drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-09-27  424  #if DRM_VERSION_CODE >= DRM_VERSION(4, 17, 0)
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  425  		buf->ops = &amdgpu_dmabuf_ops;
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  426  #endif
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  427  	}
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  428  
4b277247b1df177 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König 2017-11-13  429  	return buf;
d38ceaf99ed015f drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher    2015-04-20  430  }
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  431  
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  432  /**
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  433   * amdgpu_gem_prime_import_sg_table - &drm_driver.gem_prime_import_sg_table
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  434   * implementation
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  435   * @dev: DRM device
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  436   * @attach: DMA-buf attachment
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  437   * @sg: Scatter/gather table
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  438   *
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  439   * Imports shared DMA buffer memory exported by another device.
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  440   *
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  441   * Returns:
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  442   * A new GEM BO of the given DRM device, representing the memory
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  443   * described by the given DMA-buf attachment and scatter/gather table.
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  444   */
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  445  struct drm_gem_object *
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  446  amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  447  				 struct dma_buf_attachment *attach,
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  448  				 struct sg_table *sg)
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  449  {
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  450  	struct reservation_object *resv = attach->dmabuf->resv;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  451  	struct amdgpu_device *adev = dev->dev_private;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  452  	struct amdgpu_bo *bo;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  453  	struct amdgpu_bo_param bp;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  454  	int ret;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  455  
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  456  	memset(&bp, 0, sizeof(bp));
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  457  	bp.size = attach->dmabuf->size;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  458  	bp.byte_align = PAGE_SIZE;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  459  	bp.domain = AMDGPU_GEM_DOMAIN_CPU;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  460  	bp.flags = 0;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  461  	bp.type = ttm_bo_type_sg;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  462  	bp.resv = resv;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  463  	ww_mutex_lock(&resv->lock, NULL);
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  464  	ret = amdgpu_bo_create(adev, &bp, &bo);
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  465  	if (ret)
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  466  		goto error;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  467  
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  468  	bo->tbo.sg = sg;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  469  	bo->tbo.ttm->sg = sg;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  470  	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  471  	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
a182341f020385f drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c changzhu        2019-05-07  472  #if DRM_VERSION_CODE >= DRM_VERSION(4, 17, 0) || !defined(BUILD_AS_DKMS)
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  473  	if (attach->dmabuf->ops != &amdgpu_dmabuf_ops)
a182341f020385f drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c changzhu        2019-05-07  474  #endif
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  475  		bo->prime_shared_count = 1;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  476  
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  477  	ww_mutex_unlock(&resv->lock);
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  478  	return &bo->gem_base;
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  479  
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  480  error:
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  481  	ww_mutex_unlock(&resv->lock);
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  482  	return ERR_PTR(ret);
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  483  }
6a745988552e2b5 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König 2019-05-06  484  
ada38489ee77e6d drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-09-27  485  #if DRM_VERSION_CODE >= DRM_VERSION(4, 17, 0)
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  486  /**
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  487   * amdgpu_gem_prime_import - &drm_driver.gem_prime_import implementation
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  488   * @dev: DRM device
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  489   * @dma_buf: Shared DMA buffer
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  490   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  491   * The main work is done by the &drm_gem_prime_import helper, which in turn
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  492   * uses &amdgpu_gem_prime_import_sg_table.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  493   *
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  494   * Returns:
56ea09760076800 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Vijetha Malkai  2018-09-13  495   * GEM BO representing the shared DMA buffer for the given device.
baca30fabdc9ba2 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer   2018-05-29  496   */
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  497  struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  498  					    struct dma_buf *dma_buf)
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  499  {
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  500  	struct drm_gem_object *obj;
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  501  
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  502  	if (dma_buf->ops == &amdgpu_dmabuf_ops) {
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  503  		obj = dma_buf->priv;
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  504  		if (obj->dev == dev) {
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  505  			/*
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  506  			 * Importing dmabuf exported from out own gem increases
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  507  			 * refcount on gem itself instead of f_count of dmabuf.
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  508  			 */
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  509  			drm_gem_object_get(obj);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  510  			return obj;
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  511  		}
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  512  	}
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  513  
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  514  	return drm_gem_prime_import(dev, dma_buf);
09052fc3769c98e drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Samuel Li       2017-12-08  515  }
a6a944b476552be drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Kevin Wang      2018-01-15  516  #endif

:::::: The code at line 204 was first introduced by commit
:::::: 5a13761fa68306bc21ff91d9ca4d56d14793c889 drm/amdgpu: implement amdgpu_gem_map_(attach/detach)

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--KsGdsel6WgEHnImy
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--KsGdsel6WgEHnImy--
