Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA5490AF7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CD810E310;
	Mon, 17 Jan 2022 15:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9713110E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:00:45 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so20073064otu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/dxZvD461SlMfyeHYzrFRmG+0lHmJjYtARJeJQLPvpY=;
 b=lWRjQkiGCj+cTGTeXbOuRbrEMphiURVSpENiEBC0prgzVPEt0g8iXSfTDmshf+ViTD
 CIjoFMzlGXB7oJSSoq0W5kXmTUcSRHhur2KTpXyIbekYrhC+nJS9YFMUx9a0EKRF2F15
 dMtZKZCCYLoW+ULl/4YVAuX/Mk6zWOwbLrHx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/dxZvD461SlMfyeHYzrFRmG+0lHmJjYtARJeJQLPvpY=;
 b=gPIRUrohhmGPWuFJgfK+XcLQKp6WEcI+u4EmCPNHNPuw0AAbtPdM0+PRctbZhTaX7j
 ROMCdEV7aWJ5EcIjOuFGuUEP19ogNYQJ1qhRliNid8QPTTfb4XC2KDnAmJ1LQvtf/mqv
 KPpDvhoCdQ8VYRgdvJNOvxjguPY9Ks91Y8EcfMmAwdWlsaHAcjr6uhVowPBLc25V6fIY
 7bsQbocLVSKOlkqM7Kbol2ZhAWmK08TIywOmPykXwvg0/PJyNfPBAu2BpBdjHi32M5jr
 n+e6Th9OwdMOe4yD0UdKWBr7d1tsDufdrWiQUiMLw2O8SQ1BAeNCM0m6yRQ0p0AoqKTH
 fyZg==
X-Gm-Message-State: AOAM532P7TKdvC4ORxKM6Rnn3r/JAKquzBEV9dV6Oqz2RwXYCy4p7CLA
 lSQbIfb9JWakhSKQvF/mjLQva5Sc9b7pEWa6Mld6YA==
X-Google-Smtp-Source: ABdhPJyjl9zZGHl5jLCvJP/Li+7kpC1gjq+uBoXlAxknMVKszuG/kGjLQ+TET5p0Sgcor7GmumXL5rsNoxy7CE3/xvY=
X-Received: by 2002:a9d:685a:: with SMTP id c26mr16484836oto.239.1642431644611; 
 Mon, 17 Jan 2022 07:00:44 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
In-Reply-To: <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jan 2022 16:00:33 +0100
Message-ID: <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 1:16 PM Helge Deller <deller@gmx.de> wrote:
>
> Hello Daniel,
>
> On 1/17/22 11:02, Daniel Vetter wrote:
> > Hi Helge
> >
> > On Fri, Jan 14, 2022 at 7:18 PM Helge Deller <deller@gmx.de> wrote:
> >>
> >> The fbdev layer is orphaned, but seems to need some care.
> >> So I'd like to step up as new maintainer.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 5d0cd537803a..ce47dbc467cc 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -7583,11 +7583,12 @@ W:      http://floatingpoint.sourceforge.net/emulator/index.html
> >>  F:     arch/x86/math-emu/
> >>
> >>  FRAMEBUFFER LAYER
> >> -L:     dri-devel@lists.freedesktop.org
> >> +M:     Helge Deller <deller@gmx.de>
> >>  L:     linux-fbdev@vger.kernel.org
> >> -S:     Orphan
> >
> > Maybe don't rush maintainer changes in over the w/e without even bothering
> > to get any input from the people who've been maintaining it before.
> >
> > Because the status isn't entirely correct, fbdev core code and fbcon and
> > all that has been maintained, but in bugfixes only mode. And there's very
> > solid&important reasons to keep merging these patches through a drm tree,
> > because that's where all the driver development happens, and hence also
> > all the testing (e.g. the drm test suite has some fbdev tests - the only
> > automated ones that exist to my knowledge - and we run them in CI). So
> > moving that into an obscure new tree which isn't even in linux-next yet is
> > no good at all.
> >
> > Now fbdev driver bugfixes is indeed practically orphaned and I very much
> > welcome anyone stepping up for that, but the simplest approach there would
> > be to just get drm-misc commit rights and push the oddball bugfix in there
> > directly. But also if you want to do your own pull requests to Linus for
> > that I don't care and there's really no interference I think, so
> > whatever floats.
> >
> > But any code that is relevant for drm drivers really needs to go in through
> > drm trees, nothing else makes much sense.
> >
> > I guess you're first action as newly minted fbdev maintainer is going to be to
> > clean up the confusion you just created.
>
> Most of my machines depend on a working fbdev layer since drm isn't (and probably
> -due to technical requirements of DRM- won't be) available for those.
> So, since the fbdev drivers were marked orphaned, I decided to step up as maintainer.
>
> I see your point that at least the fbdev core code and fbcon are shared between DRM and fbdev.
> For me it's really not important to drive any patches through a seperate tree, so
> I'd be happy to join the drm-misc tree if you feel it's necessary. (By the way,
> adding my tree to for-next was on my todo list...)
>
> What's important for me though is, to keep fbdev actively maintained, which means:
> a) to get fixes which were posted to fbdev mailing list applied if they are useful & correct,

Yeah it'd be great if we have that, for a while Bart took care of
these, but had to step down again. drm-misc is maintained with the dim
scrip suite, which comes with docs and bash completion and everything.
Good starting pointer is here:

https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html

Process for getting commit rights is documented here:

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc

But there's a pile more. I think once we've set that up and got it
going we can look at the bigger items. Some of them are fairly
low-hanging fruit, but the past 5+ years absolutely no one bothered to
step up and sort them out. Other problem areas in fbdev are extremely
hard to fix properly, without only doing minimal security-fixes only
support, so fair warning there. I think a good starting point would be
to read the patches and discussions for some of the things you've
reverted in your tree.

Anyway I hope this gets you started, and hopefully after a minor
detour: Welcome to dri-devel, we're happy to take any help we can get,
there's lots to do!

Cheers, Daniel

> b) to include new drivers (for old hardware) if they arrive (probably happens rarely but there can be).
>    I know of at least one driver which won't be able to support DRM....
>    Of course, if the hardware is capable to support DRM, it should be written for DRM and not applied for fbdev.
> c) reintroduce the state where fbcon is fast on fbdev. This is important for non-DRM machines,
>    either when run on native hardware or in an emulator.
> d) not break DRM development
>
> Especially regarding c) I complained in [1] and got no feedback. I really would like to
> understand where the actual problems were and what's necessary to fix them.
>
> Helge
>
> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
