Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F208649217D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3301122B1;
	Tue, 18 Jan 2022 08:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6D11122B1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642495375;
 bh=SedghP5JapOAs2pJB1DLV4296xvTjJCK4XoFLMWApjo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jw3xsIhxBFYh6g8WtOp9mTKLY6qTDNjIhgPTxeRU/5tzat6rUfDf3NnY3vWjPxJe7
 k9VGvHOxwPb/iMw3NHvY6N4djbQISurV9Cyo6PsQuR2VCrPsKq731qk+ABq7sabEHK
 U+MBPZF2uRqxrhI0lis7IgezBDgnzvVgKzSpIguI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.155.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAh0-1mcsAJ2F1U-00bYa6; Tue, 18
 Jan 2022 09:42:55 +0100
Message-ID: <4009cf14-2bb0-a63a-1936-4ac4d757777a@gmx.de>
Date: Tue, 18 Jan 2022 09:41:50 +0100
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
X-Provags-ID: V03:K1:Vw5Y8Ukxx+E+/vPqCkQYPUnaTtWM1BJ50QjjdAWjvvb1RETIG8u
 hDvvDSSFPXXEMNCEnGEEDVsc5xc8DGNqBYfqRvjsRArdmqnkTRK588TuS93fIMCoYwmyP3c
 fAWFTt0qfAvOPHy3BvuQUx9SoXcS0JQPg15uIM3EcQcOjFAAo3jP9V5v0m8CSveu25G2v1h
 oSNDgsqSz6Iv1o0gy1grA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W8m+MGP2rXo=:dHowt1gesn8TSdGNPXRQlC
 n0zDMpR079YGvttuGR+F6X5XPwVUVXxgLCny7pZNIfEia/gWG0wGq6nTOosmsSL6A6Uzm5WKv
 xN59Bqr4n9TIsH7rbebwUinIVjouNznl8YUXJGEvZbG45aYKUqqaYJ/nBvGmVDuYF3rs+Skrf
 5Durjf3wbd9pyLHKHXieE17P2pPPAhdINPeSi+bRdfqZw/xTpepv3veT7dKnWQduG62oXyfYu
 R3KkTNIO+Qi7z/x6Gt444UdWJNZD8FpWM8eIK1RkMQ/c4amtgiWCx3zXX47vAS/BfoCUhkPY9
 WreOy5rAREm8crzuwlOXTsvpbmyupBAWR33Xr4v53Ht9GRGB8elWEms5mbqaiOZmH9HH+XJoN
 5fDidzCxzmohrKgltrJocx98BMr7/htFVVJDLutp44wWANjG/YNk83BL4M5Ln788jdL+KbsKE
 5SOcHWXOUwNE0uFFQJfuaYGXYnQKaOM4h7AEjvw9/kxaNWEIjWsrwKTNpwlJqh2XHOChKLMtY
 eqJYmAACgQNfQCBtz9ql0lYVDNBWfuywsGMzYQaeC5HVOeaoNAqUxtXxnS8jJ+RL0w+4K2DqR
 qekQ6DmUFIliXG/zOAd4w+CwfNK83kRnybiY2QiY+c+yjl67S/p8HJ3hB4ngMweTouY2KIU/Q
 r6t7yuIyeQG5lfTYQAThzI7Pc/D2aX3ktPTxWJHSaMUUuvlqLF3n1BekuZ/wjLiIBt4YzImVu
 PeK+jl3uUj5GF/9jwzkkSuJR67wIiovqavhapnxs98wkYyilD4x+1hduZdVAGkxydKVLcpwAf
 dVQLFKCrSJ0jifnhPy0poCZjwYiVJ9rAp+2NRSQoI2AtuJSYyuDuWoHB6Canx8e6D/vwdIE5B
 xdOS+ECZjbjZzRU777uRVQWPwrm3XHiGPQyE9XdAFtnPuuTf/v9X/BprLBktdA8DcPQEUaMz3
 CnzRDU6WPIejj4AQX6SYK7n5GIUXbLmJ01M4qs14ZtHwbAmx3D0Il9sAnat+EqhZ8gJShiq5f
 Rhh42yl+mtfv5ZLoktcRGvoqEkrEw7n0HGTOBhVxt5WyIxOiGxcdoZeAh0DOHEaONvtTWMImm
 RMHKavNxd9NVTY=
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

Hello Daniel,

On 1/17/22 16:00, Daniel Vetter wrote:
> On Mon, Jan 17, 2022 at 1:16 PM Helge Deller <deller@gmx.de> wrote:
>> On 1/17/22 11:02, Daniel Vetter wrote:
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

Thanks for this info, Daniel!

After reading those docs I've decided not to join dri-devel and keep
my existing linux-fbdev tree at:

https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git

The linux-fbdev is a low-volume mailing list with mostly small bug fixes
or enhancements for the fbdev drivers. Those patches usually don't affect =
DRM.

I'm expecting that non-trivial changes which may affect fbdev will be sent=
 to the
linux-fbdev mailing list, same way as I will of course send any patches wh=
ich
might affect DRM to dri-devel.

My git tree is wired up to the for-next pull chain, so in any way we would=
 notice
merge conflicts (which I believe will not happen).

Cheers,

Helge

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

