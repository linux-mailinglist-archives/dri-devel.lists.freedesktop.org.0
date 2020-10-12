Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8D28B584
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 15:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BEF6E440;
	Mon, 12 Oct 2020 13:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25E6E440;
 Mon, 12 Oct 2020 13:08:02 +0000 (UTC)
IronPort-SDR: Gs/mZzKPEbbja+TekZ8DZJXePCS1bApaJSZaH6sWqNff1UZt3yTKeX7jcI2yCOD4ipZFgdMcay
 ov6Qer9xOGWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="162269786"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="162269786"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 06:05:25 -0700
IronPort-SDR: 0VvaUoDVXZJKE3FJbbEAs3oKytNAu8hXZp/L94O7vgqC6wZYQVGeHK8VHfCqV6Br9g4Ewo2sMi
 zwFJr/f5d1vw==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="299283110"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 06:05:23 -0700
Date: Mon, 12 Oct 2020 16:05:20 +0300
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: =?utf-8?B?4pyTIEZpLkNJLklHVDogc3VjY2Vz?=
 =?utf-8?Q?s_for_rm=2Fi915=3A_Ad?= =?utf-8?Q?d?= support for LTTPR
 non-transparent link training mode (rev2)
Message-ID: <20201012130520.GA2348674@ideak-desk.fi.intel.com>
References: <20201007170917.1764556-1-imre.deak@intel.com>
 <160218732911.11034.6649329824047137013@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160218732911.11034.6649329824047137013@emeril.freedesktop.org>
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
Reply-To: imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 08:02:09PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rm/i915: Add support for LTTPR non-transparent link training mode (rev2)
> URL   : https://patchwork.freedesktop.org/series/82449/
> State : success

Thanks for the reviews, patchset is pushed to -dinq.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_9113_full -> Patchwork_18658_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_18658_full:
> 
> ### IGT changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@gem_exec_capture@pi@vcs0}:
>     - shard-skl:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl9/igt@gem_exec_capture@pi@vcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_18658_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - shard-iclb:         [PASS][2] -> [INCOMPLETE][3] ([i915#1090] / [i915#1185])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@gem_exec_suspend@basic-s0.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-iclb3/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglb:         [PASS][4] -> [SKIP][5] ([i915#2190])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb7/igt@gem_huc_copy@huc-copy.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-tglb6/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wc:
>     - shard-hsw:          [PASS][6] -> [FAIL][7] ([i915#1888]) +1 similar issue
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wc.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wc.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-skl:          [PASS][8] -> [FAIL][9] ([i915#454])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl7/igt@i915_pm_dc@dc6-psr.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl10/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-hsw:          [PASS][10] -> [FAIL][11] ([i915#2370])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
>     - shard-skl:          [PASS][12] -> [FAIL][13] ([i915#52] / [i915#54])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:
>     - shard-snb:          [PASS][14] -> [SKIP][15] ([fdo#109271])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
>     - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#1982]) +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>     - shard-skl:          [PASS][18] -> [DMESG-WARN][19] ([i915#1982]) +5 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-skl:          [PASS][20] -> [FAIL][21] ([i915#79])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-dp1:
>     - shard-kbl:          [PASS][22] -> [INCOMPLETE][23] ([i915#155])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-hsw:          [PASS][24] -> [INCOMPLETE][25] ([i915#2055])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-hsw6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +1 similar issue
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-tglb:         [PASS][28] -> [DMESG-WARN][29] ([i915#1982]) +1 similar issue
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-skl:          [PASS][30] -> [FAIL][31] ([i915#1188]) +1 similar issue
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl3/igt@kms_hdr@bpc-switch-suspend.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl10/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-coverage-7efc:
>     - shard-skl:          [PASS][32] -> [FAIL][33] ([fdo#108145] / [i915#265]) +2 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl5/igt@kms_plane_alpha_blend@pipe-c-coverage-7efc.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl4/igt@kms_plane_alpha_blend@pipe-c-coverage-7efc.html
> 
>   * igt@kms_psr@psr2_cursor_plane_move:
>     - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html
> 
>   * igt@kms_setmode@basic:
>     - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#31])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk4/igt@kms_setmode@basic.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-glk5/igt@kms_setmode@basic.html
> 
>   
> #### Possible fixes ####
> 
>   * {igt@gem_exec_capture@pi@rcs0}:
>     - shard-skl:          [INCOMPLETE][38] -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl2/igt@gem_exec_capture@pi@rcs0.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl9/igt@gem_exec_capture@pi@rcs0.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo:
>     - shard-hsw:          [INCOMPLETE][40] -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-hsw1/igt@gem_mmap_gtt@basic-small-bo.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
>     - shard-hsw:          [FAIL][42] ([i915#1888]) -> [PASS][43]
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-skl:          [INCOMPLETE][44] ([i915#151]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl1/igt@i915_pm_rpm@system-suspend.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl2/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - shard-skl:          [DMESG-FAIL][46] ([i915#541]) -> [PASS][47]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl3/igt@i915_selftest@live@gt_heartbeat.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl3/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * {igt@kms_async_flips@alternate-sync-async-flip}:
>     - shard-kbl:          [FAIL][48] ([i915#2521]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * {igt@kms_async_flips@async-flip-with-page-flip-events}:
>     - shard-glk:          [FAIL][50] ([i915#2521]) -> [PASS][51]
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
>     - shard-glk:          [DMESG-WARN][52] ([i915#1982]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
>     - shard-hsw:          [DMESG-WARN][54] ([i915#1982]) -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-hsw8/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-farfromfence:
>     - shard-glk:          [FAIL][56] ([i915#49]) -> [PASS][57]
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-glk8/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-glk4/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>     - shard-skl:          [FAIL][58] ([i915#49]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_plane@plane-position-covered-pipe-b-planes:
>     - shard-skl:          [DMESG-WARN][60] ([i915#1982]) -> [PASS][61] +4 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl8/igt@kms_plane@plane-position-covered-pipe-b-planes.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl8/igt@kms_plane@plane-position-covered-pipe-b-planes.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
>     - shard-skl:          [FAIL][62] ([fdo#108145] / [i915#265]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [SKIP][64] ([fdo#109441]) -> [PASS][65] +3 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_setmode@basic:
>     - shard-skl:          [FAIL][66] ([i915#31]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-skl5/igt@kms_setmode@basic.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-skl2/igt@kms_setmode@basic.html
> 
>   * igt@prime_vgem@sync@rcs0:
>     - shard-iclb:         [INCOMPLETE][68] ([i915#409]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb3/igt@prime_vgem@sync@rcs0.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-iclb4/igt@prime_vgem@sync@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][70] ([i915#658]) -> [SKIP][71] ([i915#588])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_dc@dc5-psr:
>     - shard-tglb:         [DMESG-WARN][72] ([i915#2411]) -> [FAIL][73] ([i915#1899])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9113/shard-tglb6/igt@i915_pm_dc@dc5-psr.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/shard-tglb5/igt@i915_pm_dc@dc5-psr.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [i915#1090]: https://gitlab.freedesktop.org/drm/intel/issues/1090
>   [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
>   [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
>   [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
>   [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
> 
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_9113 -> Patchwork_18658
> 
>   CI-20190529: 20190529
>   CI_DRM_9113: 412ff15f2b9a97bd0ab32f562ecb7efc84837881 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_5805: 9ce50ffed89a46fa1bc98ee2cfe2271c49801079 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   Patchwork_18658: 85eaa572264dad0d1a125c38307cc18d55497c6d @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18658/index.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
