Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965897A92F4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 11:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A4110E594;
	Thu, 21 Sep 2023 09:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87D5F10E595
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 09:09:22 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxqOhACAxlVYMqAA--.45656S3;
 Thu, 21 Sep 2023 17:09:20 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxiuQzCAxlUS4NAA--.28708S3; 
 Thu, 21 Sep 2023 17:09:18 +0800 (CST)
Message-ID: <728823a8-8892-e6e6-e004-427cfe23b233@loongson.cn>
Date: Thu, 21 Sep 2023 17:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: MAINTAINERS: Update drm-misc entry to match all drivers
To: Maxime Ripard <mripard@kernel.org>
References: <20230919131235.759959-1-mripard@kernel.org>
 <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
 <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxiuQzCAxlUS4NAA--.28708S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAF1rZF4rAFy7ZrW3urWkZrc_yoW5uFW7pF
 47JFyY9rs5AF4ay393t3WxCF1rAa1xZFWxK3sFgwnYvFn8AFy3tr9ay3Z8GFyUXr1xGr4x
 trn3G343ur43uFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
 6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFE__UUUUU=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/21 16:47, Maxime Ripard wrote:
> Hi,
>
> Adding Paul in Cc
>
> On Thu, Sep 21, 2023 at 04:25:50PM +0800, suijingfeng wrote:
>> On 2023/9/19 21:12, Maxime Ripard wrote:
>>> We've had a number of times when a patch slipped through and we couldn't
>>> pick them up either because our MAINTAINERS entry only covers the
>>> framework and thus we weren't Cc'd.
>>>
>>> Let's take another approach where we match everything, and remove all
>>> the drivers that are not maintained through drm-misc.
>>>
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>    MAINTAINERS | 23 ++++++++++++++++++++---
>>>    1 file changed, 20 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 90f13281d297..757d4f33e158 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
>>>    S:	Maintained
>>>    W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
>>>    T:	git git://anongit.freedesktop.org/drm/drm-misc
>>> +F:	Documentation/devicetree/bindings/display/
>>> +F:	Documentation/devicetree/bindings/gpu/
>>>    F:	Documentation/gpu/
>>> -F:	drivers/gpu/drm/*
>>> +F:	drivers/gpu/drm/
>>>    F:	drivers/gpu/vga/
>>> -F:	include/drm/drm*
>>> +F:	include/drm/drm
>>>    F:	include/linux/vga*
>>> -F:	include/uapi/drm/drm*
>>> +F:	include/uapi/drm/
>>> +X:	drivers/gpu/drm/amd/
>>> +X:	drivers/gpu/drm/armada/
>>> +X:	drivers/gpu/drm/etnaviv/
>>> +X:	drivers/gpu/drm/exynos/
>>> +X:	drivers/gpu/drm/gma500/
>>> +X:	drivers/gpu/drm/i915/
>>> +X:	drivers/gpu/drm/imx/
>>> +X:	drivers/gpu/drm/ingenic/
>>> +X:	drivers/gpu/drm/kmb/
>>> +X:	drivers/gpu/drm/mediatek/
>>> +X:	drivers/gpu/drm/msm/
>>> +X:	drivers/gpu/drm/nouveau/
>>> +X:	drivers/gpu/drm/radeon/
>>> +X:	drivers/gpu/drm/renesas/
>>> +X:	drivers/gpu/drm/tegra/
>>>    DRM DRIVERS FOR ALLWINNER A10
>>>    M:	Maxime Ripard <mripard@kernel.org>
>>
>> Nice patch!
>>
>> Well, I'm just curious about why the drm/ingenic and drm/gma500 are not maintained through drm-misc?
>>
>> As far as I know:
>> 1) the drm/ingenic driver don't have a "T" annotation (location of the link).
> Yeah, I wasn't sure about that one indeed. I remained conservative since it's a
> sensitive topic for some.
>
> Paul, is drm/ingenic supposed to be maintained through drm-misc? Either way,
> could you clarify which git tree is supposed to merge those patches in
> MAINTAINERS?
>
>> 2) the "T" of drm/gma500 is "git git://github.com/patjak/drm-gma500", but the
>    code for this link is not up to date.
>
> For gma500, I think it's mostly historical since it was there before drm-misc
> was a thing.
>
>> I think at least the drm/ingenic and drm/gma500 drivers are *actually*
>> maintained through drm-misc, So perhaps, these two drivers should not be
>> excluded. Am I correct?
> It's likely :)
>
> Either way, I think it can be solved/clarified later on


OK, that's sound fairly enough. I will respect you and Paul's opinion.
By the way, I also want to say that I think the drm/imb and various drm/imx drivers
are also belong to the drm-misc. They are also lack the "T" annotation.
Hopes someone can help to check that. Thanks.
Thanks for the patch.

> Maxime

