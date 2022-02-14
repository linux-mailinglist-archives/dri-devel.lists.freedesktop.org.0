Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BDB4B3EE7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 02:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B95110E183;
	Mon, 14 Feb 2022 01:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B8CC10E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:38:48 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:35884.1788859523
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 730831002AB;
 Mon, 14 Feb 2022 09:38:43 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 9c6f08157a064b8eadf3c9fc28a5e4ab for joe@perches.com; 
 Mon, 14 Feb 2022 09:38:46 CST
X-Transaction-ID: 9c6f08157a064b8eadf3c9fc28a5e4ab
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <a1fd4df6-c3dd-81d3-fce5-d4fc5f3b4113@189.cn>
Date: Mon, 14 Feb 2022 09:38:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 7/7] MAINTAINERS: add maintainers for DRM LSDC driver
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 Li Yi <liyi@loongson.cn>, suijingfeng <suijingfeng@loongson.cn>
References: <20220213141649.1115987-1-15330273260@189.cn>
 <20220213141649.1115987-8-15330273260@189.cn>
 <3141331e10cdbc7a3859887d5e8038eff777e3ad.camel@perches.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <3141331e10cdbc7a3859887d5e8038eff777e3ad.camel@perches.com>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Thanks for you take time to review my patch, I am not notice that, I 
will correct it at next version.
