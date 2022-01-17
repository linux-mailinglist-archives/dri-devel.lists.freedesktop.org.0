Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9717491177
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 22:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B28A10FF03;
	Mon, 17 Jan 2022 21:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6254510FF03
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 21:55:53 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id h23so23092480iol.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 13:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iq6XuonlfOcKR4C7CyNJxsO+5s/Hfb7aV3tDFA0gEZI=;
 b=l/y+ijuPgonK5lJCli5VtgR6TTwDBpyZUvCurozFzuz7OiAJnnO4Pws3B7pDXFrxo3
 1qPkCWF6g4gqcQ9fj5W3o3UG9kW9xr6WBBk9np95JyILPPkTd/fq004AVdKO1psi7nY4
 38P7nNa/TBG088Cobnmys+lfk5LZ4mwenxF/rfFCPhwiFdU9CKOaIjraLKN7XoZJ93kA
 y25Zf84NPJuHBbYRHQRGU0izpt74/lhxnnxrfSRBWIfPVTFavlBA+AM5nsk38/0d1+t5
 QAcW6keskunmZ/A6xONkjkWXvxmoTGYKNlUPLbkuCkbpmX0+fhueWXuGuDjyd+Hi15O0
 VbHQ==
X-Gm-Message-State: AOAM531hTU+b350A+TrQM/VHPcT4+kFVE29mz7nJ+kYRv5LzONAroW8t
 1EW/yWHaE9d5yeeVSRBLyJkOZm8YzeyKtT1/0K4=
X-Google-Smtp-Source: ABdhPJxxA9k4MZckhnsZSeaXrceoVg6qNVBBjDPdSuqgeM5leXyBs8XmXDdISpGBE5qYe2hXdGaekksgj3MT3OVtZY0=
X-Received: by 2002:a05:6638:c1:: with SMTP id
 w1mr4478075jao.113.1642456552694; 
 Mon, 17 Jan 2022 13:55:52 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
 <e4242fe9-13b1-91b5-d254-992f48115589@gmx.de>
In-Reply-To: <e4242fe9-13b1-91b5-d254-992f48115589@gmx.de>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 17 Jan 2022 16:55:41 -0500
Message-ID: <CAKb7UvgXaeX7FRUK_Q35N=2zBms8WgCe=ZBKr3dHrixoJWtvqw@mail.gmail.com>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 2:47 PM Helge Deller <deller@gmx.de> wrote:
>
> On 1/17/22 17:21, Helge Deller wrote:
> > On 1/17/22 16:58, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 17.01.22 um 16:42 schrieb Helge Deller:
> >>> [...]
> >>>>> c) reintroduce the state where fbcon is fast on fbdev. This is important for non-DRM machines,
> >>>>>     either when run on native hardware or in an emulator.
> >>>>> d) not break DRM development
> >>>>>
> >>>>> Especially regarding c) I complained in [1] and got no feedback. I really would like to
> >>>>> understand where the actual problems were and what's necessary to fix them.
> >>>>>
> >>>>> Helge
> >>>>>
> >>>>> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de
> >>
> >> Seems like few people read linux-fbdev these days.
> >> I suggest to partly revert the patch to the point were performance
> >> gets better again.
> > Yes, *please*!
> > That would solve my biggest concern.
> >
> > As far as I can see that's only 2 commits to be reverted:
> > b3ec8cdf457e - "fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)"
> > 39aead8373b3 - "fbcon: Disable accelerated scrolling"for-next-next
> >
> > I think both were not related to any 0-day bug reports (but again, I might be wrong).
>
> I did some more checking...
>
> Both patches are not related to DRM, since no DRM driver sets the
> FBINFO_HWACCEL_COPYAREA or FBINFO_HWACCEL_FILLRECT flags.

These used to be set by, at least, nouveau (which is a drm driver).
And yeah, console responsiveness is _way_ worse without that. People
keep pushing the messaging that it's the same speed to do it as
memcpy, but that's just not the case in my experience, on a pretty
bog-standard x86 desktop. The support got dumped, and it felt pretty
clear from the messaging at the time, "too bad". Would love to see it
come back.

Cheers,

  -ilia
