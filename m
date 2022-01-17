Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D89D490653
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 11:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20B10E181;
	Mon, 17 Jan 2022 10:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114B110E181
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642417124;
 bh=ZlkRI76O1HNMaDibceLBJ4+Yr9W5biTnm7ePlGXax8c=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BwHcpXm3NG1Lwqd5XnmY5I13XEroXICdnIhOyAtjctLB+ZbD8AMT83sL6BLMwuMUE
 RNor84k7NkJGdF+BTLmzC4gwe1o5UuLxlRozF59cPDu5uduZa5pmbuDpR9J7Y5H/H1
 OmZ39nqVBn86+zhnL/pJ7o+4oTUefstaX7Dd+ZLc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5eX-1mqNGg3sxx-00J3u5; Mon, 17
 Jan 2022 11:58:43 +0100
Message-ID: <60fad896-235c-7602-39d1-14691282ebf6@gmx.de>
Date: Mon, 17 Jan 2022 11:57:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <87o84a63hy.fsf@intel.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <87o84a63hy.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ebVuJl/dmLqN1DusLAVJLl1TzbN3n+pZ2TDGb0JtsNZMKjzmqgX
 AcrDzss4HYUU4gGfKlDiuJmsR/a5e3j0YMe9gONh2MWqf/Q+jfxq67YuTBd1YgtvBfMNWnw
 o75DkRCCC5uDZACJqcEHVBpW+aTxTTKUITA68CQXTvqOdI7AmgoBfwWsqtwFUAPJAdpVcbX
 6qxo5uiHQle2Hy46OdqfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vl7fjTBigKs=:1/42af+1H3BqrJsWlSFH/o
 RZfzhKKvGuIrHY0xRLqz3QObRNaNDFiE6fdTQDVod6fFYPpMDtjNNXN6oHSeb0yZU69bK3IvO
 QK4LY0IWHelVcWmoEdEcqLYAh0taPBWcToUbS+AOr0pwOV1G8/sUApFI5DuqBgB79HFQUg6RI
 +YN8qTdRlP67RmGDzy0LiSi2YyZ7EjAkzeyEy2g+4J91T35knvcXQ009d+qN7jqo/qpOThWel
 zz6YX+VcpzOIkzK0u19pBZwiEzrvBOzN9FpcVY7F8aBXc+xH0js1ZRNdeTsxT1EK5lHx0UnuT
 5Mt1O1BgK6JtxTQfRQkyiNIMAXnNgudr18iixaTzvLbeerE4hf7yb/PITQv43pKeT+KzKOR60
 13dYcHlgT+NlloWCZO41vrmrJX6PJh37g0FkGpRo3J/I26CZt9pyMDrhx+Rj4dlNCS607WZf/
 PeLxGlJoZDLPqJSdCf3Y6h3+s6lxlNlkOhi7TmR2gjw6p9Fyfe5OCQ0hQPzDoE+9KCLcaBDg4
 tvE1wXHot1y1ZjIi6a+95m9AxM+njeOBnsolwPNTMbAHxwM3YKsmKNBdsleC9s7nrbY1S/j34
 YdmZA2aZmGo1O/ZiM1J6CgZyPGdcv8yy6rln0Xe/w2mc+6D0qlFDkSkj0WoFT1zok8RCGd4jZ
 wwg4VNlxdoQ0CGPjS58YWNSH7TcmShdGRusF4DJg6o3sfHKxzaETaE/zWZEJZbkG3jazelU1V
 bmYhgcH3d5QWKBZyIDu3izQXeL1R4q2A2WxQXPBSRSnhV3wduB2pib3Xz6F5KC/sU3CsUZw+Z
 1v+SptapJKwtINPGptCvnOu/UtYx66WF8VT5w+Wq8ViYWU2xczdidoaF6DqXte5a6Jd7hDxro
 1GRRRe3L1c8x0in3J5e1pEyi95mT4M1s549hvcowIuWb7Aygkd45aPIgKix9SvvYcuSW0+LGf
 eMvU318jN3DhQoKQib5iTD59tIUQd9u4NKuuUE1bzOsYqH3dw4w4J2hwwZsKkCgwWdufEN29L
 2wi2GFjFLsWgZbYcMWS91JuXRAVlGtVxArGWPpaJXwMYcUNl/Ka4ICq8D9HecL0PCxBCrh/FE
 t0fka4TH4+eZ88=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jani,

On 1/17/22 11:49, Jani Nikula wrote:
> On Mon, 17 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
>> Hi Helge
>>
>> On Fri, Jan 14, 2022 at 7:18 PM Helge Deller <deller@gmx.de> wrote:
>>>
>>> The fbdev layer is orphaned, but seems to need some care.
>>> So I'd like to step up as new maintainer.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 5d0cd537803a..ce47dbc467cc 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7583,11 +7583,12 @@ W:      http://floatingpoint.sourceforge.net/e=
mulator/index.html
>>>  F:     arch/x86/math-emu/
>>>
>>>  FRAMEBUFFER LAYER
>>> -L:     dri-devel@lists.freedesktop.org
>>> +M:     Helge Deller <deller@gmx.de>
>>>  L:     linux-fbdev@vger.kernel.org
>>> -S:     Orphan
>>
>> Maybe don't rush maintainer changes in over the w/e without even bother=
ing
>> to get any input from the people who've been maintaining it before.
>>
>> Because the status isn't entirely correct, fbdev core code and fbcon an=
d
>> all that has been maintained, but in bugfixes only mode. And there's ve=
ry
>> solid&important reasons to keep merging these patches through a drm tre=
e,
>> because that's where all the driver development happens, and hence also
>> all the testing (e.g. the drm test suite has some fbdev tests - the onl=
y
>> automated ones that exist to my knowledge - and we run them in CI). So
>> moving that into an obscure new tree which isn't even in linux-next yet=
 is
>> no good at all.
>>
>> Now fbdev driver bugfixes is indeed practically orphaned and I very muc=
h
>> welcome anyone stepping up for that, but the simplest approach there wo=
uld
>> be to just get drm-misc commit rights and push the oddball bugfix in th=
ere
>> directly. But also if you want to do your own pull requests to Linus fo=
r
>> that I don't care and there's really no interference I think, so
>> whatever floats.
>>
>> But any code that is relevant for drm drivers really needs to go in thr=
ough
>> drm trees, nothing else makes much sense.
>>
>> I guess you're first action as newly minted fbdev maintainer is going t=
o be to
>> clean up the confusion you just created.
>
> As much as I like folks stepping up as maintainers, I've got to say this
> is not a style I appreciate at all.
>
> Thursday: Object a recent fbdev change [1].
>
> Friday: Step up as fbdev maintainer, change git tree (this thread) [2].
>
> Sunday: Send the maintainer change to Linus [3].
>
> Later Sunday: Start reverting the changes objected to on Thursday, with
> no discussion, no acks, no reviews, in the new git tree [4].
>
> Monday: Continue reverting the changes [5].
>
> I'm heavily in favor of maintainers who are open, transparent,
> collaborative, who seek consensus through discussion, and only put their
> foot down when required.
>
> I really don't like the optics here. I'd expect some pretty good
> explanations.

Jani, please don't worry!
I've started to sort things out, to work through the existing backlog of
patches (which is a LOT!) and nothing has been pushed yet.
I've seen the other mails and we will discuss.

So, please just ignore the current state of the linux-fbdev tree for now.

Helge
