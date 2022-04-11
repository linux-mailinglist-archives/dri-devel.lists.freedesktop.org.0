Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E364FB50C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FFE10ED87;
	Mon, 11 Apr 2022 07:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29E910ED87;
 Mon, 11 Apr 2022 07:37:15 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae91f.dynamic.kabel-deutschland.de
 [95.90.233.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7D59561EA1923;
 Mon, 11 Apr 2022 09:37:13 +0200 (CEST)
Message-ID: <76171e7d-43f0-fb7b-6e58-8a09c8f43e88@molgen.mpg.de>
Date: Mon, 11 Apr 2022 09:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: Richard Gong <richard.gong@amd.com>
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <44354d78-b340-fbc4-fd6c-060d7ad3404e@molgen.mpg.de>
 <cacb177f-20e2-b50a-806f-777837fba693@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <cacb177f-20e2-b50a-806f-777837fba693@amd.com>
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
Cc: airlied@linux.ie, xinhui.pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Richard,


Thank you for your response, but please reply to your own reply next time.

Am 11.04.22 um 02:37 schrieb Gong, Richard:
> 
> On 4/8/2022 7:19 PM, Paul Menzel wrote:

>> Thank you for your patch.
>>
>> Am 08.04.22 um 21:05 schrieb Richard Gong:
>>> Active State Power Management (ASPM) feature is enabled since kernel 
>>> 5.14.
>>> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
>>> used with Intel AlderLake based systems to enable ASPM. Using these GFX
>>
>> Alder Lake
> Actually there are 2 formats (one with space, another is w/o space) in 
> the upstream sources, so I will keep that unchanged and use the format 
> w/o space.

Do you mean the Linux kernel sources? Anyway, please use the correct 
spelling [1].


Kind regards,

Paul


[1]: 
https://ark.intel.com/content/www/us/en/ark/products/codename/147470/products-formerly-alder-lake.html
[2]: https://en.wikipedia.org/wiki/Alder_Lake
