Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8445644CE81
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 01:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A94E6E869;
	Thu, 11 Nov 2021 00:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B66A6E869;
 Thu, 11 Nov 2021 00:46:20 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id y68so5600799ybe.1;
 Wed, 10 Nov 2021 16:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jGclxXlL6lYvEF+SDFmYRiUkfiSkDSyd5IJKVOZ8EqE=;
 b=cRaG+ilODPlONYlYwH15hm3sbeeOVM7FlHUvJIv29IkWjAuwd6CzgRN5kwIrLn4ax5
 jLriURC1Zft0SKih49F52lIFpbeMq+NFQVPB4xwYax4W0vsEZCq5e2+VSn/t6hUhOXu3
 McqdyXPM9VoVSe/ur89/PbjEwYLZHwgUzvhwjx8qttl1/w+mCKaJcKXm8zDekfFR9E56
 zKV26HLTrK3HOFuFsvigJfYQkCnOoSFO2jfWSbtrBcr0VJtp3cyOf33nOqwFHMQIUQel
 W3GUa0Fs6CFj7fxfkD9zHXvBZKYj4GsjUJY/fLSS7gokT1VJVG2KIeM2+nAqwX7XASuh
 22xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jGclxXlL6lYvEF+SDFmYRiUkfiSkDSyd5IJKVOZ8EqE=;
 b=XBJt9OQ2j0WiJck4aTGpEfz+0WrBw04pQl/hIN/zWHjy95fAEooy1p6kggjcmYlUQ6
 ZHo+v1kyjAbQW6UWaKp0RD+phN4W9uEaovrJfw/b8Gy9uaNZSQEqJV0GEEwsJGOIAONW
 LQynRCUMYUzAGxnYPBKwRF+1AFRHdhuHQRFhdvcDF+/Ssdntof9WyCo9FADxkaEzOQNH
 XMW6/4/aodExsKXMWwVBOXKpWMBoFhRO5hbBC21R57b7i5AZs6+EAWxRI1teRJuCXiFn
 4xI0KzOJYGp2mqf1Vz1r6J1ZYpkeUZaM0qGDvmP23TaBein7USzhighCjTQgwvrRpup5
 JGew==
X-Gm-Message-State: AOAM530BYAdmXkLO+loec0sBl9sNrKnGqkrfn3SyYntbfa7NUm1xGqG1
 jG0kaJoWYsOSYshDTvVD5b/RiXP5yzmZCJR6Aivo+zh+
X-Google-Smtp-Source: ABdhPJzHopCA7n/yH9yxuczPe67/BWVGCG4P6b0YZIv/l3QbYpZ5JKlMNHR/A5zxOYbfTc9SEPCS+ymeZM2808khiJ4=
X-Received: by 2002:a25:ec04:: with SMTP id j4mr3849065ybh.327.1636591579794; 
 Wed, 10 Nov 2021 16:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20211110133157.553251-1-kherbst@redhat.com>
In-Reply-To: <20211110133157.553251-1-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 11 Nov 2021 10:46:08 +1000
Message-ID: <CACAvsv6a=jtpgr02cGWgu4ZrSNjmRRZecdNHtUNXVBWU1msDiQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] MAINTAINERS: update information for nouveau
To: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 at 23:32, Karol Herbst <kherbst@redhat.com> wrote:
>
> Some side notes on this. Atm we do want to use gitlab for bug tracking and
> merge requests. But due to the nature of the current linux kernel
> development, we can only do so for nouveau internal changes.
>
> Everything else still needs to be sent as emails and this is also includes
> changes to UAPI etc.
>
> Anyway, if somebody wants to submit patches via gitlab, they are free to
> do so and this should just make this more official and documented.
>
> People listed as maintainers are such that have push access to drm-misc
> (where changes are pushed to after landing in gitlab) and are known
> nouveau developers.
> We did this already for some trivial changes and critical bug fixes
> already, we just weren't thinking about updating the MAINTAINERS file.
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  MAINTAINERS | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8805df335326..270dc9c0a427 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5961,10 +5961,17 @@ F:      drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>
>  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>  M:     Ben Skeggs <bskeggs@redhat.com>
> +M:     Karol Herbst <kherbst@redhat.com>
> +M:     Lyude Paul <lyude@redhat.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     nouveau@lists.freedesktop.org
>  S:     Supported
> -T:     git git://github.com/skeggsb/linux
> +W:     https://nouveau.freedesktop.org/
> +Q:     https://patchwork.freedesktop.org/project/nouveau/
> +Q:     https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests
> +B:     https://gitlab.freedesktop.org/drm/nouveau/-/issues
> +C:     irc://irc.oftc.net/nouveau
> +T:     git https://gitlab.freedesktop.org/drm/nouveau.git
>  F:     drivers/gpu/drm/nouveau/
>  F:     include/uapi/drm/nouveau_drm.h
>
> --
> 2.33.1
>
