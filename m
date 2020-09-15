Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7326A02F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3066E0EE;
	Tue, 15 Sep 2020 07:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5906E039
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 07:51:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n22so2069254edt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhg0YeM4tXK+B7e+MsLZrBy7abV+JR3UwJaqTmBfu2c=;
 b=bTL14Kyf8Vdu9vK5JKBqQxiuSbmNOVNclcFUd3dw6oD3TqJ4hWKqgGntSSl7mp/oAz
 3EprxlR3lkbqYvP4d9y9zeKyZ/TeQlRMT2+V7w50klxcxNc8kSaoRgWz5ldke3wXmleF
 jmeY2yi0Jl+9CgEhLrvLGDnHKWFvEM/5RPi9q1cxloi4mqVCCf71SsqTegpyzjQ6eULQ
 miaI7ZNP51gfN6V6kiuzV5Krogw4QvbjoWrnHVnNdQ+XfWh6gc/a/I6bTtJOpb9cflLj
 Iah0UN3gZCvYmS3gqCToSMecN8Wg8Djm2cws8De+9hpH7JkUVbzQFWkhOwEOT0msQWWt
 9Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhg0YeM4tXK+B7e+MsLZrBy7abV+JR3UwJaqTmBfu2c=;
 b=BFqvS6CBAw4qNVIOVocEPDADCq8B5dTmhtOvslJgs/MoTpkXlv3kDIQhyPa8Nl9XGj
 OQ0u+P4rnH1+gUcr3o161IFs5Zys0GcvPuWS6nC0YZTTR7rZ2UTliJBjaCR0yGVIszqf
 qQX6+FS3+YcZc4unaHszbVnysAK28tEoOCecIKuuhUGHMX06lm5i0Sq4UGT2V4HtRXAd
 sGGADgu6IYfNsPkHDn3iJlrragkqxFmePyrbiP8soLeGD/hCx5DiQswVEnddDJr716b+
 UUp0c43fbuX2ab7pDzyGI4aB+BNs4AFxWoj+zO1cmD4VeTE8g5SdP2RsnxZ1V3mQ61hv
 jC/w==
X-Gm-Message-State: AOAM531J12ayd3mNoJLKo/FvaqdYcX0N+ldnkHWcEJADxUmcsPUbnHhn
 Jbu+2vSfGq9qRfcR6TItzFWMyYWtN2NZuQmSFIg=
X-Google-Smtp-Source: ABdhPJyGvg2xSnnS2wz9gbVrfv5vg7HZ5oQzlKZmW8kaYzqsalJbZlec262TIYTBMuZ4PSBpLFEZ8N0BDyDn/jIBmGQ=
X-Received: by 2002:a50:aa94:: with SMTP id q20mr20556339edc.119.1600156297550; 
 Tue, 15 Sep 2020 00:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200915071708.4743-1-tzimmermann@suse.de>
In-Reply-To: <20200915071708.4743-1-tzimmermann@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 15 Sep 2020 17:51:25 +1000
Message-ID: <CAPM=9tzpyWueoARAr4Kgzgub4AdFZJbb6UQcUrW5kvWKSeb2nA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Thomas as reviewer for ast,
 mgag200 and udl
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Tue, 15 Sep 2020 at 17:17, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> I'm adding myself as reviewer for ast, mgag200 and udl. I've already
> been keeping these drivers in shape for a while.
>
> While at it I'm also setting the list and tree for ast and mgag200,
> and update each driver's status to Supported. Working on these drivers
> is part of my job.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  MAINTAINERS | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58ea37042d22..2baaec07cde3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5419,7 +5419,10 @@ F:       drivers/gpu/drm/aspeed/
>
>  DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
>  M:     Dave Airlie <airlied@redhat.com>
> -S:     Odd Fixes
> +R:     Thomas Zimmermann <tzimmermann@suse.de>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Supported
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/ast/
>
>  DRM DRIVER FOR BOCHS VIRTUAL GPU
> @@ -5507,7 +5510,10 @@ F:       include/uapi/drm/mga_drm.h
>
>  DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
>  M:     Dave Airlie <airlied@redhat.com>
> -S:     Odd Fixes
> +R:     Thomas Zimmermann <tzimmermann@suse.de>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Supported
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/mgag200/
>
>  DRM DRIVER FOR MI0283QT
> @@ -5652,8 +5658,9 @@ F:        drivers/gpu/drm/panel/panel-tpo-tpg110.c
>  DRM DRIVER FOR USB DISPLAYLINK VIDEO ADAPTERS
>  M:     Dave Airlie <airlied@redhat.com>
>  R:     Sean Paul <sean@poorly.run>
> +R:     Thomas Zimmermann <tzimmermann@suse.de>
>  L:     dri-devel@lists.freedesktop.org
> -S:     Odd Fixes
> +S:     Supported
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/udl/
>
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
