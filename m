Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DC70635A
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570910E3CC;
	Wed, 17 May 2023 08:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0182610E3CC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:53:36 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:33730.1113338956
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 1FA161002EB;
 Wed, 17 May 2023 16:53:33 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-prw2v with ESMTP id
 17a0017565504ef1b191c3c72f991489 for javierm@redhat.com; 
 Wed, 17 May 2023 16:53:35 CST
X-Transaction-ID: 17a0017565504ef1b191c3c72f991489
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <53b02c0d-069d-e923-1c11-6da4e8d83470@189.cn>
Date: Wed, 17 May 2023 16:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_atomic.h: fixup typos
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 liyi <liyi@loongson.cn>
References: <20230517082322.3230271-1-suijingfeng@loongson.cn>
 <877ct79wu8.fsf@minerva.mail-host-address-is-not-set>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <877ct79wu8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/5/17 16:38, Javier Martinez Canillas wrote:
> Hello Sui,
>
> I would still add something to the commit description even when your
> changes are trivial.


OK, that sounds fine. I'm agree.


> Sui Jingfeng <suijingfeng@loongson.cn> writes:
>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
> The fixes look good to me though
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
