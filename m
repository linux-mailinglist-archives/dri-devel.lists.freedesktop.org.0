Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5474490F49
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 18:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EC410F411;
	Mon, 17 Jan 2022 17:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8718510F40B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642440022;
 bh=Oe482/0i/WLrNkCXVOSQLDJo+BYQo13yR5t/lqWrnFY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=hhQgz5JnVrEy6KkiPAOQ4XU4369t4ecgVSovc2DuarSXYrJwOLohxakWYQoa9MyAO
 7UMGGbTw/k1PnrWUBKenVa2awlD8UpV9kVP5vPREy7UvtQLzP/PvJRPKkT3MEcGcK6
 L20gTP/wOT5RA2lb0Va1WkPNKQW4lkhBx9qUx4ss=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QsO-1m9G7c11GA-011TYV; Mon, 17
 Jan 2022 18:20:22 +0100
Message-ID: <cbe8641e-9358-2ea6-235f-bd837171eaf0@gmx.de>
Date: Mon, 17 Jan 2022 18:19:17 +0100
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
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
 <CAKMK7uECQU2ALkLHuFfPCjDcH456R6yJ4N_yKbHJ6PiFZ6fiow@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uECQU2ALkLHuFfPCjDcH456R6yJ4N_yKbHJ6PiFZ6fiow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CwGx+k2vKlIe81+Xy61ZTTZRrhgIedfMmfUFL2qQ7R0sD1+/wnC
 ah3MeIxVHGzgSCh8OpE5dUgC6K7/+7ToA7j98VctdiB/D8IB0ayzF/U2Ct4r6MQAarkjhiu
 SbPsDSrdQUrmpcvGfjpt0n7Cl3zZC1v/JTRGK3Njn9RBrrm95kWqDkQZwMF94y1FE3j3Nr5
 kgZBeadDnK1dAcjHQRoFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hCwKHzwCHog=:xmZuXJQ5jSJYoM2b5+kIUO
 97PPzM+IuZ6++TkQI3+ctf0LqEkIJG3Lm05TTk/pl7pKhpChd2zKwgsD6OOdBQ9tTpznE+nXw
 AvKGH0EjE0TUMPPf63ZbOJlzqsu4hZw+zz37UdHQu6XvH1dVH7Avpc5PO8+nmTvsLYmuI0JIo
 yKxkJAP+ai5xWRM4RxW1tQKXt85YWTwS5F6Z64ryVsMOCACtZ/bfycVOdnxHPraLD3Jf/Z4F+
 aA6G8DjENyB8JSpbc6Zfcepp1mwHNsY2t/P1KdXmhV9hBoSpYu/f4tWzmaiHxBVp+fjf5B0/h
 BkfBuBMRHFR8B5QUzNNP9Lxs40tc+Ke6PcJ3K47hNBvHgebaAZsOPEnJA0dqW3yGHL+tYpL+2
 9Y3VZaA6PCizAZ+S9SIIZA7pkd08SRSZDq/kfYs/HTWAzLkm/L2my8oJh0f98FH/TZibZJZgR
 IcVd+lVque44QxqpLJKOSRfdT5eZFPCcN18FKzdOUTs2zA57gmOep+mMia7T4L+kH8dFtSbju
 8qfhQFyRHLeym94vCWRV+WT6L5UK3UBwmNDs7gBGub9U6jv1ZuAq5Vq4tXS8AiGWB/8D/M6C1
 hlZUy1FPwl5km0FtDuh608N+7kfuNAU7commey2WD8M/Ft2bzgwJ8RIEYTv9sOgNuSTwguUvC
 d12vjZbNx3pCiLWPoYFXlnyOv2j+vhFVsvZcVyJE0mV4wgXHRBrLbeFFYL7LGe1kpYvAD7HTZ
 AHRm7a5bGY4MiqLeujdZMFZWYbJQ/j+qZtbCI3jbOcTWC2+9/7mext0tlXp7xc7xfrWViqUjc
 rI5IlttD9+hlFDeVxObViKTzUzoJLuyqnPqwx+AYFb8bYzDY4z2YFlv7iGISwztIw6ZmRPv4u
 fW9tEujxKFaJjWfrZcqYwe/cmG2Mhn2sBjmxEpMsbwIhgqLNMTRNksQ10xYeYenWl7hLMtKF/
 iQTfVBuQLqs3Y96Htrxs3NrtsTWqEqtFQUyQ0p8fvYBV6+mXHhzQsWmjMc5wwYgubU9k4GNVv
 4dd//vybGO+yMvXoXqosMAbOPGcSI5YgKvggSrta+WK0LRyn5TdKEdk+c0Aqg3ukl18e+npcM
 Syw2gqkHlkJ0F8=
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/22 17:38, Daniel Vetter wrote:
> On Mon, Jan 17, 2022 at 5:22 PM Helge Deller <deller@gmx.de> wrote:
>>
>> On 1/17/22 16:58, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 17.01.22 um 16:42 schrieb Helge Deller:
>>>> [...]
>>>>>> c) reintroduce the state where fbcon is fast on fbdev. This is impo=
rtant for non-DRM machines,
>>>>>>     either when run on native hardware or in an emulator.
>>>>>> d) not break DRM development
>>>>>>
>>>>>> Especially regarding c) I complained in [1] and got no feedback. I =
really would like to
>>>>>> understand where the actual problems were and what's necessary to f=
ix them.
>>>>>>
>>>>>> Helge
>>>>>>
>>>>>> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@=
gmx.de
>>>
>>> Seems like few people read linux-fbdev these days.
>>> I suggest to partly revert the patch to the point were performance
>>> gets better again.
>> Yes, *please*!
>> That would solve my biggest concern.
>>
>> As far as I can see that's only 2 commits to be reverted:
>> b3ec8cdf457e - "fbdev: Garbage collect fbdev scrolling acceleration, pa=
rt 1 (from TODO list)"
>> 39aead8373b3 - "fbcon: Disable accelerated scrolling"for-next-next
>>
>> I think both were not related to any 0-day bug reports (but again, I mi=
ght be wrong).
>
> syzbot, not 0day, and there's like a sea of them unfortunately.
> There's all kinds of funny races going on when resizing consoles (due

The patches above are not about resizing consoles.
Even if a resize should happen in between, it's better to introduce some k=
ind of big lock
instead of completely disable acceleration for est. 58 other graphic card =
drivers and slow them
down that much that it renders them to become unusable.

> to bad locking design) which then blow up, especially in less tested
> code. For the sw rendering we've merged a bunch of patches, but you
> pretty much have to assume that it's all fairly broken code until it's
> rewritten and fully covered with tests. Shadowfb + memcpy is probably
> much faster for restoring scrolling performance than anything else
> really.

That's maybe true for fast new machines with fast PCI busses.
But have you measured that on other/older hardware too?
There is a good reason why 2D acceleration was introduced.

Helge
