Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5704E3FDC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595B10E554;
	Tue, 22 Mar 2022 13:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2980689F47
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:54:20 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:34226.1760787978
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id C6CF010021F;
 Tue, 22 Mar 2022 21:54:10 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 ca0c77cdffc64f6694d6679e66913f76 for jiaxun.yang@flygoat.com; 
 Tue, 22 Mar 2022 21:54:18 CST
X-Transaction-ID: ca0c77cdffc64f6694d6679e66913f76
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <629311ac-f847-dd57-689e-eaa97aae8480@189.cn>
Date: Tue, 22 Mar 2022 21:54:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 5/7] dt-bindings: display: Add Loongson display
 controller
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-6-15330273260@189.cn>
 <YjkITWpbnCmhKaX+@robh.at.kernel.org>
 <f7eb61bc-6784-c77a-083f-7408c0a17e05@189.cn>
 <66ae2436-aa86-f583-85b4-d652273188e9@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <66ae2436-aa86-f583-85b4-d652273188e9@flygoat.com>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/22 21:08, Jiaxun Yang wrote:
>
>
> 在 2022/3/22 2:33, Sui Jingfeng 写道:
>>
>> On 2022/3/22 07:20, Rob Herring wrote:
>>> On Tue, Mar 22, 2022 at 12:29:14AM +0800, Sui Jingfeng wrote:
>>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>>
>>> Needs a commit message.
>>>
>>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>> Same person? Don't need both emails.
>>
>> Yes,  suijingfeng@loongson.cn is my company's email. But it can not 
>> be used to send patches to dri-devel,
>>
>> when send patches with this email, the patch will not be shown on 
>> patch works.
>>
>> Emails  are either blocked or got  rejected  by loongson's mail 
>> server.  It can only receive emails
>>
>> from you and other people, but not dri-devel. so have to use my 
>> personal email(15330273260@189.cn) to send patches.
> In this case you can just use your company's email to sign-off
> code and sending with your personal email. It's common practice.
>
> If you don't want to receiving kernel email in your company mailbox,
> you can add a entry in .mailmap .
>
|I'm using `git send-email -7 --cover-letter --annotate -v11` command to 
send patches, it will automatically sign off patches with the my private 
emails. |

> Thanks.
> - Jiaxun
