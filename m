Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 303544910EB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 21:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD0410EFB5;
	Mon, 17 Jan 2022 20:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391F610EF4D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642450689;
 bh=KCY8X2y2Vnk71ilSMMSCpiULMPeoSQ28Wxj5Cc45cVA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KW2UfH9xCVNwyBe/5BSqSaHxgQUrC6LgyRng8YoryXjuxvVmhQNvMoNoTrouoD7L5
 L0JfJna7ioSsZMqZqwmNeZXzhuo/p27cnz3avEkENtru6kiJxxd2I1Yz78NCXx5sOb
 TB0XiHfqxiu+cF3neojmVNwKOePuM8STsGpijNYw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCK6-1mvCT63Z3c-00NEII; Mon, 17
 Jan 2022 21:18:08 +0100
Message-ID: <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
Date: Mon, 17 Jan 2022 21:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2RXldoJ1Jt10As/nLASf/6Yb4wGfmMbg62AH4oKNO4dup/n8ErT
 Q6ybpEaOL44rz7KK4PYJHSg1qPtP/AA5xwkEIOOfv8Ua3+18/FlY0hRMtlSIDwgUSUdxPC3
 +S0FVQkQNSwLeI6RAT49E8T9Rm4RHBiALlZc/ZVKrkskMKx98Yvd+bnEj8VKLAggojWXdKZ
 Ig2WZCYUMB0fBafcVAASg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lADmUlNvY0w=:JUW1XobJcedqZV8XakPpb8
 OmMfJPjR+nD3POVYV8BQVpuqBkESti3S/bGgmXz9CvRXPJz5f+e5CESenn5EDkgu6yTUi+79Z
 erCgPIsPJcXwmoblI7LKRj/VzsFiM8WZ4aAjrK+cUAJ+TxDDfvZ0iKZlQ0eq6zZwk8NuaGEvS
 JSfEjdGA7uN55efjFtA3wP3Y2ACC9i7idn+6rNg+smUPsOGSyNx9ZA11mDSVG521U9Wt4qJ9q
 22Yzcvi69PpPEfAZbs6AKw1Xg39NwSiVHlMV7oftt4kb9eu1AVsiovyTHlALG5XdtwPgmtNnu
 5MOPfJBSOnKDcxk1jDlsfORf/cRVtvAmbvtFRA/IRgzRtHa+vuJ7TkOAjJOMJ+BVn5VMz9z6t
 FWP3VnZAsN6CBH/9rPN5HewCxbprBRiKqCSaUpkMCvoM+DmBxlTVfCcWjx0lqMBMnqovTHjlz
 f+EcaEnUocKuaWYEnKKCIfZGH7Ef3icaZwqX0UKKeU2K5ykjwpMaBI9A2yGrv9dgLYBK6Px4d
 ZfyvvhYExJKTQIGnnGy1VD/xjZepHkb0I03iRGA+lfz0YFEqbU0QuyteyJdfVmb42JfKjLpVH
 1fEWAlvwyx3jbZtHTBsXGzb+HOaR97CTo2PEKoERPxm2FFQjmPuJll+SL6UQcV+lsaUBr8RFm
 ld59fwSCLorZbDhPYKtHR2DEIlVcfVhxLRDYBYlnxXrfqGQFqAceNqUJrisSARZjiWNjj6KHd
 7GU9ytV6xS4OEaGq645gradXK8bzIP8k6Psp7/bqnkuhPcFlMPrQI6Rn6uLyfRI8CqIVM0YWX
 7UlzfIayh//w/kG1w0pBc7jtHlgaPg/MJ0unz1ND6i5zEibRZEX1bffSLIkjREX/5WrMnt4nP
 kHty+JYCjeMMg3MAakQKVMMsYB1ftKKINEm+DoGxHeQgvI0G39ijvsL6+sNyNfqmsfYfNpZ28
 5531Tga5Olesey0ZRFVbJSYoUmVa8o4fbjW+sEuykHzXqaqVOxi7xzoJj6uiEbcIl8fgbxS7S
 /tTaqpyfCyndE5OPzmFlG/KdPQlq0fI+GQorwSfI443/SEn5KTJNcJ0mSG2k3Qx5VnwxiKTO7
 GEPLn8KOuRV/jY=
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
 Sven Schnelle <svens@stackframe.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/22 16:03, Daniel Vetter wrote:
> On Mon, Jan 17, 2022 at 3:48 PM Helge Deller <deller@gmx.de> wrote:
>>
>> On 1/17/22 15:10, Geert Uytterhoeven wrote:
>>> Hi Thomas,
>>>
>>> On Mon, Jan 17, 2022 at 2:51 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>>> Am 17.01.22 um 14:29 schrieb Geert Uytterhoeven:
>>>>> On Mon, Jan 17, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wr=
ote:
>>>>>>> b) to include new drivers (for old hardware) if they arrive (proba=
bly happens rarely but there can be).
>>>>>>>     I know of at least one driver which won't be able to support D=
RM....
>>>>>>
>>>>>> Hmm?  I seriously doubt that.  There is always the option to use a
>>>>>> shadow framebuffer, then convert from standard drm formats to whate=
ver
>>>>>> esoteric pixel format your hardware expects.
>>>>>>
>>>>>> Been there, done that.  Have a look at the cirrus driver.  The phys=
ical
>>>>>> hardware was designed in the early 90-ies, almost 30 years ago.  Th=
ese
>>>>>> days it exists in virtual form only (qemu emulates it).  Thanks to =
the
>>>>>> drm driver it runs wayland just fine even though it has a bunch of
>>>>>> constrains dictated by the hardware design.
>>>>>
>>>>> The Cirrus DRM driver supports TrueColor (RGB565/888 and ARGB8888)
>>>>> modes only.  The Cirrus fbdev driver also supports mochrome and 256
>>>>> color modes.
>>>>>
>>>>> There exist some DRM drivers that do support DRM_FORMAT_C8, but none=
 of
>>>>> the "tiny" ones do. Same for DRM_FORMAT_RGB{332,233}.  Using a shado=
w
>>>>> frame buffer to convert from truecolor to 256 colors would be doable=
,
>>>>> but would give bad results. And what about less colors?
>>>>> Adding support for e.g. DRM_FORMAT_C4 is not straight-forward, as
>>>>> the DRM core assumes in many places that a pixel is at least 1 byte,
>>>>> and would crash otherwise (yes I tried).  Other modes needed are
>>>>> DRM_FORMAT_Y4 and DRM_FORMAT_{BW,WB} (monochrome).
>>>>
>>>> We export XRGB32 from each driver, because userspace expects it. But
>>>> that is not a hard requirement. Userspace can use any format. It's ju=
st
>>>> that no one seems to have any use cases so far, so no work has been
>>>> done. Think of XRGB32 as a fallback.
>>>
>>> Using an XRGB32 intermediate would kill the user experience on old
>>> machines, due to both increased memory usage and copy overhead.
>>>
>>>> Personally, I'd much appreciate if userspace would support more of th=
e
>>>> native formats and not rely on XRGB32.
>>>
>>> Supporting monochrome, 16 colors, and 256 colors would be nice.
>>
>> From this conversation it seems DRM completely lacks backwards compatib=
ility,
>> including a missing 2D bitblt copy.
>> Isn't that all what's needed and then migrating existing drivers would
>> be easy ?
>
> Not sure who you talked to, but we have drivers with fbdev bitblt
> accel (well, in some cases had, because driver maintainers decided
> it's just not worth it and ripped it out again or never merged it).
> Also the other discussions about some low-bit formats is pretty much
> just a question of extending a few enums and wiring through the fbdev
> emulation layer.

No, you got me wrong.

I'm not talking about making other low-bit formats available to userspace.

I'm talking about running the framebuffer natively on a lower-bit format
and to speed up text emulation (fbcon) with help of on-chip 2D bitblt.
So, similiar as it was done in fbdev for non-DRM graphic cards before two
patches were applied and which disabled this speedup for *all* existing fb=
dev drivers:
b3ec8cdf457e - "fbdev: Garbage collect fbdev scrolling acceleration, part =
1 (from TODO list)"
39aead8373b3 - "fbcon: Disable accelerated scrolling"for-next-next

Esp. the commit message of patch 39aead8373b3 completely
ignored the acceleration of the fbdev drivers.

Please correct me if I'm wrong, but text-console emulation/scrolling on DR=
M is
currently unaccelerated and bound to Truecolour modes only, which is proba=
bly
one of the main reasons why most fbdev drivers can't be ported to DRM...

Helge



> So the things brought up in this thread thus far are
> actually the fairly easy items, which should take at most a handful of
> patches to rectify. There's much more nastier issues in fbdev, which
> will take serious amounts of development time to fix.
>
> Unfortunately in the past 5+ years absolutely no one stepped up with
> actual patches, which is why fbdev was marked as orphaned in
> MAINTAINERS.
> -Daniel
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
>>> to convert from truecolor to monochrome.  I guess that would work,
>>> as this is a slow e-ink display.  Have fun as a text console ;-)
>>>
>>> Gr{oetje,eeting}s,
>>>
>>>                         Geert
>>>
>>> --
>>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux=
-m68k.org
>>>
>>> In personal conversations with technical people, I call myself a hacke=
r. But
>>> when I'm talking to journalists I just say "programmer" or something l=
ike that.
>>>                                 -- Linus Torvalds
>>>
>>
>
>

