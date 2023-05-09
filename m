Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2D6FBF07
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 08:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5566110E325;
	Tue,  9 May 2023 06:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5DF10E325
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 06:08:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwGVb-0003VV-Jq; Tue, 09 May 2023 08:07:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwGVS-002AZW-Hu; Tue, 09 May 2023 08:07:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwGVR-002g2g-RA; Tue, 09 May 2023 08:07:25 +0200
Date: Tue, 9 May 2023 08:07:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH 00/19] drm/bridge: Convert to platform remove
 callback returning void
Message-ID: <20230509060725.fywaewxmgobe4fph@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
 <167930965268.2514063.17744962269901362155.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uucvblgrbfp7t3cs"
Content-Disposition: inline
In-Reply-To: <167930965268.2514063.17744962269901362155.b4-ty@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rahul T R <r-ravikumar@ti.com>, Robert Foss <rfoss@kernel.org>,
 kernel test robot <lkp@intel.com>, Jayshri Pawar <jpawar@cadence.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Liu Ying <victor.liu@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sandor Yu <Sandor.yu@nxp.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uucvblgrbfp7t3cs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Neil,

On Mon, Mar 20, 2023 at 11:54:12AM +0100, Neil Armstrong wrote:
> On Sat, 18 Mar 2023 20:07:45 +0100, Uwe Kleine-K=F6nig wrote:
> > this series adapts the platform drivers below drivers/gpu/drm/bridge to=
 use the
> > .remove_new() callback. Compared to the traditional .remove() callback
> > .remove_new() returns no value. This is a good thing because the driver=
 core
> > doesn't (and cannot) cope for errors during remove. The only effect of a
> > non-zero return value in .remove() is that the driver core emits a warn=
ing. The
> > device is removed anyhow and an early return from .remove() usually yie=
lds a
> > resource leak.
> >=20
> > [...]
>=20
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (=
drm-misc-next)
>=20
> [02/19] drm/bridge: cdns-dsi: Convert to platform remove callback returni=
ng void
>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dd5701d8f52=
10f8c70ffd1b51283b2373573e7b5a
> [04/19] drm/bridge: display-connector: Convert to platform remove callbac=
k returning void
>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dd1837136d1=
84dda0585a687c614a9117cc87ad27
> [05/19] drm/bridge: fsl-ldb: Convert to platform remove callback returnin=
g void
>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dbe5c6b1772=
29c5cb40f3fef785250afbfd669175
> [...]

I wonder what made you skip patches #1 and #3. I got some feedback by
Laurent for patch #1. In the end it was Laurent's "I don't have a string
preference here." vs me thinking that the patch is good as is. Was that
the reason to skip it? Patch #3 depends on patch #1.

Would it help to resent?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uucvblgrbfp7t3cs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRZ4xwACgkQj4D7WH0S
/k5M7wf/dz02sP6WJlzE5cR+LklmZFQvRxciIfpkQO4UiMaAd4TafVPOQH4zII84
iGgzaV+PuRaS8OW5VXbxZ8Q2kEYpS3Qfk/S73oz/I9p5llVn6hfrzBt1ryMr1mBD
HnxGbOAZVMDFhRNY5r06IdLRD3G64GS2u6MAOA81i+NPTZ8sd7G/98fz/8leujFE
v1OmXocXMLN7HSaGnrF0tmLO1uiyXdgtv1zh5q5hcVCVMlfUwNve69c7Nh/OwPTo
kTc6NsMSuf0ffJ0qPxzP4fG3ajUpBiJlvbxutQphbEm0eh0KsQgCHO0usfkj6YfS
vwNYijOz3GyiyC+OVvLLYUid4nwTgQ==
=EdPT
-----END PGP SIGNATURE-----

--uucvblgrbfp7t3cs--
