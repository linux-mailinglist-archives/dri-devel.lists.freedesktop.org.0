Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B50365A66
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B5C898C7;
	Tue, 20 Apr 2021 13:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A2B898C7;
 Tue, 20 Apr 2021 13:44:44 +0000 (UTC)
IronPort-SDR: 9H8Pakyu2DCeRv4HRR4Vk5vrm0oeQrucwBepNR3nlYFeW02SY0gdKHUC0neTtkpvO0Ep7oYA6e
 MfPJQutIbAKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195621177"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="195621177"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:44:43 -0700
IronPort-SDR: Wi5l6Gf767U/N5rmz81L1JA97uxVt137BQLgXj8Vh+uwvGE0LhUXmSRCiWIwyzflL0Oj/NxOZD
 0xc9ViXYd0hA==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="452492554"
Received: from jyick-mobl.amr.corp.intel.com (HELO intel.com) ([10.212.57.228])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:44:40 -0700
Date: Tue, 20 Apr 2021 09:44:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] topic/intel-gen-to-ver -> drm-intel-next and
 drm-intel-gt-next
Message-ID: <YH7axzn3JsMX4p5N@intel.com>
References: <878s5ebny0.fsf@intel.com>
 <161891205594.28135.14229347864444400275@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161891205594.28135.14229347864444400275@jlahtine-mobl.ger.corp.intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 12:47:36PM +0300, Joonas Lahtinen wrote:
> Quoting Jani Nikula (2021-04-19 12:53:11)
> > =

> > Hi Joonas and Rodrigo -
> > =

> > Here's the gen to ver conversion topic branch to be merged to both
> > drm-intel-next and drm-intel-gt-next.
> =

> Pulled.

Pulled, thanks.
(Sorry for the delay on the notification here)

> =

> Regards, Joonas
> =

> > Lots of Cc's for heads up.
> > =

> > =

> > BR,
> > Jani.
> > =

> > =

> > topic/intel-gen-to-ver-2021-04-19:
> > Gen to ver conversions across the driver
> > =

> > The main change is Lucas' series [1], with Ville's GLK fixes [2] and a
> > cherry-pick of Matt's commit [3] from drm-intel-next as a base to avoid
> > conflicts.
> > =

> > [1] https://patchwork.freedesktop.org/series/88825/
> > [2] https://patchwork.freedesktop.org/series/88938/
> > [3] 70bfb30743d5 ("drm/i915/display: Eliminate IS_GEN9_{BC,LP}")
> > =

> > BR,
> > Jani.
> > =

> > The following changes since commit 9c0fed84d5750e1eea6c664e073ffa2534a1=
7743:
> > =

> >   Merge tag 'drm-intel-next-2021-04-01' of git://anongit.freedesktop.or=
g/drm/drm-intel into drm-next (2021-04-08 14:02:21 +1000)
> > =

> > are available in the Git repository at:
> > =

> >   git://anongit.freedesktop.org/drm/drm-intel tags/topic/intel-gen-to-v=
er-2021-04-19
> > =

> > for you to fetch changes up to 425390c5dce6da76578389629d19517fcd79c959:
> > =

> >   drm/i915: split dgfx features from gen 12 (2021-04-14 13:05:06 +0300)
> > =

> > ----------------------------------------------------------------
> > Gen to ver conversions across the driver
> > =

> > The main change is Lucas' series [1], with Ville's GLK fixes [2] and a
> > cherry-pick of Matt's commit [3] from drm-intel-next as a base to avoid
> > conflicts.
> > =

> > [1] https://patchwork.freedesktop.org/series/88825/
> > [2] https://patchwork.freedesktop.org/series/88938/
> > [3] 70bfb30743d5 ("drm/i915/display: Eliminate IS_GEN9_{BC,LP}")
> > =

> > ----------------------------------------------------------------
> > Lucas De Marchi (12):
> >       drm/i915/display: use DISPLAY_VER() on remaining users
> >       drm/i915: rename display.version to display.ver
> >       drm/i915/display: rename display version macros
> >       drm/i915: add macros for graphics and media versions
> >       drm/i915/gt: replace gen use in intel_engine_cs
> >       drm/i915/selftests: replace unused mask with simple version
> >       drm/i915/selftests: eliminate use of gen_mask
> >       drm/i915: finish removal of gen_mask
> >       drm/i915: eliminate remaining uses of intel_device_info->gen
> >       drm/i915: finish removal of gen from intel_device_info
> >       drm/i915: add media and display versions to device_info print
> >       drm/i915: split dgfx features from gen 12
> > =

> > Matt Roper (1):
> >       drm/i915/display: Eliminate IS_GEN9_{BC,LP}
> > =

> > Ville Syrj=E4l=E4 (5):
> >       drm/i915: Restore lost glk FBC 16bpp w/a
> >       drm/i915: Restore lost glk ccs w/a
> >       drm/i915: Disable LTTPR detection on GLK once again
> >       drm/i915: Don't use {skl, cnl}_hpd_pin() for bxt/glk
> >       drm/i915: Remove a few redundant glk checks
> > =

> >  drivers/gpu/drm/i915/display/i9xx_plane.c          |  2 +-
> >  drivers/gpu/drm/i915/display/icl_dsi.c             |  4 +-
> >  drivers/gpu/drm/i915/display/intel_atomic.c        |  2 +-
> >  drivers/gpu/drm/i915/display/intel_audio.c         |  4 +-
> >  drivers/gpu/drm/i915/display/intel_bios.c          |  9 +--
> >  drivers/gpu/drm/i915/display/intel_bw.c            |  8 +--
> >  drivers/gpu/drm/i915/display/intel_cdclk.c         | 42 +++++++-------
> >  drivers/gpu/drm/i915/display/intel_color.c         |  6 +-
> >  drivers/gpu/drm/i915/display/intel_crt.c           |  6 +-
> >  drivers/gpu/drm/i915/display/intel_crtc.c          |  4 +-
> >  drivers/gpu/drm/i915/display/intel_csr.c           |  4 +-
> >  drivers/gpu/drm/i915/display/intel_ddi.c           | 53 +++++++++-----=
----
> >  drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 10 ++--
> >  drivers/gpu/drm/i915/display/intel_display.c       | 64 +++++++++++---=
--------
> >  .../gpu/drm/i915/display/intel_display_debugfs.c   |  2 +-
> >  drivers/gpu/drm/i915/display/intel_display_power.c | 57 ++++++++++----=
-----
> >  drivers/gpu/drm/i915/display/intel_dp.c            | 10 ++--
> >  .../gpu/drm/i915/display/intel_dp_link_training.c  |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c        |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dpll.c          |  8 +--
> >  drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  6 +-
> >  drivers/gpu/drm/i915/display/intel_fb.c            |  2 +-
> >  drivers/gpu/drm/i915/display/intel_fbc.c           | 21 +++----
> >  drivers/gpu/drm/i915/display/intel_fifo_underrun.c |  4 +-
> >  drivers/gpu/drm/i915/display/intel_gmbus.c         | 12 ++--
> >  drivers/gpu/drm/i915/display/intel_hdcp.c          |  9 +--
> >  drivers/gpu/drm/i915/display/intel_hdmi.c          |  9 +--
> >  drivers/gpu/drm/i915/display/intel_lvds.c          |  2 +-
> >  drivers/gpu/drm/i915/display/intel_overlay.c       | 10 ++--
> >  drivers/gpu/drm/i915/display/intel_panel.c         | 10 ++--
> >  drivers/gpu/drm/i915/display/intel_pipe_crc.c      |  4 +-
> >  drivers/gpu/drm/i915/display/intel_pps.c           | 14 ++---
> >  drivers/gpu/drm/i915/display/intel_psr.c           |  4 +-
> >  drivers/gpu/drm/i915/display/intel_tc.c            |  6 +-
> >  drivers/gpu/drm/i915/display/intel_tv.c            |  6 +-
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 10 ++--
> >  drivers/gpu/drm/i915/display/vlv_dsi.c             | 46 ++++++++------=
--
> >  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 22 ++++----
> >  drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 40 +++++++-------
> >  drivers/gpu/drm/i915/gt/selftest_engine_cs.c       | 18 +++---
> >  drivers/gpu/drm/i915/gt/selftest_workarounds.c     | 10 ++--
> >  drivers/gpu/drm/i915/i915_drv.c                    |  4 +-
> >  drivers/gpu/drm/i915/i915_drv.h                    | 42 ++++++++------
> >  drivers/gpu/drm/i915/i915_irq.c                    | 23 ++++----
> >  drivers/gpu/drm/i915/i915_pci.c                    | 13 +++--
> >  drivers/gpu/drm/i915/intel_device_info.c           |  4 +-
> >  drivers/gpu/drm/i915/intel_device_info.h           |  6 +-
> >  drivers/gpu/drm/i915/intel_pm.c                    | 50 ++++++++------=
---
> >  drivers/gpu/drm/i915/intel_uncore.c                |  8 ++-
> >  drivers/gpu/drm/i915/selftests/intel_uncore.c      |  8 ++-
> >  drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  2 +-
> >  51 files changed, 376 insertions(+), 348 deletions(-)
> > =

> > -- =

> > Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
