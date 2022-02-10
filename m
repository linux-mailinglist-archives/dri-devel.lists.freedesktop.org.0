Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E794B042C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 05:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6719E10E3C0;
	Thu, 10 Feb 2022 04:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70BF010E3C0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 04:04:36 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38042.86081220
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 3D642100225;
 Thu, 10 Feb 2022 12:04:27 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 82a1be07bbef490b937c0421a33ce5a9 for jiaxun.yang@flygoat.com; 
 Thu, 10 Feb 2022 12:04:33 CST
X-Transaction-ID: 82a1be07bbef490b937c0421a33ce5a9
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Message-ID: <d7437828-5f3f-6df5-b561-fc8b4b8a42d0@189.cn>
Date: Thu, 10 Feb 2022 12:04:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/3] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Roland Scheidegger <sroland@vmware.com>,
 Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, suijingfeng <suijingfeng@loongson.cn>
References: <20220203082546.3099-1-15330273260@189.cn>
 <d2e26781-4cef-696d-f7c8-88bb4b71fd87@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <d2e26781-4cef-696d-f7c8-88bb4b71fd87@flygoat.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/9 20:00, Jiaxun Yang wrote:
> Hi Jingfeng,
>
> Could you please keep me CCed for the for the whole thread when you 
> respin
> the patch? Cuz I'm maintain MIPS/LOONGSON64 stuff and I believe this 
> series
> is partially based on my work at Lemote.
>
> I will help with reviewing and explain some Loongson64 specified issue 
> if possible.
>
> Thanks.
> - Jiaxun
Okay, thank you.
