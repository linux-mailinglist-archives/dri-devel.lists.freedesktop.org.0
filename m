Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A672445D2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 09:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0E6E2D7;
	Fri, 14 Aug 2020 07:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5F36E2D7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 07:26:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AEB9AFB8;
 Fri, 14 Aug 2020 07:26:59 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: Change maintainer for hisilicon DRM driver
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.c,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
References: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7b836643-82a6-667e-7ece-77797dc9ae3d@suse.de>
Date: Fri, 14 Aug 2020 09:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============2123463539=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2123463539==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bvqwLGikxZe1lO7rp7FGW9rxJuchXrjZZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bvqwLGikxZe1lO7rp7FGW9rxJuchXrjZZ
Content-Type: multipart/mixed; boundary="F9Q17FKniWKL2VKF2wUvTYuqGCn29KwYz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.c,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
Cc: linuxarm@huawei.com
Message-ID: <7b836643-82a6-667e-7ece-77797dc9ae3d@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Change maintainer for hisilicon DRM driver
References: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>

--F9Q17FKniWKL2VKF2wUvTYuqGCn29KwYz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

as a driver maintainer, you should have commit access to drm-misc. Head
over to

  https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html

for a description of what that means. The account is requested at

  https://www.freedesktop.org/wiki/AccountRequests/

as described under 'Legacy SSH accounts'.

The first patch to commit would be your appointment as maintainer of
hisilicon. :)

Best regards
Thomas

Am 11.08.20 um 10:23 schrieb Tian Tao:
> Remove Rongrong Zou and change tiantao as hisilicon DRM maintainer.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f12a868..f4e49e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5694,7 +5694,7 @@ F:	drivers/gpu/drm/gma500/
> =20
>  DRM DRIVERS FOR HISILICON
>  M:	Xinliang Liu <xinliang.liu@linaro.org>
> -M:	Rongrong Zou <zourongrong@gmail.com>
> +M:	Tian Tao  <tiantao6@hisilicon.com>
>  R:	John Stultz <john.stultz@linaro.org>
>  R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
>  R:	Chen Feng <puck.chen@hisilicon.com>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--F9Q17FKniWKL2VKF2wUvTYuqGCn29KwYz--

--bvqwLGikxZe1lO7rp7FGW9rxJuchXrjZZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl82PKkUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiN+uwgAk2mi91YpMNF18na8LWrm60KkJkJb
wBk3zGq3e6qPt3h/L+9LTjTVTcA85gxA1mlHhVx5qGrU4Q7GHDYA0SXm/vWmLK33
GCA5jvGbTMWV1828A87lw75i9jVt6EXPEBkgIQ/9cBeAh9OWmIzaA5wCDt5MCG4C
1X7RsDQF0d2UwVOdEyya5k4bvmY4/1lqrD51+YaKsu4tRdyWOB+ejZYsUHhBWc/P
ydgx2k+E7cmz1QVofc6bGXmIF3BuCVscDODsoyGeqTuXCXDK7yAU/mL27SnZKEEh
9rSr7s5UWzRiqmx/I0WQTPTkHuRNMSbwlM1mfoAeu1YQUUm4H3B94Gl61A==
=M5rt
-----END PGP SIGNATURE-----

--bvqwLGikxZe1lO7rp7FGW9rxJuchXrjZZ--

--===============2123463539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2123463539==--
