Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6EC60FFD6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 20:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25C710E6BD;
	Thu, 27 Oct 2022 18:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8266210E6BB;
 Thu, 27 Oct 2022 18:07:11 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id y67so3217032oiy.1;
 Thu, 27 Oct 2022 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaxYGcocrZDHBDKCQpxYCj5Xn+ir2U1ZAi/BlPJdI84=;
 b=kyOswfpO9Lj4tJWAvnRsjJLvCg6xDvMU3Qrp/w56N2I8WcRqXCA/3W3+v5L1I4BdfX
 Sth8T77VBuVvpGdcnYlLjaaf+xJrNVIBfkrcso7WvlkSk1gL5vSo8Bufjqv/wq+M0uUm
 NsJ82J6/3AS6f6NervP7f5UaXrUl8rvJTCakYHdgGlxwYcf7kFgmBu4KTfYmFLnb9H8c
 HngshDz92uf9Y4SiNgjeGNZZM9+6R6S7MYFHGrsGi75wRkMeQh/YO7ouwc/UgUlV4vId
 JPWbQQofF3o6eZbj6e0Ms4JM+XP3liSmBcPOHIXWdXe3Y5KPGrJyreqioqlRl096zfp3
 Muzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaxYGcocrZDHBDKCQpxYCj5Xn+ir2U1ZAi/BlPJdI84=;
 b=XYq78opzonCaw1cXYzUis5YX9UhVkgUSvjEUX1EEaKcj9DEr2eeK2dkdCobt2VRv6C
 79q4K3KIIZMyTz9K+q/kP5/BmMYBulcifWOdfk+s8nPMoCVClxlZBX2xdnrCCE4HeZ8k
 JwQBuQmrCiYHcpCSF2PzEGJCqC4siQswh6+ctmZ6wRnBgHgAVb1R3j+yMOKfHHG98YIa
 i/gRVAFiTrrYGAsb8qG/0+izQ/BuAFkiwVrCwksOeGspS6ZXp1uPJxGiO4JHBMf0Jxdg
 YVo0JpLfjFD4VPLoI43HZ7cA+dleOkMngfuTO22hRtTQ9VOrCFjIKrRKfqyj9pNIa1La
 ubAw==
X-Gm-Message-State: ACrzQf15yIwYAV1UbvEz87uA2xKsaLHfM08DjD7D0IP/MnRCAnWQL94I
 0hqarUyHdmpIwUwueAYYQj9maCu/tODnWAxjbBE=
X-Google-Smtp-Source: AMsMyM4G1gpkXGE5KpUjgt5/ZfWyZ65V/M02ZXhKo8wuaK0hvXtVDlOwHr0Iql2VZhIaEwZpqrBaiNvSL0rgSi9Hurg=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr5705205oiw.96.1666894030862; Thu, 27
 Oct 2022 11:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221027061835.39784-1-luben.tuikov@amd.com>
In-Reply-To: <20221027061835.39784-1-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Oct 2022 14:06:59 -0400
Message-ID: <CADnq5_OVGPO6mhhjdOQUUZZmTybZVTW8y1o+LAo=UODvDPfocA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update GPU Scheduler email
To: Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 2:19 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Update GPU Scheduler maintainer email.
>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freede=
sktop.org>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b1f3d0893393bb..1997006d1e25a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7109,7 +7109,7 @@ F:        drivers/gpu/drm/ttm/
>  F:     include/drm/ttm/
>
>  DRM GPU SCHEDULER
> -M:     Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> +M:     Luben Tuikov <luben.tuikov@amd.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>
> base-commit: e1e7bc481d49c3e3ada11029ce0d9b85a0a539d7
> --
> 2.38.1
>
