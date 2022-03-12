Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D24D70B3
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 21:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ADE10E0EB;
	Sat, 12 Mar 2022 20:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8A010E0EB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 20:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647115968;
 bh=iyCaHnkVX4kPAM0u0xeT+75CDDgVUy9GfJ21v4ThaiY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gtAsg1tmkE0B/dVfaWc0Wfj6t5umRjsWe67K4+GpcUq0M2vQ0PtY3yfw6HMRXxC6e
 vrcE/4tm5pSHvgL7LjnPYacwWfRYjzTKU2NYuovqyNhihBGh860SYc+Z7LV9MjUZZD
 QSHvKNeGeRrjSegz6GyQFQWaVSoD1y2u0NxOz5h4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([85.197.41.77]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1oCmOF1XEV-018Gm0; Sat, 12
 Mar 2022 21:12:48 +0100
Date: Sat, 12 Mar 2022 21:12:46 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH 3/6] drm: mxc-epdc: Add display and waveform
 initialisation
Message-ID: <Yiz+vvnkfn9hemJg@latitude>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-4-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uD2AzuFRXoVuvUY3"
Content-Disposition: inline
In-Reply-To: <20220206080016.796556-4-andreas@kemnade.info>
X-Provags-ID: V03:K1:0N6gIHfBj0Vf8LtRxNxkFhxEM441nNBXuu0cSw7ebjqbIPS+85n
 KcAv8o+kY2GStdXGyVVVMRkmbyVEf0O9JERcJgQh0Ed9DJdmnVC7g3iybuYj6wTgIXAHYPP
 gMcPAt/E9BOTVgGVeNHVvcs/eeUDx8LNFvLILoL0+kr45ShHiTw/wwILq5eKI4JMMDE281G
 0emsVwbI2d9yZjWCy9eOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9cdA3M2jQOE=:glxd3vXgErdaljLlW6kbzY
 RTjdeGM/4vGOl/aItjz/hoH0UtIcnXBtW7A7Ee0Qlpb+U0Aq60fgEjsiT+FR+RK/Cd2V28sqk
 KZyuOBvw+yZgQ/6WGJGerAQQbIkX3XAoVDEgiyUjU6Ry9zqMY8jG15jhAsWquu0+OhGKdCLp/
 J8l+tZci4yN+M1CcDXtsTWC++xqZ/oty+EJHe7+me2cO+QT3Wi8XNXl3IFWM3iIUxq0szuab9
 aY4J/rgOKAD4m4+VgM3tTJBV1xOKB0qLqnNWmsbA7jHhUFduB6efjtqIng1MGKZdaZqFULZnr
 ACeIpUwcNDtjsm52hThyvocWiXPpkWR6IzJDEnKt9nVZGTdJAPAYsBpdg1dtGpImih65cTsph
 NEP8TWakM8h0VzhC1aE1VqSi5hbSLY/WIiBKEx9GEB4G7L5GNhmn6ryUK1PAORIp7Fyxf3Q5+
 UQBvnuRGFelpU+ZgOhmU+joZQu6+EBHm+yFMD3jG+5QXcY66t8uHGQ26cR9iVTGJmKwV0L64M
 WEvyD1f2XZ/o9ZXCYQI3YkChoWbhY9cHFyDW6kjFCxitLQgufNDwref5zYFknCGXeWfZrsUp3
 7OLu3+WgWLGVKi0FgKtndp/WyVD1FWFXzH1gUAYJCklCo6rm3azkFbhDy4X5M4LSOeNlc/aE7
 4IO/FIX8/vpXNvoSIVCOnKNghr3iDszac5inUGYZwKiI2Dwg3UXn4dpMKX4dnzZfZ4xR1AzDU
 /0Latb57rA1ENj77Nvnm+ZB5HMzZ7ngvF5E7Zo2WAUxR3jA0S0rNwwGqBH5iqQ5RCmArtfn44
 67j7dm05whO9JaZcnkCEPXqnS63SFCWeZNbYG46ohiK4oL2/8hC7DtJNnfVAotyORXDq42uHn
 2rKTaIN8Zbvk13d4RBVAEJgwJTUn6t1+tft0sCk10WfFeaexINY+JcVhbTX1k3TflL7tu3sX3
 9fNB71fjrHT8WTxaxqvi0RtnfJ4NESNmgZCWjhHIlPeBcEjL8xlN9o26cgNZUws/h1Opg+ag0
 Wl0LV2yz8G+IrI77yCQEWBbMuX7u++l4rua5iGvmnfgoMM0/gRk1zVhfGgQWDVrYaIPsnfCc/
 jKQK6ACI+MM+Oo=
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, tzimmermann@suse.de, samuel@sholland.org,
 airlied@linux.ie, s.hauer@pengutronix.de, alistair@alistair23.me,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 josua.mayer@jm0.eu, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uD2AzuFRXoVuvUY3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 06, 2022 at 09:00:13AM +0100, Andreas Kemnade wrote:
> Adds display parameter initialisation, display power up/down and
> waveform loading
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
[...]
> +	/* Enable the v3p3 regulator */
> +	ret =3D regulator_enable(priv->v3p3_regulator);
> +	if (IS_ERR((void *)ret)) {

	if (ret < 0)   is common enough to be understood.

> +		dev_err(priv->drm.dev,
> +			"Unable to enable V3P3 regulator. err =3D 0x%x\n",
> +			ret);
> +		mutex_unlock(&priv->power_mutex);
> +		return;
> +	}
> +
> +	usleep_range(1000, 2000);
> +
> +	pm_runtime_get_sync(priv->drm.dev);
> +
> +	/* Enable clocks to EPDC */
> +	clk_prepare_enable(priv->epdc_clk_axi);
> +	clk_prepare_enable(priv->epdc_clk_pix);
> +
> +	epdc_write(priv, EPDC_CTRL_CLEAR, EPDC_CTRL_CLKGATE);
> +
> +	/* Enable power to the EPD panel */
> +	ret =3D regulator_enable(priv->display_regulator);
> +	if (IS_ERR((void *)ret)) {

dito

> +		dev_err(priv->drm.dev,
> +			"Unable to enable DISPLAY regulator. err =3D 0x%x\n",
> +			ret);
> +		mutex_unlock(&priv->power_mutex);
> +		return;
> +	}
> +
> +	ret =3D regulator_enable(priv->vcom_regulator);
> +	if (IS_ERR((void *)ret)) {

dito

> +		dev_err(priv->drm.dev,
> +			"Unable to enable VCOM regulator. err =3D 0x%x\n",
> +			ret);
> +		mutex_unlock(&priv->power_mutex);
> +		return;
> +	}
> +
> +	priv->powered =3D true;
> +
> +	mutex_unlock(&priv->power_mutex);
> +}

[...]
> +	priv->rev =3D ((val & EPDC_VERSION_MAJOR_MASK) >>
> +				EPDC_VERSION_MAJOR_OFFSET) * 10
> +			+ ((val & EPDC_VERSION_MINOR_MASK) >>
> +				EPDC_VERSION_MINOR_OFFSET);

Instead of this transformation it might be (1) safer against unexpected
versions and (2) simpler, to store the EPDC_VERSION register content
directly.

Instead of

	if (priv->rev =3D=3D 20) { ... }

we'd have

	if (priv->rev =3D=3D 0x02000000) { ... }

or perhaps something along the lines of

	if (priv->rev =3D=3D EPDC_REV(2, 0, 0)) { ... }

(using a macro that does the proper bitshifts).

> +	dev_dbg(priv->drm.dev, "EPDC version =3D %d\n", priv->rev);
> +
> +	if (priv->rev <=3D 20) {
> +		dev_err(priv->drm.dev, "Unsupported version (%d)\n", priv->rev);
> +		return -ENODEV;
> +	}
> +
> +	/* Initialize EPDC pins */
> +	pinctrl =3D devm_pinctrl_get_select_default(priv->drm.dev);
> +	if (IS_ERR(pinctrl)) {
> +		dev_err(priv->drm.dev, "can't get/select pinctrl\n");
> +		return PTR_ERR(pinctrl);
> +	}
> +
> +	mutex_init(&priv->power_mutex);
> +
> +	return 0;
> +}

[...]
> diff --git a/drivers/gpu/drm/mxc-epdc/epdc_waveform.h b/drivers/gpu/drm/m=
xc-epdc/epdc_waveform.h
> new file mode 100644
> index 000000000000..c5c461b975cb
> --- /dev/null
> +++ b/drivers/gpu/drm/mxc-epdc/epdc_waveform.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/* Copyright (C) 2022 Andreas Kemnade */
> +int mxc_epdc_fb_get_temp_index(struct mxc_epdc *priv, int temp);
> +int mxc_epdc_prepare_waveform(struct mxc_epdc *priv,
> +			      const u8 *waveform, size_t size);
> +void mxc_epdc_set_update_waveform(struct mxc_epdc *priv,
> +				  struct mxcfb_waveform_modes *wv_modes);
> diff --git a/drivers/gpu/drm/mxc-epdc/mxc_epdc.h b/drivers/gpu/drm/mxc-ep=
dc/mxc_epdc.h
> index c5f5280b574f..f7b1cbc4cc4e 100644
> --- a/drivers/gpu/drm/mxc-epdc/mxc_epdc.h
> +++ b/drivers/gpu/drm/mxc-epdc/mxc_epdc.h
> @@ -8,6 +8,32 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <linux/thermal.h>
> +#include "epdc_regs.h"
> +
> +#define TEMP_USE_AMBIENT			0x1000

What's the significance of 0x1000 here? Is it a register value?


>  static void mxc_epdc_pipe_update(struct drm_simple_display_pipe *pipe,
> @@ -187,6 +267,7 @@ static struct drm_driver mxc_epdc_driver =3D {
>  static int mxc_epdc_probe(struct platform_device *pdev)
>  {
>  	struct mxc_epdc *priv;
> +	const struct firmware *firmware;
>  	int ret;
> =20
>  	priv =3D devm_drm_dev_alloc(&pdev->dev, &mxc_epdc_driver, struct mxc_ep=
dc, drm);
> @@ -195,6 +276,19 @@ static int mxc_epdc_probe(struct platform_device *pd=
ev)
> =20
>  	platform_set_drvdata(pdev, priv);
> =20
> +	ret =3D mxc_epdc_init_hw(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D request_firmware(&firmware, "imx/epdc/epdc.fw", priv->drm.dev);

Thinking ahead to the point when we'll have multiple waveforms for
different modes...  What's your idea for a naming scheme to distinguish
the different waveform files, and should the default name be epdc.fw, or
perhaps something more specific?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D mxc_epdc_prepare_waveform(priv, firmware->data, firmware->size);
> +	release_firmware(firmware);
> +	if (ret)
> +		return ret;
> +
>  	mxc_epdc_setup_mode_config(&priv->drm);
> =20
>  	ret =3D mxc_epdc_output(&priv->drm);


Jonathan

--uD2AzuFRXoVuvUY3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIs/p0ACgkQCDBEmo7z
X9svPg/+OL4D1gwnQuMC1jKKa1HHwROE2fd/xV2gC/5F+52t1t+rjYcMcp7UtIJe
X9q0wiuOOYNLa8LW3kX6HFVlRWpsMZ7XI14AeHwGzdPqtACpRwfnmtamSvp4QrG/
XddVB5wPnfmnFzjuHqQXb/ekIDZCYk2V5rNNyi7ZJ2ESpCxxAUVzws4172PIFAJL
h7NquhDpCKFjrxO+7/NDQ7+hRFb0yW6rPx5WnrgHrVIcBSskH5lZxP7XYticAElq
GxHg57wXN3OW9oYmZ9sCQ8GmzVCPeTAprdOc6mqh/ZKA/sTh1IpRnSa0wDSQGo5n
yiFYtYcGJ0VAplDbRk4U4J55om3AJC4z7PB6LFuebSrRAINHUJinwC2qiqfBMzBV
jkxzB6xPaONjAiREDtGziYf6Py1nv3/uaqd2gEORiiHX4DJxZi3aoeEcc3xGieaB
ZfQ5EmLWIbx79ijoX6ZTcl1CXeVJ7d7yOJYTBRlx7f2VYl6gA/P3n9Jzj1E2Lqmk
5K0O3j+CieKPuIroS6nKJtuFgsWb8Hl5sReMbNlJK55KxN0AX90oi6ZEvXHb9GxC
hkqfiuvY1oWmNnLWD3GQXrGaPN8FjMbEL3E5qQbYHR2wyFCjveNZn4cLf64zWdv2
7urZ4VDlg+x8wOK/DWAaZXQQqrkkSQVM2QLRq+ewhRiRRIzstgQ=
=nc/z
-----END PGP SIGNATURE-----

--uD2AzuFRXoVuvUY3--
