Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7273A494A52
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 10:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670810E3F5;
	Thu, 20 Jan 2022 09:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D43B10E3DA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 09:06:16 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id m57so3160115vkf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 01:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hW9NoHGAjAtGmLgUFLCO4iu8bgqOUYOgRPSBz28dQI=;
 b=uMx5iH38/nNq6nvVy9Ty28SiGL4CcgtQeHOSCu8RoejYxcLb2mX2TrXId9e15fp3VZ
 vFp29nkCt3h9eAngDpyQPnR0rVLrMHrH5hqTTwQS0FvMmNqxgeO81IQDNeJ/oSd5hGwz
 JgD2lQi4it9ih5kd2k6lQKy4OcaYpkzEFohiV87+XYQ8MjbZakrs0totatZFwNANXoBj
 JcV8ak5DQYSnhwCbeJ4RxdQsLM54YqqMi9ng1oXLY7oub5ZOT197CCxDypuVwgmfq4iO
 VTWjyJUUwscsvL6Ha5/bx55AOJgg8CLMJUBZEuE6hzQ8UcVD+KAK0MD6LGddMDKTIGyQ
 MSDA==
X-Gm-Message-State: AOAM5326W2wqlf9NNIkk31ozzkEKnIJVryDaQvUPF0orvqOESp54W9un
 0nfShErSFX60Fvvi9amoAja3kaa3nwzx8Q==
X-Google-Smtp-Source: ABdhPJyR9o8IQ6c5nWdfXiFFKG2EczeNi0+1+AEJWqpXV9716qLqudWUW3gZoN9sM7TmLgBL0B1C5A==
X-Received: by 2002:a1f:c4c7:: with SMTP id u190mr14527479vkf.0.1642669574411; 
 Thu, 20 Jan 2022 01:06:14 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id l187sm444234vke.6.2022.01.20.01.06.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 01:06:14 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id 2so9536592uax.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 01:06:13 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr13566234vsu.5.1642669573470; 
 Thu, 20 Jan 2022 01:06:13 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org> <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
In-Reply-To: <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jan 2022 10:06:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
Message-ID: <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

On Thu, Jan 20, 2022 at 4:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
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

Hopefully only the parts of the screen which need a redraw?

Not all displays can be updated that fast. For a "modern" example, see
https://patchwork.freedesktop.org/series/93070/.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
