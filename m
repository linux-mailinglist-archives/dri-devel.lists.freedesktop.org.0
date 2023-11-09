Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CC7E6C68
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 15:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568DB10E218;
	Thu,  9 Nov 2023 14:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9178310E218
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ps5jy95FKn5zhfX2cWWoeVLPnNfxcc4g07BTW6Er8i0=; b=XI8p8iFAmRCXyrsDbfskgnxQsn
 J7Q5y/nrs87M0a3pSjHk9SON8+Rb8DXhQe2Ig8cAcKLU1d0oxz/0rYVj6ENY/sLXMX5afZI0/OZTX
 HqWcNVBy8xJdooAVEN3hT6W3kobbbPX/3hbuHs388QVh6gX3R/Jb5Yhs5NhsjAxDVBkKGGQ4C0nOw
 V/qYaoDzjhVvn7tuCH8Z5M3lAGPp0G0kZgqgEsmHh8IGCH7qkD/TegSI7L1InT3FGPlSbBxBFU0t5
 0x8umsdQrQlf2Di2k5KcvuDv1VpHUEyMj1ANwggk1LW5PEPiih7A4hFrL/S0gm+SK/aQ3Vw8/o98o
 LIr1/iEw==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r160A-001Gav-2B; Thu, 09 Nov 2023 15:27:22 +0100
Message-ID: <7b8e23bb-60ac-0de5-265e-d6e9294a8435@igalia.com>
Date: Thu, 9 Nov 2023 11:27:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add Maira to V3D maintainers
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20231106134201.725805-1-mcanal@igalia.com>
 <20231108130333.azkvg5yqhdt45af3@mail.igalia.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20231108130333.azkvg5yqhdt45af3@mail.igalia.com>
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
Cc: kernel-dev@igalia.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 10:05, Melissa Wen wrote:
> On 11/06, Maíra Canal wrote:
>> I've been contributing to V3D with improvements, reviews, testing and
>> debugging. Therefore, add myself as a co-maintainer of the V3D driver.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> 
> Acked-by: Melissa Wen <mwen@igalia.com>
> 

Applied to drm-misc/drm-misc-next!

Best Regards,
- Maíra

>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f13e476ed803..3213563756cb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7108,6 +7108,7 @@ F:	drivers/gpu/drm/omapdrm/
>>   DRM DRIVERS FOR V3D
>>   M:	Emma Anholt <emma@anholt.net>
>>   M:	Melissa Wen <mwen@igalia.com>
>> +M:	Maíra Canal <mcanal@igalia.com>
>>   S:	Supported
>>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>>   F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>> --
>> 2.41.0
>>
