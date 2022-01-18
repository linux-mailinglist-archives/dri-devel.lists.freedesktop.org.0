Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C6F492255
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D631129F9;
	Tue, 18 Jan 2022 09:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161A51129F6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642497214;
 bh=BAp0jQCvf5HmoPP92JBeHGBh/7ksg8VOxpzaHHQTqGQ=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=BMGboksWm//bMHpvNNrjgpOZZdXDZdbVR34GI8EfIH3+dYTWY6D0CvwP7BMGgni0s
 LJ58MulNLAjVJEJ8OqaC2arSHZGIF+l9dCGQg/3yseQ57Ln6k04aJDTtKhd+6xamfB
 +ZZmpGZ1OacSCFc42QYbzmWzkfv10bEx7ZuonZAQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.155.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1ml7Dg2j7K-00TDTP; Tue, 18
 Jan 2022 10:13:34 +0100
Message-ID: <bf2a45c4-5f48-24e6-213f-562e59505f3d@gmx.de>
Date: Tue, 18 Jan 2022 10:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Daniel Vetter <daniel@ffwll.ch>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <4009cf14-2bb0-a63a-1936-4ac4d757777a@gmx.de>
In-Reply-To: <4009cf14-2bb0-a63a-1936-4ac4d757777a@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q5lDuSRIHbm40Rxed3xFSWxoKPpK1fBg+yIy00RPw+0buW/Qbi/
 qmUypYHZvOkNFRSb0ISYHyJ+HNU5YdpykRRkfnsfwLT/iah9Byg8FwiavPk6SL8iEvqZOC2
 YFns2rXZqmRXtdzLhZDeNiFDoMMuarVDtz/8DI3nzTyXJh2SQC9WubrXompgSnxjiCQZcZY
 Z+/w7Dja+76TzR8J6BtWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cpgKooRd0XA=:7SIKqGhDgIUj5tAcRhXnaa
 smx6PZGSaLiT8vVjomwNEhx5J2LKDGhAHYTOGiQ+flTThxd5jXtrJM54DjG9jIpASCSq3kb8z
 +qcWHsRXUgJ3na2fkQ6SN11RRQqk6sNsHOtqUJsX4vhylT4sx5GzTtW+jaAuNu7pjAXkt/iMC
 BM2Cf40G2EKOE1e9Elsg2o7Pdst+ndSg4IXvf6JHwJ2SH7t3W+yhzpKGzNQKnFjoDFC6S7i5G
 E+cXU61KUP4UpLt3oE72HmMoJ2xCk9VVfg3M+2khKSEoebCNhWh4rPU6ZmNLQLKilkx3Pa10R
 p0irMXCu7puZulB9DmITSrDkH2h9X96qZ8u/2LyllF0ANRPzi6uyBwrm0oUyWq5NJLBtg2vjL
 LOMqr3bOAz7jjj9IM5LdoDCvZEfo6WNDK26GkGm1gc55al11O8d2bsO3MCikDdbfwxUbMK+u4
 JHQw5THz0UjOoI264Ej7g5ToOg7+9/hiPDLJhm+5Xk5AdkPRInSCZz6iu6Zs+GmwKuu8s6RE1
 5TFsZuxA/USvewMzybN0tw/4nCW1WntBbG33ZLX6l7pBrepZSos4X7zzetGcD6sxBJLtwbwF2
 E2OCGit60ZM/X1zpPva4W9iMWCbsx6PzIYZXJjAI72wMKvQFRdCf7Et1LcFTC3QZwOQVTtdfb
 RMt6ygbBXeda1+I9kF9HhOuBNNLp7dz8LBnqrkIwJEaplVRvHKoPnyyEcqc6XucFOx/jYHrJ+
 mseHJ2YlH6YJDPBIcbFg8+GWb9fTHPbKoyBbTckYJ6HcmrnZUoe+t+7JMrjxyDasKiS/8Qo95
 /A/PrCfdazldej5tEAVt9C7XD4FsRutwUwG4V3y+lE8Imf+tsxz8pE42nQiXoi8rzDiuptvLM
 BlTwNG7d2uFTe//l26yN0AldDCgQHd8lAHqw98Ppvmm6OC756448hZxqbKwAaiZQbfN0jFhw9
 MWrdchnNlhoOfaMvXdJGuHxtlpx/kafZ+hF0e80+6C1aWR59079PgR2mEv8DJbK8CSxTuGECW
 th1x5YdRCHc/Yw//atOc2HVbtcne6wteoAfXr0ZkYffOVPGq8CbWymtpwcPwJ4wpjS9/tRZ0H
 WYx4cpF2YMbs6I=
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/22 09:41, Helge Deller wrote:
> Hello Daniel,
>
> On 1/17/22 16:00, Daniel Vetter wrote:
>> On Mon, Jan 17, 2022 at 1:16 PM Helge Deller <deller@gmx.de> wrote:
>>> On 1/17/22 11:02, Daniel Vetter wrote:
>>>> On Fri, Jan 14, 2022 at 7:18 PM Helge Deller <deller@gmx.de> wrote:
>>>>>
>>>>> The fbdev layer is orphaned, but seems to need some care.
>>>>> So I'd like to step up as new maintainer.
>>>>>
>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 5d0cd537803a..ce47dbc467cc 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -7583,11 +7583,12 @@ W:      http://floatingpoint.sourceforge.net=
/emulator/index.html
>>>>>  F:     arch/x86/math-emu/
>>>>>
>>>>>  FRAMEBUFFER LAYER
>>>>> -L:     dri-devel@lists.freedesktop.org
>>>>> +M:     Helge Deller <deller@gmx.de>
>>>>>  L:     linux-fbdev@vger.kernel.org
>>>>> -S:     Orphan
>>>>
>>>> Maybe don't rush maintainer changes in over the w/e without even both=
ering
>>>> to get any input from the people who've been maintaining it before.
>>>>
>>>> Because the status isn't entirely correct, fbdev core code and fbcon =
and
>>>> all that has been maintained, but in bugfixes only mode. And there's =
very
>>>> solid&important reasons to keep merging these patches through a drm t=
ree,
>>>> because that's where all the driver development happens, and hence al=
so
>>>> all the testing (e.g. the drm test suite has some fbdev tests - the o=
nly
>>>> automated ones that exist to my knowledge - and we run them in CI). S=
o
>>>> moving that into an obscure new tree which isn't even in linux-next y=
et is
>>>> no good at all.
>>>>
>>>> Now fbdev driver bugfixes is indeed practically orphaned and I very m=
uch
>>>> welcome anyone stepping up for that, but the simplest approach there =
would
>>>> be to just get drm-misc commit rights and push the oddball bugfix in =
there
>>>> directly. But also if you want to do your own pull requests to Linus =
for
>>>> that I don't care and there's really no interference I think, so
>>>> whatever floats.
>>>>
>>>> But any code that is relevant for drm drivers really needs to go in t=
hrough
>>>> drm trees, nothing else makes much sense.
>>>>
>>>> I guess you're first action as newly minted fbdev maintainer is going=
 to be to
>>>> clean up the confusion you just created.
>>>
>>> Most of my machines depend on a working fbdev layer since drm isn't (a=
nd probably
>>> -due to technical requirements of DRM- won't be) available for those.
>>> So, since the fbdev drivers were marked orphaned, I decided to step up=
 as maintainer.
>>>
>>> I see your point that at least the fbdev core code and fbcon are share=
d between DRM and fbdev.
>>> For me it's really not important to drive any patches through a sepera=
te tree, so
>>> I'd be happy to join the drm-misc tree if you feel it's necessary. (By=
 the way,
>>> adding my tree to for-next was on my todo list...)
>>>
>>> What's important for me though is, to keep fbdev actively maintained, =
which means:
>>> a) to get fixes which were posted to fbdev mailing list applied if the=
y are useful & correct,
>>
>> Yeah it'd be great if we have that, for a while Bart took care of
>> these, but had to step down again. drm-misc is maintained with the dim
>> scrip suite, which comes with docs and bash completion and everything.
>> Good starting pointer is here:
>>
>> https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html
>>
>> Process for getting commit rights is documented here:
>>
>> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#d=
rm-misc
>>
>> But there's a pile more. I think once we've set that up and got it
>> going we can look at the bigger items. Some of them are fairly
>> low-hanging fruit, but the past 5+ years absolutely no one bothered to
>> step up and sort them out. Other problem areas in fbdev are extremely
>> hard to fix properly, without only doing minimal security-fixes only
>> support, so fair warning there. I think a good starting point would be
>> to read the patches and discussions for some of the things you've
>> reverted in your tree.
>>
>> Anyway I hope this gets you started, and hopefully after a minor
>> detour: Welcome to dri-devel, we're happy to take any help we can get,
>> there's lots to do!
>
> Thanks for this info, Daniel!
>
> After reading those docs I've decided not to join dri-devel and keep
> my existing linux-fbdev tree at:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
>
> The linux-fbdev is a low-volume mailing list with mostly small bug fixes
> or enhancements for the fbdev drivers. Those patches usually don't affec=
t DRM.
>
> I'm expecting that non-trivial changes which may affect fbdev will be se=
nt to the
> linux-fbdev mailing list, same way as I will of course send any patches =
which
> might affect DRM to dri-devel.
>
> My git tree is wired up to the for-next pull chain, so in any way we wou=
ld notice
> merge conflicts (which I believe will not happen).

To make it more clear:
I'm not planning to push code to fbdev/fbcon without having discussed ever=
ything
on dri-devel. Everything which somehow would affect DRM needs to be discus=
sed on
dri-devel and then - after agreement - either pushed via the fbdev git tre=
e or
the drm-misc tree.

Helge

> Cheers,
>
> Helge
>
>>> b) to include new drivers (for old hardware) if they arrive (probably =
happens rarely but there can be).
>>>    I know of at least one driver which won't be able to support DRM...=
.
>>>    Of course, if the hardware is capable to support DRM, it should be =
written for DRM and not applied for fbdev.
>>> c) reintroduce the state where fbcon is fast on fbdev. This is importa=
nt for non-DRM machines,
>>>    either when run on native hardware or in an emulator.
>>> d) not break DRM development
>>>
>>> Especially regarding c) I complained in [1] and got no feedback. I rea=
lly would like to
>>> understand where the actual problems were and what's necessary to fix =
them.
>>>
>>> Helge
>>>
>>> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx=
.de
>>
>>
>>
>

