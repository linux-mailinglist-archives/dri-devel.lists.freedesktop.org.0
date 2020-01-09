Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16E1350C4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 02:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204F96E366;
	Thu,  9 Jan 2020 01:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5096E366
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 01:00:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 17:00:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,412,1571727600"; 
 d="gz'50?scan'50,208,50";a="218222591"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2020 17:00:55 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ipMBy-000DnJ-Dj; Thu, 09 Jan 2020 09:00:54 +0800
Date: Thu, 9 Jan 2020 09:00:14 +0800
From: kbuild test robot <lkp@intel.com>
To: David Francis <David.Francis@amd.com>
Subject: [radeon-alex:drm-next 218/239] htmldocs:
 include/drm/drm_dp_mst_helper.h:162: warning: Function parameter or member
 'fec_capable' not described in 'drm_dp_mst_port'
Message-ID: <202001090859.iOoD06OO%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bsgqmghhymwl5zgi"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 kbuild-all@lists.01.org, Mikita Lipski <mikita.lipski@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bsgqmghhymwl5zgi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git drm-next
head:   97b7d54cb4471d27e35913a98c914956be65cc2c
commit: ccc3c70e60b54ed29137323b6e48d2895faec88b [218/239] drm/dp_mst: Parse FEC capability on MST ports
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   fs/posix_acl.c:647: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   sound/soc/soc-core.c:2509: warning: Function parameter or member 'legacy_dai_naming' not described in 'snd_soc_register_dai'
   include/linux/skbuff.h:888: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
   include/net/sock.h:232: warning: Function parameter or member 'skc_addrpair' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_portpair' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_ipv6only' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_net_refcnt' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_v6_daddr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_v6_rcv_saddr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_cookie' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_listener' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_tw_dr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_rcv_wnd' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_tw_rcv_nxt' not described in 'sock_common'
   include/net/sock.h:514: warning: Function parameter or member 'sk_rx_skb_cache' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_tx_skb_cache' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_bpf_storage' not described in 'sock'
   include/net/sock.h:2454: warning: Function parameter or member 'tcp_rx_skb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2454: warning: Excess function parameter 'sk' description in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2454: warning: Excess function parameter 'skb' description in 'DECLARE_STATIC_KEY_FALSE'
   net/core/skbuff.c:5489: warning: Function parameter or member 'ethernet' not described in 'skb_mpls_push'
   include/linux/netdevice.h:1779: warning: bad line: spinlock
   include/linux/netdevice.h:2082: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
   drivers/infiniband/core/umem_odp.c:167: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_alloc_child'
   drivers/infiniband/core/umem_odp.c:217: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_get'
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
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:263: warning: Function parameter or member 'tbl_entries' not described in 'opa_veswport_mactable'
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
   kernel/futex.c:1187: warning: Function parameter or member 'ret' not described in 'wait_for_owner_exiting'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
   drivers/gpu/drm/bridge/panel.c:303: warning: Function parameter or member 'bridge' not described in 'drm_panel_bridge_connector'
>> include/drm/drm_dp_mst_helper.h:162: warning: Function parameter or member 'fec_capable' not described in 'drm_dp_mst_port'
   include/drm/gpu_scheduler.h:102: warning: Function parameter or member 'num_sched_list' not described in 'drm_sched_entity'
   include/drm/gpu_scheduler.h:102: warning: Function parameter or member 'sched_list' not described in 'drm_sched_entity'
   include/drm/gpu_scheduler.h:102: warning: Function parameter or member 'priority' not described in 'drm_sched_entity'
   include/net/cfg80211.h:1189: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4081: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
   include/net/mac80211.h:2036: warning: Function parameter or member 'txpwr' not described in 'ieee80211_sta'
   include/linux/devfreq.h:187: warning: Function parameter or member 'last_status' not described in 'devfreq'
   drivers/devfreq/devfreq.c:1818: warning: bad line: - Resource-managed devfreq_register_notifier()
   drivers/devfreq/devfreq.c:1854: warning: bad line: - Resource-managed devfreq_unregister_notifier()
   drivers/devfreq/devfreq-event.c:355: warning: Function parameter or member 'edev' not described in 'devfreq_event_remove_edev'
   drivers/devfreq/devfreq-event.c:355: warning: Excess function parameter 'dev' description in 'devfreq_event_remove_edev'
   Documentation/admin-guide/xfs.rst:257: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/admin-guide/hw-vuln/tsx_async_abort.rst:142: WARNING: duplicate label virt_mechanism, other instance in Documentation/admin-guide/hw-vuln/mds.rst
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to nonexisting document 'usb/rio'
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to nonexisting document 'usb/wusb-design-overview'
   Documentation/x86/boot.rst:72: WARNING: Malformed table.
   Text in column margin in table line 57.

vim +162 include/drm/drm_dp_mst_helper.h

ad7f8a1f9ced7f Dave Airlie 2014-06-05 @162  

:::::: The code at line 162 was first introduced by commit
:::::: ad7f8a1f9ced7f049f9b66d588723f243a7034cd drm/helper: add Displayport multi-stream helper (v0.6)

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--bsgqmghhymwl5zgi
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ngmGWjC72Jn0LzxqJWJ7agAA

--bsgqmghhymwl5zgi
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--bsgqmghhymwl5zgi--
