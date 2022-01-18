Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B8492100
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE72112171;
	Tue, 18 Jan 2022 08:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AD6112171
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642493455;
 bh=YvKRHw1tFJN1cKyfD3xEwJGNkcxUYdcTnHvH2l+gF0M=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YJ9tUolwMDvHkCVKiMfRwGRFDqwO0+dbVgZYHjrpSknZgcX+G50liWyJcbvWjf/ua
 ntZLnAVzSVVJviKdrBrUEtyC4rjiT/hlTDHYeGFMUUpRmFuNrsqvqidnVXxHZsbq9L
 WtbrNuS+Wyyp+RyX3jU3mSZsPuPbyQgbwEcSGD8Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.155.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBDjA-1n1S7N0B8I-00CeYZ; Tue, 18
 Jan 2022 09:10:55 +0100
Message-ID: <9565ea8d-c374-5a9e-2590-bdcbec6d37bd@gmx.de>
Date: Tue, 18 Jan 2022 09:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <20220118061120.7exr5vtdwyuzhnup@sirius.home.kraxel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220118061120.7exr5vtdwyuzhnup@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UgTaROfJXqyNofTJXXCjg2j0fjMac4/tCMThylcFiyPOUV3OSYx
 Bmw+0HDc4D0P1st4nbx2vCpO1oSy3qR7VzbinU7/mKzbCaFXjHV5FgYNQMAnVoTbLkWebB8
 NtD2p9lIrH8H7UVwgo4dqmBaKEI1Q25sfaVtfYoYgrb1Fd9t8BKKYm16n2htQ/uzwe4nDOL
 yo9VzUcvWOtSKTK+/ojHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YifBO2F8olo=:cAq842N23kMH1S+4nILs6S
 0Jbhvu9zSPNH523qw6hKGInRJRk6t/zd+v8n7bXSEuO+oh//wjPNygnylFvrnWBLyWNGj1pL/
 auhxiaNS1sbA4RkWE/GSslayr2ft+TeuaAHspkiBZpfRfqmlbkx37WbvkSEHabsZP3i4wi5nz
 CzASasoCC+Q07nqmVU+wFvG5YavvIXLc+1iRCp2t8hfN2pWBgRWlES7DQr8lGcY0AyvIKjuzy
 eDbb0k+U/WN6v+cagUKC8CUfRgS190s7JwmBlvhjH5a8Wga+dfPDvSOJu9NQ+TTbFF7/aNZNR
 7OJfUNigCbO2bRHJc7ol0azYASrv9cGorhu93iqj66+nzqNVavBb+4XrM32i5Rj3yMgi16rOa
 mGQo3sF+m9x0HomCAY45diEbjgx2Wm06sU+NzYApsCf04/jPb2B4r/vvol9gzRBq8SKSVu3/f
 AcMa1WjeLKdx+JxGu18uuI1lL6qK2zUycD+20UXLVrw4X9b5UacH8gDzLbuAzG8lrqyQsnHxI
 Z5lg6ZUYlo3wqhq4ozlJFLd7KyvPJZfQtvi0+ELn6eaVFB8oTN6mDpq0SWxtwxDZMx8wXfqmp
 JG41WKnJIZ/D4sAcKiY1Z2ZGi8hDr3Zxome4U/ee1Lbi/J1yN4dMAUKknow2lnO01pgCkOUD/
 KTBlX1bs5mZRB3NxwM+Uh6KgW0LjzB1KUGbLo0oQQD25Pf0g8MvDkjMbJSgDRyMY9R7riTkE/
 YoYaDw0Ll+/zdEBlYXI5sCQpbbDPvlAXsiea/ecnQWS+eVG/l+djInP/R0bBuZVUcOECb0EUU
 mCmnKdh0D52MJxUNKzLU74dcPmGqYFwfINdOxqjceYuTprSAmR5fpukJ5jW7SR6SczWrkd/fb
 043V8nFbvHnZGMwcmBkVMh56aQZmTGsMl2FQxfjeGcNaMi4JdxwfGsy2gji6j50RQWUdlCJKr
 LFpD0KuBHB+dI8XFamOmd0MuLcRQhcwuVXrEKA6WSGGn5HcWmx9ZDVUB/ayBNHESskAJSDGav
 OWm94wv7y+xQSkWuS8Ib2ZC/TviP8peA3OB5E8SXWnFuKCDH9JqO7roB6djpL7vIeZbjPrlDI
 YV6S/K5Nc1iZBY=
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/22 07:11, Gerd Hoffmann wrote:
> On Mon, Jan 17, 2022 at 02:29:47PM +0100, Geert Uytterhoeven wrote:
>> Hi Gerd,
>>
>> On Mon, Jan 17, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote=
:
>>>> b) to include new drivers (for old hardware) if they arrive (probably=
 happens rarely but there can be).
>>>>    I know of at least one driver which won't be able to support DRM..=
..
>>>
>>> Hmm?  I seriously doubt that.  There is always the option to use a
>>> shadow framebuffer, then convert from standard drm formats to whatever
>>> esoteric pixel format your hardware expects.
>>>
>>> Been there, done that.  Have a look at the cirrus driver.  The physica=
l
>>> hardware was designed in the early 90-ies, almost 30 years ago.  These
>>> days it exists in virtual form only (qemu emulates it).  Thanks to the
>>> drm driver it runs wayland just fine even though it has a bunch of
>>> constrains dictated by the hardware design.
>>
>> The Cirrus DRM driver supports TrueColor (RGB565/888 and ARGB8888)
>> modes only.  The Cirrus fbdev driver also supports mochrome and 256
>> color modes.
>>
>> There exist some DRM drivers that do support DRM_FORMAT_C8, but none of
>> the "tiny" ones do. Same for DRM_FORMAT_RGB{332,233}.
>
> Adding that to the cirrus driver shouldn't be hard.  I'm wondering
> whenever there are any userspace apps which would actually use that
> though.

The discussion is not about userspace apps.

It's about the case, that if existing fbdev drivers should be converted to
DRM, then they are currently required to run in TrueColor. Some of those c=
ards/drivers
don't support TrueColor (which is problem #1), and even if they do, then
only with their existing 2D bitblt acceleration they are somewhat performa=
nce-wise
useable as framebuffer console (problem #2).

So, if DRM would natively support other formats, then it's not hard to
convert them to DRM.

Helge
