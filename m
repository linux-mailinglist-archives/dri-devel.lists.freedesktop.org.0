Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2EB25DF0D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D136EB36;
	Fri,  4 Sep 2020 16:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB9A6EB36
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:06:18 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id cv8so3222358qvb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2k+RMtQ7FVvTOkg2KVamAhOp4172u29BwvuLUNGieoE=;
 b=E3UJoB2RPcPyiVe1/U8HdULwx64HkjynNKAmKPmm069PXep9Rp7QzmrXwxuuHVt6sK
 wLL2wy1GsS6UOmrd9H2rrz/bCDFyICm2iqiR3cXx+4pcQwPbf+KiWs1kRM3krqfD7ayL
 9bNc2K9CqhrufC905POoGFJRZ4fFrgwEt2zHk+BhWZWhkZapkyZDdMCtCm0xiamtrUDT
 Mcy5pEKbnSQSHDU/MnmasTIb6T+9pdzTi4qE31g186uyfDS7OJQaClPC7ErvLgsq5muo
 Q3AAxAtUa5wsUGYPElGUal65nG+y5RmDrL0N4/jCYkORNsRPejnpBnFVYc4zGX2lS6ED
 CqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2k+RMtQ7FVvTOkg2KVamAhOp4172u29BwvuLUNGieoE=;
 b=pmmuhyPZsFZww+VdXweyHudc9o7j1ZyL32JcSG+hz2q1FA2PQKUo7plvngJplxFoSR
 vciBkWTdY49KrPvVsSwu80yUTZNIqqAUXOZn8K0e5EswT/gDP9DVQciQkpkBp1tuyFD4
 Vvw1F2PkdEPdFfGFBQoddXAQ/m7nbFDKfj19iDnkywhWR54Fn+kqbYZ1s64ouG2wH8ff
 m263oITfYm/eqdL3UtIa6+b91a4LwVaantECzUrD9EXWyw2d57SbacktZEkV7tKWDrAC
 NI8VV4+bsr6W6DtIVxxReCUkF8/qL3MQnXqwefKW1qZoMRmyCk+Exz650q7Sig/VwhVu
 wSiA==
X-Gm-Message-State: AOAM5312m8P32qq0CKY+2ybyP0uhPdeqqM4k/mCAH3ROSgU94Uj7Jg8b
 SD5faU3i5o51eOgJnc11dFg=
X-Google-Smtp-Source: ABdhPJzq14od5HRnlJY5OJFH0Zl73OpWrOWApVh1vD7AQrfE7+xYmoR82ZrPSllUV12xFQddQi/PSw==
X-Received: by 2002:a0c:b2d4:: with SMTP id d20mr7559760qvf.1.1599235557522;
 Fri, 04 Sep 2020 09:05:57 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56e0:6d60::10ec])
 by smtp.gmail.com with ESMTPSA id c13sm4841611qtq.5.2020.09.04.09.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:05:56 -0700 (PDT)
Date: Fri, 4 Sep 2020 12:05:42 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for VKMS
Message-ID: <20200904160542.3nxdioebafgt352x@smtp.gmail.com>
References: <20200904130605.vs5tnfhgnemnz6pt@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200904130605.vs5tnfhgnemnz6pt@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0451626677=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0451626677==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nrdcccm2bvsn7by3"
Content-Disposition: inline


--nrdcccm2bvsn7by3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/04, Melissa Wen wrote:
> Add myself as maintainer of VKMS driver
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01fb9ee6b951..d4277824a01c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5640,6 +5640,7 @@ F:	drivers/gpu/drm/udl/
> =20
>  DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>  M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> +M:	Melissa Wen <melissa.srw@gmail.com>
>  R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>  R:	Daniel Vetter <daniel@ffwll.ch>
>  L:	dri-devel@lists.freedesktop.org
> --=20
> 2.28.0
>=20

Acked-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

--=20
Rodrigo Siqueira
https://siqueira.tech

--nrdcccm2bvsn7by3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl9SZdAACgkQWJzP/com
vP81KxAAnOH/Da0fUQ5YNF1s4/rdaiUCgFJc50DsODod4nSCblcPGhZ11XqLBrbl
MbnhslELK6lIVMl2JD9wXR02nFif/fCzktt7f4jjzx4edrs01kSx9M7ndmQD2cyp
P6bHw8itjc6e62Jb9ZZFH/l3w8d9BSxdaAoxtz44+lGG4PJfYlsgS+EpFfljQtmN
v8oK+jXTZygo1BGzXt2dIgz/UC8KNHNHbT9/ExT71Qb61YcdeJN3fINLA5HAcKX6
+VIibp9W++7dM2/t6EUWfhRY2oM4RFyVp+mygpR1talPpDN9jn4ff9eotHW+mBHK
2ZfeNxIGrNAkvPkoL5jJxioq8cvJ1MCgvuS9vfZEHXbARaeX9WzCNcylgtJrPsmh
nJ9gO5G6JaESkYyaT+yoYmhXfTUTzTkXHNOQnuhjtaWoPZCbVYS2Jorq/VUh4TIM
7sS0bYSzE3634iyCZKT0gQmDqORcWiPTxakVa6ofmBMot8e4e6wElb20wvRibNSd
T437J+JdC84ftD7vPXkQx1dFRrSgngEuM6k0odU6VmCEzKvsfoOPXD4r+Jx4sFEx
DTebG+leukKTHXY5sHNj2r4VrpLMHNhIwFc37bvsmkMgEY4uQHC6ZMd3xqW8Ag4t
UVE4AWvax7idObwfFKJHVFmy2gi+rXW+wksuH5TEDT3DacyYfYs=
=oaui
-----END PGP SIGNATURE-----

--nrdcccm2bvsn7by3--

--===============0451626677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0451626677==--
