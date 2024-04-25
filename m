Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5848B1ABF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878D411A188;
	Thu, 25 Apr 2024 06:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E5211A188
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 06:14:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzsNW-0005pe-V0; Thu, 25 Apr 2024 08:14:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzsNT-00EDGW-EW; Thu, 25 Apr 2024 08:14:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rzsNT-008Mht-17;
 Thu, 25 Apr 2024 08:14:39 +0200
Date: Thu, 25 Apr 2024 08:14:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Xilin Wu <wuxilin123@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Junhao Xie <bigfoot@classfun.cn>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Molly Sophia <mollysophia379@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
Message-ID: <nuq56pinjqonlo4crfibtb2ddlwvldurkphomsyyqp6iupqpbk@u6kun3qvstw2>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
 <af62742c-8d6d-4fa9-b2e4-f83253e6e388@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rl24wix7isqmyofu"
Content-Disposition: inline
In-Reply-To: <af62742c-8d6d-4fa9-b2e4-f83253e6e388@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rl24wix7isqmyofu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 24, 2024 at 09:37:25PM +0200, Konrad Dybcio wrote:
> On 4/24/24 17:29, Xilin Wu via B4 Relay wrote:
> > +
> > +	/* use random value to apply changes */
> > +	ret =3D sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
>=20
> "a random value"? sounds suspicious..

I smiled about that one, too, remembering https://xkcd.com/221/

> [...]
> > +#if IS_ENABLED(CONFIG_GPIOLIB)
> > +	/* enable hardware shutdown pin */
> > +	if (priv->sdb)
> > +		gpiod_set_value(priv->sdb, 1);
> > +#endif
> > +
> > +	/* power-off sn5112 power vdd */
> > +	regulator_disable(priv->vdd);
> > +
> > +	pwmchip_remove(chip);
>=20
> devm_pwmchip_add?

Note using devm_xyz only works if all requests before are also using
devm. (There are a few exceptions, but these need proper thinking and
extensive commenting.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rl24wix7isqmyofu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYp9M4ACgkQj4D7WH0S
/k5jTgf+JqJAnfN3fXmdz5yWJWeCDGj4DZTK3E0EJ2lu7asHWc+Pp6fM19DKN/F0
dsr14eDwjo1po1ptkFeRa04QeB7yeqMay3j0d5X4XUOm/SIHEI2Mn/ky5ZlVOwr7
ciorY8ICvuZ4YI/4306YGVmlbcndaA9ubGwykp0c9JYUqdSMWgwBGy4dVqHoKPmR
RiM2SBTJAVd5Qw2LmSMMZ+uU25dWYCiM4eHrkbphTMhYItgqvTWkZhiTEdDVmU/p
2RqsoyKgfJKcMfW8eF31vZd7qkRjPErqQU76uzhW0Cm9nPDJERrXkkB+fGEzOcAh
6ros37wvCLEtFIp5fA2kOsh/PhCMeQ==
=Hs3D
-----END PGP SIGNATURE-----

--rl24wix7isqmyofu--
