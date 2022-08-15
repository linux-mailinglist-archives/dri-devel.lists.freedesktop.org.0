Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A4E593E9D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 23:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6BDD4F16;
	Mon, 15 Aug 2022 21:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DECEB5031
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 21:07:00 +0000 (UTC)
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id NhIPoUIJz4lbwNhIPoi6UR; Mon, 15 Aug 2022 23:06:56 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Aug 2022 23:06:56 +0200
X-ME-IP: 90.11.190.129
Message-ID: <d9a4321c-efc3-e2b8-1bb7-9e2413940885@wanadoo.fr>
Date: Mon, 15 Aug 2022 23:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/hyperv: Fix an error handling path in
 hyperv_vmbus_probe()
Content-Language: fr
To: Wei Liu <wei.liu@kernel.org>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
References: <7dfa372af3e35fbb1d6f157183dfef2e4512d3be.1659297696.git.christophe.jaillet@wanadoo.fr>
 <PH0PR21MB3025D61C85CD6E724919A9D8D79E9@PH0PR21MB3025.namprd21.prod.outlook.com>
 <20220815155608.uekossy5hejqflni@liuwe-devbox-debian-v2>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220815155608.uekossy5hejqflni@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 15/08/2022 à 17:56, Wei Liu a écrit :
>>
>> All that said, the fix looks good, so
>>
>> Reviewed-by: Michael Kelley <mikelley@microsoft.com>
> 
> I made the two changes listed above and applied this patch to
> hyperv-fixes.
> 

Thanks a lot, that saves me a v2.

CJ

> Thanks,
> Wei.
> 

