Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9E1266C3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 17:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58036E373;
	Thu, 19 Dec 2019 16:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060B36E373
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 16:24:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 08:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; 
 d="gz'50?scan'50,208,50";a="241211749"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 19 Dec 2019 08:24:24 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ihyb9-000Fth-MV; Fri, 20 Dec 2019 00:24:23 +0800
Date: Fri, 20 Dec 2019 00:24:18 +0800
From: kbuild test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@amd.com>
Subject: [radeon-alex:drm-next 488/534] htmldocs:
 include/drm/gpu_scheduler.h:102: warning: Function parameter or member
 'num_sched_list' not described in 'drm_sched_entity'
Message-ID: <201912200013.SGk9kF1n%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fwkquusfgnlg4ifx"
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
Cc: Alex Deucher <alexander.deucher@amd.com>, kbuild-all@lists.01.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fwkquusfgnlg4ifx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git drm-next
head:   2236fe71fb0b404a02c9451f4966c9b754a36c9e
commit: 353522e0be7cc524c17da80e4ed66e4100f339af [488/534] drm/scheduler: rework entity creation
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
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
>> include/drm/gpu_scheduler.h:102: warning: Function parameter or member 'num_sched_list' not described in 'drm_sched_entity'
>> include/drm/gpu_scheduler.h:102: warning: Function parameter or member 'sched_list' not described in 'drm_sched_entity'
>> include/drm/gpu_scheduler.h:102: warning: Function parameter or member 'priority' not described in 'drm_sched_entity'
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
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to nonexisting document 'usb/rio'
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to nonexisting document 'usb/wusb-design-overview'
   Documentation/x86/boot.rst:72: WARNING: Malformed table.
   Text in column margin in table line 57.

vim +102 include/drm/gpu_scheduler.h

1b1f42d8fde4fe Lucas Stach 2017-12-06 @102  

:::::: The code at line 102 was first introduced by commit
:::::: 1b1f42d8fde4fef1ed7873bf5aa91755f8c3de35 drm: move amd_gpu_scheduler into common location

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--fwkquusfgnlg4ifx
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Pw4pUlpqAAA=

--fwkquusfgnlg4ifx
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--fwkquusfgnlg4ifx--
