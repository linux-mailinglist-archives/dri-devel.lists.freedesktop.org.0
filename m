Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5953490880
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 13:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D3C10E255;
	Mon, 17 Jan 2022 12:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C14610E255
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642421781;
 bh=0umTTU4XfVVX+KXxZBAd7v3zaeX2hoWPbrIx01aJkMM=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=dTam736OkShsJUDXUaKisxBZIIRwJ4/ptbwrL8lRSVSkkpHPwOHDjKOXtJSjTFFkR
 XL72Id8Yh8G5/Dhig9vZhcWYrky8E+fxWB4Q3oCvzHEPgs9EsNbETCzQdKyZrwv4sv
 x+Lbd5lT3TvJxpTnvf9Pmxa8cqEDb5gDlu6rAEe4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTRN-1mulpA1Q85-00NPv8; Mon, 17
 Jan 2022 13:16:21 +0100
Message-ID: <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
Date: Mon, 17 Jan 2022 13:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
In-Reply-To: <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D2eGrpuAUbVVzZrhjRVJ3cJjkjGmaGCwoincAiE9iwih9KDLXNU
 29l6dw5iBTUHU1WPz48pV4an0QAJy/hP2fmgokflBgIwptu2HWBmg4/2fi9/R2uPqLxtPPK
 d2WroLO/yK/49QqHe6lwRcz+KzE3QhZSDPxhY27X8aRsd2nMpNh4Hn+5uE5warHJiMrPVEs
 YYR/NhMPjBw+2kFNgZG1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+f37p3vPXP4=:wyoDRTccsWKM6CQP0NxMjQ
 tD9j8iMD2H9Qv32t0kd0TIVpEDZvC7D5vBW7+uIRf7qURHwhEoLrJ57SK2XMPqxuLzTdGl5ET
 UiN4xPP50lLaqmenQb/cw7fwaIQiXlUYA69kKVRYqz81LzYZa9yKEQNwu9D1MNstGjQn8F1kE
 DWzDX68i3LhfwXlJhEsCketjgDeZfLN+Zmb2tUY5wnBNrxtq+l5X1APKgNf97wR2H0Ju6L2Im
 T1wid4TJqXWUmx+oKu7Svm/VWD5UdDJHlJfCAawo5Q+HNiS0YPgD+c8AIaHGpvk0+LVfrqQRu
 7EZEOtlI/1TQ/Zf5wxfbVXWJzFIA85X4RFLODqbTMjep5LXS6A0xumCZ8q+aPwHwHAA5U7igd
 lGAhCjLRpNbJUbbUE3A5NvMzJJmle/9jyKeiArme6sm7WzMCo8WeM7TRmhvRqseatgTd+G2Vr
 ZSgHzMkuI5i7AcPdSzFkEGMG5Uy2hFlj8bUPL+S/OcFX1fq2/6VJiB6QdoaGZHvgpRUvMjK8s
 5zpxvI11OpqV6pjmbeadQwUwxHqaDA57emWKOYZ7yR+TVmoAQHDwl8BZt/7/ERfCChKeypNsz
 lZ0qNWV46MwQWgavaxW/TwEK6oFTPWRWKpmxtRRvk3mKuS58lGWv6M55HDV7oQjwCravf585m
 EyZwMPQZaUtlsivuk8V2tgOjLleAnjqj3a+oOX1XIAvapQlen9GdV492oHjzx22i1jIDAoKzW
 JqX6YWHb2Y/JPdKMRNCQvbav9+eEEtANUNt5PoNO7k6zVLWnVhQVbllT7RgKpPYD4xIpD/4HU
 uz4Dbj1cRyUUi5REHfKlEaMiX/bKlnrqJFGH4yH2lWiBgqBZp++DK6bSa1hurRel3gfKMLuno
 r9UviaH01J8HzQ54n2qU1JO0/iSVD8zSnOI25IJPbaOpkreO/aZwhXgLHRgFB/cgFmt2J+Fpg
 ORxGdhoYY1N/yU3fFKSWKqttM0BDLAr5tSifkts/WZE7N8dt/SXNb3LE7TkLortOTbrWbOEvc
 ye8E2R7RoG3A/tr2KZbsJycis1s6EHysWZVyoqCYM76ZbawCf9hN4FQE22UKpNnRjQ2bnwTKH
 VGJi6W/QCLr2X4=
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 1/17/22 11:02, Daniel Vetter wrote:
> Hi Helge
>
> On Fri, Jan 14, 2022 at 7:18 PM Helge Deller <deller@gmx.de> wrote:
>>
>> The fbdev layer is orphaned, but seems to need some care.
>> So I'd like to step up as new maintainer.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5d0cd537803a..ce47dbc467cc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7583,11 +7583,12 @@ W:      http://floatingpoint.sourceforge.net/em=
ulator/index.html
>>  F:     arch/x86/math-emu/
>>
>>  FRAMEBUFFER LAYER
>> -L:     dri-devel@lists.freedesktop.org
>> +M:     Helge Deller <deller@gmx.de>
>>  L:     linux-fbdev@vger.kernel.org
>> -S:     Orphan
>
> Maybe don't rush maintainer changes in over the w/e without even botheri=
ng
> to get any input from the people who've been maintaining it before.
>
> Because the status isn't entirely correct, fbdev core code and fbcon and
> all that has been maintained, but in bugfixes only mode. And there's ver=
y
> solid&important reasons to keep merging these patches through a drm tree=
,
> because that's where all the driver development happens, and hence also
> all the testing (e.g. the drm test suite has some fbdev tests - the only
> automated ones that exist to my knowledge - and we run them in CI). So
> moving that into an obscure new tree which isn't even in linux-next yet =
is
> no good at all.
>
> Now fbdev driver bugfixes is indeed practically orphaned and I very much
> welcome anyone stepping up for that, but the simplest approach there wou=
ld
> be to just get drm-misc commit rights and push the oddball bugfix in the=
re
> directly. But also if you want to do your own pull requests to Linus for
> that I don't care and there's really no interference I think, so
> whatever floats.
>
> But any code that is relevant for drm drivers really needs to go in thro=
ugh
> drm trees, nothing else makes much sense.
>
> I guess you're first action as newly minted fbdev maintainer is going to=
 be to
> clean up the confusion you just created.

Most of my machines depend on a working fbdev layer since drm isn't (and p=
robably
-due to technical requirements of DRM- won't be) available for those.
So, since the fbdev drivers were marked orphaned, I decided to step up as =
maintainer.

I see your point that at least the fbdev core code and fbcon are shared be=
tween DRM and fbdev.
For me it's really not important to drive any patches through a seperate t=
ree, so
I'd be happy to join the drm-misc tree if you feel it's necessary. (By the=
 way,
adding my tree to for-next was on my todo list...)

What's important for me though is, to keep fbdev actively maintained, whic=
h means:
a) to get fixes which were posted to fbdev mailing list applied if they ar=
e useful & correct,
b) to include new drivers (for old hardware) if they arrive (probably happ=
ens rarely but there can be).
   I know of at least one driver which won't be able to support DRM....
   Of course, if the hardware is capable to support DRM, it should be writ=
ten for DRM and not applied for fbdev.
c) reintroduce the state where fbcon is fast on fbdev. This is important f=
or non-DRM machines,
   either when run on native hardware or in an emulator.
d) not break DRM development

Especially regarding c) I complained in [1] and got no feedback. I really =
would like to
understand where the actual problems were and what's necessary to fix them=
.

Helge

[1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de
