Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586A7725B0D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A45210E4A7;
	Wed,  7 Jun 2023 09:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C029F10E4A7;
 Wed,  7 Jun 2023 09:49:51 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Ax3eq8UoBkDRkAAA--.362S3;
 Wed, 07 Jun 2023 17:49:48 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxKeW6UoBk70AEAA--.15579S3; 
 Wed, 07 Jun 2023 17:49:47 +0800 (CST)
Message-ID: <6a765dff-b3ed-3027-dcf8-7883ca46ea4e@loongson.cn>
Date: Wed, 7 Jun 2023 17:49:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: display/Kconfig: replace leading spaces with
 tab
To: "Chen, Guchun" <Guchun.Chen@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20230606133328.148490-1-suijingfeng@loongson.cn>
 <CADnq5_MdNSBJuNrJC2-fRByhEoUqEJmMGATT+OrFvjqA7k4F5Q@mail.gmail.com>
 <85b7bf66-840b-c6de-a7e3-be1f49953464@loongson.cn>
 <7db6a90f-1929-5e36-3f1d-c96acb5c70a1@loongson.cn>
 <DM5PR12MB2469E5DA60D629BBEC0A6157F153A@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <DM5PR12MB2469E5DA60D629BBEC0A6157F153A@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxKeW6UoBk70AEAA--.15579S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4fXry7uFWfJw45AF4UWrX_yoW5CFy5pw
 43AFn0kF4DXF1rt3srta4fWF15tan3tFy8XryDGw1UZryqvF1SgrWkKrs8ur95ZF1xCa1r
 ZFyrWF47W3WFyrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
 wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr
 0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU
 FyCJUUUUU
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/7 17:09, Chen, Guchun wrote:
> [Public]
>
> It's https://gitlab.freedesktop.org/agd5f/linux/-/tree/amd-staging-drm-next?ref_type=heads. Latest patches including yours's will be pushed to this branch after a while.

Now I know,  thanks for your kindness reply.

> Regards,
> Guchun
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Sui
>> Jingfeng
>> Sent: Wednesday, June 7, 2023 2:34 PM
>> To: Alex Deucher <alexdeucher@gmail.com>
>> Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; David Airlie
>> <airlied@gmail.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, Rodrigo
>> <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Daniel Vetter
>> <daniel@ffwll.ch>; Deucher, Alexander <Alexander.Deucher@amd.com>;
>> Wentland, Harry <Harry.Wentland@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>
>> Subject: Re: [PATCH] drm/amdgpu: display/Kconfig: replace leading spaces
>> with tab
>>
>> https://cgit.freedesktop.org/amd/drm-amd/
>>
>>
>> This one has a long time with no update.
>>
>>
>> On 2023/6/7 14:31, Sui Jingfeng wrote:
>>> Hi,
>>>
>>> On 2023/6/7 03:15, Alex Deucher wrote:
>>>> Applied.  Thanks!
>>> Where is the official branch of drm/amdgpu, I can't find it on the
>>> internet.
>>>
>>> Sorry for asking this silly question.
>>>> Alex
>>>>
>>>> On Tue, Jun 6, 2023 at 9:33 AM Sui Jingfeng <suijingfeng@loongson.cn>
>>>> wrote:
>>>>> This patch replace the leading spaces with tab, make them keep
>>>>> aligned with the rest of the config options. No functional change.
>>>>>
>>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/display/Kconfig | 17 +++++++----------
>>>>>    1 file changed, 7 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/Kconfig
>>>>> b/drivers/gpu/drm/amd/display/Kconfig
>>>>> index 2d8e55e29637..04ccfc70d583 100644
>>>>> --- a/drivers/gpu/drm/amd/display/Kconfig
>>>>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>>>>> @@ -42,16 +42,13 @@ config DEBUG_KERNEL_DC
>>>>>             Choose this option if you want to hit kdgb_break in assert.
>>>>>
>>>>>    config DRM_AMD_SECURE_DISPLAY
>>>>> -        bool "Enable secure display support"
>>>>> -        depends on DEBUG_FS
>>>>> -        depends on DRM_AMD_DC_FP
>>>>> -        help
>>>>> -            Choose this option if you want to
>>>>> -            support secure display
>>>>> -
>>>>> -            This option enables the calculation
>>>>> -            of crc of specific region via debugfs.
>>>>> -            Cooperate with specific DMCU FW.
>>>>> +       bool "Enable secure display support"
>>>>> +       depends on DEBUG_FS
>>>>> +       depends on DRM_AMD_DC_FP
>>>>> +       help
>>>>> +         Choose this option if you want to support secure display
>>>>>
>>>>> +         This option enables the calculation of crc of specific
>>>>> region via
>>>>> +         debugfs. Cooperate with specific DMCU FW.
>>>>>
>>>>>    endmenu
>>>>> --
>>>>> 2.25.1
>>>>>
>> --
>> Jingfeng

-- 
Jingfeng

