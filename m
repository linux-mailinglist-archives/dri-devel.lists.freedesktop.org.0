Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB238DAC6
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 11:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E356E072;
	Sun, 23 May 2021 09:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041A46E072
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 09:49:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621763392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UIkBSe5bph9TeB96LqkuFwERBu7Gp635Ew/KzvtXbaU=;
 b=tQ0/9kKIarh5kyo6D+F0f6mqcP27dkm8nfshJQ9QFo1AW+DtPReToHHAjMNvWWJ9NXU+J2
 bMvFpiw99KFK1XGfrHEfWBeP7Oc8S3MpL87BBvbQ4/msOHy7o2bEt5dW3oc7SDy9oJ6Z/5
 iiqEp5E+ci9NnsFE7NPtsibHzH3uo54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621763392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UIkBSe5bph9TeB96LqkuFwERBu7Gp635Ew/KzvtXbaU=;
 b=FuZNb3pzsQzsLewU+vwuREIPRKabNfN1bpz92qU2eqT5adfb+4f412q855JVZiPCdgSiu8
 Q008Vm4FzmAVzpBQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17559ACB7;
 Sun, 23 May 2021 09:49:52 +0000 (UTC)
Subject: Re: [PATCH RESEND] drm/hisilicon/kirin: Use the correct HiSilicon
 copyright
To: Hao Fang <fanghao11@huawei.com>, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <1621678529-14389-1-git-send-email-fanghao11@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <92a24e79-bb4d-ddc1-35eb-a04361fd15fa@suse.de>
Date: Sun, 23 May 2021 11:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1621678529-14389-1-git-send-email-fanghao11@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dF42GZ0s0x292XIJHo8iDI6mDxeJICt4a"
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
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 kong.kongxinwei@hisilicon.com, linux-kernel@vger.kernel.org,
 prime.zeng@hisilicon.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dF42GZ0s0x292XIJHo8iDI6mDxeJICt4a
Content-Type: multipart/mixed; boundary="8okMKDKnU3SQP2PrEaXJDQmfHJxR6qBXk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hao Fang <fanghao11@huawei.com>, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Cc: xinliang.liu@linaro.org, linux-kernel@vger.kernel.org,
 kong.kongxinwei@hisilicon.com, prime.zeng@hisilicon.com,
 tiantao6@hisilicon.com
Message-ID: <92a24e79-bb4d-ddc1-35eb-a04361fd15fa@suse.de>
Subject: Re: [PATCH RESEND] drm/hisilicon/kirin: Use the correct HiSilicon
 copyright
References: <1621678529-14389-1-git-send-email-fanghao11@huawei.com>
In-Reply-To: <1621678529-14389-1-git-send-email-fanghao11@huawei.com>

--8okMKDKnU3SQP2PrEaXJDQmfHJxR6qBXk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.05.21 um 12:15 schrieb Hao Fang:
> s/Hisilicon/HiSilicon/.
> It should use capital S, according to
> https://www.hisilicon.com/en.
>=20
> Signed-off-by: Hao Fang <fanghao11@huawei.com>
> Acked-by: Tian Tao <tiantao6@hisilicon.com>

It's been acked already. Tian can merge it for you.

Best regards
Thomas

> ---
>   drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 2 +-
>   drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h    | 2 +-
>   drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h | 2 +-
>   drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 2 +-
>   drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 2 +-
>   drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu=
/drm/hisilicon/kirin/dw_drm_dsi.c
> index 00e87c2..9b565a0 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -3,7 +3,7 @@
>    * DesignWare MIPI DSI Host Controller v1.02 driver
>    *
>    * Copyright (c) 2016 Linaro Limited.
> - * Copyright (c) 2014-2016 Hisilicon Limited.
> + * Copyright (c) 2014-2016 HiSilicon Limited.
>    *
>    * Author:
>    *	Xinliang Liu <z.liuxinliang@hisilicon.com>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h b/drivers/gpu=
/drm/hisilicon/kirin/dw_dsi_reg.h
> index 19e81ff..d79fc03 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h
> @@ -1,7 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2016 Linaro Limited.
> - * Copyright (c) 2014-2016 Hisilicon Limited.
> + * Copyright (c) 2014-2016 HiSilicon Limited.
>    */
>  =20
>   #ifndef __DW_DSI_REG_H__
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h b/drivers/=
gpu/drm/hisilicon/kirin/kirin_ade_reg.h
> index e2ac098..be9e789 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
> @@ -1,7 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2016 Linaro Limited.
> - * Copyright (c) 2014-2016 Hisilicon Limited.
> + * Copyright (c) 2014-2016 HiSilicon Limited.
>    */
>  =20
>   #ifndef __KIRIN_ADE_REG_H__
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/=
gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index 6dcf9ec..1ab9462 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -3,7 +3,7 @@
>    * Hisilicon Hi6220 SoC ADE(Advanced Display Engine)'s crtc&plane dri=
ver
>    *
>    * Copyright (c) 2016 Linaro Limited.
> - * Copyright (c) 2014-2016 Hisilicon Limited.
> + * Copyright (c) 2014-2016 HiSilicon Limited.
>    *
>    * Author:
>    *	Xinliang Liu <z.liuxinliang@hisilicon.com>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/=
gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 4349da3..e590e19 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -3,7 +3,7 @@
>    * Hisilicon Kirin SoCs drm master driver
>    *
>    * Copyright (c) 2016 Linaro Limited.
> - * Copyright (c) 2014-2016 Hisilicon Limited.
> + * Copyright (c) 2014-2016 HiSilicon Limited.
>    *
>    * Author:
>    *	Xinliang Liu <z.liuxinliang@hisilicon.com>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h b/drivers/=
gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> index 386d137..db0dc7b 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> @@ -1,7 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2016 Linaro Limited.
> - * Copyright (c) 2014-2016 Hisilicon Limited.
> + * Copyright (c) 2014-2016 HiSilicon Limited.
>    */
>  =20
>   #ifndef __KIRIN_DRM_DRV_H__
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8okMKDKnU3SQP2PrEaXJDQmfHJxR6qBXk--

--dF42GZ0s0x292XIJHo8iDI6mDxeJICt4a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCqJT4FAwAAAAAACgkQlh/E3EQov+Do
gxAAxdP6bRkUA7AYMgZQCcGLxjxkgQeHrt7YtpZQau3StsYnfoW3y6/zc662d4QxdypIB50fy9xP
CtQv16b2cj1LwndrOxv94rrwsOhmqkqfKVun616ls1O2SPrAVaW+R7LsqY+TE0WwxmEv8nJiJHbR
ARNi48sfZ5hv7jGj0namPyD87oH53SS2DW/0fxUidHEGiNhZQt/VDFSDf5ppN8277woyoTFFFlNy
fmD0PxEdXmTonFil38DzgkZZ2Ad6zhxm3K0fwwZk8uK5De3HtwqrFVnw8doDeo8W/16P7Tt2ll1P
EIL0+zkMGostCzGoFNPJksz4zKbjJ/NIEi/sc9hkS5a16jZ+QSMO6YzUnkT2GZkE0Ui9OVHKeO3k
SDojlb5z1BFfMHLBOg07LkzjYaXOX6lFTZeuuKWf2PcdBIu1vLxTO4mwoug/isTK63CATQz4PzoH
i0l/Jtr8UiuqK+WeJwjrh58yUDfA39KammRZnjH0FVayod/+zuJb54XpplboaVKtasvOmHw/puuy
zi4N3i/JAE8MK5tRC3G3YD6bUgUNUq6rZ9oZ861BkLGzBzF10m+AAcpNhsVO7cUBmuuWGjrPhTIW
0c/xP/IZhzvPqAS+PuzTt9vdq2kTSPLpxAm1D3lV0poKLYK2vCh5k4ke7TOGes3tcoXWuvj7XHsC
Jq0=
=dKWa
-----END PGP SIGNATURE-----

--dF42GZ0s0x292XIJHo8iDI6mDxeJICt4a--
