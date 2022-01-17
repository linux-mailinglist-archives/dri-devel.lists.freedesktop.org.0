Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8F490560
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDEC10E8B8;
	Mon, 17 Jan 2022 09:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED9F10E8B8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:48:06 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a18so63120122edj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 01:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hvs7wdHNk9d6evPXMTRPHKlvNS1pd2jeBhpDZL4yqgM=;
 b=j2eUcRSqjv8rz+GGyoypRLAiAp5ByKbji3UGDPaismYVEFznjzB0AqxcwnFSnIa5XG
 b0cBStOP4jQD2Zw/3wYoPLGO+9ULjkL+mz7s1pp8yfHTSVx67v6T6OxrVIq6AbOZHk2L
 j7v7/kvJC9ch+PZ4wTRPp0dRN2QdlGFNNfhcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Hvs7wdHNk9d6evPXMTRPHKlvNS1pd2jeBhpDZL4yqgM=;
 b=TgGgIwNkRcsWXS9eWc7UxwcPU3pzDc+BWc9RWkp6wcRu9WRRGqaU8NRxyXgQdLoWzV
 aTssfsA1om1wDaejoBZPYsJnglPUBNOwfnOsl2OEQl0nVeLmBO7qNoJaOUPMqKARIVyX
 T2oP/9aP7JSUUD0+LhD9mJlDWwnsdKL3yacFSKjEOIEHU4NyyMgZ0cFRldZFD2SV2v1J
 zRXVe8EruAKm0EqR1brgsuHLQtyQp+MKQYdxp1QLI/lXcQtHIECVLB29KAK+2MgOfkqH
 M+Lg63gI16Yjr5X7PAYUS8GChadOAwcwaCi33r7S8Mw3dGgwYh4mB6wgxYibkZ6UQ5GU
 ET9w==
X-Gm-Message-State: AOAM531fbI+cKKKaI83HEjm/ZBulvO43drexgUuc6PNPGk4vIoEKD0+P
 Z8mGLM5wDOda04fzf40yxwd/BA==
X-Google-Smtp-Source: ABdhPJzgzyXyFgTeax+VBjmTswOv7LJ3YOfVs1bNjMWWzVqPATfGKipEN5KgjwU4FLcDhpQ8YuNBeA==
X-Received: by 2002:a17:907:3e07:: with SMTP id
 hp7mr7400211ejc.469.1642412883687; 
 Mon, 17 Jan 2022 01:48:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p4sm2887048ejl.78.2022.01.17.01.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 01:48:03 -0800 (PST)
Date: Mon, 17 Jan 2022 10:48:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>, "airlied@gmail.com" <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <CAKMK7uFnhK7pnfiMzz-UY1UYv3WG=sVOCe24bz0xROhQOxY+eA@mail.gmail.com>
Mail-Followup-To: Helge Deller <deller@gmx.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <YeG8ydoJNWWkGrTb@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeG8ydoJNWWkGrTb@ls3530>
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
 dri-devel@lists.freedesktop.org
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
> +L:     dri-devel@lists.freedesktop.org
> +S:     Maintained
>  Q:     http://patchwork.kernel.org/project/linux-fbdev/list/
> -T:     git git://anongit.freedesktop.org/drm/drm-misc
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git

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
that I don't care and there's really no interference, so whatever floats.

But any code that is relevant for drm drivers really needs to in through
drm trees, nothing else makes much sense.

I guess you're first action as newly minted maintainer is going to be to
clean up the confusion you just created.

Cheers, Daniel

>  F:     Documentation/fb/
>  F:     drivers/video/
>  F:     include/linux/fb.h



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
