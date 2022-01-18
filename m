Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD6492392
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3807F112A27;
	Tue, 18 Jan 2022 10:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9E4112A21
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642500847;
 bh=q9WeE4nIkI5prnRwCwlCoEZMzm5Vu8F3aRRX9wup85I=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=kgH/k0fgUR+sfgPujSr97qtwglOnKEUKTUSoRg76ufdwAZF/APGcdx9vIa2eSXML4
 HC+V8cZAKQ+jfprpH3YntF3qDk15JNauwh0grwiN9os6JZCDgedwpgFuz4wDxLOaOh
 RsuBSODvV4fZe2Mms034aWfgGNJ9o2CSX/2Msk9k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.155.155]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lcJ-1n9UNw2bdD-000xTZ; Tue, 18
 Jan 2022 11:14:07 +0100
Message-ID: <ffef1042-e1af-d5b5-b140-ae24fcc1855b@gmx.de>
Date: Tue, 18 Jan 2022 11:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <ebe9c076-e2a9-0cb7-eb6a-ae71c075975e@gmx.de>
 <20220118091615.3ih5n7vhd6tgmnku@sirius.home.kraxel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220118091615.3ih5n7vhd6tgmnku@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GSa5Cuwffr03edaVa0sJSU9YmqnXcHnWJIo9Ct+Ij/irNGRZHOQ
 x9iouiO+a8hYt5WQoc46evDp9gebCfSWQwXISLFU0xTkDDqpwnZ1njRykOejpKWcnRmjV8m
 77sippyRY+i6o2mdu4Sv51buqcd0gDGbvi3lYHEBaCn3x4J8/1CQX7SKM6eS1LMOl1FB9+x
 ziz/DNQ+7TRiJldahe2QA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZcWvDr5nQG0=:hXj3r+EYoT1FLW3XVX1xee
 wmrFQX+Eubm79xJAn5dZelAxnVm3TQ46yC5misZfEnDb16jpVhrQWMJYBOBvxWE8Bykq3Uezt
 ZHuL2K9VitLiQpu5Ydz4vZAJ1BfaiZBYC8wcnCCQ2wMk12IWXl2uuJgdoWjQpHrLvXQMuZ8Dq
 ltofp0ZYpkpeck6XDoKj4I61/gq97IXthQ9G+aQHPXov1FaI3vIcPPGeXth6iu9dKUQRUjfkv
 v9XHCfHVFWVn/5tczHCHTurJeL3lofzsbJjGmkdTkwDN5Uqt77wpU9s3JB6m6yznfpSMVOCOu
 IKhKYVVpIN4y4uTfdmEKoTGudc7o/lgrGbKu0Cxx+KGMmzaK8iD99U5tPXdY65KvBb6M3YWa3
 mgWJoSKfN13LT1ygBKG+U6f5P70Uy9OJNut66tS/hDoyTMx93aYzr1JZkWlrOpEsaVVD340tr
 Dm7nqEAXUJP4TFqZ2BSsA7W8Nk3bUQjJY6Wy0LuCsktYYKpkgnub5o2QIdpCWQM64zbIY8w5q
 ROQxbWwgdA8mkGn5U3WN+QeDpSay+HN1UBMGpSXlWLbE2DSf5To7aNY0gh9JH/uXUEgvTEvy9
 3OEnzmxoRJXQZn9g2ioUMKVXxcIEwG0gq7z+aLR6d++6o/fmJbS6P13UdC4tiBuGTPrS72hzT
 SQd0rh1lFNxxvxYxJkA2peVXCLb5wGAF/uUHB5I95oBt0Rknq0VaU0lEms3oEuXFOpUATbPIA
 ulRthweN18ZJVXkn8JLdWLO/qV/ttxRS+fkt95VGiUfUSEheLMLGspNrE2cTZfQfB88dYWQFn
 MI3fxHpb3ODd8/bd6YF58z+40UTuU4DfsgT8UdaUHwG2Fn0Sp4J5Ue4jd5pN/egKGR6iagvaY
 h+m2JV0rnXXrSPIw3U+TDBZivJ2v6f9rhlIs4KFdTXI0H0KU2XP9CZe0YaJT7Fts/be0rFXWO
 mlL3qJewwlBydy9C8/R6zFRg3OYt/hK4GvHUaP4UMO9B76YPNb028Gc6iJrAu3GvUhDhrgqxd
 OT54HTfwxKmPY3L4X8UL48dMDiACrMhMEL3/EGBEAYHBasN3+KqEzZ/G3UlbnZCrXD4s7f6jp
 F3Y9GeGLF1qBHw=
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

On 1/18/22 10:16, Gerd Hoffmann wrote:
> On Tue, Jan 18, 2022 at 09:20:43AM +0100, Helge Deller wrote:
>> On 1/18/22 07:29, Gerd Hoffmann wrote:
>>>> Please correct me if I'm wrong, but text-console emulation/scrolling =
on DRM is
>>>> currently unaccelerated and bound to Truecolour modes only,
>>>
>>> Yes.  Adding support for formats beside argb8888 to the drm fbcon
>>> emulation shouldn't be that much of a problem though.
>>
>> Really? Assuming a graphic card which runs with only 256 colors framebu=
ffer
>> is easily supported by DRM, and you can use fbcon without using lots of=
 memcpy()?
>
> Driver: programming a fixed color cube palette, then use RGB332.
>
> fbcon/fbdev emulation: RGB332 support must be added I think.  But both
> argb888 and rgb565 are supported today, so it should not be hard to find
> the places where you have to add some code to handle RGB332 too.

I'd expect that that framework is provided by DRM developers if there is t=
he wish
to get rid of old fbdev and transition existing drivers over to use DRM.

>>> Acceleration is harder.  The scroll acceleration had issues nobody
>>> addressed for years, and on modern hardware it is simply not used, whi=
ch
>>> is probably the reason nobody stepped up fixing things and it ended up
>>> being dropped.
>>
>> The DRM layer doesn't use scroll acceleration.
>> More than 30 other existing fbdev drivers use it.
>
> Yes.  The world shifted from 2d acceleration to 3d acceleration.  Modern
> hardware simply has no classic blitter any more.  Which is a problem
> when it comes to keeping scroll acceleration alive, it is already a very
> niche use case and it will only become worse ...

For me it's Ok that the DRM drivers don't use 2d acceleration (as it is to=
day
with the arguments mentioned multiple times).
But the patches broke existing fbdev acceleration which is available by
the fbdev drivers. That's a big regression from point of fbdev.

>>> Bringing it back is much more work than just reverting the commits rem=
oving it.
>>
>> Reverting those commits have no effect on DRM's usage of fbcon.
>> But reverting those commits bring back scroll acceleration for all othe=
rs.
>> I'm trying to find out which patches did apparently fixed such issues
>> for the REDRAW case. If you have a pointer it would be helpful.
>
> IIRC the code had a bunch of races and syzkaller flagged problems.
> I didn't follow very closely though.

That's sad.
Nevertheless I wonder if the changes which were apparently done for
the SCROLL_REDRAW case (on the higher level?) didn't also fixed the issues
for SCROLL_MOVE.

Helge
