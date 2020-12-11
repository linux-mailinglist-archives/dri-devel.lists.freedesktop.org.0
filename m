Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93392D93FA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449B46E0C4;
	Mon, 14 Dec 2020 08:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF5786E8A6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 15:29:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 381FA31B;
 Fri, 11 Dec 2020 07:29:33 -0800 (PST)
Received: from [10.57.25.185] (unknown [10.57.25.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C6EF3F66B;
 Fri, 11 Dec 2020 07:29:30 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Thermal devfreq cooling improvements with Energy
 Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20201210143014.24685-1-lukasz.luba@arm.com>
 <04bdcc7a-c264-ffd2-89a2-5606e59ff786@arm.com>
 <7545df9d-9cbc-d35c-6d32-39c4f96cc216@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <20b01b9a-3ec6-4521-bcd1-a218199e1732@arm.com>
Date: Fri, 11 Dec 2020 15:29:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7545df9d-9cbc-d35c-6d32-39c4f96cc216@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, rui.zhang@intel.com,
 ionela.voinescu@arm.com, orjan.eide@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/11/20 3:15 PM, Daniel Lezcano wrote:
> On 11/12/2020 16:11, Lukasz Luba wrote:
>> Hi Daniel,
>>
>> Do you think it has chance to go to as material for v5.11?
> 
> Yes, it is in the thermal/linux-next material ATM.

Thank you!

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
