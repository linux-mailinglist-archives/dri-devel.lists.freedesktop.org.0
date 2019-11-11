Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E071F747A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 14:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D81A6E908;
	Mon, 11 Nov 2019 13:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7D26E908
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 13:04:37 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BC69F20003;
 Mon, 11 Nov 2019 13:04:29 +0000 (UTC)
Date: Mon, 11 Nov 2019 14:06:24 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: "Kalakodima Venkata Rajesh (RBEI/ECF3)"
 <VenkataRajesh.Kalakodima@in.bosch.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20191111130624.auplcgd2nwyaw5f3@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <e731216a728c4035af88c92b70756197@in.bosch.com>
MIME-Version: 1.0
In-Reply-To: <e731216a728c4035af88c92b70756197@in.bosch.com>
User-Agent: NeoMutt/20180716
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
Cc: "muroya@ksk.co.jp" <muroya@ksk.co.jp>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "horms@verge.net.au" <horms@verge.net.au>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "koji.matsuoka.xm@renesas.com" <koji.matsuoka.xm@renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 "Harsha Manjula Mallikarjun \(RBEI/ECF3\)"
 <Harsha.ManjulaMallikarjun@in.bosch.com>,
 "uli+renesas@fpond.eu" <uli+renesas@fpond.eu>,
 "ezequiel@collabora.com" <ezequiel@collabora.com>
Content-Type: multipart/mixed; boundary="===============2132759009=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2132759009==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u6q34lyragniy4ty"
Content-Disposition: inline


--u6q34lyragniy4ty
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

On Mon, Nov 11, 2019 at 11:21:28AM +0000, Kalakodima Venkata Rajesh (RBEI/ECF3) wrote:
> Hi Jacopo,
>
> Please find comments below.
>
> Best regards,
>
> Rajesh Kv
> RBEI/ECF3
>
> > -----Original Message-----
> > From: linux-kernel-owner@vger.kernel.org <linux-kernel-
> > owner@vger.kernel.org> On Behalf Of Jacopo Mondi
> > Sent: Tuesday, October 15, 2019 4:16 PM
> > To: laurent.pinchart@ideasonboard.com;
> > kieran.bingham+renesas@ideasonboard.com; geert@linux-m68k.org;
> > horms@verge.net.au; uli+renesas@fpond.eu; Kalakodima Venkata Rajesh
> > (RBEI/ECF3) <VenkataRajesh.Kalakodima@in.bosch.com>
> > Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>; airlied@linux.ie;
> > daniel@ffwll.ch; koji.matsuoka.xm@renesas.com; muroya@ksk.co.jp; Harsha
> > Manjula Mallikarjun (RBEI/ECF3) <Harsha.ManjulaMallikarjun@in.bosch.com>;
> > ezequiel@collabora.com; seanpaul@chromium.org; linux-renesas-
> > soc@vger.kernel.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
> >
> > References:
> > A reference to the v1 cover letter, with some background on the CMM is
> > available here:
> > https://lkml.org/lkml/2019/6/6/583
> > v2:
> > https://lore.kernel.org/linux-renesas-soc/20190706140746.29132-10-
> > jacopo+renesas@jmondi.org/
> > v3:
> > https://lore.kernel.org/linux-renesas-soc/20190825135154.11488-1-
> > jacopo+renesas@jmondi.org/
> > v4:
> > https://lore.kernel.org/linux-renesas-soc/20190906135436.10622-1-
> > jacopo+renesas@jmondi.org/
> >
> > Again, quite a consistent changelog, mostly due to the developments happened
> > on Ezequiel's VOP unit following Sean's advices.
> >
> > I here implemented the same, and moved the CMM handling to the crtc being
> > and enable callbacks. As a result the overall implementation results quite a lot
> > simplified, mostly on the CMM driver side.
> >
> > I have dropped tags and acks on the CMM driver and CMM enablement patches
> > in DU crtc driver because of the number of changes.
> >
> > A more detailed change log:
> >
> > - Rebased on renesas-devel-2019-10-07-v5.4-rc4
> >
> > * Bindings/DT
> > - Included Rob's comments on the yaml file license and the use of 'OneOf'
> >   in the compatible property description
> > - Use the bracketed style suggested by Kieran for the 'renesas,cmm' property
> >   introduced in patch 2
> > - Re-order the properties in the SoC DTS files as suggested by Kieran
> >
> > * CMM/DU
> > - As anticipated, moved CMM management to the crtc from the atomic commit
> > tail
> >   helper where it was implemented in v4
> >   This allow to correctly support resume/suspend and proper ordering of the
> > CMM
> >   enable and setup operations (enable -before- setup)
> > - As a consequence the CMM driver is greatly simplified by removing the need
> >   to cache the LUT table entries provided to cmm_setup() and later re-apply
> >   them at enable time.
> > - Better support handling of disabled CMM config option by returning -ENODEV
> >   at cmm_init() time as suggested by Kieran.
> >
> > * Testing
> > I have tested by injecting a color inversion LUT table and enabling/disabling it
> > every 50 displayed frames:
> > https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut
> >
> > CMM functionalities are retained between suspend/resume cycles (tested with
> > suspend-to-idle) without requiring a re-programming of the LUT tables.
> >
> > Testing with real world use cases might be beneficial. Rajesh are you still
> > interested in giving this series a spin
>
> I have tested version v3 of CMM module with a demo application based on libdrm
> library. I could successfully test setting of Gamma LUT.

\o/

If you want to, please send your Tested-by tag, so that it can be
collected, as CMM support will be collected for the v5.6 merge window, as we
had a small issue that prevented v6 from being part of the v5.5 one.

>
> Next step is to test on full featured graphics stack i.e. involving Weston and OpenGL.
> Weston can set Gamma. I have to stop this work for a while due to other high prio activities.
> I plan to resume soon.
>

Thanks for testing and please keep us posted!

Thanks
   j

> >
> > Laurent, Kieran, could we fast-track review of this and hopefully try to have it
> > merged for v5.5 ?
> >
> > Thanks Ezequiel for having suggested me this solution.
> >
> > Thanks
> >    j
> >
> > Jacopo Mondi (8):
> >   dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
> >   dt-bindings: display, renesas,du: Document cmms property
> >   drm: rcar-du: Add support for CMM
> >   drm: rcar-du: kms: Initialize CMM instances
> >   drm: rcar-du: crtc: Control CMM operations
> >   drm: rcar-du: crtc: Register GAMMA_LUT properties
> >   arm64: dts: renesas: Add CMM units to Gen3 SoCs
> >   drm: rcar-du: kms: Expand comment in vsps parsing routine
> >
> >  .../bindings/display/renesas,cmm.yaml         |  67 ++++++
> >  .../bindings/display/renesas,du.txt           |   5 +
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  39 ++++
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  31 ++-
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  31 ++-
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  21 ++
> >  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  21 ++
> >  drivers/gpu/drm/rcar-du/Kconfig               |   7 +
> >  drivers/gpu/drm/rcar-du/Makefile              |   1 +
> >  drivers/gpu/drm/rcar-du/rcar_cmm.c            | 198 ++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_cmm.h            |  60 ++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  89 ++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_group.c       |   5 +
> >  drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  82 +++++++-
> >  drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
> >  18 files changed, 665 insertions(+), 3 deletions(-)  create mode 100644
> > Documentation/devicetree/bindings/display/renesas,cmm.yaml
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> >
> > --
> > 2.23.0
>

--u6q34lyragniy4ty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3JXMoACgkQcjQGjxah
VjyHxw//YOPTQ1K5syH6PsaJ8ptTzm+gh0f9gDufusYADRI2Pu8CURR7OZwHUBxd
8rUwEMagvQDWbGwL2okFnlxcnKYygiH49mMSiSUWoWaI8+iOBhDgwVxJSIc8Gr9F
zcX/bCfgNVR3zcCkd7+hTXu5f/Ymw5jpa64I5aFxILmfK2JV2WQgdBvY7Se2eT8g
mC1z1x21BDKvGfsTAtdGYE9HI/bda50VshbBSgYDIb8YyVvEQlVPcl2DZKCN2cyh
RV/87uiIGclAgW5buhhBAmQticmUBCXGTJWhkcEUCkqYH5R/hgtjV9SI00AhY4Ws
sxTA1PA6A/Qs2WBYl2+UDwenrqBdwg+uFDevOIkh3P5p+AD5GCowy7TMbgbVJUE7
USIHzzYB1Ai+arUW5XAybgVupKNvD+UVGTPj04XD0aBoRc2vKE27bwWR9VdpsTBv
TRNNTQIxg5i2Qpv23DyhsqM3AaqPqCQM95zgBPjpT5IZ/vvqgX+SDLm6KqqgWvlT
/mCnVMu26HhPN6yw9IM4Ea6S6SGpq1OxWozbvUQFrw4zbn9jXBkW9sspUkUe2ZTv
WJ0as519wvCWkqcXsLc/XnX/OaekD9KtatUObE2bLFsLAOwDlXt83gjIpAu+4lzQ
/V9Isg6cOR1Nqx7j8+I5MdBnPNxwi7Oarl5Pd9EANRy/CSUBtTk=
=io+m
-----END PGP SIGNATURE-----

--u6q34lyragniy4ty--

--===============2132759009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2132759009==--
