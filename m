Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F44D82B7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 13:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154F310E730;
	Mon, 14 Mar 2022 12:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA60110E730
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 12:08:26 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id h2so10144718pfh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23TYdE6rAuXYnRZLR9j843i1X8sFiRPB6rJyBcbFYXs=;
 b=b1PoT10MogDeQwXCvzAqnu9MG3VLXUzDdorogQ+bRJISwsiaQI4EFaIhHKwh9Hm+MH
 qOQcWYM7UMHutgGFXuuP5TfzO1y/Exkky7/n1x+i+3Pit9qOwTcMCySndyfuHqck8zoS
 2OrWT3A3VuLV1bT6w2YIxDeRpgIbxmlYLZwvorjE+mAkL3ezcQ7mG1E9KwWeZsdeGBN1
 RmUIp1i1lFToXoK48A+qWnKkGLhxdWXNV0mUgxeJhXCcyVGClwwHuLqMmEOdneG6PlAE
 D455b5Z/a7/bGOlO2BBIw+4s71PfrL5/K97FlKso0FC5tD/73YJyF/o0dFHRVqx3lzZN
 UKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23TYdE6rAuXYnRZLR9j843i1X8sFiRPB6rJyBcbFYXs=;
 b=fPGMy3JE7/198tTYH5EOO5qRBQAbIeGxriNYcNR/eNpvcb1rkr6S1cLgKkYNqSCk6l
 UkzvnNllzgrNmoaD9ruJLpcQcyRPfHPWapuNAa1hvBzwl0TPQ5dyLYWYkxdSyUbRy9Rs
 eHWaZdaLQsTRasSDKymj28bqOM30/H8WcIHcPm0VnlguyKdj4HSPrKx7tu/q0zRp4qf+
 677aHKeUttM8ZlTy0b2alMzWzvuwbe4mp81Aj1NvgaigISTqHFsP0ilyF8tnAtY9cSqR
 6Jz8xBrtLtr1tbrIb1oimrBx6SaPG9/dY4w9HWNXneiM+Ey8pPFQnmQnHWsT2K88q0x6
 GW+A==
X-Gm-Message-State: AOAM531pSC8vcBfcf8j6wPFqcPWUB6svAcxK+F4/JXRVk02oSHN7VLpc
 kSn5U9Vy1m4qF4O24bRO7O6YvXK5D0NEd1AZlRujmA==
X-Google-Smtp-Source: ABdhPJyi1ayXupqnGAIwFzy9lr1mIEyrYR/lMV4RbaKiM0lejSV4gI+EJMXtf5Nvl2P8bxsG7lrN3fU3xze97nYT/tQ=
X-Received: by 2002:a63:2a4f:0:b0:37c:4e54:c399 with SMTP id
 q76-20020a632a4f000000b0037c4e54c399mr19751458pgq.324.1647259706391; Mon, 14
 Mar 2022 05:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
 <20220314115354.144023-7-Julia.Lawall@inria.fr>
In-Reply-To: <20220314115354.144023-7-Julia.Lawall@inria.fr>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 14 Mar 2022 13:08:14 +0100
Message-ID: <CAG3jFytMcPY9SsaP9ubgNZ_KdXCm0o9C-ZDF-RXhQHUKFf7+sg@mail.gmail.com>
Subject: Re: [PATCH 06/30] drm/bridge: analogix_dp: fix typos in comments
To: Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: multipart/alternative; boundary="000000000000a715e705da2c89f5"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a715e705da2c89f5
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022, 12:53 Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index eb590fb8e8d0..c719cd5fba77 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -567,7 +567,7 @@ static int
> analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
>         analogix_dp_get_adjust_training_lane(dp, adjust_request);
>
>         if (!analogix_dp_channel_eq_ok(link_status, link_align,
> lane_count)) {
> -               /* traing pattern Set to Normal */
> +               /* training pattern Set to Normal */
>                 retval = analogix_dp_training_pattern_dis(dp);
>                 if (retval < 0)
>                         return retval;
> @@ -1254,7 +1254,7 @@ static int analogix_dp_bridge_attach(struct
> drm_bridge *bridge,
>         /*
>          * NOTE: the connector registration is implemented in analogix
>          * platform driver, that to say connector would be exist after
> -        * plat_data->attch return, that's why we record the connector
> +        * plat_data->attach return, that's why we record the connector
>          * point after plat attached.
>          */
>         if (dp->plat_data->attach) {
>

Acked-by: Robert Foss <robert.foss@linaro.org>

>

--000000000000a715e705da2c89f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Mar 14, 2022, 12:53 Julia Lawall &lt;<a href=
=3D"mailto:Julia.Lawall@inria.fr">Julia.Lawall@inria.fr</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Various spelling mistakes in comments.<=
br>
Detected with the help of Coccinelle.<br>
<br>
Signed-off-by: Julia Lawall &lt;<a href=3D"mailto:Julia.Lawall@inria.fr" ta=
rget=3D"_blank" rel=3D"noreferrer">Julia.Lawall@inria.fr</a>&gt;<br>
<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |=C2=A0 =C2=A0 4 +=
+--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/g=
pu/drm/bridge/analogix/analogix_dp_core.c<br>
index eb590fb8e8d0..c719cd5fba77 100644<br>
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c<br>
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c<br>
@@ -567,7 +567,7 @@ static int analogix_dp_process_equalizer_training(struc=
t analogix_dp_device *dp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 analogix_dp_get_adjust_training_lane(dp, adjust=
_request);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!analogix_dp_channel_eq_ok(link_status, lin=
k_align, lane_count)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* traing pattern S=
et to Normal */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* training pattern=
 Set to Normal */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D analogix=
_dp_training_pattern_dis(dp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (retval &lt; 0)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return retval;<br>
@@ -1254,7 +1254,7 @@ static int analogix_dp_bridge_attach(struct drm_bridg=
e *bridge,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* NOTE: the connector registration is imp=
lemented in analogix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* platform driver, that to say connector =
would be exist after<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * plat_data-&gt;attch return, that&#39;s why w=
e record the connector<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * plat_data-&gt;attach return, that&#39;s why =
we record the connector<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* point after plat attached.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dp-&gt;plat_data-&gt;attach) {<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Acked-by: Rob=
ert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org">robert.foss@linaro.o=
rg</a>&gt;</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"></blockquote></div></div></div>

--000000000000a715e705da2c89f5--
