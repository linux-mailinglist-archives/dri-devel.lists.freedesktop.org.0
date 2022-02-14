Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD54B42ED
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 08:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C1710E221;
	Mon, 14 Feb 2022 07:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36F3E10E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:18:36 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:40520.1301825991
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 2E9CA1001F0;
 Mon, 14 Feb 2022 09:18:31 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 750ecf3745c54b01ab0aef2812fb2f0d for joe@perches.com; 
 Mon, 14 Feb 2022 09:18:34 CST
X-Transaction-ID: 750ecf3745c54b01ab0aef2812fb2f0d
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <dfc864fd-0918-9f0d-3e42-a9d363af3c48@189.cn>
Date: Mon, 14 Feb 2022 09:18:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 7/7] MAINTAINERS: add maintainers for DRM LSDC driver
Content-Language: en-US
References: <20220213141649.1115987-1-15330273260@189.cn>
 <20220213141649.1115987-8-15330273260@189.cn>
 <3141331e10cdbc7a3859887d5e8038eff777e3ad.camel@perches.com>
From: Sui Jingfeng <15330273260@189.cn>
To: undisclosed-recipients: ;
In-Reply-To: <3141331e10cdbc7a3859887d5e8038eff777e3ad.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 14 Feb 2022 07:37:40 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/14 07:12, Joe Perches wrote:
> On Sun, 2022-02-13 at 22:16 +0800, Sui Jingfeng wrote:
>> From: suijingfeng <suijingfeng@loongson.cn>
> []
>> diff --git a/MAINTAINERS b/MAINTAINERS
> []
>> @@ -6453,6 +6453,15 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>>   F:	drivers/gpu/drm/lima/
>>   F:	include/uapi/drm/lima_drm.h
>>   
>> +DRM DRIVERS FOR LOONGSON
>> +M:	Sui Jingfeng <suijingfeng@loongson.cn>
>> +L:	dri-devel@lists.freedesktop.org
>> +R:	Li Yi <liyi@loongson.cn>
>> +S:	Maintained
>> +W:	https://www.loongson.cn/
>> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>> +F:	drivers/gpu/drm/lsdc/
>> +
> M then R then L please
>
> DRM DRIVERS FOR LOONGSON
> M:	Sui Jingfeng <suijingfeng@loongson.cn>
> R:	Li Yi <liyi@loongson.cn>
> L:	dri-devel@lists.freedesktop.org
>
>
oh, I will correct it at next version, thank you.
