Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C54921B4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D330112937;
	Tue, 18 Jan 2022 08:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA7C112937
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642496162;
 bh=GAgvbVPcCTuLf4Z4erafyL68j3sS6m18caviXbwN4Jk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dQfA5YWI57nAMzFS/Wh8UxLUNeLDiGns3azOGpwteKKqJXM8FORIAttcX5d4awgAi
 EjQiHs9qENQECAxYubmwhSGvnt3545CkfTKD6wuUFvRJS0XXWTmAkDV8wU+y8FuQQ3
 GJUP7XgeaMYKrTyzhzQ5OGR9vUsa5nsitAumng0I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.155.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1mtKQg0x9o-00KzES; Tue, 18
 Jan 2022 09:56:02 +0100
Message-ID: <5ba33e10-7d75-9f9a-dfd6-c04608d230a4@gmx.de>
Date: Tue, 18 Jan 2022 09:54:56 +0100
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
 <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de> <87a6ft5thv.fsf@intel.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <87a6ft5thv.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4B29741B1ZG7mNpe4Dk9T8BEcW0y/ambhddI/Tv2Lv//Zq7v0RQ
 Q0xkNd2rXSnFr4sOmbGYYxnnc7Bug8oA7JW64k4bBTW6fJSYmb+d40werEsjQvcdGoAB8l/
 TuxBsTx2biW0z8bE7fTzGyTT7h8CajyKz2s6CPkiMYDlyuZNF5B9B+hAXQLzfv/VMKbiEGW
 IEnnTHsxI+0fTku0ds2Zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uPTcZpVpMeE=:nvf0OKwgjQu21vcintoVWv
 FKzbwGU1bxY6maP1ol9x2wf3m59FLxnRcSp3x1u3IV1Neh4C1wr61zI2CR29+uKUXCqyU+GEs
 83f8QCu64FLx0+TV5bARUWDXze7TS5HKs0T2nc9HOhzVS7o2hCE1XJwCYARjFfFStdmMwiEDA
 wsK5UftRvARDnE8kIBYsyTRyHdKiPuf9PK83p76VYXkx1a+iS79RcYoCqM4P4rX8d2dZ2sWfo
 8ywJyN0fPEHsxKKgCfilSE5TFbiKt+OpVmLF0XpAmoq6d+5dmstpwuaTd0hfDh3laafkK1YUC
 ltBgWCjzZu5Z11w8mMWXv2vBCjulURWv736LY/+dLRuUfQG2MjQ+flI4xFId/soDEXmqmfMxQ
 KfcDlJ1APSZxwjXHPgH+Jc4ExsSXQS4EkX2krjwlFVVXd+FSGTMbaajMYjS47jQvQdUe20YQg
 YZbJq8Ngb5hv6csn2CSGei/a0l5NPjUdjY38IdV3gH20GQL1PvsvcJVBC5qEodYaOqsbNy8wx
 9E4VgPNeb999G2UkKCThu2vvHyj543i1TwNddU7tS9DlVBoz6Hy9hiZ4h5SUe2vwJYc7Dqcrb
 m4mfBXF1s/hXOhKGXpYwEDxed890VPM6kj6MVsDEQ9MavBL9aG5DcFWn4VIQ8AFChP4Ws67VL
 2XayZrb9UNXnb7HIw2+HuJ+/Dffa0kzttQEebjs2ggdvi1FhulRGNp8xZAnG3vwqBdDlnTHzO
 Ofton0X4bdmMyhLgKkdGoVMQgdV3QpvcHfHCX/lJm/JDPWaA4NSpDj5MoQTFrUrCLpsyGPRkm
 3uqMMGQ6vArWa2P9r5pEm1fJ9kcGS2rk67555rRmbgbaXb6irgewRPdmjIlGcOqra9HCjEYRw
 TCNSI2siJIWnaMdNMXT7OLHKUzOqG7AjbOr5FarCrhSjlcbHbIka0KHv8K/WMQJKsSKINrZVr
 M18RET6c5JcrsYPYD03qCi96a2u8ULQbq+GMCdbacjvKK4KT8jmIcas/g5SZv/mDx7InSixkh
 erHFuCZAdFcnIbk3Cm78xItyTH/r8RcBklzAJfFmPOqFEiMR4/hEX3JL1b1DItIJJ25kosKLH
 j4J46E65y1ZSt4=
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

On 1/18/22 09:38, Jani Nikula wrote:
> On Mon, 17 Jan 2022, Helge Deller <deller@gmx.de> wrote:
>> On 1/17/22 22:40, Jani Nikula wrote:
>>> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> Seems like few people read linux-fbdev these days.
>>>
>>> How much traffic is there to linux-fbdev that is *not* Cc'd to dri-dev=
el
>>> also?
>>
>> Doesn't seem like much traffic - which IMHO is OK for such a tree with
>> mostly just maintenance patches.
>>
>>> Do we still need a separate linux-fbdev mailing list at all?
>>
>> Yes. I want to have it seperate of dri-devel.
>> Actually I'd prefer to drop dri-devel from the list where patches
>> for fbdev are sent...
>
> Disagreed. If anything, this thread shows we can't have fbdev and drm in
> silos of their own.

Patches to fbdev usually don't affect DRM.
Patches which affect DRM needs to through to dri-devel.
In addition this would take the burden of the dri-developers to receive
unrelated fbdev driver updates and patches.

> Also, if the patches continue to get merged through drm-misc, they need
> to be sent to dri-devel.

Helge
