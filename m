Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03F8B1AB2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031DA10F8FC;
	Thu, 25 Apr 2024 06:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1718E10F8FC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 06:08:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzsHV-0003tM-OE; Thu, 25 Apr 2024 08:08:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzsHT-00ECyT-5a; Thu, 25 Apr 2024 08:08:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rzsHT-008MV3-0D;
 Thu, 25 Apr 2024 08:08:27 +0200
Date: Thu, 25 Apr 2024 08:08:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Junhao Xie <bigfoot@classfun.cn>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
Message-ID: <7j7d3ygupaprtryygxlpyjezd6naaaevrnzrpybxe7twcvuhbm@fzmswsfql37r>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
 <17d36836-67cb-4d5a-a8b4-ecf1517a0020@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zh4yvalyaaytqrij"
Content-Disposition: inline
In-Reply-To: <17d36836-67cb-4d5a-a8b4-ecf1517a0020@linaro.org>
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


--zh4yvalyaaytqrij
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 24, 2024 at 04:55:26PM +0100, Bryan O'Donoghue wrote:
> On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pwm.h>
> > +#include <linux/regmap.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/regulator/consumer.h>
>=20
> Includes should be alphabetised

Also check if you need them all. (E.g. I wonder about delay.h)

> > +	dev_dbg(priv->pdev, "request regmap_write 0x%x 0x%x\n", reg, val);
> > +	err =3D regmap_write(priv->regmap, reg, val);
> > +	if (err)
> > +		dev_warn_ratelimited(
> > +			priv->pdev,
> > +			"regmap_write to register 0x%x failed: %pe\n", reg,
> > +			ERR_PTR(err));
>=20
> Multi-line should be encapsulated in {}
>=20
> if (err) {
> 	stuff
> 	goes here
> }

In my eyes a single state doesn't need {} even when spanning multiple
lines.

> > +	return err;
> > +}

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zh4yvalyaaytqrij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYp81oACgkQj4D7WH0S
/k6kxAf/c1u90d3vIMOZL5Sy8DR9MgBQGKJaZnQQUCk3HIdQyVyA4LhxHyxHiO/e
oLm0HCG9idBnRK5mTyNmtWhLg0djTCR6DxSeGUhuAPa3Nr6BZGMTYYkU0ESYIFcW
bKRxD29EiCcTvj0d7Ls5XwvXmmWTRkPMgoCXgtD2FDmyPCXvhfIEpOp+B8pvN/LD
rToO/lFSpmxBzT9sOCqoT/4nCjOSKh/NZXuilf/zbxArH0gKjnTzSek0OFH+nC2s
/oLGB00jxl8YKpSoUU0N67bbmnhYbLTVCed0yBT3wp9K1Mn9BBTns35UVkit5ytW
SwUooPCJ8Mvb64kcHSgtz4CKCq7BdQ==
=QM2k
-----END PGP SIGNATURE-----

--zh4yvalyaaytqrij--
