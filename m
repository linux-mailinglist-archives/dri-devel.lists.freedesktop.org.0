Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B437278B5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41E510E1FD;
	Thu,  8 Jun 2023 07:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id A434410E1FD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:24:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxDetGgoFknXMAAA--.1746S3;
 Thu, 08 Jun 2023 15:24:54 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxZuRGgoFkr98GAA--.22149S3; 
 Thu, 08 Jun 2023 15:24:54 +0800 (CST)
Message-ID: <aff664c7-b692-4fcf-ad61-8030cc648501@loongson.cn>
Date: Thu, 8 Jun 2023 15:24:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
Content-Language: en-US
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20230608024207.581401-1-suijingfeng@loongson.cn>
 <ZIGAEZTJvq1GqFVD@aptenodytes>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ZIGAEZTJvq1GqFVD@aptenodytes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxZuRGgoFkr98GAA--.22149S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF1kZryDZr18GF1xur13Jrc_yoW8XFW7pr
 W8Ka4jyF4IvFW5KF1xAr13XFy5X3WkGFWS9F12k3WDuwn8AFyDZr93ZrWYgFy5ZrZrJF40
 yFn7Ka45Ga12kagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jn
 UUUUUUUU=
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks a lot

On 2023/6/8 15:15, Paul Kocialkowski wrote:
> Hi,
>
> On Thu 08 Jun 23, 10:42, Sui Jingfeng wrote:
>> drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select this
>> two kconfig option, otherwise the driver failed to compile on platform
>> without REGMAP_MMIO selected:
>>
>> ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicvc/logicvc-drm.ko] undefined!
>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>> make: *** [Makefile:1978: modpost] Error 2
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Thanks for the fix, looks good to me!
>
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

After received this Acked-by, do a need append this tag to the patch, 
and resend this again?

I don't know about this.

I don't need to do anythings ales, you will push it to your repository, 
right?


> Cheers,
>
> Paul
>
>> ---
>>   drivers/gpu/drm/logicvc/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
>> index fa7a88368809..1df22a852a23 100644
>> --- a/drivers/gpu/drm/logicvc/Kconfig
>> +++ b/drivers/gpu/drm/logicvc/Kconfig
>> @@ -5,5 +5,7 @@ config DRM_LOGICVC
>>   	select DRM_KMS_HELPER
>>   	select DRM_KMS_DMA_HELPER
>>   	select DRM_GEM_DMA_HELPER
>> +	select REGMAP
>> +	select REGMAP_MMIO
>>   	help
>>   	  DRM display driver for the logiCVC programmable logic block from Xylon
>> -- 
>> 2.25.1
>>
-- 
Jingfeng

