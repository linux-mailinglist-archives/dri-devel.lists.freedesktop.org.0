Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA3F48EFE1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 19:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F9F10E1A9;
	Fri, 14 Jan 2022 18:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B29010E1AF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 18:31:22 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id o1so18440698uap.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ia/9q2E3tSjqPvHPFubkiPIGbF6QBSNFRiW9j/QalMo=;
 b=lCPIwVksDTeRllAeXhHL88qlRfc2u0XNPJ/zrpzSeDRTY+r5rrc7LU4c2K9WXDODRH
 Cv7SWQJDxNAkEBOhtF2dbx7wBm/K/z8CEa7a+86LytAmxc3WX+K0IIXFdRKEjRn7O9Pj
 mi8aT3dM4G9xkSH+4t32YLczYNM1jEho8vVBxfDT0b81TgNCl2SZbpmvaQELaHK4y9EL
 txvs9MOJpiO7UIHX88JZEsvREoR/iedEJ5BdiYBO0WUxD3OJCONj2k/KfoDQLHC7N44/
 dxf+b8ifX+j44guIAGEcVW5rng1ExwUX0iuWT1W0/cxrZld7Rzco9mZy5bMVx4EgERPt
 m2mA==
X-Gm-Message-State: AOAM530b3SiYTjc8b766+0p+SnsIwX7Lf965yY4970J6Da31FXVYS04L
 lxXrivnZl+oSzW1zCRZ4bhNqwTP5WZv3uoA5
X-Google-Smtp-Source: ABdhPJyyzm8s12EDnBaHCDLV0U2RuDAIogA6tiw1jViPzrzC99we1+TL8MtFj/Kbhn4BmFJbqbvlkg==
X-Received: by 2002:a67:c116:: with SMTP id d22mr1897605vsj.58.1642185081335; 
 Fri, 14 Jan 2022 10:31:21 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id b14sm2147068vkk.22.2022.01.14.10.31.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 10:31:20 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id w206so6345946vkd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:31:20 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr4877434vka.0.1642185080729;
 Fri, 14 Jan 2022 10:31:20 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
In-Reply-To: <YeG8ydoJNWWkGrTb@ls3530>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 19:31:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNzDb--Ud1DzGyoqWsgFU9m8YZ6fa1TqfBWtg4pkd==A@mail.gmail.com>
Message-ID: <CAMuHMdWNzDb--Ud1DzGyoqWsgFU9m8YZ6fa1TqfBWtg4pkd==A@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Fri, Jan 14, 2022 at 7:12 PM Helge Deller <deller@gmx.de> wrote:
> The fbdev layer is orphaned, but seems to need some care.
> So I'd like to step up as new maintainer.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

Thanks a lot!

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
