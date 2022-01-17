Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EA4910C1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 20:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF0A10FB5C;
	Mon, 17 Jan 2022 19:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9454310FB5C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642448820;
 bh=Ks7mMCqqWKSlVbqzVh5pK404Cv2+2Ly5dVd7cCJcWeg=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=N2p7xGpotefOdUtnRbldZTBMapof8LRE+NkJlgFgpgrBi10pZB0Fkxn3BQ2PG3zQS
 ZSt4b9WaaZI+2TPvwrIwKrCBNM1V0tiTsC9tgJ5YdpEndeRfST58LGYnh/ZXDXqqPP
 xXt+VaLgj7Up8nt4IJHgbI+dljqCkrguTSD94g3I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYLa-1mgpv211Eu-00fzf5; Mon, 17
 Jan 2022 20:47:00 +0100
Message-ID: <e4242fe9-13b1-91b5-d254-992f48115589@gmx.de>
Date: Mon, 17 Jan 2022 20:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
In-Reply-To: <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d9wRC9A0c+ckVOKrEHQ8NTzqqT98PzaomAbCQyg7rjReFHfbcqZ
 yRARvKgiat7uRMuER0jfMQjqUTjI9XR4w3dxY8o9whz0A5st3XikGPFIYeuTEzSQeQZQM+H
 4U/F/IkxsA0MhBXGEo1tTnXOZ/vat2zFWMuUQjG0N16VHAEpuxA7I7T+TUodicvILoovuk+
 spyc2gcdJnfLUdxL/D2mg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wfMp1TsVfQ8=:hPz1fAYdOTE469XoyDBVpA
 WL+Tli57ugQc03+Omo6OlmdeTyjRrBD7/OA6OeN9TjU/fXzvzlQQfUhFAGnX6NxX6LaDNtp76
 DPjPdxpKGF028ZflLzSQtmgzIvjYZZvkQ1bLiekF6FL5/RvZ0T2LpYokZWrfyhezA/hW/N4sL
 mzTqocw07IgElRH3mY8/qC5phmI82wPuo7DYGhJysVtKCmCkzeGgii6hLC36zdcaw7ZdeDxmX
 c5NnNfMKGh1WaJHsd7dc4UHOXWlXvqy2TMTd2Xmj0s53v2IlBSO5l4mYLGz5caelbQf5ri8Bc
 93VKIRF3vDG6vP2ehLEp9n2AQsEiiQ3bb8wMoUmRQKwjxi4t8zZ4pzYjOOYIt9X+HuIxF5W6W
 DUMcFs9MJbKA4WWkj6ISy3QkPo9gc05/nCa7Nq4cABjh2hmRvFx9+HcHBqs2tQl+KVQFh3tvh
 vx5Hs7gqsFiSd6jEftOGI/fCYVvJua4BvJP3Qxw99cdeHZSNCsve6/xkuWa0RkiZdXAjcR2sj
 oU9fwWmREa6b+JSLTeTNastvbU8eLi330ZA7WOEOGgK22bYFlTm6ShpxLHYL9aOoaw9iZ+EbC
 fApqzW3nC1bw4kPQhJtR3PysBouqmw85cqYMTJds8pS/FeCyfP3R1o6a/pj0aILoknLUIVkgf
 L461z4Wt09FheWGex/H31VkK8a/23hh/Lfjv1iC2nxxOExMJF9qITubTOpn/Zs96hp7WxovVn
 rqMbkXhsCAcXnxkUKdKUCy0fKvwtPJGSbUXWDUIgdguCCS2qn4SexOo9XqgDObK7nq9OHFKqO
 BF/z1fWCABpywCZplwR9o/YuoXpw4YcCqYBJMhnzBk8PxPE6a3rFyry7GTLv6shPCjIsXgVe9
 uQittlP+utBHuls34U+C5xv2VKAUtAN1d8eH1PC00q1TI7V8WLg73W5aW7mp9dlIhXbdxVFC5
 go+Qn0sAvkFmalRCjXtzO2691O3jGd6X3zyugrBPwRTMMRw4IysCm490536RV1w5mZxZGWrYc
 jDDuE1Igb27Z/0H+NSiexxfwLf+8vldxAwCOBK+5iDHNyiqjr/Azk2qlN3UEytaHBcH2aTn6s
 /uKA3fKkIfZC2E=
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

On 1/17/22 17:21, Helge Deller wrote:
> On 1/17/22 16:58, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 17.01.22 um 16:42 schrieb Helge Deller:
>>> [...]
>>>>> c) reintroduce the state where fbcon is fast on fbdev. This is impor=
tant for non-DRM machines,
>>>>> =C2=A0=C2=A0=C2=A0 either when run on native hardware or in an emula=
tor.
>>>>> d) not break DRM development
>>>>>
>>>>> Especially regarding c) I complained in [1] and got no feedback. I r=
eally would like to
>>>>> understand where the actual problems were and what's necessary to fi=
x them.
>>>>>
>>>>> Helge
>>>>>
>>>>> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@g=
mx.de
>>
>> Seems like few people read linux-fbdev these days.
>> I suggest to partly revert the patch to the point were performance
>> gets better again.
> Yes, *please*!
> That would solve my biggest concern.
>
> As far as I can see that's only 2 commits to be reverted:
> b3ec8cdf457e - "fbdev: Garbage collect fbdev scrolling acceleration, par=
t 1 (from TODO list)"
> 39aead8373b3 - "fbcon: Disable accelerated scrolling"for-next-next
>
> I think both were not related to any 0-day bug reports (but again, I mig=
ht be wrong).

I did some more checking...

Both patches are not related to DRM, since no DRM driver sets the
FBINFO_HWACCEL_COPYAREA or FBINFO_HWACCEL_FILLRECT flags.

Reverting those would bring back fbdev performance which I'm worried most =
about.
And it introduces no (positive or negative) effects on DRM.

I still wonder why those were submitted.
Let's please revert those.

Helge
