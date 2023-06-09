Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5F7297D4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8A10E698;
	Fri,  9 Jun 2023 11:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF3A110E68C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:08:24 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxOuonCINkzwoBAA--.3186S3;
 Fri, 09 Jun 2023 19:08:23 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxTMonCINk_uIKAA--.24411S3; 
 Fri, 09 Jun 2023 19:08:23 +0800 (CST)
Message-ID: <0ee84d8a-d2c9-07d0-b738-61fc7c568444@loongson.cn>
Date: Fri, 9 Jun 2023 19:08:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/4] PCI/VGA: Replace full MIT license text with SPDX
 identifier
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230609103321.629192-1-suijingfeng@loongson.cn>
 <20230609103321.629192-4-suijingfeng@loongson.cn> <87cz24rjgb.fsf@intel.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <87cz24rjgb.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxTMonCINk_uIKAA--.24411S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr4rZr4DJFW3Cr1kuw17Jwc_yoW5Xry7pr
 ySk3Z7CF4UXryxGrnFkr43tFy7X393AF47KFy7WFyS9rnFywn3Kr4qqr1rta43AFZ2k3yF
 vFy7XrWUWFnrZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
 6r17McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ag4DUUUUU==
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/9 18:58, Jani Nikula wrote:
> On Fri, 09 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> Per Documentation/process/license-rules.rst, the SPDX MIT identifier is
>> equivalent to including the entire MIT license text from
>> LICENSES/preferred/MIT.
>>
>> Replace the MIT license text with the equivalent SPDX identifier.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   include/linux/vgaarb.h | 30 +-----------------------------
>>   1 file changed, 1 insertion(+), 29 deletions(-)
>>
>> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
>> index 6d5465f8c3f2..341245205e1c 100644
>> --- a/include/linux/vgaarb.h
>> +++ b/include/linux/vgaarb.h
>> @@ -1,32 +1,4 @@
>> -/*
>> - * The VGA aribiter manages VGA space routing and VGA resource decode to
>> - * allow multiple VGA devices to be used in a system in a safe way.
> Why is this being removed?
>
>> - *
>> - * (C) Copyright 2005 Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> - * (C) Copyright 2007 Paulo R. Zanoni <przanoni@gmail.com>
>> - * (C) Copyright 2007, 2009 Tiago Vignatti <vignatti@freedesktop.org>
> Replacing the license text with SPDX is fine, removing copyright notices
> is not.

Sorry, I'm mindless

I should keep the copyright notices(original authors) there.

I will respin this patch. Thanks for pointed out.

> BR,
> Jani.
>
>> - *
>> - * Permission is hereby granted, free of charge, to any person obtaining a
>> - * copy of this software and associated documentation files (the "Software"),
>> - * to deal in the Software without restriction, including without limitation
>> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> - * and/or sell copies of the Software, and to permit persons to whom the
>> - * Software is furnished to do so, subject to the following conditions:
>> - *
>> - * The above copyright notice and this permission notice (including the next
>> - * paragraph) shall be included in all copies or substantial portions of the
>> - * Software.
>> - *
>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> - * DEALINGS
>> - * IN THE SOFTWARE.
>> - *
>> - */
>> +/* SPDX-License-Identifier: MIT */
>>   
>>   #ifndef LINUX_VGA_H
>>   #define LINUX_VGA_H

-- 
Jingfeng

