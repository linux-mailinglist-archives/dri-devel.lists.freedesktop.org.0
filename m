Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B44D70CD
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 21:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A8910E0F7;
	Sat, 12 Mar 2022 20:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B0D10E0F7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647116521;
 bh=Kipwnu9i0XJKTtS/vkHsIeGhK2mTOYwd9Fe3CUqyhYc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=UBhJ7b9IlVmT4EkmHV02GlVuK0MB7q9abBtPaRAY5uf7QVEJ9EjwhfutrcwEWT8sq
 YXFayw4At97xktykMq7E4uoUmPxTD/H9tSHQpEhhsX0v++gfjIXV07O6813VKZBXhU
 U1WRUzYr2A7imhWUzPh3AjSrD+rT85/b0gvq5jeY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([85.197.41.77]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1nx1Tw3oCS-00nfow; Sat, 12
 Mar 2022 21:22:01 +0100
Date: Sat, 12 Mar 2022 21:21:58 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH 4/6] drm: mxc-epdc: Add update management
Message-ID: <Yi0A5inJh0Whkh5n@latitude>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-5-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KGiIJO+uT5QL2O/C"
Content-Disposition: inline
In-Reply-To: <20220206080016.796556-5-andreas@kemnade.info>
X-Provags-ID: V03:K1:LUNg/vUU63M4JNITfsENQEGLDAqQgIJnfYNsY+v4K23T2MDIEHo
 Jl4sGt1IMYukgUjGNhzu5Tm8Da+/r0BBtaK3fHq8LSq34ZeHA6C5UwVz1WZskw6ko7Y7Vh1
 fYxjQCEQzdDeriYQxZSgcRBabREVihDEgouu48NutLnlDZ3jaYfAxEufhIvOBYIFcgci2AX
 c03IWTkSxyD9gm+BDq9Lg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gzRNHYYwgDQ=:0Q74Y/hL8fApK7J8WSJqKV
 5SXZmwZHXjAUQxVia3LyaJAJtUzhCS6D7MH4GsSQ4kLf/jvGP6vlCiKDo8SIgBC+ZUdy8T0L3
 05hKk1PlcJqQ2S2jIMOCN7NySZo5daljzLUO4HaxrEujN8ou/xOxfgw7ppBd03nTzJ5CeZ1ot
 Vmpi/wZ6tPNp2QGk8ZExQSJuVasN6ioqgxvmDrMxX8SrpCHKjt+YlgN6I1ppuSy0BQUeirQlf
 HcG7xmv44Ho8o1yFzoM94iiVsirpJEMsJng1H9NME2SNqMBuOONJ9/W5uXrA+J0MoVDthc4bS
 qxCYoZNSN3U9tRDk7MStptDoeTtH5TLOUmlSa2UQ7wH1OSFrllTDLuDB+uM97b5SEER5oddQ9
 OGxcFzz4nqLHQmMrANhT3NmNtiBluV0rvzPOcir7Qbfh00gu+LMCHdXceTzITPwHfW5LfkWCD
 6m/WCfxI58aFKGDfHF01B8dQcvTQph98tmiAuCVTpBWki2HtWs9Gre0egnHh4QZFaa/WgmEkQ
 napTXnO7097NELB5G3B8m1kAUthfuAeKOed8jt68YRdQHH04Fw6sDmZW3d5XgaL2cP5MWBYBi
 WBdX+N9LY5NTmbraVlm4QhKGK8LKnOF8rifHR+ZEg5+0Q7HYrGfxaKMPhFYWEU3qrDn/SfbH5
 KsExIYV9sLsfuKG1GAHbls69hwXAbQWQsWthf+0IS+Md6ssmKYao961c/7W++L230coHf9PSs
 pmD+aKGDJOzKg9rjLa5TvanBQAPiEJoak5eeaX2dgxroiNOLnaYa64RAoeVCR1xL83a8zbd3a
 OwA9wc04nPrrkb31iDzXcKLgcPni/yFxh3ANMF8awEPtTYoo4QSC4k6fzL/uvRWp8R6woC6WC
 /jcyR8DSRmxARZpeT4ENNieExzVYxHZgjOKKj9o5Vgdb1AOn0+H2dr6Lj52KiURVkJGu8jKm7
 tqUccIewUVkBxatfn1isnjeZQrYRk+YtTsQO4DgzvjaVVuWzfWaIomqQmn3Zw819Yn6jcqq2/
 mj/Zm92RVHOeQ8dDHbDFQ1jha43qLYl4C4TyUVxHCJ7m+z3znQgPgSCTy8f22s8CwCEDji2xx
 /utk2hTriST7Qk=
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


--KGiIJO+uT5QL2O/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 06, 2022 at 09:00:14AM +0100, Andreas Kemnade wrote:
> The EPDC can process some dirty rectangles at a time, pick them up and
> forward them to the controller. Only processes not involving PXP are
> supported at the moment. Due to that and to work with more waveforms,
> there is some masking/shifting done. It was tested with the factory
> waveforms of Kobo Clara HD, Tolino Shine 3, and Tolino Shine 2HD.
> Also the waveform called epdc_E060SCM.fw from NXP BSP works with the
> i.MX6SL devices.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

[...]
> +	adj_update_region =3D upd_data_list->update_desc->upd_data.update_regio=
n;
> +	/*
> +	 * Is the working buffer idle?
> +	 * If the working buffer is busy, we must wait for the resource
> +	 * to become free. The IST will signal this event.

What does IST mean?


> +void mxc_epdc_draw_mode0(struct mxc_epdc *priv)

What does mode 0 imply? An overview of the possible modes would be
appreciated.

> +{
> +	u32 *upd_buf_ptr;
> +	int i;
> +	u32 xres, yres;
> +
> +	upd_buf_ptr =3D (u32 *)priv->epdc_mem_virt;
> +
> +	epdc_working_buf_intr(priv, true);
> +	epdc_lut_complete_intr(priv, 0, true);
> +
> +	/* Use unrotated (native) width/height */
> +	xres =3D priv->epdc_mem_width;
> +	yres =3D priv->epdc_mem_height;
> +
> +	/* Program EPDC update to process buffer */
> +	epdc_set_update_area(priv, priv->epdc_mem_phys, 0, 0, xres, yres, 0);
> +	epdc_submit_update(priv, 0, priv->wv_modes.mode_init, UPDATE_MODE_FULL,
> +		false, true, 0xFF);
> +
> +	dev_dbg(priv->drm.dev, "Mode0 update - Waiting for LUT to complete...\n=
");
> +
> +	/* Will timeout after ~4-5 seconds */
> +
> +	for (i =3D 0; i < 40; i++) {
> +		if (!epdc_is_lut_active(priv, 0)) {
> +			dev_dbg(priv->drm.dev, "Mode0 init complete\n");
> +			return;
> +		}
> +		msleep(100);
> +	}
> +
> +	dev_err(priv->drm.dev, "Mode0 init failed!\n");
> +}

> +#define WAVEFORM_MODE_GLR16			4
> +#define WAVEFORM_MODE_GLD16			5
> +#define WAVEFORM_MODE_AUTO			257

(How) are these mode numbers related to "mode 0"?


Jonathan

--KGiIJO+uT5QL2O/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmItAOYACgkQCDBEmo7z
X9t/Fw//WJXYK5In6OQvEJeTImkCzhxbqniGCtE1+Jw/e2CfJQhBvZ77tElUhbHk
7IMr9JVLrQ19o32h7p/xFdeM6PWNVOiYFP7woHiU3SXasNB8t6JHxnUkX7CXhZvL
0FmfHtJRVGljFKi9VDMkicJxBwxsOQoEbAmfUiRdcimwjjDjKLl4HThP1kPaeMBm
6NEKVqBp5KoTqHmB+1XLfM9dZGwxrzHs5QYlAnyZZzv/OuZUgSjzhB2qK45nr8UH
1C7Psmeo7MaYP+ZqgqeYU3k9PcrQ9OxUUZ9HKjdPJ61oXhuTR0wesGpPulOxPbV/
uloHVV8bdYyVYrr/CAs3bhL5GvhcTkuTGO9y3OUW74l9xRsn8xQxwio6NbvSigdn
6AfjUk9F298wN7d3j7scryZ8RuDFkuocWSm0NdUhynQb2LeRXwYNz35KDq34DSgQ
SmR99dsdQJnqPre7oz7NQr6mPw3lretW5Rbfai60Wp5POwvLLXktZX4tVnkM0CBz
g0wZoXJywqgoRMcd1jRSUzcZMytfBss1dz7j3Fg3PNk7EylJ+/xWv72ZUOTMftXW
6hvwHRyo9SUpNi0sCWT1uh6aPAgrt2xQkTBObb9UJozSfL6mSxIChRbuSHKeLz4q
reX0HS0EEgsFYoVROEVMNxqS3kKg78ceqbE4Q6bnWZ2dpNHya0E=
=SlcQ
-----END PGP SIGNATURE-----

--KGiIJO+uT5QL2O/C--
