Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561649059E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 11:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDF210E27C;
	Mon, 17 Jan 2022 10:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F11410E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:02:40 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 v124-20020a4a5a82000000b002e303ad3241so146712ooa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 02:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HqXcDREe5y1sCCawQrq5gS0r+qm6TMEu5IgagEe+Xnk=;
 b=bIv8XIAU0GsSyIwX6nsbk3i/t2O8vvYeunZVSIrKk3F32b5AVoFwIuTETUfRcoNTAv
 +h3oO9tLPGF9tBJjejEdSSTOH6duM90RBVMsihNbbUHfBxb27b2Y2XDhJDh0CYhgt8W2
 BxYG+jkBKpCKCNsoaanja7a4R2cqDV8A5Ci24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HqXcDREe5y1sCCawQrq5gS0r+qm6TMEu5IgagEe+Xnk=;
 b=KbfQ8Z4FSgG3yTMcXUQNHs71CFfZYsUSjL1vViKO8d3HzcDZlgwF6hI0TwWceMo2+V
 Oi96I8WRS0pjmpci7cNmbOCdiCaS9g0gLiMvLyzJSytxGuITuaQMlLQn4C5D2kzjVa15
 hFVPVj61CPyeDL7QwwyBLjdbIdmk0NUQ+T1XH5MWVVBuN14FFNFR96k5T/qCkfTgayBm
 +a4AErNed/k4SruOXK7iXQRXGfYES/rGEP2XJCDLMLKfjJ5uLScDtXLjKDPoEJAsIIxS
 /amGXnQdbNsf64K+wKRaokP0FutwywMq6LcpA/TTFuEQ6SsE/DTJ7z6fJ5Fd+7ROEIXJ
 CbWw==
X-Gm-Message-State: AOAM533zPUDSabU1IBZTDlOfSHhw7h9XZQOsv1sweELRpBVearOUlSjR
 i0DPXMjCoTQFqPlBdSbP77bJAyK2pZzdtTgQDWpmFQ==
X-Google-Smtp-Source: ABdhPJwvPKmDxxJJ1qa577C8egiG4E+qjDnMKNDKT3l/zj/o4nz98PNcYsm9tz4V8VBIdw49tjknfpyUQtCv2tyYqwE=
X-Received: by 2002:a4a:db96:: with SMTP id s22mr12394697oou.66.1642413759605; 
 Mon, 17 Jan 2022 02:02:39 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
In-Reply-To: <YeG8ydoJNWWkGrTb@ls3530>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jan 2022 11:02:28 +0100
Message-ID: <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Helge Deller <deller@gmx.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 "airlied@gmail.com" <airlied@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge

On Fri, Jan 14, 2022 at 7:18 PM Helge Deller <deller@gmx.de> wrote:
>
> The fbdev layer is orphaned, but seems to need some care.
> So I'd like to step up as new maintainer.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d0cd537803a..ce47dbc467cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7583,11 +7583,12 @@ W:      http://floatingpoint.sourceforge.net/emulator/index.html
>  F:     arch/x86/math-emu/
>
>  FRAMEBUFFER LAYER
> -L:     dri-devel@lists.freedesktop.org
> +M:     Helge Deller <deller@gmx.de>
>  L:     linux-fbdev@vger.kernel.org
> -S:     Orphan

Maybe don't rush maintainer changes in over the w/e without even bothering
to get any input from the people who've been maintaining it before.

Because the status isn't entirely correct, fbdev core code and fbcon and
all that has been maintained, but in bugfixes only mode. And there's very
solid&important reasons to keep merging these patches through a drm tree,
because that's where all the driver development happens, and hence also
all the testing (e.g. the drm test suite has some fbdev tests - the only
automated ones that exist to my knowledge - and we run them in CI). So
moving that into an obscure new tree which isn't even in linux-next yet is
no good at all.

Now fbdev driver bugfixes is indeed practically orphaned and I very much
welcome anyone stepping up for that, but the simplest approach there would
be to just get drm-misc commit rights and push the oddball bugfix in there
directly. But also if you want to do your own pull requests to Linus for
that I don't care and there's really no interference I think, so
whatever floats.

But any code that is relevant for drm drivers really needs to go in through
drm trees, nothing else makes much sense.

I guess you're first action as newly minted fbdev maintainer is going to be to
clean up the confusion you just created.

Cheers, Daniel


> +L:     dri-devel@lists.freedesktop.org
> +S:     Maintained
>  Q:     http://patchwork.kernel.org/project/linux-fbdev/list/
> -T:     git git://anongit.freedesktop.org/drm/drm-misc
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
>  F:     Documentation/fb/
>  F:     drivers/video/
>  F:     include/linux/fb.h



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
