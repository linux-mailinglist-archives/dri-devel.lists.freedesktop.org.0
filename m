Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE64F3FA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 08:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3F66E95D;
	Sat, 22 Jun 2019 06:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FF6E95D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 06:11:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2019 23:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,403,1557212400"; 
 d="gz'50?scan'50,208,50";a="161169615"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2019 23:11:15 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1heZF5-00092z-AB; Sat, 22 Jun 2019 14:11:15 +0800
Date: Sat, 22 Jun 2019 14:10:49 +0800
From: kbuild test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [radeon-alex:amd-staging-drm-next-navi10 323/469] htmldocs:
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function
 parameter or member 'soc_bounding_box' not described in
 'amdgpu_display_manager'
Message-ID: <201906221438.rgesvWGb%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
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
Cc: Alex Deucher <alexander.deucher@amd.com>, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next-navi10
head:   e82deaaf0052ac2c79d5f600a953bd951a0b4351
commit: 8ebfb44064042222b21eef5c79b48ff3b2eb122c [323/469] drm/amd/display: Read soc_bounding_box from gpu_info (v2)
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   include/linux/generic-radix-tree.h:1: warning: no structured comments found
   lib/sort.c:59: warning: Excess function parameter 'size' description in 'swap_words_32'
   lib/sort.c:83: warning: Excess function parameter 'size' description in 'swap_words_64'
   lib/sort.c:110: warning: Excess function parameter 'size' description in 'swap_bytes'
   block/genhd.c:540: warning: Function parameter or member 'devt' not described in 'blk_invalidate_devt'
   kernel/rcu/tree_plugin.h:1: warning: no structured comments found
   include/net/cfg80211.h:1074: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4037: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
   include/net/mac80211.h:2004: warning: Function parameter or member 'txpwr' not described in 'ieee80211_sta'
   kernel/rcu/tree_plugin.h:1: warning: no structured comments found
   include/linux/firmware/intel/stratix10-svc-client.h:1: warning: no structured comments found
   Error: Cannot open file drivers/counter/generic-counter.c
   Error: Cannot open file drivers/counter/generic-counter.c
   WARNING: kernel-doc 'scripts/kernel-doc -rst -enable-lineno -export drivers/counter/generic-counter.c' failed with return code 2
   include/linux/gpio/driver.h:374: warning: Function parameter or member 'init_valid_mask' not described in 'gpio_chip'
   include/linux/i2c.h:343: warning: Function parameter or member 'init_irq' not described in 'i2c_client'
   include/linux/iio/hw-consumer.h:1: warning: no structured comments found
   drivers/base/node.c:78: warning: Function parameter or member 'hmem_attrs' not described in 'node_access_nodes'
   drivers/base/node.c:690: warning: Function parameter or member 'mem_nid' not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:690: warning: Function parameter or member 'cpu_nid' not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:690: warning: Excess function parameter 'mem_node' description in 'register_memory_node_under_compute_node'
   drivers/base/node.c:690: warning: Excess function parameter 'cpu_node' description in 'register_memory_node_under_compute_node'
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
   fs/libfs.c:479: warning: Excess function parameter 'available' description in 'simple_write_end'
   fs/posix_acl.c:646: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:646: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:646: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:179: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_read_lock'
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2822: warning: Function parameter or member 'pasid' not described in 'amdgpu_vm_make_compute'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:375: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:376: warning: Function parameter or member 'ih' not described in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:376: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:128: warning: Incorrect use of kernel-doc format: Documentation Makefile include scripts source @atomic_obj
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:212: warning: Incorrect use of kernel-doc format: Documentation Makefile include scripts source gpu_info FW provided soc bounding box struct or 0 if not
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function parameter or member 'atomic_obj' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function parameter or member 'backlight_link' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function parameter or member 'backlight_caps' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function parameter or member 'freesync_module' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function parameter or member 'fw_dmcu' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function parameter or member 'dmcu_fw_version' not described in 'amdgpu_display_manager'
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:217: warning: Function parameter or member 'soc_bounding_box' not described in 'amdgpu_display_manager'
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
   drivers/gpu/drm/scheduler/sched_main.c:365: warning: Function parameter or member 'bad' not described in 'drm_sched_stop'
   drivers/gpu/drm/scheduler/sched_main.c:429: warning: Function parameter or member 'full_recovery' not described in 'drm_sched_start'
   drivers/gpu/drm/i915/i915_vma.h:50: warning: cannot understand function prototype: 'struct i915_vma '
   drivers/gpu/drm/i915/i915_vma.h:1: warning: no structured comments found
   drivers/gpu/drm/i915/intel_guc_fwif.h:536: warning: cannot understand function prototype: 'struct guc_log_buffer_state '
   drivers/gpu/drm/i915/i915_trace.h:1: warning: no structured comments found
   drivers/gpu/drm/i915/i915_reg.h:156: warning: bad line:
   include/linux/interconnect.h:1: warning: no structured comments found
   include/linux/skbuff.h:897: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:897: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
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
   include/net/sock.h:520: warning: Function parameter or member 'sk_rx_skb_cache' not described in 'sock'
   include/net/sock.h:520: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:520: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:520: warning: Function parameter or member 'sk_tx_skb_cache' not described in 'sock'
   include/net/sock.h:520: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:520: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:520: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/net/sock.h:520: warning: Function parameter or member 'sk_bpf_storage' not described in 'sock'
   net/socket.c:658: warning: Excess function parameter 'sock' description in 'INDIRECT_CALLABLE_DECLARE'
   net/socket.c:658: warning: Excess function parameter 'msg' description in 'INDIRECT_CALLABLE_DECLARE'
   net/socket.c:889: warning: Excess function parameter 'sock' description in 'INDIRECT_CALLABLE_DECLARE'
   net/socket.c:889: warning: Excess function parameter 'msg' description in 'INDIRECT_CALLABLE_DECLARE'
   net/socket.c:889: warning: Excess function parameter 'flags' description in 'INDIRECT_CALLABLE_DECLARE'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member '____cacheline_aligned_in_smp' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2044: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'quotactl' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'quota_on' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_free_mnt_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_eat_lsm_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_kern_mount' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_show_options' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_add_mnt_opt' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'd_instantiate' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'getprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'setprocattr' not described in 'security_list_options'
   Documentation/admin-guide/mm/numaperf.rst:24: ERROR: Unexpected indentation.
   Documentation/admin-guide/mm/numaperf.rst:24: WARNING: Inline substitution_reference start-string without end-string.
   Documentation/admin-guide/mm/numaperf.rst:25: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/bpf/btf.rst:154: ERROR: Unexpected indentation.
   Documentation/bpf/btf.rst:163: ERROR: Unexpected indentation.
   lib/list_sort.c:128: WARNING: Definition list ends without a blank line; unexpected unindent.
   lib/list_sort.c:161: ERROR: Unexpected indentation.
   lib/list_sort.c:162: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/xarray.h:232: ERROR: Unexpected indentation.
   kernel/time/hrtimer.c:1120: WARNING: Block quote ends without a blank line; unexpected unindent.
   kernel/signal.c:348: WARNING: Inline literal start-string without end-string.

vim +217 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h

b8592b484 Leo Li              2018-09-14  111  
4562236b3 Harry Wentland      2017-09-12  112  	struct dc *dc;
b8592b484 Leo Li              2018-09-14  113  
b8592b484 Leo Li              2018-09-14  114  	/**
b8592b484 Leo Li              2018-09-14  115  	 * @cgs_device:
b8592b484 Leo Li              2018-09-14  116  	 *
b8592b484 Leo Li              2018-09-14  117  	 * The Common Graphics Services device. It provides an interface for
b8592b484 Leo Li              2018-09-14  118  	 * accessing registers.
b8592b484 Leo Li              2018-09-14  119  	 */
4562236b3 Harry Wentland      2017-09-12  120  	struct cgs_device *cgs_device;
4562236b3 Harry Wentland      2017-09-12  121  
b8592b484 Leo Li              2018-09-14  122  	struct amdgpu_device *adev;
b8592b484 Leo Li              2018-09-14  123  	struct drm_device *ddev;
4562236b3 Harry Wentland      2017-09-12  124  	u16 display_indexes_num;
4562236b3 Harry Wentland      2017-09-12  125  
b8592b484 Leo Li              2018-09-14  126  	/**
eb3dc8978 Nicholas Kazlauskas 2018-11-22  127  	 * @atomic_obj
eb3dc8978 Nicholas Kazlauskas 2018-11-22 @128  	 *
eb3dc8978 Nicholas Kazlauskas 2018-11-22  129  	 * In combination with &dm_atomic_state it helps manage
eb3dc8978 Nicholas Kazlauskas 2018-11-22  130  	 * global atomic state that doesn't map cleanly into existing
eb3dc8978 Nicholas Kazlauskas 2018-11-22  131  	 * drm resources, like &dc_context.
eb3dc8978 Nicholas Kazlauskas 2018-11-22  132  	 */
eb3dc8978 Nicholas Kazlauskas 2018-11-22  133  	struct drm_private_obj atomic_obj;
eb3dc8978 Nicholas Kazlauskas 2018-11-22  134  
eb3dc8978 Nicholas Kazlauskas 2018-11-22  135  	/**
674e78aca Nicholas Kazlauskas 2018-12-05  136  	 * @dc_lock:
674e78aca Nicholas Kazlauskas 2018-12-05  137  	 *
674e78aca Nicholas Kazlauskas 2018-12-05  138  	 * Guards access to DC functions that can issue register write
674e78aca Nicholas Kazlauskas 2018-12-05  139  	 * sequences.
674e78aca Nicholas Kazlauskas 2018-12-05  140  	 */
674e78aca Nicholas Kazlauskas 2018-12-05  141  	struct mutex dc_lock;
674e78aca Nicholas Kazlauskas 2018-12-05  142  
674e78aca Nicholas Kazlauskas 2018-12-05  143  	/**
b8592b484 Leo Li              2018-09-14  144  	 * @irq_handler_list_low_tab:
b8592b484 Leo Li              2018-09-14  145  	 *
b8592b484 Leo Li              2018-09-14  146  	 * Low priority IRQ handler table.
4562236b3 Harry Wentland      2017-09-12  147  	 *
b8592b484 Leo Li              2018-09-14  148  	 * It is a n*m table consisting of n IRQ sources, and m handlers per IRQ
b8592b484 Leo Li              2018-09-14  149  	 * source. Low priority IRQ handlers are deferred to a workqueue to be
b8592b484 Leo Li              2018-09-14  150  	 * processed. Hence, they can sleep.
4562236b3 Harry Wentland      2017-09-12  151  	 *
4562236b3 Harry Wentland      2017-09-12  152  	 * Note that handlers are called in the same order as they were
4562236b3 Harry Wentland      2017-09-12  153  	 * registered (FIFO).
4562236b3 Harry Wentland      2017-09-12  154  	 */
4562236b3 Harry Wentland      2017-09-12  155  	struct irq_list_head irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER];
b8592b484 Leo Li              2018-09-14  156  
b8592b484 Leo Li              2018-09-14  157  	/**
b8592b484 Leo Li              2018-09-14  158  	 * @irq_handler_list_high_tab:
b8592b484 Leo Li              2018-09-14  159  	 *
b8592b484 Leo Li              2018-09-14  160  	 * High priority IRQ handler table.
b8592b484 Leo Li              2018-09-14  161  	 *
b8592b484 Leo Li              2018-09-14  162  	 * It is a n*m table, same as &irq_handler_list_low_tab. However,
b8592b484 Leo Li              2018-09-14  163  	 * handlers in this table are not deferred and are called immediately.
b8592b484 Leo Li              2018-09-14  164  	 */
4562236b3 Harry Wentland      2017-09-12  165  	struct list_head irq_handler_list_high_tab[DAL_IRQ_SOURCES_NUMBER];
4562236b3 Harry Wentland      2017-09-12  166  
b8592b484 Leo Li              2018-09-14  167  	/**
b8592b484 Leo Li              2018-09-14  168  	 * @pflip_params:
b8592b484 Leo Li              2018-09-14  169  	 *
b8592b484 Leo Li              2018-09-14  170  	 * Page flip IRQ parameters, passed to registered handlers when
b8592b484 Leo Li              2018-09-14  171  	 * triggered.
b8592b484 Leo Li              2018-09-14  172  	 */
4562236b3 Harry Wentland      2017-09-12  173  	struct common_irq_params
4562236b3 Harry Wentland      2017-09-12  174  	pflip_params[DC_IRQ_SOURCE_PFLIP_LAST - DC_IRQ_SOURCE_PFLIP_FIRST + 1];
4562236b3 Harry Wentland      2017-09-12  175  
b8592b484 Leo Li              2018-09-14  176  	/**
b8592b484 Leo Li              2018-09-14  177  	 * @vblank_params:
b8592b484 Leo Li              2018-09-14  178  	 *
b8592b484 Leo Li              2018-09-14  179  	 * Vertical blanking IRQ parameters, passed to registered handlers when
b8592b484 Leo Li              2018-09-14  180  	 * triggered.
b8592b484 Leo Li              2018-09-14  181  	 */
4562236b3 Harry Wentland      2017-09-12  182  	struct common_irq_params
b57de80a5 Andrey Grodzovsky   2017-04-19  183  	vblank_params[DC_IRQ_SOURCE_VBLANK6 - DC_IRQ_SOURCE_VBLANK1 + 1];
4562236b3 Harry Wentland      2017-09-12  184  
d2574c33b Mario Kleiner       2019-03-29  185  	/**
d2574c33b Mario Kleiner       2019-03-29  186  	 * @vupdate_params:
d2574c33b Mario Kleiner       2019-03-29  187  	 *
d2574c33b Mario Kleiner       2019-03-29  188  	 * Vertical update IRQ parameters, passed to registered handlers when
d2574c33b Mario Kleiner       2019-03-29  189  	 * triggered.
d2574c33b Mario Kleiner       2019-03-29  190  	 */
d2574c33b Mario Kleiner       2019-03-29  191  	struct common_irq_params
d2574c33b Mario Kleiner       2019-03-29  192  	vupdate_params[DC_IRQ_SOURCE_VUPDATE6 - DC_IRQ_SOURCE_VUPDATE1 + 1];
d2574c33b Mario Kleiner       2019-03-29  193  
4562236b3 Harry Wentland      2017-09-12  194  	spinlock_t irq_handler_list_table_lock;
4562236b3 Harry Wentland      2017-09-12  195  
4562236b3 Harry Wentland      2017-09-12  196  	struct backlight_device *backlight_dev;
4562236b3 Harry Wentland      2017-09-12  197  
4562236b3 Harry Wentland      2017-09-12  198  	const struct dc_link *backlight_link;
206bbafe0 David Francis       2018-11-26  199  	struct amdgpu_dm_backlight_caps backlight_caps;
4562236b3 Harry Wentland      2017-09-12  200  
4562236b3 Harry Wentland      2017-09-12  201  	struct mod_freesync *freesync_module;
a36214858 Andrey Grodzovsky   2017-04-20  202  
a36214858 Andrey Grodzovsky   2017-04-20  203  	struct drm_atomic_state *cached_state;
5099114ba Alex Deucher        2018-05-31  204  
a32e24b48 Roman Li            2017-07-27  205  	struct dm_comressor_info compressor;
a94d5569b David Francis       2018-09-11  206  
a94d5569b David Francis       2018-09-11  207  	const struct firmware *fw_dmcu;
ee6e89c0f David Francis       2018-09-13  208  	uint32_t dmcu_fw_version;
8ebfb4406 Harry Wentland      2019-05-07  209  #ifdef CONFIG_DRM_AMD_DC_DCN2_0
8ebfb4406 Harry Wentland      2019-05-07  210  	/**
8ebfb4406 Harry Wentland      2019-05-07  211  	 * gpu_info FW provided soc bounding box struct or 0 if not
8ebfb4406 Harry Wentland      2019-05-07  212  	 * available in FW
8ebfb4406 Harry Wentland      2019-05-07  213  	 */
8ebfb4406 Harry Wentland      2019-05-07  214  	const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
8ebfb4406 Harry Wentland      2019-05-07  215  #endif
4562236b3 Harry Wentland      2017-09-12  216  };
4562236b3 Harry Wentland      2017-09-12 @217  

:::::: The code at line 217 was first introduced by commit
:::::: 4562236b3bc0a28aeb6ee93b2d8a849a4c4e1c7c drm/amd/dc: Add dc display driver (v2)

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--IJpNTDwzlM2Ie8A6
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
lmgAAA==

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--IJpNTDwzlM2Ie8A6--
