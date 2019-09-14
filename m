Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D9B29E3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 06:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811CF6E0EB;
	Sat, 14 Sep 2019 04:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4B06E0EB
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 04:49:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 21:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,503,1559545200"; 
 d="gz'50?scan'50,208,50";a="210591638"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2019 21:49:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i9005-0003gE-E9; Sat, 14 Sep 2019 12:49:33 +0800
Date: Sat, 14 Sep 2019 12:49:14 +0800
From: kbuild test robot <lkp@intel.com>
To: Christian =?unknown-8bit?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 1718/1730] htmldocs:
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:827: warning: Function parameter or
 member 'direct' not described in 'amdgpu_vm_bo_param'
Message-ID: <201909141209.VHxqrkOF%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dl32a6nhgwinbdb3"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dl32a6nhgwinbdb3
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   cfdabd064b2d58f98ff376f1134d3cea5515a64e
commit: 76c44610d813f21e7f843973813c1282b2388041 [1718/1730] drm/amdgpu: allocate PDs/PTs with no_gpu_wait in a page fault
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.
   Documentation/sphinx/kfigure.py:174: RemovedInSphinx20Warning: app.verbose() is now deprecated. Use sphinx.util.logging instead.
     app.verbose("kfigure: check installed tools ...")
   Documentation/sphinx/kfigure.py:182: RemovedInSphinx20Warning: app.warning() is now deprecated. Use sphinx.util.logging instead.
     app.warn("dot(1) not found, for better output quality install "
   WARNING: dot(1) not found, for better output quality install graphviz from http://www.graphviz.org
   Documentation/sphinx/kfigure.py:188: RemovedInSphinx20Warning: app.warning() is now deprecated. Use sphinx.util.logging instead.
     "convert(1) not found, for SVG to PDF conversion install "
   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   Documentation/sphinx/kerneldoc.py:93: RemovedInSphinx20Warning: app.verbose() is now deprecated. Use sphinx.util.logging instead.
     env.app.verbose('calling kernel-doc \'%s\'' % (" ".join(cmd)))
   Documentation/sphinx/kerneldoc.py:125: RemovedInSphinx20Warning: AutodocReporter is now deprecated. Use sphinx.util.docutils.switch_source_input() instead.
     self.state.memo.reporter = AutodocReporter(result, self.state.memo.reporter)
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
   Documentation/sphinx/kerneldoc.py:103: RemovedInSphinx20Warning: app.warning() is now deprecated. Use sphinx.util.logging instead.
     env.app.warn('kernel-doc \'%s\' failed with return code %d' % (" ".join(cmd), p.returncode))
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:142: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_read_lock'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:347: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:348: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:494: warning: Function parameter or member 'start' not described in 'amdgpu_vm_pt_first_dfs'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'adev' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'vm' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'start' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'cursor' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'entry' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:827: warning: Function parameter or member 'level' not described in 'amdgpu_vm_bo_param'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:827: warning: Function parameter or member 'direct' not described in 'amdgpu_vm_bo_param'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:863: warning: Function parameter or member 'direct' not described in 'amdgpu_vm_alloc_pts'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'params' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'bo' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'level' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'pe' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'addr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'count' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'incr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1299: warning: Function parameter or member 'flags' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2828: warning: Function parameter or member 'pasid' not described in 'amdgpu_vm_make_compute'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:389: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:390: warning: Function parameter or member 'ih' not described in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:390: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:129: warning: Incorrect use of kernel-doc format:          * @atomic_obj
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:235: warning: Incorrect use of kernel-doc format:          * gpu_info FW provided soc bounding box struct or 0 if not
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:240: warning: Function parameter or member 'atomic_obj' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:240: warning: Function parameter or member 'backlight_link' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:240: warning: Function parameter or member 'backlight_caps' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:240: warning: Function parameter or member 'freesync_module' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:240: warning: Function parameter or member 'fw_dmcu' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:240: warning: Function parameter or member 'dmcu_fw_version' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:240: warning: Function parameter or member 'soc_bounding_box' not described in 'amdgpu_display_manager'
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
   drivers/gpu/drm/drm_dp_mst_topology.c:1594: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_late_register'
   drivers/gpu/drm/drm_dp_mst_topology.c:1614: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_early_unregister'
   drivers/gpu/drm/drm_dp_mst_topology.c:1594: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_late_register'
   drivers/gpu/drm/drm_dp_mst_topology.c:1614: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_early_unregister'
   drivers/gpu/drm/drm_dp_mst_topology.c:1595: warning: Function parameter or member 'connector' not described in 'drm_dp_mst_connector_late_register'
   drivers/gpu/drm/drm_dp_mst_topology.c:1595: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_late_register'
   drivers/gpu/drm/drm_dp_mst_topology.c:1615: warning: Function parameter or member 'connector' not described in 'drm_dp_mst_connector_early_unregister'
   drivers/gpu/drm/drm_dp_mst_topology.c:1615: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_early_unregister'
   drivers/gpu/drm/drm_dp_mst_topology.c:1594: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_late_register'
   drivers/gpu/drm/drm_dp_mst_topology.c:1614: warning: Excess function parameter 'drm_connector' description in 'drm_dp_mst_connector_early_unregister'
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

vim +827 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

adc7e863f68466 Christian König 2019-03-18  815  
13307f7e1d0c05 Christian König 2018-01-24  816  /**
e21eb2613d071a Christian König 2018-08-27  817   * amdgpu_vm_bo_param - fill in parameters for PD/PT allocation
e21eb2613d071a Christian König 2018-08-27  818   *
e21eb2613d071a Christian König 2018-08-27  819   * @adev: amdgpu_device pointer
e21eb2613d071a Christian König 2018-08-27  820   * @vm: requesting vm
e21eb2613d071a Christian König 2018-08-27  821   * @bp: resulting BO allocation parameters
e21eb2613d071a Christian König 2018-08-27  822   */
e21eb2613d071a Christian König 2018-08-27  823  static void amdgpu_vm_bo_param(struct amdgpu_device *adev, struct amdgpu_vm *vm,
76c44610d813f2 Christian König 2019-07-17  824  			       int level, bool direct,
76c44610d813f2 Christian König 2019-07-17  825  			       struct amdgpu_bo_param *bp)
e21eb2613d071a Christian König 2018-08-27  826  {
e21eb2613d071a Christian König 2018-08-27 @827  	memset(bp, 0, sizeof(*bp));
e21eb2613d071a Christian König 2018-08-27  828  
e21eb2613d071a Christian König 2018-08-27  829  	bp->size = amdgpu_vm_bo_size(adev, level);
e21eb2613d071a Christian König 2018-08-27  830  	bp->byte_align = AMDGPU_GPU_PAGE_SIZE;
e21eb2613d071a Christian König 2018-08-27  831  	bp->domain = AMDGPU_GEM_DOMAIN_VRAM;
284dec4317c8e7 Christian König 2018-08-22  832  	bp->domain = amdgpu_bo_get_preferred_pin_domain(adev, bp->domain);
284dec4317c8e7 Christian König 2018-08-22  833  	bp->flags = AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS |
284dec4317c8e7 Christian König 2018-08-22  834  		AMDGPU_GEM_CREATE_CPU_GTT_USWC;
e21eb2613d071a Christian König 2018-08-27  835  	if (vm->use_cpu_for_update)
e21eb2613d071a Christian König 2018-08-27  836  		bp->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
03e9dee11db0cc Felix Kuehling  2018-09-05  837  	else if (!vm->root.base.bo || vm->root.base.bo->shadow)
03e9dee11db0cc Felix Kuehling  2018-09-05  838  		bp->flags |= AMDGPU_GEM_CREATE_SHADOW;
e21eb2613d071a Christian König 2018-08-27  839  	bp->type = ttm_bo_type_kernel;
76c44610d813f2 Christian König 2019-07-17  840  	bp->no_wait_gpu = direct;
e21eb2613d071a Christian König 2018-08-27  841  	if (vm->root.base.bo)
e21eb2613d071a Christian König 2018-08-27  842  		bp->resv = vm->root.base.bo->tbo.resv;
e21eb2613d071a Christian König 2018-08-27  843  }
e21eb2613d071a Christian König 2018-08-27  844  

:::::: The code at line 827 was first introduced by commit
:::::: e21eb2613d071abfaa40e353b106f01f4ce83d77 drm/amdgpu: add helper for VM PD/PT allocation parameters v3

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--dl32a6nhgwinbdb3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
vpdoAAA=

--dl32a6nhgwinbdb3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--dl32a6nhgwinbdb3--
