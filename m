Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF324F08FF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 13:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7330410E34B;
	Sun,  3 Apr 2022 11:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20BF10E34B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 11:26:48 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m18so6015228plx.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Apr 2022 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=w946qE0oQH/JSOUDxHYnc0efzfxX52cZ8EHkHFTQNtk=;
 b=M+a73MH+LPWMXhGw+dLIXhDOdtcORrqMDDQPd/bgKLa3zoaQY8AoxSPatxzTmmm15e
 N7O9NMKfdZ4pAI2XjbFxp9OpLwJ7YZP2nexhFufuKuEeOlcpYLFArW0J/tptzYnNePKC
 Gk2pwmjOee7INC7mIYeWPJnx1nKwjpelehAoZ0GTPIyksIw9/On1/vT8W4nPXFtAHM6d
 UkaCdarpCl5/fAdEJrzXdLyTJNFDp1LnSBprO/OKwQwtue5Um09zUX82h8zaOOTPzkCF
 zSTr1SY5L3pEMjsqTVmRfDObWpOFc9KU2TIvPeXENp2Y8mij/8mbQiMBeZwnVJxc+upf
 IpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=w946qE0oQH/JSOUDxHYnc0efzfxX52cZ8EHkHFTQNtk=;
 b=efQhmu7il8x4WmNw2hL0hv7NKOXXWKDQQ4V6FXrqNhJaaGveProfDYVQTTt8wtsVEe
 Wo7gQUhRNjMJ2Rx1wFSisZl8iS+5dTXvbhu/JtFxHxlaAt/Xp767PdE9QFNQXFKMig9/
 Qon1uaVCjju69SXB9DYOzOqsPvptSZTlCfi4qBqAST9NPI9GLQPAtGqjWeaaoiSp/4KE
 eLyqWf3haXcBhsz8GD3ngxxDDLvKMZzoyKIkqPGlsrRLG//R+JTNe3FDEt/w3dp9g0zU
 AEtvcKUFzJ1CQ9xZw5yFW6YjMFpK8l4yTPrhQo4nFCrNE8szWfCINYPv9ZUU9Ip4G8jx
 OiWA==
X-Gm-Message-State: AOAM531BCoKjxzaf5hmzvCgOYbuyjW0fEUWQI4BbT5PS52slgWv7j8kW
 J9XCHbhuiVcVyHJOZmjfslQvdYh1dE6j5j+RGQ==
X-Google-Smtp-Source: ABdhPJyKhMnUsGGr2FVgnJfzn4AH4IfTZsV9IODqKnEoD5mnKikZE4A2rLCVLWl+QON/FOZ3lm39ocRw5F1TIm0DU/A=
X-Received: by 2002:a17:90b:1803:b0:1c7:24c4:ab52 with SMTP id
 lw3-20020a17090b180300b001c724c4ab52mr20657309pjb.240.1648985208390; Sun, 03
 Apr 2022 04:26:48 -0700 (PDT)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sun, 3 Apr 2022 19:26:36 +0800
Message-ID: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
Subject: =?UTF-8?B?W0JVR10gZmJkZXY6IGk3NDBmYjogRGl2aWRlIGVycm9yIHdoZW4g4oCYdmFyLT5waXhjbA==?=
 =?UTF-8?B?b2Nr4oCZIGlzIHplcm8=?=
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
Cc: linux-fbdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I found a bug in the function i740fb_set_par().

When the user calls the ioctl system call without setting the value to
'var->pixclock', the driver will throw a divide error.

This bug occurs because the driver uses the value of 'var->pixclock'
without checking it, as the following code snippet show:

if ((1000000 / var->pixclock) > DACSPEED8) {
     dev_err(info->device, "requested pixclock %i MHz out of range
(max. %i MHz at 8bpp)\n",
         1000000 / var->pixclock, DACSPEED8);
    return -EINVAL;x
}

We can fix this by checking the value of 'var->pixclock' in the
function i740fb_check_var() similar to commit
b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest
supported value when this field is zero.
I have no idea about which solution is better.

The following log reveals it:

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:444 [inline]
RIP: 0010:i740fb_set_par+0x272f/0x3bb0 drivers/video/fbdev/i740fb.c:739
Call Trace:
 <TASK>
 fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1036
 do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1112
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1191
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]

Regards,
Zheyu Ma
