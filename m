Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E72425CA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1A46E8AE;
	Wed, 12 Aug 2020 07:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0725389CB9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:49:33 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id v20so307921ual.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ec3hb1HhqeB2DI7JK5yImFfYmmeK+5UuuKg/pUNSeYA=;
 b=rr5OWxLDqhYYZxUKHh5CpNBFKgFC1ZdhLolQeVHsw/C8onEks48wUq5jTJHX+At8cD
 0/emtRS+xwzW95pK2umsSK96eFsEjqUda704AuGWcUTxd3i3pcSboPf/14XP/7AZD/sW
 ZETOdgq62bsvTE5ck7tGKrRIkaJD0TlOWJXOY3VzjEOw/Pn+GzAxcuUQ0i+GUWDmm6qg
 rQrcmqB7i9FXhmJ/g82LRDIvAfhoddkYpMH9Oy2XtGICSemrOG2VTq8nB0AqbQ0gD1R+
 9zYKwDMwHPuU0WjeFvB70FhjA/7RYl4bPVVqqqgzagNG4p5aeT1v+/KDv5eTzFlEQ1gz
 lilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ec3hb1HhqeB2DI7JK5yImFfYmmeK+5UuuKg/pUNSeYA=;
 b=ciwMUBFUKuKUYFkdW/OqVNfdnMwmnidE03y/Jgm4KDLkh0dpRYu74n1ifQhmj2BjAS
 qSy0iENTa9l866wrAGUXQpInODhkbodpG9G8YHpXonXoypt15n1a1//2khvNboiJpCXR
 RwJ/59nnmt3TxDbTbsZ5/bae1tQdVGhtLXG7FGp0dqzUeQPhQ7msjEYu1axCQqvN3BRg
 59UyagG7gAMqM8mBKoVtkrIkUzABuYHKnM+C8JE2JHKUVjqGbI3WaVdgjyMShHoj5mTE
 sTQs4D2gtM7SWt1J9LIIV+RDcsDa6qErWt5cy/ZR8JQonJCc4Qwxc8MrP5u7RLY7saed
 Hslg==
X-Gm-Message-State: AOAM53396Dx2sxhhlEhFvR1LMyCMOetb3hk3JogBCJQ/XuF2tnz7mK9W
 jSSExLkr8yFP220Os6BGbO+eU9ENVWjSNchSngtRCA==
X-Google-Smtp-Source: ABdhPJy5pt5VmcI55q9ot9oREHqUuwuWHZtbOjqhFzWQEo177ZixVAQzCJyWs4tCr1SGWfS8nl6/+KAOqor2//9/oaA=
X-Received: by 2002:ab0:6018:: with SMTP id j24mr21745329ual.85.1597135773085; 
 Tue, 11 Aug 2020 01:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Tue, 11 Aug 2020 16:49:22 +0800
Message-ID: <CAKoKPbzEJ8KZOEARz=mZuEZ1m6Mx+gaK5J78H80jOqvaqEANHA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Change maintainer for hisilicon DRM driver
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: David Airlie <airlied@linux.ie>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 11 Aug 2020 at 16:25, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Remove Rongrong Zou and change tiantao as hisilicon DRM maintainer.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Thanks Tian Tao,
Tian Tao now is actively maintaining hibmc driver. Happy to hear this.
Acked-by: Xinliang Liu <xinliang.liu@linaro.org>

-Xinliang

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f12a868..f4e49e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5694,7 +5694,7 @@ F:        drivers/gpu/drm/gma500/
>
>  DRM DRIVERS FOR HISILICON
>  M:     Xinliang Liu <xinliang.liu@linaro.org>
> -M:     Rongrong Zou <zourongrong@gmail.com>
> +M:     Tian Tao  <tiantao6@hisilicon.com>
>  R:     John Stultz <john.stultz@linaro.org>
>  R:     Xinwei Kong <kong.kongxinwei@hisilicon.com>
>  R:     Chen Feng <puck.chen@hisilicon.com>
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
