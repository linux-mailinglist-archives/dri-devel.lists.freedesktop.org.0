Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4195724CF7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39E10E39A;
	Tue,  6 Jun 2023 19:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3511910E267;
 Tue,  6 Jun 2023 19:24:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxi+rrh39k600AAA--.736S3;
 Wed, 07 Jun 2023 03:24:28 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbMrrh39k5f8CAA--.3429S3; 
 Wed, 07 Jun 2023 03:24:27 +0800 (CST)
Message-ID: <516bcf93-2a57-f87a-49b4-c8977d48b554@loongson.cn>
Date: Wed, 7 Jun 2023 03:24:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: display/Kconfig: replace leading spaces with
 tab
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230606133328.148490-1-suijingfeng@loongson.cn>
 <CADnq5_MdNSBJuNrJC2-fRByhEoUqEJmMGATT+OrFvjqA7k4F5Q@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <CADnq5_MdNSBJuNrJC2-fRByhEoUqEJmMGATT+OrFvjqA7k4F5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxbMrrh39k5f8CAA--.3429S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw18XrykZF4fKrW5uFyxXrc_yoW8XFyrp3
 98C3Z09rWUJF1Yy39rA3WfWFy5Ga93JFyUKryDG343Za4DAF1xGrWkKFWYgrZrXFyxAa1r
 ZFZ5WF42v3WqkrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
 XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
 k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
 4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcwIDDUUUU
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
Cc: Leo Li <sunpeng.li@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks a lot.


On 2023/6/7 03:15, Alex Deucher wrote:
> Applied.  Thanks!
>
> Alex
>
> On Tue, Jun 6, 2023 at 9:33 AM Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> This patch replace the leading spaces with tab, make them keep aligned with
>> the rest of the config options. No functional change.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/amd/display/Kconfig | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
>> index 2d8e55e29637..04ccfc70d583 100644
>> --- a/drivers/gpu/drm/amd/display/Kconfig
>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>> @@ -42,16 +42,13 @@ config DEBUG_KERNEL_DC
>>            Choose this option if you want to hit kdgb_break in assert.
>>
>>   config DRM_AMD_SECURE_DISPLAY
>> -        bool "Enable secure display support"
>> -        depends on DEBUG_FS
>> -        depends on DRM_AMD_DC_FP
>> -        help
>> -            Choose this option if you want to
>> -            support secure display
>> -
>> -            This option enables the calculation
>> -            of crc of specific region via debugfs.
>> -            Cooperate with specific DMCU FW.
>> +       bool "Enable secure display support"
>> +       depends on DEBUG_FS
>> +       depends on DRM_AMD_DC_FP
>> +       help
>> +         Choose this option if you want to support secure display
>>
>> +         This option enables the calculation of crc of specific region via
>> +         debugfs. Cooperate with specific DMCU FW.
>>
>>   endmenu
>> --
>> 2.25.1
>>
-- 
Jingfeng

