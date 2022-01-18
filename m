Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388FD4923FB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3758410EF88;
	Tue, 18 Jan 2022 10:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5D110EF88
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642502731;
 bh=JW+QcUwSTe/qvoccvRFDM6uCr/IeefTcWJCBZIb73JE=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=FUoqr2g6SrdxgbR7s3ZBQzgB6sf5/IzzwT+GDFZBQPHyfBcjzHzRbEwEzMKAhnT4M
 pXZAH9qJYjA53LMfM5wG4P2aICpoxOeK9PAiKq7Am7HlpfCUKhWMNcgQ6uGvM1fgaN
 MbtZ/oV0MDQ8ah9iW0mAWS9rph88+IHgV6ltWy88=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.155.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zBb-1mEFXF39ON-0154Gr; Tue, 18
 Jan 2022 11:45:30 +0100
Message-ID: <c2526855-233e-c785-ddca-e89c79ca9676@gmx.de>
Date: Tue, 18 Jan 2022 11:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
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
 <ffef1042-e1af-d5b5-b140-ae24fcc1855b@gmx.de>
In-Reply-To: <ffef1042-e1af-d5b5-b140-ae24fcc1855b@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lmGpmKheriWIpGTC9y29Op8mC39RE4Ab6zzfHl/6o98L6WwynYR
 6NhK0wilkiCZsfmY5AWLyEJK9Lghxg5Zja6JIpAExEb+wWiIC+fvJnLTfDG2u/+cDFHUPl+
 oDLW0D58BnAwNvS85SrQc1Eh3cdbwyFcpoKE9X8yvJ6GcxwbWjuUHOw3ZhauRyPDJZsptAd
 OHXGO4NEsQm1qxmdUNNag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TGVFCWwRQW4=:p6xqOSVgld85oN8cqabdFQ
 zaPoklAxiGlRmy414zJsMaZwHZVX3od/N4qo1Ykk6WpM2AckbND/X0q/oq0tuqYyTn8dfbfMY
 1+QJEy+3LjPV9ywyXE5IW0dZDGEaFv3S3rHkV77h9n6BoSfz24DQ7mi7nZUUbqAAgPGRQrYxY
 qS0PSCUapyBn9LG8CzVgXhLFrbOMJ0Iy9qx4zFYSi5zL0GbpdG5JH9AgIcsif0DSD/vvycr7T
 hLoI9/vU5X2f6+O2h4pCTza96hrh8wuvLlukaABJR9Fg1P48Bj+hC22AMrygKGhWt8x64A4o6
 sgzrmBbx125qMqjfHO0EKknQN5WZ1gOK4BChkqOr9yPVrblA8XeFBpWVPfSkJE/G+gzKvWKiq
 XBY7/inRtZh3JE06MtxgRqjwolepbxkeFrqDyrGFhOKuj59J/UC61pFpeqY36C3xver9/RgL4
 uQcJPRrvm32WBlNakUPhkE1NyzblQH4+1+lkJJ4LwYlf0Ftopt1LQrQb/pe2GbC+tTs6x4aKT
 2lFP5l3Cr/abjHdiJbhr1bQ/+k1bqO/Na1OuIVQOjAWf9HOE7WyxyvczTxUczSQKBQG/5ieuL
 tDTl3NLlK5dFsiz+/h2x//8qQ7f9VnvqM7aLHnF1eZrAB5iYnold00pRzkEouSre0/Rhd7xV/
 z6ssIUGOnbF7+OKRXy+d1kAbgWd7oS/KuRV20VkFD7uaOq0R4Up7n8kPUrF9wwgQcgW6e98xq
 OeKRPLyDNgAMKyY4peT7PX2WKDaol8cOULTtknDHZu7EMNlFaSlCC6tul1ZyQcQmM4ek2rXTJ
 N3FgtLMg1p7yN2258fGAHnG+riSUAv0P0pRsfF/nE/bTkyOobXKszbUQ9ms19769ObLFVNDOk
 QZM2dGZ56IpDizCbRI1HKa2dN/oolD98rd9FgEzNJ8lIAaQ1CaphDayrPMw5YPcXPorJQ2l8Y
 RMcR1QB/vLKql6cfhNK9OERGZhrjxngmWlLViVQboY8W0sTwmnIreQdnManOLntKNSnGj41rR
 Z1FLsarFU3XIEU7UHjHxmtPg4wITvUfdrsDwb5YzC7Rvn573J8kFhF0jJnvZEDtoGzy2Ugmfl
 2FMGI/43j5SOy8=
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

On 1/18/22 11:13, Helge Deller wrote:
> On 1/18/22 10:16, Gerd Hoffmann wrote:
>> On Tue, Jan 18, 2022 at 09:20:43AM +0100, Helge Deller wrote:
>>> On 1/18/22 07:29, Gerd Hoffmann wrote:
>>>>> Please correct me if I'm wrong, but text-console emulation/scrolling=
 on DRM is
>>>>> currently unaccelerated and bound to Truecolour modes only,
>>>>
>>>> Yes.  Adding support for formats beside argb8888 to the drm fbcon
>>>> emulation shouldn't be that much of a problem though.
>>>
>>> Really? Assuming a graphic card which runs with only 256 colors frameb=
uffer
>>> is easily supported by DRM, and you can use fbcon without using lots o=
f memcpy()?
>>
>> Driver: programming a fixed color cube palette, then use RGB332.
>>
>> fbcon/fbdev emulation: RGB332 support must be added I think.  But both
>> argb888 and rgb565 are supported today, so it should not be hard to fin=
d
>> the places where you have to add some code to handle RGB332 too.
>
> I'd expect that that framework is provided by DRM developers if there is=
 the wish
> to get rid of old fbdev and transition existing drivers over to use DRM.
>
>>>> Acceleration is harder.  The scroll acceleration had issues nobody
>>>> addressed for years, and on modern hardware it is simply not used, wh=
ich
>>>> is probably the reason nobody stepped up fixing things and it ended u=
p
>>>> being dropped.
>>>
>>> The DRM layer doesn't use scroll acceleration.
>>> More than 30 other existing fbdev drivers use it.
>>
>> Yes.  The world shifted from 2d acceleration to 3d acceleration.  Moder=
n
>> hardware simply has no classic blitter any more.  Which is a problem
>> when it comes to keeping scroll acceleration alive, it is already a ver=
y
>> niche use case and it will only become worse ...
>
> For me it's Ok that the DRM drivers don't use 2d acceleration (as it is =
today
> with the arguments mentioned multiple times).
> But the patches broke existing fbdev acceleration which is available by
> the fbdev drivers. That's a big regression from point of fbdev.
>
>>>> Bringing it back is much more work than just reverting the commits re=
moving it.
>>>
>>> Reverting those commits have no effect on DRM's usage of fbcon.
>>> But reverting those commits bring back scroll acceleration for all oth=
ers.
>>> I'm trying to find out which patches did apparently fixed such issues
>>> for the REDRAW case. If you have a pointer it would be helpful.
>>
>> IIRC the code had a bunch of races and syzkaller flagged problems.
>> I didn't follow very closely though.
>
> That's sad.
> Nevertheless I wonder if the changes which were apparently done for
> the SCROLL_REDRAW case (on the higher level?) didn't also fixed the issu=
es
> for SCROLL_MOVE.

I've just looked through all patches in drivers/video which were tagged
with syzbot or syzkaller back to year 2005. The vast majority fixed the
reported issues on a higher level, e.g. when screen is to be resized,
or when font size is to be changed. The few ones which touched driver
code fixed a real driver bug, e.g. by adding a check.

NONE of those patches touched either the SCROLL_MOVE or the SCROLL_REDRAW =
case.
That means, I see no reason why SCROLL_MOVE had to be ripped-out and just
SCROLL_REDRAW had to be used instead, other than simply "it's not being
used by DRM, so let's pull it out".
The patches which removed SCROLL_MOVE support simply ignored the fact
that SCROLL_MOVE is still heavily used by fbdev (non-DRM).

I don't see a reason why the two patches which removed SCROLL_MOVE
shouldn't be reverted. Or what am I missing?

Helge
