Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B43A31A38E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 18:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0900A6E193;
	Fri, 12 Feb 2021 17:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373936E193
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 17:28:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0AED64E95;
 Fri, 12 Feb 2021 17:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613150935;
 bh=GFtq0B3Onk0lHTm0ppoQIGAxNpPaVFOx5jJLCzZQSQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bb3gzoBWSN8jfLP4qc0LoBX5luPDYRAPNv5tC4lFWG9a2Uyg3WAPitKNT5ppP502v
 aNRnvDjnINauiA7JNG13YIO5ZklqTH3QgOaJ5aG4wlT+4FR9usLObfdXTZBRNUJfr/
 49WdWAGRFHS3HkhXHoigFM5GaLTsgN0r3BzNRBhSU8aJgnjkphovMswQ7YqZXoC3zA
 t6Nw3G4m8/FRD53QoDq5kouPV6FP8dKEfrRT72147hLUNiZqVrgHgE5880hJCkb+6c
 wMcOsn9QR8VVUyuQUvQzR1wtJ12lwuS5sGT5rWBGRR7PFMC5OBYXjRvXMSZIW9XEO7
 hVtHZRxDO+0Pw==
Received: by earth.universe (Postfix, from userid 1000)
 id E02143C0C96; Fri, 12 Feb 2021 18:28:52 +0100 (CET)
Date: Fri, 12 Feb 2021 18:28:52 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4] MAINTAINERS: move Milo Kim to credits
Message-ID: <20210212172852.hplx6ly3m5ixrw4o@earth.universe>
References: <20210212163229.68270-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210212163229.68270-1-krzk@kernel.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1487315298=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1487315298==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56e5d2djjx3fcdkn"
Content-Disposition: inline


--56e5d2djjx3fcdkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 12, 2021 at 05:32:29PM +0100, Krzysztof Kozlowski wrote:
> Milo Kim's email in TI bounces with permanent error (550: Invalid
> recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> credits and remove the separate driver entries for:
>  - TI LP855x backlight driver,
>  - TI LP8727 charger driver,
>  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>=20
> ---
>
> Dear Lee,
>=20
> Could you take care about this patch?
>=20
> Best regards,
> Krzysztof
>=20
> Changes since v3:
> 1. Remove the entries as Dan Murphy won't be mainaining them.
>=20
> Changes since v2:
> 1. Fix subject (TP -> TI).
>=20
> Changes since v1:
> 1. Add Dan Murphy, do not remove the entries.
> ---

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  CREDITS     |  3 +++
>  MAINTAINERS | 23 -----------------------
>  2 files changed, 3 insertions(+), 23 deletions(-)
>=20
> diff --git a/CREDITS b/CREDITS
> index be097156bd71..71552790774d 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -1933,6 +1933,9 @@ N: Kukjin Kim
>  E: kgene@kernel.org
>  D: Samsung S3C, S5P and Exynos ARM architectures
> =20
> +N: Milo Kim
> +D: TI LP855x, LP8727 and LP8788 drivers
> +
>  N: Sangbeom Kim
>  E: sbkim73@samsung.com
>  D: Samsung SoC Audio (ASoC) drivers
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00bca3e220cc..3478082debd1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17880,29 +17880,6 @@ S:	Maintained
>  F:	sound/soc/codecs/isabelle*
>  F:	sound/soc/codecs/lm49453*
> =20
> -TI LP855x BACKLIGHT DRIVER
> -M:	Milo Kim <milo.kim@ti.com>
> -S:	Maintained
> -F:	Documentation/driver-api/backlight/lp855x-driver.rst
> -F:	drivers/video/backlight/lp855x_bl.c
> -F:	include/linux/platform_data/lp855x.h
> -
> -TI LP8727 CHARGER DRIVER
> -M:	Milo Kim <milo.kim@ti.com>
> -S:	Maintained
> -F:	drivers/power/supply/lp8727_charger.c
> -F:	include/linux/platform_data/lp8727.h
> -
> -TI LP8788 MFD DRIVER
> -M:	Milo Kim <milo.kim@ti.com>
> -S:	Maintained
> -F:	drivers/iio/adc/lp8788_adc.c
> -F:	drivers/leds/leds-lp8788.c
> -F:	drivers/mfd/lp8788*.c
> -F:	drivers/power/supply/lp8788-charger.c
> -F:	drivers/regulator/lp8788-*.c
> -F:	include/linux/mfd/lp8788*.h
> -
>  TI NETCP ETHERNET DRIVER
>  M:	Wingman Kwok <w-kwok2@ti.com>
>  M:	Murali Karicheri <m-karicheri2@ti.com>
> --=20
> 2.25.1
>=20

--56e5d2djjx3fcdkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmAmusMACgkQ2O7X88g7
+pq5YxAAi9sMZJ6My43p1X33t66UXnrR6iZir+yvyHCur564wWsRrT+XCPKJJVGX
JYMtku40qwJSzvF9ZBR5otvlXdPq592MuTPhdq81AE5W/NiS2PBWwn6WFOVMwQe/
to4K+oaOLiOfVAkMeV8jZQeFlJrKtCJIm05K+rVTJKI8ZDW2ggY/eLygzzrAsXH9
xD/9aCxyU7ra5mWiBC+8+Z8szKt6lc4rqrc98uEZTOJL244YUprtOI3Qzz2oC5Dx
o/YUOEhtiAH9zeQZTNBBllfg/HUMtKzEcKA/a7zbA1Pv7RRpldr7Jv9N8a03F6Xr
Y84j9Iay39KOMGbJuDG0QGTMlP0cmgZKsJ8+gk9jyT5YGLSuPFEQdwZjEZu6Fgxb
iHUqAybdZIwEqgOA+hzsxFXbL3dHTKLbvuUjEtcMhdythDZCLVpN5vGCGsbn46vB
lzENDVKf/yYY3HJYqJCY5XbIABTqX6yOxjUPxOMjyDc8PpY4tFppASJ92i3z9XXI
ayWP4rCaEhKFiviGrrA7CQQaMo+n1B1k5vfXkYMuwjwG4L5upXiBYOgwxx/XB8bs
5vbXTwC2JBb2mHKKxrWRZIbDJNaBn55A6oYOeGoznLRkUYytsLsAKJ244lw4CKy3
HVH6yTNna7+Xzm6m2HF6y8xN8xO0nSw4lXamSGUF6y8G8x+fM6g=
=QaBn
-----END PGP SIGNATURE-----

--56e5d2djjx3fcdkn--

--===============1487315298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1487315298==--
