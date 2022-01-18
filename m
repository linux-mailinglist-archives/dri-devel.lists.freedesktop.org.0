Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD39492111
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9657F10E117;
	Tue, 18 Jan 2022 08:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27B010E117
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642494109;
 bh=iEnrxoLs+M+Xhm5bqXFfPM9bJaACNANweZulGOVxe2s=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=it/n+Bu20A+rDNDARaFFa+TClsrGy3v7xNggTzObRv2hWXBJDaiS5QWdmqVX5CnEA
 riJkhb7xVYVNa+VoRz2xhGni4zmOrFtS5R5N5C3yjt5YOONt86IfERImdTEruH1aR0
 R8PbyBV1//daa3DnuVQYelqwCjUS6UdF1TbDj69k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.155.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtfJd-1mJpgI0h8p-00v9Bg; Tue, 18
 Jan 2022 09:21:49 +0100
Message-ID: <ebe9c076-e2a9-0cb7-eb6a-ae71c075975e@gmx.de>
Date: Tue, 18 Jan 2022 09:20:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
In-Reply-To: <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:prWw9Xzsb49CRbqWjcdFLIUei76xAcWz2JUkyRqfu6+rvcGmd7o
 MpFTdhlErIj5qC+iOCYB7gLwlqvPwELibl4pUuPJK9rLPx2JJpeg+uJpUmbQUwDNbXZ5dNc
 svt0Q1GTrGyNf7GrJCs5/9KQYDG41yqUF0RUd4crRs8DSoJ2gMW5AsMSFGR0Rrs27+kfAWN
 rB88KhNOGtfKEk7RAh8QA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CprwXkI8ZOI=:TgwiIbvFKPZjAL3KebNfYh
 3KExnKEjR0oUcn7JWXiFZ+6gda2EkX20oih1TkXpdKQWCgyK/gFNWNVJrVUi97x7wlHCPKECn
 vz2nO6Ee8htWmtmAbyJOJnZ9o9gy3YkekEbOuiFayEAjerZy+QT2pWhqiHo0Im8n73H9Q+rTN
 xT6ZvDFJQi2cCpeUEkiro4ekhWlEtMGueN7ILWjFD0Ydgu0WfjIcI13nXzGUNqAN1wObOPXEe
 kcfLBMrpiCBBB1i1ISNdgYyLNP74MwhikRDkfLev16OM6FcCp0qX4StpSKEEzTeQ98qDN0skn
 u2gdNo2MyxWayMFrVzvvPysykU90bRPZjWcmqRCJCbiIaZKh98kU84CfdG2iP6LIpPnWzxHR5
 KDunMMUm32ZAw+szYFtDnwAatJFRYA8CRuGJ76fsFvK+aYMrYrD0Q15MxyqJ5kb+2JkaMu070
 LtdfjVZwr/CGCGYFea2xDHHiQPL4LTt5Nr6cAMz0XCV69rxRkhplrggGGpjWo1TA/xUhSix+W
 aj632CRP/F4NL1v19yYP3gO2FZ7+4OWL6Ds6pEqhyKXVMfBSc+QP4x43Xv3vFCSbKwTdkzCHA
 nRQ4pJ/Hp9c2BgXPtK7hJAdzznCweiktAeUjZvmbt6kIbKsTg7FypagkCwI6Ny6CsxeVIlyXw
 1OUCzQIns+TKzvJqMqQ+P/NaHgn3uz8wwAz83kr9xFoPL8eLB+xIbBDOUKkaIKwAyxPfzkFtV
 XFIHGtOOQpk4R6V3nZK3nrP9COyyN2tWnfCDGvSF32Fu2biWIz1+cnOzyVtXE5/yeCpIP8i5v
 4yuyeAxu7Thkkztc6tPHpIKkSzqULxzUxtqViFsN7+x9OLez7PgRLZeYR0+MAWGWz/iVv+Niw
 DXN+DoAGOay3BQolOA6THzysTCrFNZbkoNQO6oZd8cIvw0v7S9eGT13DXfXRvJQUzRn4LRW6Y
 DOVVjjSXrrqfbQAjdlF7KZr1wyiwB/SdxcsbCk41Qc9T6FHYZLq/ZqRM+LiKcsUVYbMKe3ZD2
 12to/9cUh3FqkyrpuLn3IIXdMDR+ox9JxP/A8zWPxmCbjYdi7ZfX0D2zhb0EwPKpUXPnbMz1X
 ABrSsl1epg843o=
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/22 07:29, Gerd Hoffmann wrote:
>> Please correct me if I'm wrong, but text-console emulation/scrolling on=
 DRM is
>> currently unaccelerated and bound to Truecolour modes only,
>
> Yes.  Adding support for formats beside argb8888 to the drm fbcon
> emulation shouldn't be that much of a problem though.

Really? Assuming a graphic card which runs with only 256 colors framebuffe=
r
is easily supported by DRM, and you can use fbcon without using lots of me=
mcpy()?

> Acceleration is harder.  The scroll acceleration had issues nobody
> addressed for years, and on modern hardware it is simply not used, which
> is probably the reason nobody stepped up fixing things and it ended up
> being dropped.

The DRM layer doesn't use scroll acceleration.
More than 30 other existing fbdev drivers use it.

> Bringing it back is much more work than just reverting the commits remov=
ing it.

Reverting those commits have no effect on DRM's usage of fbcon.
But reverting those commits bring back scroll acceleration for all others.
I'm trying to find out which patches did apparently fixed such issues
for the REDRAW case. If you have a pointer it would be helpful.

> Also note that using a shadow framebuffer allows to decouple fbcon
> updates and scanout framebuffer updates.  Can be used to speed up
> things without depending on the 2d blitter.

Not on older hardware.

Helge
