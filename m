Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A718B490BA9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AB110E42D;
	Mon, 17 Jan 2022 15:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E0210E42D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642434186;
 bh=+TVQ+7UtVks/m9/GncR3RWLn+/OJtfPHJr9nYMoiJRM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GSI0JVZbbWFXMMmRZTFd+5sMOk1Jo9br/Giflzjlx8P2hwht8eqFMj8PKuToH6dcz
 OT41bhaFZoCG4xoi8oMaEutYlB+ohSzSsctkAroUmykNOr3jJmR96aPKBVqh2EWd46
 OpWW/Oj6QmAUFoWA13YVsHOOgKgJhRBg9Ep0+w4M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1nGdpg0yTa-007FjN; Mon, 17
 Jan 2022 16:43:06 +0100
Message-ID: <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
Date: Mon, 17 Jan 2022 16:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tfVvt5d3VZ1s/Z+29Gkdp0lLmE4BSkXR4U8/Uz9LDjTtXSYfQl8
 BVfikzp0D2U5HHoqUaCTRXmi72Tt32PLwEyA2uuoJ2BwJwKHUyfcfiMS9DFsi3pqojy9OB4
 cy7yi2Rsg10MADz4XqKWlRnn5nN4zZb+JNlRcU80YQk2T9MqGMUHHhwHtx8+Wf5hF6hrOpz
 OvruOcYgqMP1gXbe4+65w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qPR5NpcXXbY=:I8Rj0ZHtJKgKVsRntLdOei
 coJroARINzvdAi7UQfHqshCaDgD5pkCnCSGwwIiW1lnIocMt+1RuAYY3reby8R3q1tDPvT8nY
 jM0eVRMkKynnMhStgCWQ5RebFEJ19MGJJhqFjKNXSBUXF8ZQS3OfG8TSDisd41mG7fOyic+a9
 0a1u5xAYllzNH0ShcQpxBT1AVBmgXE2Y0xg3WJ1V1W5wkTPP1CJo5NJsCOlILnttv226C/grp
 mbSUN0RUf55VONtix6PSMD9byMPeKCLfhHLKh/fFfoeuGlPAlq4ek1iOQnTNgbBAhsHgPAfr5
 DC4PnDJEL52z7fmWlNmS6oMQ5gR1yP3Y1NKBNt3cXjBr7Lv4qqM4xLcQhGzEbM/EV6ea7PcTL
 3xMiyE/zeWWtfhdiH8qbEnVc8+7zPG7Y/5tG042gnIMYVmTIU8iKnk+WpofcAKOB6rXd/OIoK
 fwquo/f3syNLR2U/FRq+6hl7RZh3eGkkSoxpsJkNvxYeFIjX6qhQyBipNEDvN6uC6zdBUqq41
 TsqJTMbYvwx9J0yxeDZ6u7rDuZA7XS1Ht44pkZRqPEqK8DtXFo50awjESFnp1j+SJFagWpiEv
 Y4LtcG0i5mK5Ipt0rb8Pz4T0nP96iUfibBzrHcArfxXlgMa3/wYBcgh1rHt3X+2i6+OHgrEK7
 yiSMmUFInXQPQGxufJPMW7iU8sjrluLcYj8i2JGWrRCLQyWvWBqLmxF/stFmLYv133su7zZh4
 wBfESrZhU41z+jQ3nHY6we6+p+um9mb1FxcGG84pjD794w+Al9Ha/QtDLoHhEXVNIpEdWqSeU
 gE7NB6H33ctqYtpm3qTOUwcpqgpAOH+8YAj4RilFRqlz0wn4Zf/Lx6fug4sBTLwq12KMbppRX
 thvHjU52wgU7a1oWqkGIiMx9LNJGuLGkLYCXJVhZ4/ij5o0Z5KVME65u6U86Gj6DoXA7Ubnt+
 AMJyL4Hxe5o9Fw7Q8qtCafwrDYWdkAzMeNLtOthBmrHD1GEbEV8x0/ndzv4JxuGXarF+zwlP4
 T0rtn6TcWeKCn3pI3Dp3d+s01ox8GbLK6Vc0rd4wz3PZqATnBVVhJr8kLogDzAPlelgLRPnqv
 43378dZqwZ+Qa0=
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

On 1/17/22 16:00, Daniel Vetter wrote:
> On Mon, Jan 17, 2022 at 1:16 PM Helge Deller <deller@gmx.de> wrote:
>>
>> Hello Daniel,
>>
>> On 1/17/22 11:02, Daniel Vetter wrote:
>>> Hi Helge
>>>
>>> On Fri, Jan 14, 2022 at 7:18 PM Helge Deller <deller@gmx.de> wrote:
>>>>
>>>> The fbdev layer is orphaned, but seems to need some care.
>>>> So I'd like to step up as new maintainer.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 5d0cd537803a..ce47dbc467cc 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -7583,11 +7583,12 @@ W:      http://floatingpoint.sourceforge.net/=
emulator/index.html
>>>>  F:     arch/x86/math-emu/
>>>>
>>>>  FRAMEBUFFER LAYER
>>>> -L:     dri-devel@lists.freedesktop.org
>>>> +M:     Helge Deller <deller@gmx.de>
>>>>  L:     linux-fbdev@vger.kernel.org
>>>> -S:     Orphan
>>>
>>> Maybe don't rush maintainer changes in over the w/e without even bothe=
ring
>>> to get any input from the people who've been maintaining it before.
>>>
>>> Because the status isn't entirely correct, fbdev core code and fbcon a=
nd
>>> all that has been maintained, but in bugfixes only mode. And there's v=
ery
>>> solid&important reasons to keep merging these patches through a drm tr=
ee,
>>> because that's where all the driver development happens, and hence als=
o
>>> all the testing (e.g. the drm test suite has some fbdev tests - the on=
ly
>>> automated ones that exist to my knowledge - and we run them in CI). So
>>> moving that into an obscure new tree which isn't even in linux-next ye=
t is
>>> no good at all.
>>>
>>> Now fbdev driver bugfixes is indeed practically orphaned and I very mu=
ch
>>> welcome anyone stepping up for that, but the simplest approach there w=
ould
>>> be to just get drm-misc commit rights and push the oddball bugfix in t=
here
>>> directly. But also if you want to do your own pull requests to Linus f=
or
>>> that I don't care and there's really no interference I think, so
>>> whatever floats.
>>>
>>> But any code that is relevant for drm drivers really needs to go in th=
rough
>>> drm trees, nothing else makes much sense.
>>>
>>> I guess you're first action as newly minted fbdev maintainer is going =
to be to
>>> clean up the confusion you just created.
>>
>> Most of my machines depend on a working fbdev layer since drm isn't (an=
d probably
>> -due to technical requirements of DRM- won't be) available for those.
>> So, since the fbdev drivers were marked orphaned, I decided to step up =
as maintainer.
>>
>> I see your point that at least the fbdev core code and fbcon are shared=
 between DRM and fbdev.
>> For me it's really not important to drive any patches through a seperat=
e tree, so
>> I'd be happy to join the drm-misc tree if you feel it's necessary. (By =
the way,
>> adding my tree to for-next was on my todo list...)
>>
>> What's important for me though is, to keep fbdev actively maintained, w=
hich means:
>> a) to get fixes which were posted to fbdev mailing list applied if they=
 are useful & correct,
>
> Yeah it'd be great if we have that, for a while Bart took care of
> these, but had to step down again. drm-misc is maintained with the dim
> scrip suite, which comes with docs and bash completion and everything.
> Good starting pointer is here:
>
> https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html
>
> Process for getting commit rights is documented here:
>
> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#dr=
m-misc
>
> But there's a pile more. I think once we've set that up and got it
> going we can look at the bigger items. Some of them are fairly
> low-hanging fruit, but the past 5+ years absolutely no one bothered to
> step up and sort them out. Other problem areas in fbdev are extremely
> hard to fix properly, without only doing minimal security-fixes only
> support, so fair warning there. I think a good starting point would be
> to read the patches and discussions for some of the things you've
> reverted in your tree.
>
> Anyway I hope this gets you started, and hopefully after a minor
> detour: Welcome to dri-devel, we're happy to take any help we can get,
> there's lots to do!
>

Hello Daniel,

you somehow missed to answer my main topics below...:

>
>> b) to include new drivers (for old hardware) if they arrive (probably h=
appens rarely but there can be).
>>    I know of at least one driver which won't be able to support DRM....
>>    Of course, if the hardware is capable to support DRM, it should be w=
ritten for DRM and not applied for fbdev.
>> c) reintroduce the state where fbcon is fast on fbdev. This is importan=
t for non-DRM machines,
>>    either when run on native hardware or in an emulator.
>> d) not break DRM development
>>
>> Especially regarding c) I complained in [1] and got no feedback. I real=
ly would like to
>> understand where the actual problems were and what's necessary to fix t=
hem.
>>
>> Helge
>>
>> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.=
de
>
>
>

