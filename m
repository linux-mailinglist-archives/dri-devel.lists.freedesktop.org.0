Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D239490C0C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 17:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C378E10EAB7;
	Mon, 17 Jan 2022 16:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF4810EAB7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642435587;
 bh=s5BIBuSXS7UxV06lWqKoBfQTCsNxGaUxkMitDZfBz9U=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=hrniWZGE+BsmDagjivRek4WFwVYPKilvlnJ1lzpC3gAdOx9sFfjiNdq2jeagck7uc
 iHbp88+x6rvhwoSeJCb9s/u62Um6dt844fHSdYMyVt1Flg/okPkwh4j/FzKd9A6bCg
 aQEuhkgpf1myePB5kgq5mLFk9be7l/BWeT1R5gIQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1mf5iy3dXG-00eOrF; Mon, 17
 Jan 2022 17:06:26 +0100
Message-ID: <669792cd-9899-980a-04b1-4ff64886b751@gmx.de>
Date: Mon, 17 Jan 2022 17:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <faa46e76-d38c-f436-d005-ce69915033fb@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <faa46e76-d38c-f436-d005-ce69915033fb@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZW2m36RD2bEb4hSnYRTY1+FAWG6uOcoJ3sYwXhAVazg96rrtGSL
 utdB9MSWGPPp1VJzhrRkYpTqxqHevQB29c39eXmh7A+lTvJZGHPlXC3qsILj1KNVIpF/Grz
 JqaMFa/iHQHjb86Zo8V1r//lXg3TAOANEqiraHnB+/7lJAaPsNWdl0UocvHmRgcBuk2t414
 EcT0rmXNmEnSwlr/FfdIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NUlVH8f4SYE=:gGcTH/ICXvEUgsOIfGcJ7c
 bs1UF2IahUFvlpW8tB1nVz/2MfNmWiT2wWihsiypKa/zn1dWfcDYKi41YpEP8uVEiyGSQIWKg
 1pV0NTWHSXPEo0A8wkP63wu9l7grwPN8zK112rpVBAejK+2A8+gf2pHhLDvdMRCdYxEVM4yKt
 /cfGmn4trlF1BDKOsWxCJ4hVyN6AWo/16KpksygeCVElgrGPkn3SwRaGrVnfzuHoXwK07UKQa
 hlEvCS3f9a8Zq/om3iFHH+BLOCANtvMSNcAnuctbliNdBk3BZsCldozu+yGdYEEQ3ap1FERmy
 1beq2IvkX7QmWJPZiN844fFoKYhevMX5jY9TIY4AUIJoJDqpdOqyKiyphZJxojQwXfpvzEJN8
 rYzCTMJaMWjjni34+V164fWloiubd6AOaL1s8CBR8bNGaYgDkUak7JEu7mGWgQII+miaWYKU5
 zeG1ESGoR8tUUEB7ykzcNlsCigu1HUc9r3r/MQHPBJzS9oKYL3yYWHvV654PDCf52ePn22G73
 RGz2G2d+km1QD1osoM7RPI1xVInOhwGACwXu+eKzu7fATma8XWijYdMHXsu7ORHT6+u1Af7F3
 Dvg5ZKJ3XM9ThR0i0ndpMHedMD6MHWEh8NMsNkDwG+arRGjaF5xlAAxHSC2m0nOp9AoN1py0n
 4MSOWbfxR5dlTvjBN+k2DYgPdmE6d7Q3ljsiVgAj1gp7kwYofR3Tz7tFdZPEve5xka7Ba+u8h
 pH4MS9YjRNHTZOjNsIy54UF2kb7lMdQbCGsb+fz6zSuJtgPm+42kNT2IY5jkn89ZHzkvUYGVd
 5UcNoNO+PaEVKpTlp+PbuL+t5Wh9pux358htzi+Grwrc2v5m5NsxFm3oFNoQpIMhCgV42cyS0
 ybVPmUwIGOM2YVbvC7qHZmKjnOUVnVLLkPxoeBH40i99ILbog6jVkkiW7ubgzzk1w6CxpGjKT
 RZx7Y1I4oC7uU5ZVrbRXmsiGZXznP3KCc1F+SKv51Pgnnnn7TKkq1oU77FNsQqiR8juhDp8fO
 WtAWXcXjwzrH7bMnfIEIbht+W6xENBe3hm7BNY5mpPt80GmGNypVzg7pK74J3ZbtOoUUc4phE
 DdXRLqsbOqW8aI=
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

Hi Thomas,

On 1/17/22 16:05, Thomas Zimmermann wrote:
> Hi
>
> Am 17.01.22 um 15:47 schrieb Helge Deller:
>> On 1/17/22 15:10, Geert Uytterhoeven wrote:
>> [...]
>>> Using an XRGB32 intermediate would kill the user experience on old
>>> machines, due to both increased memory usage and copy overhead.
>>>
>>>> Personally, I'd much appreciate if userspace would support more of th=
e
>>>> native formats and not rely on XRGB32.
>>>
>>> Supporting monochrome, 16 colors, and 256 colors would be nice.
>>
>> =C2=A0From this conversation it seems DRM completely lacks backwards co=
mpatibility,
>> including a missing 2D bitblt copy.
>> Isn't that all what's needed and then migrating existing drivers would
>> be easy ?
>
> What exactly do you mean by 'backwards compatibility'?

DRM to provide possibility to run (in at least a few) of the bitmap format=
s
mentioned above.

> The driver API is different, of course.

Sure.
I would think of a defined set how to activate a special graphics output.
And a function to do on-screen 2D bitblt to move contents (for usage of
fbcon emulation).

> My conversion helpers can provide a starting point to move fbdev code
> into DRM drivers.
I need to look into this.

> For fbdev 2d-bitblt ioctls,

I'm not talking about 2d bitblt "IOCTLS". I'm talking about fbcon utilizin=
g
2D graphic card bitblt to move on-screen contents to speed up a text conso=
le.
E.g. text upwards scrolling.

> you can add them to DRM drivers and set
> up DRM's fbdev emulation accordingly. Some DRM drivers do/did this.

> To my knowledge, so far there's not been a use case where that
> provides a benefit over simple memcpy.

It's a huge difference on older machines with slower busses for example.
So, for text console emulation, moving windows ... it's important.

> For fast 2d blitting from userspace, you should read Daniel's comment
> at [1]. tl;dr: a generic solution is non-trivial.
Probably. I think fbdev doesn't provide that functionality either today
(at least I think so) - so that's probably not a focus (and not relevant
regading the "backwards compatibility" I mentioned).

Helge


> Best regards
> Thomas
>
> [1] https://blog.ffwll.ch/2018/08/no-2d-in-drm.html
>
>>
>> Helge
>>
>>
>>>>> This not only to support "old" hardware, but also modern small OLED
>>>>> and e-ink displays.
>>>>
>>>> There's a DRM driver for Repaper e-Ink displays. So it seems doable a=
t
>>>> least.
>>>
>>> Which uses an DRM_FORMAT_XRGB8888 intermediate, and
>>> drm_fb_xrgb8888_to_gray8() and repaper_gray8_to_mono_reversed()
>>> to convert from truecolor to monochrome.=C2=A0 I guess that would work=
,
>>> as this is a slow e-ink display.=C2=A0 Have fun as a text console ;-)
>>>
>>> Gr{oetje,eeting}s,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Geert
>>>
>>> --
>>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux=
-m68k.org
>>>
>>> In personal conversations with technical people, I call myself a hacke=
r. But
>>> when I'm talking to journalists I just say "programmer" or something l=
ike that.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -- Linus Torvalds
>>>
>>
>

