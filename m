Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C0706347
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C67810E3C9;
	Wed, 17 May 2023 08:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id A51E010E3C9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:48:35 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:59340.234832183
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 1A8E11002E1;
 Wed, 17 May 2023 16:48:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-2qvwx with ESMTP id
 bb5ef2c8a7554d65add99f78c2e17e1f for javierm@redhat.com; 
 Wed, 17 May 2023 16:48:22 CST
X-Transaction-ID: bb5ef2c8a7554d65add99f78c2e17e1f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <9ccad690-15a0-82a6-f8b0-572323a42e3d@189.cn>
Date: Wed, 17 May 2023 16:48:19 +0800
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

Hi, thanks a lot


On 2023/5/17 16:38, Javier Martinez Canillas wrote:
> Hello Sui,
>
> I would still add something to the commit description even when your
> changes are trivial.
Ok, I remember this, I will respin patch with this instruction in mind 
in the future.
>
> Sui Jingfeng <suijingfeng@loongson.cn> writes:
>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
> The fixes look good to me though
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
