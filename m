Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF5C491166
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 22:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A8710FE80;
	Mon, 17 Jan 2022 21:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3DD10FE80
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642455936;
 bh=6czN+Kc8MWNVarvsSp3OMW6bjBq/Kmp3PxQSsnJVhqA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Nmd9zKSu7Lj459Sbf9nLgDqaTkvEx+23VGFpMsj9u0nyo6wV5DPjNmGIayhf//QxI
 HdS5BY7dBT62/hqNe5y4vzwdFLX9cw5GZt/7IgDn/tEdVWrxNK/shzesJ8nQ68Ykot
 4blMKofJcb/r6KMpaAWPY2kXeNhAgB10s0SQI8vw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.167.237]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJlW-1mQJNs05R6-00jIIT; Mon, 17
 Jan 2022 22:45:36 +0100
Message-ID: <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de>
Date: Mon, 17 Jan 2022 22:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de> <87ee5659dt.fsf@intel.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <87ee5659dt.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AOsSvq0ynHAvfBH2SFINyupBFJzMXhDwC8RnC8hf3CnICi4Jsat
 Ct8gGrDqnAjesUAJHGfQprWoxmCPydOMephNCMqSWBogYzxgci+23NVIRTzeGCLIydhPcZS
 sq2ik5QEdL1oZWu4yIYiyGg3YZhHPOSNb837RKwnlmY3RGSwwqIbxuXBtJlQK47b+jcATcu
 P9mckP5YLx37w2LgIWKlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:piSOiqy5ZTQ=:DVwFlP6DwEhVdZeTYweZOB
 bpRPq/C6eezPlmQOxPGaIX1v5Iqi4dvkpu1dvAKt20iHn61MQZYbFwwecKiL8xN8qd7GurTJG
 Rp4VBG3PyiL5RHwwYrVpxDuu+MGpX3zOF+PNx7a/vFnme2lUHESiDidh+OgigDk3hlOW29Qfd
 DMy9UweODd0r/NvRKyD9i9qSjc0OY0HhFaw/z8kdGqtdRrVv8SJZWGBFuOvTupmKLJimy15T7
 uJW1Ta5t2OxGDJDaPVJeY0b4nB+ruona1kaJLZgraa6NJCCL3LVthzzlSzEsZCYlsrG1SLGcj
 0Q+C74cmH9DhQFrYO3F3vwacpBH/LUD4xdhcSbassJNPSC6XStx9jR76J7NVcknc55XvNSdlC
 Hql7AgyZeB31ue+qH7iCmoOfaS8BSgafTmxlo4S/c+21GPwt2lO7Atmz8GtehqjHUKCTTEkpW
 QJS3uL8jTHvi+raHWEIZu9oYzytWZGOtTFzihWeGQIxxACMm514osLAvbXGel7lqJTGikEZrD
 jGWXfML4QRSmpXmDKTCuv4MgTuSVa0lyC0VtDV84AD82Z5J4ory0W/4iaWl8pBipoNlMXweLF
 UOGBitK16EX++ucJDt6Me4PudicoH13DzgzvsozWUz+QiQrlbjAAfvKbIWP/55k3NEHx9eGDh
 IeKFLEdA+ptMvwJQlJwl2XvRrv6qQy6H3SEP9CUYbaK9VFRcEefXNK3+jfh1Uoyd1vY+oXaGV
 nr1+MWYjTVVwJp12ZyjgweY8ZrN7lRlMuU5cHbR/dMd6Mj+KKzKFW+wsTXf85rwUdRqTVa4/3
 soQZipgus3o8PdvmmlOV9R2ZW+NFHeQd2B7FVJdCB4ORmExoqdzsbbEw70dkVIWTE6tudWgcn
 bNE09V526l05SpUsr60b5yCq+BE2zTeRqsKo5yl/gjLTDjZCCsMEbmoOH8Nho5W2GiL8KIsTA
 jKeZsfzR+yJfQ58pouKS6g76I7t3CHPQ5R5EFHoOO5t5TEJExTxGzjK6XrOuMYCN2348Uuegy
 PADDJNiJsHpLey0MZfIQ0otgPHtVfpjcieYcl+JYkfI3nALkS0P/pyf6L7+0htfrPWZ4dxdR4
 JgxnoUWcI7ZHsU=
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
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/22 22:40, Jani Nikula wrote:
> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Seems like few people read linux-fbdev these days.
>
> How much traffic is there to linux-fbdev that is *not* Cc'd to dri-devel
> also?

Doesn't seem like much traffic - which IMHO is OK for such a tree with
mostly just maintenance patches.

> Do we still need a separate linux-fbdev mailing list at all?

Yes. I want to have it seperate of dri-devel.
Actually I'd prefer to drop dri-devel from the list where patches
for fbdev are sent...

Helge
