Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF54924AE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 12:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A71010E4C7;
	Tue, 18 Jan 2022 11:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95E610E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 11:23:02 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id bf5so5690287oib.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 03:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0vxu12L1jZfPH/n8U6n3NYOUika1PiHRFgnFfE0mqac=;
 b=FQcI04UjT4EjGUadFs3tu4NgXPGRJOKF4fVamISkg3N+HpvnrRY052ydvNoRCdWVsm
 DQxKsojVYpQZ/lVhyUlZE4dzcOtYQ5HqNZMtdFoOtzS/mNtFbLcdBrCAKyHdQGtrcNb+
 Dv/SZjYB0cET4g9ABzGbEN0f28Ox80038d3ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0vxu12L1jZfPH/n8U6n3NYOUika1PiHRFgnFfE0mqac=;
 b=3lIBvu5rKaLPw+S1p5UUf5ESf4HXpNXFZIHN5qwUhBM6p4WOTNrCB77p91W50IJlFq
 UwAvV4Nw1/2gEuYfALypu6u5W99gYRe6nWahVVUYTwV0DSZ09ASw8FuXZEiGNbO0w2Sv
 GHuT2UgPTTOIXo2xggkKszvbjTvxMvsvJUiZtGV25IbcbgINO07fz1auQTkXWAcJsEyN
 YzeUNQXEGekD9AKqHQCb8VKGBjmGnDyx4r2yqMFbvhJDqZQHPPqAooR+gKgiEnhKS43/
 6VHHW0H+9ce6fuVuWLy0LMD2P8JdqqYKgyYD6QunPy980v7MDliviQUHJ5XuHKyiVUKD
 oKZg==
X-Gm-Message-State: AOAM531C+UzisMyxKeqtJABeWCc2ZcsfBhgAUum1ZbH+5rNO6hLIrBhC
 H8Z7zo/Rahnx6QskdAJStb00s7nOyWjXEaJ9KLDk7w==
X-Google-Smtp-Source: ABdhPJx04xf4KFu7cR9PzSZ5lOKeBxnc/JEG/KJ4kgQu+iPUN6I304Hyiv0+IwlQnk/spVK2x5FoB5/tKvzavEUuFvo=
X-Received: by 2002:aca:b103:: with SMTP id a3mr26125595oif.14.1642504981992; 
 Tue, 18 Jan 2022 03:23:01 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org> <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
In-Reply-To: <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Jan 2022 12:22:50 +0100
Message-ID: <CAKMK7uGQ=pGHv+LcRxZqb_jV0fqzUZtd+tZCr7aatoMDF4hyvw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 10:54 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Jan 18, 2022 at 10:33:23AM +0200, Pekka Paalanen wrote:
> > On Mon, 17 Jan 2022 19:47:39 +0100
> > Sven Schnelle <svens@stackframe.org> wrote:
> >
> > > I also tested the speed on my Thinkpad X1 with Intel graphics, and there
> > > a dmesg with 919 lines one the text console took about 2s to display. In
> > > x11, i measure 22ms. This might be unfair because encoding might be
> > > different, but i cannot confirm the 'memcpy' is faster than hardware
> > > blitting' point. I think if that would be the case, no-one would care
> > > about 2D acceleration.
> >
> > I think that is an extremely unfair comparison, because a graphical
> > terminal app is not going to render every line of text streamed to it.
> > It probably renders only the final view alone if you simply run
> > 'dmesg', skipping the first 800-900 lines completely.
>
> Probably more like "render on every vblank", but yes, unlike fbcon it
> surely wouldn't render every single character sent to the terminal.
>
> Also acceleration on modern hardware is more like "compose window
> content using the 3d engine" than "use 2d blitter to scroll the window".
>
> > Maybe fbcon should do the same when presented with a flood of text,
> > but I don't know how or why it works like it works.
>
> fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
> doing it synchronously.

Yeah, and if you use the shadow fb support in drm fbdev helpers,
that's what you get. Maybe we should just make that the default, since
that would also greatly simply stuff like modesetting support for
fbdev.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
