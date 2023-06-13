Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3941872DCC7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 10:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFAF10E34A;
	Tue, 13 Jun 2023 08:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id C847410E34A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 08:40:13 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:49218.162439971
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 42FC2100236;
 Tue, 13 Jun 2023 16:40:08 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 eeccf25fcf684add9e175087e8ee34ea for mripard@kernel.org; 
 Tue, 13 Jun 2023 16:40:11 CST
X-Transaction-ID: eeccf25fcf684add9e175087e8ee34ea
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <555e160a-0c9d-9145-88f1-a0ecff62240a@189.cn>
Date: Tue, 13 Jun 2023 16:40:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 0/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20230520105718.325819-1-15330273260@189.cn>
 <d4e647d8-294c-abd7-40c6-37381796203d@loongson.cn>
 <a23d6mgl4fbfa4ucgjvwgw7l3somxo4tkhit7ygy55fldlum56@vm3tyjdsx24l>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <a23d6mgl4fbfa4ucgjvwgw7l3somxo4tkhit7ygy55fldlum56@vm3tyjdsx24l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/13 16:30, Maxime Ripard wrote:
> Hi,
>
> On Mon, Jun 12, 2023 at 10:58:54PM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>>
>> Any ideas for this trivial DC driver? Sorry about my broken English.
>>
>> What to do next? Send a new version?
> Thomas already told you to merge it in the previous version:
> https://lore.kernel.org/dri-devel/7b77020f-d543-13bf-e178-bc416bcc728d@suse.de/
>
> So.. do that?

OK, I also want to merge this.

If there are any other problems, We and other contributor will take the 
responsibility to fixed it with a separate patch.

It this OK?

> Maxime
