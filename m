Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F016FC535
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 13:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B6410E099;
	Tue,  9 May 2023 11:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EE510E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U5qal67GZgamHZ21yry0Vc9BM8A8zkBktAImjIuhOVk=; b=YA0kA9XF1pXuupmxlk3ZwMjLoR
 ZVpQkBiQL0EEyW6hWONkabA0/09vpf1kA1+H1YSy3S9hbmMIkNO03tb/N57ql/FjvHZJ8oSnFUXWZ
 ZMgmbN3PhkyZJKRf/jaQPOsF5SLwX5mjwOkutgiau7MBM7FxJJa5wsGtumzZ8C6DnnFfqE3u6L96L
 I+ClieC87w2Bqe6Iek33eg9hX/0wQ6vc5qzFrAmgPB0cIAycLft/JTCuRjFsrTSnh7UOYMlmlvPph
 7sd7kckWc8qg/mPInxGGueHkrxuF3ezlCmlV9nNXmRtTD0170YjBraSYZ9N11pD0mmpqwAFab7obN
 ZPkDuxpw==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwLiM-004lko-Kp; Tue, 09 May 2023 13:41:06 +0200
Date: Tue, 9 May 2023 10:41:03 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH] MAINTAINERS: Add Maira to VKMS maintainers
Message-ID: <20230509114053.intbu5gtmoezo5e7@mail.igalia.com>
References: <20230508141038.327160-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yy4wix4jnww4ijyp"
Content-Disposition: inline
In-Reply-To: <20230508141038.327160-1-mairacanal@riseup.net>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yy4wix4jnww4ijyp
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxbeqvemzhcqrvxp"
Content-Disposition: inline


--oxbeqvemzhcqrvxp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/08, Ma=EDra Canal wrote:
> I've been contributing to VKMS with improvements, reviews, testing and
> debugging. Therefore, add myself as a co-maintainer of the VKMS driver.
>=20
> Signed-off-by: Ma=EDra Canal <mairacanal@riseup.net>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 276298cfc7ee..63e9b1e8c113 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6721,6 +6721,7 @@ F:	drivers/gpu/drm/udl/
>  DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>  M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>  M:	Melissa Wen <melissa.srw@gmail.com>
> +M:	Ma=EDra Canal <mairacanal@riseup.net>

Acked-by: Melissa Wen <mwen@igalia.com>

And thanks for all contributions to VKMS.

>  R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>  R:	Daniel Vetter <daniel@ffwll.ch>
>  L:	dri-devel@lists.freedesktop.org
> --=20
> 2.40.1
>=20

--oxbeqvemzhcqrvxp--

--yy4wix4jnww4ijyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRaMU8ACgkQwqF3j0dL
ehwINBAAv0xWeAGqOUysX10nsXSaDfKjvyPpJSFIf9XFwDGNOd9pQjxL/ICl+ifJ
H3nFvhjA2xSc98I7QSKup/TaqHug5o3cusTDkmvF5ih0o4lLUf+063ectghcFR9D
o87rNaoah/k2icji+kBnZ1vqavNM641A4kSRT8KFCylD5ggzQYcdES4VIeFDpWvk
t757rdT7gBvRZNJ9dRxkC5nIlwNAoL/9BDG+VQYFbEVMoqYROj1adxd5CqCT8CXD
UA3teJQUQb5YABzS6tyaDb5d4C3fQB1K3j6iXEtQj9Z8vOft/Rhw5ssxVMnOCdBN
0NSWOJeXmD+svG5Es48+82azBg/U9jFeZZJ2b4PUnS+xgS38c7W0TJqIxijNxaan
VcVikp0HN0ZEv+PalxYDOzv/1bkiP2RInzPeEt6mMAKvtAgN/C59skj4siyfLgrx
5ChWQj5XjD0STQ0ggfInwtCfn7Pw60KEr7p6Mo4tod1Wt8+nfHdzWL2bpw8XnxPz
DsnHtYBG/Qs9nnSVCJqS2Mq9M0K54qpq/6jR6dp5CttRnsSgG7meBJEcO1VUQlPp
tu/eomnIAigcBNbHEVeMwiJwcOo500570q1An+oA76KcxcjGemK/PVtfiRmd7aOw
SmIFji9dAVIQ/njvIniRorQVHCZ73UDNvxhYoW1B1FtJI4fJ6Oc=
=LxRR
-----END PGP SIGNATURE-----

--yy4wix4jnww4ijyp--
