Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15D622CCA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478D010E5C5;
	Wed,  9 Nov 2022 13:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19E910E262;
 Tue,  8 Nov 2022 13:20:18 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13b23e29e36so16176048fac.8; 
 Tue, 08 Nov 2022 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uv9gc2ibGoC0p8zBcpgbD9oqWs0yPeUdH2euqwP0XDw=;
 b=SxxDMbROhJxhyd2gsdG8S8h4Qa08yYB7P6UJkcvqLR+pAQpZJjxR16lz68hJbWlpUP
 yGRzyDzQ7xvBJEDEA8MCOmQWCsk2+xIhkCNMd76f60uLLyIImfqEcOc2LpxUMgpyv/NV
 tAz39KPtwQlEbc2qfOd7eA1Fl3EaOjweZXepwB6qGEO3NTCYYIy2Fs3KfcPhw2k4rkQB
 4P4f/iZSErqIpje/TUQ+viSlgjmItWqKt7mPU4SHD6UKpLSns1XaBqTA61IK1t1o57wI
 wSI8IIIqlHhtLndEnEmqoAC6aotcOteeDyjDfvd4G5KNN/MJCnm1fl2cmbwbxcU55OZp
 yxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uv9gc2ibGoC0p8zBcpgbD9oqWs0yPeUdH2euqwP0XDw=;
 b=JoE5A/KpagO/qdsmImsNOa7WONzh7/H2PI7mYQwH8td0kHvllSf+yng4D8TLfKr/qw
 lbusttDQh6XChriGzV9mxynKCb14Ttzh4j/Ryw4qxmqJmH7h0HKWSmeUpxrbrVpWk+tv
 zOGMx/4WS12EUDtIceMTaCbutW8IcqRVRkHqL4I3WXlotvqe3zNGZVUOtRAuQprJ56Dh
 LGV7KAXo4f+htH014oFkq3rlXDM+RfWSKEclfqNdelV1l7iCj43KBQHseI9UAOe1MWAu
 MxW8RMA9oK63bDWd/Kg7+wf9Jzp6LJX8KV/Vd9hbLCnXxzu62RxUBex7+TXxJ/3MUVt1
 CSDg==
X-Gm-Message-State: ACrzQf32SrqkMCNWIN7u571uldpf20WOTQ9+47QREykyFsOZxhX5iCGN
 eKD00bKX+LH+s1QZaFS39teJEoJmxKKuSEhqLBg=
X-Google-Smtp-Source: AMsMyM7Gtj4nFizOmMyIJVpeAzmV8wvteO8SNwvkmDB2F0VclfqGJ/gGj8ImmHnyI9nWDfdHaeIUkBmRc0JLzqNxOhs=
X-Received: by 2002:a05:6870:5596:b0:13c:831a:f150 with SMTP id
 n22-20020a056870559600b0013c831af150mr33051816oao.234.1667913617989; Tue, 08
 Nov 2022 05:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
From: Lukas Satin <luke.satin@gmail.com>
Date: Tue, 8 Nov 2022 14:20:07 +0100
Message-ID: <CAEFVmOKCTc_ZrFyCxiSwCmhtjJj_fzr6n99cWtb9aECFzzYVXg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v7 00/23] drm: Analog TV Improvements
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: multipart/alternative; boundary="000000000000b7668405ecf566e0"
X-Mailman-Approved-At: Wed, 09 Nov 2022 13:50:31 +0000
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b7668405ecf566e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One can switch from NTSC to PAL now using (on vc4)

modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL


NTSC should be 640x480i, not 720. It will probably work on most TV's, but
NTSC by the spec is 640x480i.

On Mon, Nov 7, 2022 at 3:16 PM Maxime Ripard <maxime@cerno.tech> wrote:

> Hi,
>
> Here's a series aiming at improving the command line named modes support,
> and more importantly how we deal with all the analog TV variants.
>
> The named modes support were initially introduced to allow to specify the
> analog TV mode to be used.
>
> However, this was causing multiple issues:
>
>   * The mode name parsed on the command line was passed directly to the
>     driver, which had to figure out which mode it was suppose to match;
>
>   * Figuring that out wasn't really easy, since the video=3D argument or =
what
>     the userspace might not even have a name in the first place, but
>     instead could have passed a mode with the same timings;
>
>   * The fallback to matching on the timings was mostly working as long as
>     we were supporting one 525 lines (most likely NSTC) and one 625 lines
>     (PAL), but couldn't differentiate between two modes with the same
>     timings (NTSC vs PAL-M vs NSTC-J for example);
>
>   * There was also some overlap with the tv mode property registered by
>     drm_mode_create_tv_properties(), but named modes weren't interacting
>     with that property at all.
>
>   * Even though that property was generic, its possible values were
>     specific to each drivers, which made some generic support difficult.
>
> Thus, I chose to tackle in multiple steps:
>
>   * A new TV mode property was introduced, with generic values, each driv=
er
>     reporting through a bitmask what standard it supports to the userspac=
e;
>
>   * This option was added to the command line parsing code to be able to
>     specify it on the kernel command line, and new atomic_check and reset
>     helpers were created to integrate properly into atomic KMS;
>
>   * The named mode parsing code is now creating a proper display mode for
>     the given named mode, and the TV standard will thus be part of the
>     connector state;
>
>   * Two drivers were converted and tested for now (vc4 and sun4i), with
>     some backward compatibility code to translate the old TV mode to the
>     new TV mode;
>
> Unit tests were created along the way.
>
> One can switch from NTSC to PAL now using (on vc4)
>
> modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
> modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL
>
> Let me know what you think,
> Maxime
>
> To: David Airlie <airlied@linux.ie>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Emma Anholt <emma@anholt.net>
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> To: Ben Skeggs <bskeggs@redhat.com>
> To: Karol Herbst <kherbst@redhat.com>
> To: Lyude Paul <lyude@redhat.com>
> To: Chen-Yu Tsai <wens@csie.org>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Samuel Holland <samuel@sholland.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dom Cobley <dom@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
> Changes in v7:
> - Switch to another implementation of get_modes from Noralf
> - Made more checks in VEC's atomic_check
> - Fixed typo in a commit log
> - Checked for tv_mode_specified in
> drm_mode_parse_command_line_for_connector
> - Rebased on drm-misc-next-2022-11-03
> - Link to v6:
> https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v6-0-e7792734=
108f@cerno.tech
>
> Changes in v6:
> - Add and convert to a new get_modes helper to create the PAL and NTSC
> modes in
>   the proper order, with the right preferred mode flag, depending on the
> driver
>   capabilities and defaults.
> - Support PAL60
> - Renamed tests to be consistent with DRM tests naming convention
> - Simplified a bit the named mode parsing code
> - Add a tv_mode_specified field
> - Return 0 in get_modes implementations instead of error codes
> - Link to v5:
> https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v5-0-d841cc64=
fe4b@cerno.tech
>
> Changes in v5:
> - Dropped TV Standard documentation removal
> - Switched the TV Mode documentation from CSV to actual documentation
> - Switched to kunit assertions where possible
> - Switched to KUNIT_ASSERT_NOT_NULL instead of KUNIT_ASSERT_PTR_NE(...,
> NULL)
> - Shuffled a bit the introduction of
> drm_client_modeset_connector_get_modes between patches
> - Renamed tv_mode_names to legacy_tv_mode_names
> - Removed the count variable in sun4i_tv_comp_get_modes
> - Rebased on top of current drm-misc-next
> - Link to v4:
> https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v4-0-60d38873=
f782@cerno.tech
>
> Changes in v4:
> - Removed the unused TV Standard property documentation
> - Added the TV Mode property documentation to kms-properties.csv
> - Fixed the documentation of drm_mode_create_tv_properties()
> - Removed DRM_MODE_TV_MODE_NONE
> - Reworded the line length check comment in drm_mode_analog_tv tests
> - Switched to HZ_PER_KHZ in drm_mode_analog_tv tests
> - Reworked drm_mode_analog_tv to fill our mode using the previously
> computed
>   timings
> - Added the command-line option documentation to modedb.rst
> - Improved the Kunit helpers cleanup
> - Moved the subconnector documentation renaming to the proper patch
> - Added the various review tags
> - Removed the count variable in vc4_vec_connector_get_modes
> - Rebased on drm-misc-next-2022-09-23 and fixed a merge conflict
> - Folded all the named mode parsing improvements in a single patch
> - Link to v3:
> https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v2-0-f733a0ed=
9f90@cerno.tech
>
> Changes in v3:
> - Applied some of the fixes to vc4 and sun4i
> - Renamed the old TV mode property to legacy_mode
> - Fixed a bunch of bisection errors
> - Removed most of the redundant TV modes
> - Added a new None TV mode to not fall back on NTSC by mistake
> - Fixed the mode generation function to match better what is expected
> - Added some logging to the mode generation function
> - Split the improvements to the named mode parsing logic into separate
> patches
> - Added more checks to the TV atomic_check helper
> - Link to v2:
> https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v2-0-=
459522d653a7@cerno.tech/
>
> Changes in v2:
> - Kept the older TV mode property as legacy so we can keep the old driver=
s
> functional
> - Renamed the tv_norm property to tv_mode
> - Added a function to create PAL and NTSC compatible display modes
> - Added some helpers to instantiate a mock DRM device in Kunit
> - More Kunit tests
> - Removed the HD analog TV modes
> - Renamed some of the tests
> - Renamed some of the named modes
> - Fixed typos in commit logs
> - Added the various tags
> - Link to v1:
> https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-0-=
3d53ae722097@cerno.tech/
>
> ---
> Mateusz Kwiatkowski (2):
>       drm/vc4: vec: Check for VEC output constraints
>       drm/vc4: vec: Add support for more analog TV standards
>
> Maxime Ripard (20):
>       drm/tests: Add Kunit Helpers
>       drm/connector: Rename legacy TV property
>       drm/connector: Only register TV mode property if present
>       drm/connector: Rename drm_mode_create_tv_properties
>       drm/connector: Add TV standard property
>       drm/modes: Add a function to generate analog display modes
>       drm/client: Add some tests for drm_connector_pick_cmdline_mode()
>       drm/modes: Move named modes parsing to a separate function
>       drm/modes: Switch to named mode descriptors
>       drm/modes: Fill drm_cmdline mode from named modes
>       drm/connector: Add pixel clock to cmdline mode
>       drm/connector: Add a function to lookup a TV mode by its name
>       drm/modes: Introduce the tv_mode property as a command-line option
>       drm/modes: Properly generate a drm_display_mode from a named mode
>       drm/modes: Introduce more named modes
>       drm/atomic-helper: Add a TV properties reset helper
>       drm/atomic-helper: Add an analog TV atomic_check implementation
>       drm/vc4: vec: Use TV Reset implementation
>       drm/vc4: vec: Convert to the new TV mode property
>       drm/sun4i: tv: Convert to the new TV mode property
>
> Noralf Tr=C3=B8nnes (1):
>       drm/probe-helper: Provide a TV get_modes helper
>
>  Documentation/fb/modedb.rst                     |   2 +
>  Documentation/gpu/drm-kms.rst                   |   6 +
>  drivers/gpu/drm/drm_atomic_state_helper.c       | 124 +++++
>  drivers/gpu/drm/drm_atomic_uapi.c               |   4 +
>  drivers/gpu/drm/drm_client_modeset.c            |   4 +
>  drivers/gpu/drm/drm_connector.c                 | 173 ++++++-
>  drivers/gpu/drm/drm_modes.c                     | 639
> +++++++++++++++++++++++-
>  drivers/gpu/drm/drm_probe_helper.c              |  97 ++++
>  drivers/gpu/drm/gud/gud_connector.c             |  10 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                |   6 +-
>  drivers/gpu/drm/i915/display/intel_tv.c         |   5 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c       |   6 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c                | 141 ++----
>  drivers/gpu/drm/tests/Makefile                  |   3 +
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 229 +++++++++
>  drivers/gpu/drm/tests/drm_cmdline_parser_test.c |  67 +++
>  drivers/gpu/drm/tests/drm_connector_test.c      |  90 ++++
>  drivers/gpu/drm/tests/drm_kunit_helpers.c       |  61 +++
>  drivers/gpu/drm/tests/drm_kunit_helpers.h       |   9 +
>  drivers/gpu/drm/tests/drm_modes_test.c          | 144 ++++++
>  drivers/gpu/drm/vc4/vc4_vec.c                   | 342 +++++++++++--
>  include/drm/drm_atomic_state_helper.h           |   4 +
>  include/drm/drm_connector.h                     |  89 +++-
>  include/drm/drm_mode_config.h                   |  12 +-
>  include/drm/drm_modes.h                         |  17 +
>  include/drm/drm_probe_helper.h                  |   1 +
>  26 files changed, 2081 insertions(+), 204 deletions(-)
> ---
> base-commit: 3b536e43463ed91b7bf9acec1eb4da0bc677dc43
> change-id: 20220728-rpi-analog-tv-properties-0914dfcee460
>
> Best regards,
> --
> Maxime Ripard <maxime@cerno.tech>
>

--000000000000b7668405ecf566e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One can switch from NTSC to PAL now using (on vc4)<br><br>=
modetest -M vc4=C2=A0 -s 53:720x480i -w 53:&#39;TV mode&#39;:1 # NTSC<br>mo=
detest -M vc4=C2=A0 -s 53:720x576i -w 53:&#39;TV mode&#39;:4 # PAL<br><div>=
<br></div><div><br></div><div>NTSC should be 640x480i, not 720. It will pro=
bably work on most TV&#39;s, but NTSC by the spec is 640x480i.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Nov 7, 2022 at 3:16 PM Maxime Ripard &lt;maxime@cerno.tech&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Here&#39;s a series aiming at improving the command line named modes suppor=
t,<br>
and more importantly how we deal with all the analog TV variants.<br>
<br>
The named modes support were initially introduced to allow to specify the<b=
r>
analog TV mode to be used.<br>
<br>
However, this was causing multiple issues:<br>
<br>
=C2=A0 * The mode name parsed on the command line was passed directly to th=
e<br>
=C2=A0 =C2=A0 driver, which had to figure out which mode it was suppose to =
match;<br>
<br>
=C2=A0 * Figuring that out wasn&#39;t really easy, since the video=3D argum=
ent or what<br>
=C2=A0 =C2=A0 the userspace might not even have a name in the first place, =
but<br>
=C2=A0 =C2=A0 instead could have passed a mode with the same timings;<br>
<br>
=C2=A0 * The fallback to matching on the timings was mostly working as long=
 as<br>
=C2=A0 =C2=A0 we were supporting one 525 lines (most likely NSTC) and one 6=
25 lines<br>
=C2=A0 =C2=A0 (PAL), but couldn&#39;t differentiate between two modes with =
the same<br>
=C2=A0 =C2=A0 timings (NTSC vs PAL-M vs NSTC-J for example);<br>
<br>
=C2=A0 * There was also some overlap with the tv mode property registered b=
y<br>
=C2=A0 =C2=A0 drm_mode_create_tv_properties(), but named modes weren&#39;t =
interacting<br>
=C2=A0 =C2=A0 with that property at all.<br>
<br>
=C2=A0 * Even though that property was generic, its possible values were<br=
>
=C2=A0 =C2=A0 specific to each drivers, which made some generic support dif=
ficult.<br>
<br>
Thus, I chose to tackle in multiple steps:<br>
<br>
=C2=A0 * A new TV mode property was introduced, with generic values, each d=
river<br>
=C2=A0 =C2=A0 reporting through a bitmask what standard it supports to the =
userspace;<br>
<br>
=C2=A0 * This option was added to the command line parsing code to be able =
to<br>
=C2=A0 =C2=A0 specify it on the kernel command line, and new atomic_check a=
nd reset<br>
=C2=A0 =C2=A0 helpers were created to integrate properly into atomic KMS;<b=
r>
<br>
=C2=A0 * The named mode parsing code is now creating a proper display mode =
for<br>
=C2=A0 =C2=A0 the given named mode, and the TV standard will thus be part o=
f the<br>
=C2=A0 =C2=A0 connector state;<br>
<br>
=C2=A0 * Two drivers were converted and tested for now (vc4 and sun4i), wit=
h<br>
=C2=A0 =C2=A0 some backward compatibility code to translate the old TV mode=
 to the<br>
=C2=A0 =C2=A0 new TV mode;<br>
<br>
Unit tests were created along the way.<br>
<br>
One can switch from NTSC to PAL now using (on vc4)<br>
<br>
modetest -M vc4=C2=A0 -s 53:720x480i -w 53:&#39;TV mode&#39;:1 # NTSC<br>
modetest -M vc4=C2=A0 -s 53:720x576i -w 53:&#39;TV mode&#39;:4 # PAL<br>
<br>
Let me know what you think,<br>
Maxime<br>
<br>
To: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=3D"_blank">=
airlied@linux.ie</a>&gt;<br>
To: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">=
daniel@ffwll.ch</a>&gt;<br>
To: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@linux.intel.c=
om" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<br>
To: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"_blan=
k">mripard@kernel.org</a>&gt;<br>
To: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" target=3D"=
_blank">tzimmermann@suse.de</a>&gt;<br>
To: Emma Anholt &lt;<a href=3D"mailto:emma@anholt.net" target=3D"_blank">em=
ma@anholt.net</a>&gt;<br>
To: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com" target=
=3D"_blank">jani.nikula@linux.intel.com</a>&gt;<br>
To: Joonas Lahtinen &lt;<a href=3D"mailto:joonas.lahtinen@linux.intel.com" =
target=3D"_blank">joonas.lahtinen@linux.intel.com</a>&gt;<br>
To: Rodrigo Vivi &lt;<a href=3D"mailto:rodrigo.vivi@intel.com" target=3D"_b=
lank">rodrigo.vivi@intel.com</a>&gt;<br>
To: Tvrtko Ursulin &lt;<a href=3D"mailto:tvrtko.ursulin@linux.intel.com" ta=
rget=3D"_blank">tvrtko.ursulin@linux.intel.com</a>&gt;<br>
To: Ben Skeggs &lt;<a href=3D"mailto:bskeggs@redhat.com" target=3D"_blank">=
bskeggs@redhat.com</a>&gt;<br>
To: Karol Herbst &lt;<a href=3D"mailto:kherbst@redhat.com" target=3D"_blank=
">kherbst@redhat.com</a>&gt;<br>
To: Lyude Paul &lt;<a href=3D"mailto:lyude@redhat.com" target=3D"_blank">ly=
ude@redhat.com</a>&gt;<br>
To: Chen-Yu Tsai &lt;<a href=3D"mailto:wens@csie.org" target=3D"_blank">wen=
s@csie.org</a>&gt;<br>
To: Jernej Skrabec &lt;<a href=3D"mailto:jernej.skrabec@gmail.com" target=
=3D"_blank">jernej.skrabec@gmail.com</a>&gt;<br>
To: Samuel Holland &lt;<a href=3D"mailto:samuel@sholland.org" target=3D"_bl=
ank">samuel@sholland.org</a>&gt;<br>
Cc: Geert Uytterhoeven &lt;<a href=3D"mailto:geert@linux-m68k.org" target=
=3D"_blank">geert@linux-m68k.org</a>&gt;<br>
Cc: Mateusz Kwiatkowski &lt;<a href=3D"mailto:kfyatek%2Bpublicgit@gmail.com=
" target=3D"_blank">kfyatek+publicgit@gmail.com</a>&gt;<br>
Cc: &quot;Noralf Tr=C3=B8nnes&quot; &lt;<a href=3D"mailto:noralf@tronnes.or=
g" target=3D"_blank">noralf@tronnes.org</a>&gt;<br>
Cc: Dave Stevenson &lt;<a href=3D"mailto:dave.stevenson@raspberrypi.com" ta=
rget=3D"_blank">dave.stevenson@raspberrypi.com</a>&gt;<br>
Cc: Dom Cobley &lt;<a href=3D"mailto:dom@raspberrypi.com" target=3D"_blank"=
>dom@raspberrypi.com</a>&gt;<br>
Cc: Phil Elwell &lt;<a href=3D"mailto:phil@raspberrypi.com" target=3D"_blan=
k">phil@raspberrypi.com</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank=
">dri-devel@lists.freedesktop.org</a>&gt;<br>
Cc: <a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux=
-kernel@vger.kernel.org</a><br>
Cc: <a href=3D"mailto:intel-gfx@lists.freedesktop.org" target=3D"_blank">in=
tel-gfx@lists.freedesktop.org</a><br>
Cc: <a href=3D"mailto:nouveau@lists.freedesktop.org" target=3D"_blank">nouv=
eau@lists.freedesktop.org</a><br>
Cc: <a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blan=
k">linux-arm-kernel@lists.infradead.org</a><br>
Cc: <a href=3D"mailto:linux-sunxi@lists.linux.dev" target=3D"_blank">linux-=
sunxi@lists.linux.dev</a><br>
Cc: Hans de Goede &lt;<a href=3D"mailto:hdegoede@redhat.com" target=3D"_bla=
nk">hdegoede@redhat.com</a>&gt;<br>
Signed-off-by: Maxime Ripard &lt;maxime@cerno.tech&gt;<br>
<br>
---<br>
Changes in v7:<br>
- Switch to another implementation of get_modes from Noralf<br>
- Made more checks in VEC&#39;s atomic_check<br>
- Fixed typo in a commit log<br>
- Checked for tv_mode_specified in drm_mode_parse_command_line_for_connecto=
r<br>
- Rebased on drm-misc-next-2022-11-03<br>
- Link to v6: <a href=3D"https://lore.kernel.org/r/20220728-rpi-analog-tv-p=
roperties-v6-0-e7792734108f@cerno.tech" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v6-0-e7792734=
108f@cerno.tech</a><br>
<br>
Changes in v6:<br>
- Add and convert to a new get_modes helper to create the PAL and NTSC mode=
s in<br>
=C2=A0 the proper order, with the right preferred mode flag, depending on t=
he driver<br>
=C2=A0 capabilities and defaults.<br>
- Support PAL60<br>
- Renamed tests to be consistent with DRM tests naming convention<br>
- Simplified a bit the named mode parsing code<br>
- Add a tv_mode_specified field<br>
- Return 0 in get_modes implementations instead of error codes<br>
- Link to v5: <a href=3D"https://lore.kernel.org/r/20220728-rpi-analog-tv-p=
roperties-v5-0-d841cc64fe4b@cerno.tech" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v5-0-d841cc64=
fe4b@cerno.tech</a><br>
<br>
Changes in v5:<br>
- Dropped TV Standard documentation removal<br>
- Switched the TV Mode documentation from CSV to actual documentation<br>
- Switched to kunit assertions where possible<br>
- Switched to KUNIT_ASSERT_NOT_NULL instead of KUNIT_ASSERT_PTR_NE(..., NUL=
L)<br>
- Shuffled a bit the introduction of drm_client_modeset_connector_get_modes=
 between patches<br>
- Renamed tv_mode_names to legacy_tv_mode_names<br>
- Removed the count variable in sun4i_tv_comp_get_modes<br>
- Rebased on top of current drm-misc-next<br>
- Link to v4: <a href=3D"https://lore.kernel.org/r/20220728-rpi-analog-tv-p=
roperties-v4-0-60d38873f782@cerno.tech" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v4-0-60d38873=
f782@cerno.tech</a><br>
<br>
Changes in v4:<br>
- Removed the unused TV Standard property documentation<br>
- Added the TV Mode property documentation to kms-properties.csv<br>
- Fixed the documentation of drm_mode_create_tv_properties()<br>
- Removed DRM_MODE_TV_MODE_NONE<br>
- Reworded the line length check comment in drm_mode_analog_tv tests<br>
- Switched to HZ_PER_KHZ in drm_mode_analog_tv tests<br>
- Reworked drm_mode_analog_tv to fill our mode using the previously compute=
d<br>
=C2=A0 timings<br>
- Added the command-line option documentation to modedb.rst<br>
- Improved the Kunit helpers cleanup<br>
- Moved the subconnector documentation renaming to the proper patch<br>
- Added the various review tags<br>
- Removed the count variable in vc4_vec_connector_get_modes<br>
- Rebased on drm-misc-next-2022-09-23 and fixed a merge conflict<br>
- Folded all the named mode parsing improvements in a single patch<br>
- Link to v3: <a href=3D"https://lore.kernel.org/r/20220728-rpi-analog-tv-p=
roperties-v2-0-f733a0ed9f90@cerno.tech" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/r/20220728-rpi-analog-tv-properties-v2-0-f733a0ed=
9f90@cerno.tech</a><br>
<br>
Changes in v3:<br>
- Applied some of the fixes to vc4 and sun4i<br>
- Renamed the old TV mode property to legacy_mode<br>
- Fixed a bunch of bisection errors<br>
- Removed most of the redundant TV modes<br>
- Added a new None TV mode to not fall back on NTSC by mistake<br>
- Fixed the mode generation function to match better what is expected<br>
- Added some logging to the mode generation function<br>
- Split the improvements to the named mode parsing logic into separate patc=
hes<br>
- Added more checks to the TV atomic_check helper<br>
- Link to v2: <a href=3D"https://lore.kernel.org/dri-devel/20220728-rpi-ana=
log-tv-properties-v2-0-459522d653a7@cerno.tech/" rel=3D"noreferrer" target=
=3D"_blank">https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-proper=
ties-v2-0-459522d653a7@cerno.tech/</a><br>
<br>
Changes in v2:<br>
- Kept the older TV mode property as legacy so we can keep the old drivers =
functional<br>
- Renamed the tv_norm property to tv_mode<br>
- Added a function to create PAL and NTSC compatible display modes<br>
- Added some helpers to instantiate a mock DRM device in Kunit<br>
- More Kunit tests<br>
- Removed the HD analog TV modes<br>
- Renamed some of the tests<br>
- Renamed some of the named modes<br>
- Fixed typos in commit logs<br>
- Added the various tags<br>
- Link to v1: <a href=3D"https://lore.kernel.org/dri-devel/20220728-rpi-ana=
log-tv-properties-v1-0-3d53ae722097@cerno.tech/" rel=3D"noreferrer" target=
=3D"_blank">https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-proper=
ties-v1-0-3d53ae722097@cerno.tech/</a><br>
<br>
---<br>
Mateusz Kwiatkowski (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/vc4: vec: Check for VEC output constraints<br>
=C2=A0 =C2=A0 =C2=A0 drm/vc4: vec: Add support for more analog TV standards=
<br>
<br>
Maxime Ripard (20):<br>
=C2=A0 =C2=A0 =C2=A0 drm/tests: Add Kunit Helpers<br>
=C2=A0 =C2=A0 =C2=A0 drm/connector: Rename legacy TV property<br>
=C2=A0 =C2=A0 =C2=A0 drm/connector: Only register TV mode property if prese=
nt<br>
=C2=A0 =C2=A0 =C2=A0 drm/connector: Rename drm_mode_create_tv_properties<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/connector: Add TV standard property<br>
=C2=A0 =C2=A0 =C2=A0 drm/modes: Add a function to generate analog display m=
odes<br>
=C2=A0 =C2=A0 =C2=A0 drm/client: Add some tests for drm_connector_pick_cmdl=
ine_mode()<br>
=C2=A0 =C2=A0 =C2=A0 drm/modes: Move named modes parsing to a separate func=
tion<br>
=C2=A0 =C2=A0 =C2=A0 drm/modes: Switch to named mode descriptors<br>
=C2=A0 =C2=A0 =C2=A0 drm/modes: Fill drm_cmdline mode from named modes<br>
=C2=A0 =C2=A0 =C2=A0 drm/connector: Add pixel clock to cmdline mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/connector: Add a function to lookup a TV mode by i=
ts name<br>
=C2=A0 =C2=A0 =C2=A0 drm/modes: Introduce the tv_mode property as a command=
-line option<br>
=C2=A0 =C2=A0 =C2=A0 drm/modes: Properly generate a drm_display_mode from a=
 named mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/modes: Introduce more named modes<br>
=C2=A0 =C2=A0 =C2=A0 drm/atomic-helper: Add a TV properties reset helper<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/atomic-helper: Add an analog TV atomic_check imple=
mentation<br>
=C2=A0 =C2=A0 =C2=A0 drm/vc4: vec: Use TV Reset implementation<br>
=C2=A0 =C2=A0 =C2=A0 drm/vc4: vec: Convert to the new TV mode property<br>
=C2=A0 =C2=A0 =C2=A0 drm/sun4i: tv: Convert to the new TV mode property<br>
<br>
Noralf Tr=C3=B8nnes (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/probe-helper: Provide a TV get_modes helper<br>
<br>
=C2=A0Documentation/fb/modedb.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0Documentation/gpu/drm-kms.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0drivers/gpu/drm/drm_atomic_state_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 124 +++++<br>
=C2=A0drivers/gpu/drm/drm_atomic_uapi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0drivers/gpu/drm/drm_client_modeset.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0drivers/gpu/drm/drm_connector.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 173 ++++++-<br>
=C2=A0drivers/gpu/drm/drm_modes.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 639 +++++++++++++++++++++++-<br>
=C2=A0drivers/gpu/drm/drm_probe_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 97 ++++<br>
=C2=A0drivers/gpu/drm/gud/gud_connector.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0drivers/gpu/drm/i2c/ch7006_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_tv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0drivers/gpu/drm/nouveau/dispnv04/tvnv17.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
=C2=A0drivers/gpu/drm/sun4i/sun4i_tv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 141 ++----<br>
=C2=A0drivers/gpu/drm/tests/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0drivers/gpu/drm/tests/drm_client_modeset_test.c | 229 +++++++++<br>
=C2=A0drivers/gpu/drm/tests/drm_cmdline_parser_test.c |=C2=A0 67 +++<br>
=C2=A0drivers/gpu/drm/tests/drm_connector_test.c=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 90 ++++<br>
=C2=A0drivers/gpu/drm/tests/drm_kunit_helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 61 +++<br>
=C2=A0drivers/gpu/drm/tests/drm_kunit_helpers.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A09 +<br>
=C2=A0drivers/gpu/drm/tests/drm_modes_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 144 ++++++<br>
=C2=A0drivers/gpu/drm/vc4/vc4_vec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 342 +++++++++++--<br>
=C2=A0include/drm/drm_atomic_state_helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0include/drm/drm_connector.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 89 +++-<br>
=C2=A0include/drm/drm_mode_config.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0include/drm/drm_modes.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +<br>
=C2=A0include/drm/drm_probe_helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A026 files changed, 2081 insertions(+), 204 deletions(-)<br>
---<br>
base-commit: 3b536e43463ed91b7bf9acec1eb4da0bc677dc43<br>
change-id: 20220728-rpi-analog-tv-properties-0914dfcee460<br>
<br>
Best regards,<br>
-- <br>
Maxime Ripard &lt;maxime@cerno.tech&gt;<br>
</blockquote></div>

--000000000000b7668405ecf566e0--
