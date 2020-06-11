Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E01F6848
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 14:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552CB89A4B;
	Thu, 11 Jun 2020 12:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3384289A4B;
 Thu, 11 Jun 2020 12:51:36 +0000 (UTC)
IronPort-SDR: uZan0LnG06Q0SidOR7HLEg/3wJEUfKFjeo7j0uvDxzuLyKyDHshZeJ47FpeidG0vnqfeqIFhLd
 tin2gLsKgyKw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 05:51:35 -0700
IronPort-SDR: cEFRUW37eoY24+L0lRrnHqcjtsnsKuNFW5ajIHbTDlTOrzuOwcrqo5ZvhR4af+M4u/tCuo+BRC
 1MOEUkx5gYMw==
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; d="scan'208";a="306916223"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 05:51:34 -0700
Date: Thu, 11 Jun 2020 15:51:24 +0300
From: Imre Deak <imre.deak@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Lyude Paul <lyude@redhat.com>
Subject: Re: =?utf-8?B?4pyTIEZpLkNJLklHVDogc3VjY2Vz?=
 =?utf-8?Q?s_for_series_starting_with_=5B1=2F3=5D_drm=2Fdp=5Fmst?=
 =?utf-8?Q?=3A?= Fix the DDC I2C device unregistration of an MST port (rev2)
Message-ID: <20200611125124.GE17512@ideak-desk.fi.intel.com>
References: <20200607212522.16935-1-imre.deak@intel.com>
 <159186517668.22716.10635471487472572534@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159186517668.22716.10635471487472572534@emeril.freedesktop.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 08:46:16AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/3] drm/dp_mst: Fix the DDC I2C device unregistration of an MST port (rev2)
> URL   : https://patchwork.freedesktop.org/series/78100/
> State : success

Thanks for the review, the patchset is pushed to drm-misc-next.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8608_full -> Patchwork_17919_full
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
>   Here are the unknown changes that may have been introduced in Patchwork_17919_full:
> 
> ### Piglit changes ###
> 
> #### Possible regressions ####
> 
>   * spec@glsl-4.20@execution@conversion@frag-conversion-implicit-mat4-dmat4-zero-sign (NEW):
>     - {pig-icl-1065g7}:   NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/pig-icl-1065g7/spec@glsl-4.20@execution@conversion@frag-conversion-implicit-mat4-dmat4-zero-sign.html
> 
>   * spec@glsl-4.20@execution@conversion@vert-conversion-implicit-mat3-dmat3-zero-sign (NEW):
>     - {pig-icl-1065g7}:   NOTRUN -> [CRASH][2] +4 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/pig-icl-1065g7/spec@glsl-4.20@execution@conversion@vert-conversion-implicit-mat3-dmat3-zero-sign.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8608_full and Patchwork_17919_full:
> 
> ### New Piglit tests (6) ###
> 
>   * spec@glsl-4.00@execution@built-in-functions@gs-op-div-dmat4x3-dmat4x3:
>     - Statuses : 1 crash(s)
>     - Exec time: [98.33] s
> 
>   * spec@glsl-4.20@execution@conversion@frag-conversion-implicit-mat4-dmat4-zero-sign:
>     - Statuses : 1 incomplete(s)
>     - Exec time: [0.0] s
> 
>   * spec@glsl-4.20@execution@conversion@geom-conversion-implicit-mat3-dmat3-zero-sign:
>     - Statuses : 1 crash(s)
>     - Exec time: [15.54] s
> 
>   * spec@glsl-4.20@execution@conversion@geom-conversion-implicit-mat4-dmat4-zero-sign:
>     - Statuses : 1 crash(s)
>     - Exec time: [57.24] s
> 
>   * spec@glsl-4.20@execution@conversion@vert-conversion-implicit-mat3-dmat3-zero-sign:
>     - Statuses : 1 crash(s)
>     - Exec time: [3.59] s
> 
>   * spec@glsl-4.20@execution@conversion@vert-conversion-implicit-mat3x4-dmat3x4-zero-sign:
>     - Statuses : 1 crash(s)
>     - Exec time: [25.06] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_17919_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_schedule@implicit-boths@bcs0:
>     - shard-snb:          [PASS][3] -> [INCOMPLETE][4] ([i915#82])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-snb4/igt@gem_exec_schedule@implicit-boths@bcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-snb2/igt@gem_exec_schedule@implicit-boths@bcs0.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#93] / [i915#95]) +3 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@gem_exec_whisper@basic-forked-all:
>     - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-glk4/igt@gem_exec_whisper@basic-forked-all.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-skl:          [PASS][9] -> [INCOMPLETE][10] ([i915#69])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl2/igt@i915_suspend@sysfs-reader.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl6/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-glk2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
>     - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#95]) +16 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
>     - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +1 similar issue
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +8 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
>     - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#95])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>     - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
>     - shard-skl:          [PASS][23] -> [FAIL][24] ([i915#1928])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
>     - shard-skl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +10 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl4/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl10/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
>     - shard-skl:          [PASS][29] -> [DMESG-FAIL][30] ([fdo#108145] / [i915#1982])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
>     - shard-skl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#265])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl2/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl6/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
> 
>   * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
>     - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-iclb7/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
> 
>   * igt@kms_psr@psr2_cursor_render:
>     - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
>     - shard-hsw:          [PASS][37] -> [INCOMPLETE][38] ([i915#61])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-hsw2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
> 
>   * igt@perf@blocking-parameterized:
>     - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#1542])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-tglb3/igt@perf@blocking-parameterized.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-tglb8/igt@perf@blocking-parameterized.html
> 
>   * igt@sw_sync@sync_multi_consumer:
>     - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#402])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-tglb2/igt@sw_sync@sync_multi_consumer.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-tglb1/igt@sw_sync@sync_multi_consumer.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_create@madvise:
>     - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-glk1/igt@gem_exec_create@madvise.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-glk7/igt@gem_exec_create@madvise.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-glk:          [FAIL][45] ([i915#1930]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_mmap_gtt@basic-small-copy-xy:
>     - shard-iclb:         [DMESG-WARN][47] ([i915#1982]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-iclb2/igt@gem_mmap_gtt@basic-small-copy-xy.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-iclb5/igt@gem_mmap_gtt@basic-small-copy-xy.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-skl:          [DMESG-WARN][49] ([i915#1436] / [i915#716]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl10/igt@gen9_exec_parse@allowed-single.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl2/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-skl:          [INCOMPLETE][51] ([i915#69]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl1/igt@i915_suspend@fence-restore-untiled.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl7/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-kbl:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-kbl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-kbl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>     - shard-glk:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-glk1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-glk7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-suspend:
>     - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
> 
>   * igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:
>     - shard-skl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +3 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl1/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl2/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>     - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +3 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-skl:          [INCOMPLETE][63] ([i915#123] / [i915#69]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl8/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl10/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
>     - shard-skl:          [FAIL][65] ([fdo#108145] / [i915#265]) -> [PASS][66] +1 similar issue
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl10/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
> 
>   * igt@kms_psr@psr2_cursor_plane_onoff:
>     - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
> 
>   * igt@kms_setmode@basic:
>     - shard-glk:          [FAIL][69] ([i915#31]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-glk9/igt@kms_setmode@basic.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-glk4/igt@kms_setmode@basic.html
> 
>   * igt@kms_vblank@pipe-c-query-busy-hang:
>     - shard-tglb:         [DMESG-WARN][71] ([i915#402]) -> [PASS][72] +2 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-tglb2/igt@kms_vblank@pipe-c-query-busy-hang.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-tglb1/igt@kms_vblank@pipe-c-query-busy-hang.html
> 
>   * igt@perf@blocking-parameterized:
>     - shard-iclb:         [FAIL][73] ([i915#1542]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-iclb4/igt@perf@blocking-parameterized.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-iclb8/igt@perf@blocking-parameterized.html
>     - shard-hsw:          [FAIL][75] ([i915#1542]) -> [PASS][76] +1 similar issue
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-hsw6/igt@perf@blocking-parameterized.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-hsw1/igt@perf@blocking-parameterized.html
> 
>   * igt@syncobj_wait@invalid-wait-illegal-handle:
>     - shard-apl:          [DMESG-WARN][77] ([i915#95]) -> [PASS][78] +10 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl2/igt@syncobj_wait@invalid-wait-illegal-handle.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl2/igt@syncobj_wait@invalid-wait-illegal-handle.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_reloc@basic-concurrent16:
>     - shard-snb:          [FAIL][79] ([i915#1930]) -> [TIMEOUT][80] ([i915#1958])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         [FAIL][81] ([i915#454]) -> [SKIP][82] ([i915#468])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
>     - shard-skl:          [DMESG-FAIL][83] ([i915#1982]) -> [FAIL][84] ([i915#454])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-skl8/igt@i915_pm_dc@dc6-psr.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-skl1/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-iclb:         [FAIL][85] ([i915#1515]) -> [WARN][86] ([i915#1515])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-snb:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-snb2/igt@kms_big_fb@yf-tiled-addfb.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-snb6/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-apl:          [TIMEOUT][89] ([i915#1319] / [i915#1635]) -> [FAIL][90] ([fdo#110321] / [fdo#110336]) +1 similar issue
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl7/igt@kms_content_protection@atomic.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl7/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-apl:          [DMESG-FAIL][91] ([fdo#110321]) -> [TIMEOUT][92] ([i915#1319])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl2/igt@kms_content_protection@atomic-dpms.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl8/igt@kms_content_protection@atomic-dpms.html
>     - shard-kbl:          [TIMEOUT][93] ([i915#1319] / [i915#1958]) -> [TIMEOUT][94] ([i915#1319])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-kbl4/igt@kms_content_protection@atomic-dpms.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-kbl7/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_draw_crc@fill-fb:
>     - shard-apl:          [DMESG-WARN][95] ([i915#95]) -> [DMESG-FAIL][96] ([i915#95])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl6/igt@kms_draw_crc@fill-fb.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl2/igt@kms_draw_crc@fill-fb.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-apl:          [FAIL][97] ([IGT#2]) -> [DMESG-FAIL][98] ([IGT#2] / [i915#95])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8608/shard-apl3/igt@kms_sysfs_edid_timing.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/shard-apl7/igt@kms_sysfs_edid_timing.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
>   [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
>   [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
>   [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
>   [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
>   [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
>   [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
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
>   * Linux: CI_DRM_8608 -> Patchwork_17919
> 
>   CI-20190529: 20190529
>   CI_DRM_8608: e7b23e6cc4cdd7ad191bb039f803a2f13e4a0e40 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_5700: 88e379cef970db3dab020966d5dd117de7cc03ab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   Patchwork_17919: ae88a71f3c396ee528050ee86509f65af8509303 @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17919/index.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
