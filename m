Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9A5490AB4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877589CE1;
	Mon, 17 Jan 2022 14:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FE310E2F6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642430909;
 bh=0z5LHwE5NG6AcV/mo1P1LpHBQnyVU+bCpmzShbRlbGU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fS+Bu50tH8J6jQmtlnTIrC8aRu9PBg/h/d9G4/qwdTpXpePoYTvZNMlQEFZ4pgPvC
 VLzqu/UtNNadpMDDudUr5xUKAqtU474B9xhybWkQyuOz/ekiyKEkNqLrVM5mIoWg2w
 zhiXsT872MQgcVGi58UW4JGKEEHuVPBoU+SF8c20=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1mDA6q3GWC-015KxP; Mon, 17
 Jan 2022 15:48:28 +0100
Message-ID: <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
Date: Mon, 17 Jan 2022 15:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0IYh08vDK6QIg5wdcH+NhEdYzxVPfDL3OyfZJU3NzK8g5WMPnjY
 oX/cVPByBDrvgHTcvm5X2rmX4escCEdre5r98uIWeHzo7VTtIf73qg0b6k1wt5xA80GbFuP
 nWcJZHaH7HzleB5Ps49xB68EzA8xktko/LZeGGnVHJMlSBzOayoZJiM3hQiOvtUN+pWyboV
 33lix+6VBnZlf+fLh2PtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UH5P+eqU0rM=:VibbxS6CbIXwAAHtUnBBil
 ak0y+AouoDFlohFc1kDED8OdBWiPWQi4OxNxG91caPk365RWHdqNL+5MavZP8H02vDX8LCzGo
 MVWcVPLxXUolZJXk3I95wKmb5Z6xdctAAUaYg0cjX2mxmJlZmcgI1GKAJXYYQY0rmSJqOKHa8
 mNFZv5js/9BvtE0muCBbdHx6sPMQhiQdQrweaNXdTUXShIBkzH3q33+DOFcohFgd6PQaLFUTY
 pZAqU+hFzJaqkSo4rgIO3Kuxy0A6uSbodB+FNtgKLUV6RlLPhkkng4uPoRuC9CL1J2JmfrM9r
 YwPNNm+MZRgHcdDxq4jVW5xcIlezjODv0Ie5QWmzZDJy4E3eVK7cLshOn9BOHfKun7zCGT0FT
 69wiJkOqn4Wvk8UaKp4uQDN4CWKLLyffyKGGF6V0iZ3WyXcUIvfj1gFEeJqM1E64k0W8xfb9y
 drqIR0nbcX/bbNHNB7bxerLW58LLawcOCF6CRpTbFO9W+cHXRrDUvQXT5w78xh/vi2rIDlvFE
 hGfnCF/fsDortY0tls1paWya/2FOdDkb+Ar4O4W1ZUvrT+LbrM4xiQZD1Y0RTLXUnEB+vcILc
 qIzIQ4rATz3gMR8WdElKkza+8MWBNIazjuRD0DT/TiIVpMkdFzlBB+bJcAPd4FNoPzOvuz2Zw
 0KwJAeIM0pavx6HPvnfXrseWIWPnqd9OfnrdOyWuPkgJGu5rAEdn1lVv3Ch8scq8e/v17Lf3C
 eG69HJrIYMUwE1xLT+mrPj7zmIvrypsRrZf0SzZrIpjwFXiYFEJue5oztcwqPKTgR3JtMAJAY
 vZnHdC8pEoNoLbkxv9s8sYY2I/BVdFP7t+WzMgHfyBVtDKkr7uxQgBxL00qD6udKARD2dq5pq
 Rrte4Svx3XdA3ihPS+OpulywPNDhkCNm8+wcXGjHli5Z/CVpxWhUP13V6FyDHjwEo/22blKCw
 dwHB3B+GvfhYIDwfZMA9kCyiyxtBtsZk57OOmBTBHgdJ+xVtiZzXO7vvBXSQZlYU3uXca7P7M
 o5hUCMbMbaxrouPQ9eg0/MCpL39cfhQBMtnVd5rGFZ1Nv8Xp13veDPmQJcz0Ia+R9dIYyCCMy
 KZj6rsnDIiTTlc=
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/22 15:10, Geert Uytterhoeven wrote:
> Hi Thomas,
>
> On Mon, Jan 17, 2022 at 2:51 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>> Am 17.01.22 um 14:29 schrieb Geert Uytterhoeven:
>>> On Mon, Jan 17, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wrot=
e:
>>>>> b) to include new drivers (for old hardware) if they arrive (probabl=
y happens rarely but there can be).
>>>>>     I know of at least one driver which won't be able to support DRM=
....
>>>>
>>>> Hmm?  I seriously doubt that.  There is always the option to use a
>>>> shadow framebuffer, then convert from standard drm formats to whateve=
r
>>>> esoteric pixel format your hardware expects.
>>>>
>>>> Been there, done that.  Have a look at the cirrus driver.  The physic=
al
>>>> hardware was designed in the early 90-ies, almost 30 years ago.  Thes=
e
>>>> days it exists in virtual form only (qemu emulates it).  Thanks to th=
e
>>>> drm driver it runs wayland just fine even though it has a bunch of
>>>> constrains dictated by the hardware design.
>>>
>>> The Cirrus DRM driver supports TrueColor (RGB565/888 and ARGB8888)
>>> modes only.  The Cirrus fbdev driver also supports mochrome and 256
>>> color modes.
>>>
>>> There exist some DRM drivers that do support DRM_FORMAT_C8, but none o=
f
>>> the "tiny" ones do. Same for DRM_FORMAT_RGB{332,233}.  Using a shadow
>>> frame buffer to convert from truecolor to 256 colors would be doable,
>>> but would give bad results. And what about less colors?
>>> Adding support for e.g. DRM_FORMAT_C4 is not straight-forward, as
>>> the DRM core assumes in many places that a pixel is at least 1 byte,
>>> and would crash otherwise (yes I tried).  Other modes needed are
>>> DRM_FORMAT_Y4 and DRM_FORMAT_{BW,WB} (monochrome).
>>
>> We export XRGB32 from each driver, because userspace expects it. But
>> that is not a hard requirement. Userspace can use any format. It's just
>> that no one seems to have any use cases so far, so no work has been
>> done. Think of XRGB32 as a fallback.
>
> Using an XRGB32 intermediate would kill the user experience on old
> machines, due to both increased memory usage and copy overhead.
>
>> Personally, I'd much appreciate if userspace would support more of the
>> native formats and not rely on XRGB32.
>
> Supporting monochrome, 16 colors, and 256 colors would be nice.

=46rom this conversation it seems DRM completely lacks backwards compatibi=
lity,
including a missing 2D bitblt copy.
Isn't that all what's needed and then migrating existing drivers would
be easy ?

Helge


>>> This not only to support "old" hardware, but also modern small OLED
>>> and e-ink displays.
>>
>> There's a DRM driver for Repaper e-Ink displays. So it seems doable at
>> least.
>
> Which uses an DRM_FORMAT_XRGB8888 intermediate, and
> drm_fb_xrgb8888_to_gray8() and repaper_gray8_to_mono_reversed()
> to convert from truecolor to monochrome.  I guess that would work,
> as this is a slow e-ink display.  Have fun as a text console ;-)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org
>
> In personal conversations with technical people, I call myself a hacker.=
 But
> when I'm talking to journalists I just say "programmer" or something lik=
e that.
>                                 -- Linus Torvalds
>

