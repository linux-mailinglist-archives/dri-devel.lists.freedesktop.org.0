Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A17FC682
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 21:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BD710E188;
	Tue, 28 Nov 2023 20:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF12110E188
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 20:59:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r85AN-0006nV-7B; Tue, 28 Nov 2023 21:58:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r85AI-00CFt4-DE; Tue, 28 Nov 2023 21:58:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r85AI-00AOAR-2T; Tue, 28 Nov 2023 21:58:42 +0100
Date: Tue, 28 Nov 2023 21:58:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Message-ID: <20231128205841.al23ra5s34rn3muj@pengutronix.de>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <170119374454.445690.515311393756577368.b4-ty@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bibczb2zawwhoawf"
Content-Disposition: inline
In-Reply-To: <170119374454.445690.515311393756577368.b4-ty@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bibczb2zawwhoawf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 06:49:23PM +0100, Thierry Reding wrote:
>=20
> On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> > Merging
> > =3D=3D=3D=3D=3D=3D=3D
> > I propose to take entire patchset through my tree (Samsung SoC), becaus=
e:
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> > 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov=
920), so
> >    they will touch the same lines in some of the DT bindings (not all, =
though).
> >    It is reasonable for me to take the bindings for the new SoCs, to ha=
ve clean
> >    `make dtbs_check` on the new DTS.
> > 2. Having it together helps me to have clean `make dtbs_check` within m=
y tree
> >    on the existing DTS.
> > 3. No drivers are affected by this change.
> > 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expe=
ct
> >    follow up patchsets.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [12/17] dt-bindings: pwm: samsung: add specific compatibles for existing =
SoC
>         commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f

You didn't honor (or even comment) Krzysztof's proposal to take the
whole patchset via his tree (marked above). Was there some off-list
agreement?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bibczb2zawwhoawf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVmVIAACgkQj4D7WH0S
/k4mPQgAuzfJsEw0Nil25KsPJwyY53qFjfCGd8WTObzTDFpeIlzV2EL87bWT2Gtd
vEFgfX2Uj+RoOLX5CNnyuEfwH5e+O5oVYF9gfpsdqtRTJ3zyPV3dUiFCaIh2KNqZ
aaY1tsb4vECeh7dmEL/y2VUWoO2bAa08sZe6EpJXOkeUWN54VdTCMBwncH1utjgh
Tb/pHhjkfvdcbXuvxsFY4gL86pT8BER5EjIRZZaPN0kHDrGTBR+ZqjFvMVWTrFbq
IUK1gAMX+BOooJDwVFE4SeRta6p/lfClW73PbWk1++SyLPA2KbTp8jTul4qgXWKT
IbIJY8Qwg5trzJ0LHDMX3a02COS9hg==
=P7ML
-----END PGP SIGNATURE-----

--bibczb2zawwhoawf--
