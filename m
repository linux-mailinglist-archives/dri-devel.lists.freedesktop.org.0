Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55811265F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 05:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6134A894C9;
	Fri,  3 May 2019 03:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C49892AD;
 Fri,  3 May 2019 03:03:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 20:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,424,1549958400"; 
 d="gz'50?scan'50,208,50";a="321027733"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 02 May 2019 20:03:32 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hMOTz-000Dcw-MG; Fri, 03 May 2019 11:03:31 +0800
Date: Fri, 3 May 2019 11:02:46 +0800
From: kbuild test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [drm-tip:drm-tip 4/9] htmldocs:
 drivers/gpu/drm/scheduler/sched_main.c:364: warning: Function parameter or
 member 'bad' not described in 'drm_sched_stop'
Message-ID: <201905031134.l6Ktb4er%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   6f67b24f2fc7b90a94e4163ae4cd01bc2783fbfd
commit: fb4f0930305e60c480c86c0e2ba9bc8683179bd9 [4/9] Merge remote-tracking branch 'origin/drm-misc-next' into drm-tip
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   include/linux/generic-radix-tree.h:1: warning: no structured comments found
   kernel/rcu/tree_plugin.h:1: warning: no structured comments found
   kernel/rcu/tree_plugin.h:1: warning: no structured comments found
   include/linux/firmware/intel/stratix10-svc-client.h:1: warning: no structured comments found
   include/linux/gpio/driver.h:371: warning: Function parameter or member 'init_valid_mask' not described in 'gpio_chip'
   include/linux/i2c.h:343: warning: Function parameter or member 'init_irq' not described in 'i2c_client'
   include/linux/iio/hw-consumer.h:1: warning: no structured comments found
   include/linux/input/sparse-keymap.h:46: warning: Function parameter or member 'sw' not described in 'key_entry'
   include/linux/regulator/machine.h:199: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:228: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   drivers/slimbus/stream.c:1: warning: no structured comments found
   include/linux/spi/spi.h:188: warning: Function parameter or member 'driver_override' not described in 'spi_device'
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:294: warning: Excess function parameter 'mm' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:294: warning: Excess function parameter 'start' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:294: warning: Excess function parameter 'end' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:343: warning: Excess function parameter 'mm' description in 'amdgpu_mn_invalidate_range_end'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:343: warning: Excess function parameter 'start' description in 'amdgpu_mn_invalidate_range_end'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:343: warning: Excess function parameter 'end' description in 'amdgpu_mn_invalidate_range_end'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:183: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_read_lock'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:295: warning: Function parameter or member 'range' not described in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:295: warning: Excess function parameter 'mm' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:295: warning: Excess function parameter 'start' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:295: warning: Excess function parameter 'end' description in 'amdgpu_mn_invalidate_range_start_hsa'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:344: warning: Function parameter or member 'range' not described in 'amdgpu_mn_invalidate_range_end'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:344: warning: Excess function parameter 'mm' description in 'amdgpu_mn_invalidate_range_end'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:344: warning: Excess function parameter 'start' description in 'amdgpu_mn_invalidate_range_end'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:344: warning: Excess function parameter 'end' description in 'amdgpu_mn_invalidate_range_end'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:347: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:348: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:494: warning: Function parameter or member 'start' not described in 'amdgpu_vm_pt_first_dfs'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'adev' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'vm' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'start' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'cursor' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'entry' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:823: warning: Function parameter or member 'level' not described in 'amdgpu_vm_bo_param'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'params' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'bo' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'level' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'pe' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'addr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'count' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'incr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'flags' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2781: warning: Function parameter or member 'pasid' not described in 'amdgpu_vm_make_compute'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:375: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:376: warning: Function parameter or member 'ih' not described in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:376: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:128: warning: Incorrect use of kernel-doc format: Documentation Makefile include scripts source @atomic_obj
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:210: warning: Function parameter or member 'atomic_obj' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:210: warning: Function parameter or member 'backlight_link' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:210: warning: Function parameter or member 'backlight_caps' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:210: warning: Function parameter or member 'freesync_module' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:210: warning: Function parameter or member 'fw_dmcu' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:210: warning: Function parameter or member 'dmcu_fw_version' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: no structured comments found
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_pin' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_unpin' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_res_obj' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_get_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_import_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_vmap' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_vunmap' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_mmap' not described in 'drm_driver'
   include/drm/drm_modeset_helper_vtables.h:1004: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_modeset_helper_vtables.h:1004: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found
>> drivers/gpu/drm/scheduler/sched_main.c:364: warning: Function parameter or member 'bad' not described in 'drm_sched_stop'
   drivers/gpu/drm/scheduler/sched_main.c:428: warning: Function parameter or member 'full_recovery' not described in 'drm_sched_start'
   drivers/gpu/drm/i915/i915_vma.h:50: warning: cannot understand function prototype: 'struct i915_vma '
   drivers/gpu/drm/i915/i915_vma.h:1: warning: no structured comments found
   drivers/gpu/drm/i915/intel_guc_fwif.h:536: warning: cannot understand function prototype: 'struct guc_log_buffer_state '
   drivers/gpu/drm/i915/i915_trace.h:1: warning: no structured comments found
   drivers/gpu/drm/i915/i915_reg.h:156: warning: bad line:
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:126: warning: Function parameter or member 'hw_id' not described in 'komeda_component'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:126: warning: Function parameter or member 'max_active_outputs' not described in 'komeda_component'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:126: warning: Function parameter or member 'supported_outputs' not described in 'komeda_component'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:142: warning: Function parameter or member 'output_port' not described in 'komeda_component_output'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:196: warning: Function parameter or member 'component' not described in 'komeda_component_state'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:196: warning: Function parameter or member 'crtc' not described in 'komeda_component_state'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:196: warning: Function parameter or member 'plane' not described in 'komeda_component_state'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:196: warning: Function parameter or member 'wb_conn' not described in 'komeda_component_state'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:196: warning: Function parameter or member 'changed_active_inputs' not described in 'komeda_component_state'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:196: warning: Function parameter or member 'affected_inputs' not described in 'komeda_component_state'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'n_layers' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'layers' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'n_scalers' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'scalers' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'compiz' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'wb_layer' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'improc' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'ctrlr' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:323: warning: Function parameter or member 'funcs' not described in 'komeda_pipeline'
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:344: warning: Function parameter or member 'pipe' not described in 'komeda_pipeline_state'
   drivers/gpu/drm/arm/display/komeda/komeda_dev.h:148: warning: Function parameter or member 'dev' not described in 'komeda_dev'
   drivers/gpu/drm/arm/display/komeda/komeda_dev.h:148: warning: Function parameter or member 'reg_base' not described in 'komeda_dev'
   drivers/gpu/drm/arm/display/komeda/komeda_dev.h:148: warning: Function parameter or member 'chip' not described in 'komeda_dev'
   drivers/gpu/drm/arm/display/komeda/komeda_dev.h:148: warning: Function parameter or member 'mclk' not described in 'komeda_dev'
   drivers/gpu/drm/arm/display/komeda/komeda_dev.h:148: warning: Function parameter or member 'n_pipelines' not described in 'komeda_dev'
   drivers/gpu/drm/arm/display/komeda/komeda_dev.h:148: warning: Function parameter or member 'pipelines' not described in 'komeda_dev'
   drivers/gpu/drm/arm/display/komeda/komeda_dev.h:148: warning: Function parameter or member 'debugfs_root' not described in 'komeda_dev'
   drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h:1: warning: no structured comments found
   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:1: warning: no structured comments found
   drivers/gpu/drm/arm/display/komeda/komeda_plane.c:1: warning: no structured comments found
   include/linux/interconnect.h:1: warning: no structured comments found
   include/linux/skbuff.h:899: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:899: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
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
   include/net/sock.h:513: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member '____cacheline_aligned_in_smp' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2067: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'quotactl' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'quota_on' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'sb_free_mnt_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'sb_eat_lsm_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'sb_kern_mount' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'sb_show_options' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'sb_add_mnt_opt' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'task_setioprio' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'task_getioprio' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'task_movememory' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'd_instantiate' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1802: warning: Function parameter or member 'getprocattr' not described in 'security_list_options'

vim +364 drivers/gpu/drm/scheduler/sched_main.c

222b5f044 Andrey Grodzovsky   2018-12-04  350  
222b5f044 Andrey Grodzovsky   2018-12-04  351  /**
f5d356328 Jonathan Neuschäfer 2019-04-20  352   * drm_sched_stop - stop the scheduler
222b5f044 Andrey Grodzovsky   2018-12-04  353   *
222b5f044 Andrey Grodzovsky   2018-12-04  354   * @sched: scheduler instance
222b5f044 Andrey Grodzovsky   2018-12-04  355   *
5918045c4 Christian König     2019-04-18  356   * Stop the scheduler and also removes and frees all completed jobs.
5918045c4 Christian König     2019-04-18  357   * Note: bad job will not be freed as it might be used later and so it's
5918045c4 Christian König     2019-04-18  358   * callers responsibility to release it manually if it's not part of the
5918045c4 Christian König     2019-04-18  359   * mirror list any more.
5918045c4 Christian König     2019-04-18  360   *
222b5f044 Andrey Grodzovsky   2018-12-04  361   */
5918045c4 Christian König     2019-04-18  362  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
222b5f044 Andrey Grodzovsky   2018-12-04  363  {
5918045c4 Christian König     2019-04-18 @364  	struct drm_sched_job *s_job, *tmp;
222b5f044 Andrey Grodzovsky   2018-12-04  365  	unsigned long flags;
222b5f044 Andrey Grodzovsky   2018-12-04  366  
222b5f044 Andrey Grodzovsky   2018-12-04  367  	kthread_park(sched->thread);
222b5f044 Andrey Grodzovsky   2018-12-04  368  
222b5f044 Andrey Grodzovsky   2018-12-04  369  	/*
5918045c4 Christian König     2019-04-18  370  	 * Iterate the job list from later to  earlier one and either deactive
5918045c4 Christian König     2019-04-18  371  	 * their HW callbacks or remove them from mirror list if they already
5918045c4 Christian König     2019-04-18  372  	 * signaled.
5918045c4 Christian König     2019-04-18  373  	 * This iteration is thread safe as sched thread is stopped.
222b5f044 Andrey Grodzovsky   2018-12-04  374  	 */
5918045c4 Christian König     2019-04-18  375  	list_for_each_entry_safe_reverse(s_job, tmp, &sched->ring_mirror_list, node) {
222b5f044 Andrey Grodzovsky   2018-12-04  376  		if (s_job->s_fence->parent &&
222b5f044 Andrey Grodzovsky   2018-12-04  377  		    dma_fence_remove_callback(s_job->s_fence->parent,
3741540e0 Andrey Grodzovsky   2018-12-05  378  					      &s_job->cb)) {
222b5f044 Andrey Grodzovsky   2018-12-04  379  			atomic_dec(&sched->hw_rq_count);
222b5f044 Andrey Grodzovsky   2018-12-04  380  		} else {
5918045c4 Christian König     2019-04-18  381  			/*
5918045c4 Christian König     2019-04-18  382  			 * remove job from ring_mirror_list.
5918045c4 Christian König     2019-04-18  383  			 * Locking here is for concurrent resume timeout
5918045c4 Christian König     2019-04-18  384  			 */
5918045c4 Christian König     2019-04-18  385  			spin_lock_irqsave(&sched->job_list_lock, flags);
5918045c4 Christian König     2019-04-18  386  			list_del_init(&s_job->node);
222b5f044 Andrey Grodzovsky   2018-12-04  387  			spin_unlock_irqrestore(&sched->job_list_lock, flags);
222b5f044 Andrey Grodzovsky   2018-12-04  388  
5918045c4 Christian König     2019-04-18  389  			/*
5918045c4 Christian König     2019-04-18  390  			 * Wait for job's HW fence callback to finish using s_job
5918045c4 Christian König     2019-04-18  391  			 * before releasing it.
5918045c4 Christian König     2019-04-18  392  			 *
5918045c4 Christian König     2019-04-18  393  			 * Job is still alive so fence refcount at least 1
5918045c4 Christian König     2019-04-18  394  			 */
5918045c4 Christian König     2019-04-18  395  			dma_fence_wait(&s_job->s_fence->finished, false);
5918045c4 Christian König     2019-04-18  396  
5918045c4 Christian König     2019-04-18  397  			/*
5918045c4 Christian König     2019-04-18  398  			 * We must keep bad job alive for later use during
a5343b8a2 Andrey Grodzovsky   2019-04-18  399  			 * recovery by some of the drivers but leave a hint
a5343b8a2 Andrey Grodzovsky   2019-04-18  400  			 * that the guilty job must be released.
5918045c4 Christian König     2019-04-18  401  			 */
5918045c4 Christian König     2019-04-18  402  			if (bad != s_job)
5918045c4 Christian König     2019-04-18  403  				sched->ops->free_job(s_job);
a5343b8a2 Andrey Grodzovsky   2019-04-18  404  			else
a5343b8a2 Andrey Grodzovsky   2019-04-18  405  				sched->free_guilty = true;
222b5f044 Andrey Grodzovsky   2018-12-04  406  		}
222b5f044 Andrey Grodzovsky   2018-12-04  407  	}
222b5f044 Andrey Grodzovsky   2018-12-04  408  
290764af7 Andrey Grodzovsky   2019-04-18  409  	/*
290764af7 Andrey Grodzovsky   2019-04-18  410  	 * Stop pending timer in flight as we rearm it in  drm_sched_start. This
290764af7 Andrey Grodzovsky   2019-04-18  411  	 * avoids the pending timeout work in progress to fire right away after
290764af7 Andrey Grodzovsky   2019-04-18  412  	 * this TDR finished and before the newly restarted jobs had a
290764af7 Andrey Grodzovsky   2019-04-18  413  	 * chance to complete.
290764af7 Andrey Grodzovsky   2019-04-18  414  	 */
290764af7 Andrey Grodzovsky   2019-04-18  415  	cancel_delayed_work(&sched->work_tdr);
222b5f044 Andrey Grodzovsky   2018-12-04  416  }
222b5f044 Andrey Grodzovsky   2018-12-04  417  

:::::: The code at line 364 was first introduced by commit
:::::: 5918045c4ed492fb5813f980dcf89a90fefd0a4e drm/scheduler: rework job destruction

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--GvXjxJ+pjyke8COw
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--GvXjxJ+pjyke8COw--
