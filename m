Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D5B2425E7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4788F6E8BD;
	Wed, 12 Aug 2020 07:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6D66E8BD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DA05B1AA;
 Wed, 12 Aug 2020 07:18:12 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: Change maintainer for hisilicon DRM driver
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.c,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
References: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e03e9597-2f25-4f7b-38bd-aa56f3a00542@suse.de>
Date: Wed, 12 Aug 2020 09:17:47 +0200
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
Content-Type: multipart/mixed; boundary="===============0469516251=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0469516251==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="knU8VmonCekW45Pv1I2KEd3FAfDTj5rNv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--knU8VmonCekW45Pv1I2KEd3FAfDTj5rNv
Content-Type: multipart/mixed; boundary="cZrU9yiX73SvcKBEGMnfTVDwhepjSEp3m";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.c,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
Cc: linuxarm@huawei.com
Message-ID: <e03e9597-2f25-4f7b-38bd-aa56f3a00542@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Change maintainer for hisilicon DRM driver
References: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>

--cZrU9yiX73SvcKBEGMnfTVDwhepjSEp3m
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.08.20 um 10:23 schrieb Tian Tao:
> Remove Rongrong Zou and change tiantao as hisilicon DRM maintainer.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for looking after the hisilicon drivers.

Best regards
Thomas

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


--cZrU9yiX73SvcKBEGMnfTVDwhepjSEp3m--

--knU8VmonCekW45Pv1I2KEd3FAfDTj5rNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8zl5sUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPttwgAmN8w1wkDRPJAlUzZu0wJrbIm7xEs
/fuddvw2LhR54zgh3CI4ZQlRzFqdJHbxH5qLL4e941BP2pzotYKNNa4VKUNjA+jG
LdBq4zhyAUKJnNeefjUcFoKzX5ypqBA08B0Xs85uDYiRgVPLCqZQfspL4sajeRR4
piYDewmqM9KelwIulGfWj6lvRC4FKiYBb1zE8pEG8JbOYQCT3xEviemc1BaTysZH
JF8uKzXy+cRgA8EVFuSDyfVdKnVKZv09TrmznECFCypUz5GryPY6ttycOG4VWYEY
E75A1cY2gLi3OuoH3hRqCUVI3YouWAtFcZkwxS+hnc3pdn+KMH7jApTTgQ==
=UWLL
-----END PGP SIGNATURE-----

--knU8VmonCekW45Pv1I2KEd3FAfDTj5rNv--

--===============0469516251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0469516251==--
