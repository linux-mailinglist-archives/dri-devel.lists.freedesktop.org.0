Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245139261DC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BBD10E1B8;
	Wed,  3 Jul 2024 13:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CC8110E1B8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:29:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B10A7367;
 Wed,  3 Jul 2024 06:30:23 -0700 (PDT)
Received: from [10.1.37.29] (e122027.cambridge.arm.com [10.1.37.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED0D83F762;
 Wed,  3 Jul 2024 06:29:55 -0700 (PDT)
Message-ID: <3f35f423-e6dc-4a14-80dd-273c73cc1c55@arm.com>
Date: Wed, 3 Jul 2024 14:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Mark simple_ondemand governor as softdep
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Furkan Kardame <f.kardame@manjaro.org>, stable@vger.kernel.org
References: <4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org>
 <f672e7460c92bc9e0c195804f7e99d0b@manjaro.org>
 <20240703152018.02e4e461@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240703152018.02e4e461@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/07/2024 14:20, Boris Brezillon wrote:
> On Wed, 03 Jul 2024 14:42:37 +0200
> Dragan Simic <dsimic@manjaro.org> wrote:
> 
>> Hello everyone,
>>
>> On 2024-06-17 22:17, Dragan Simic wrote:

<snip>

>>
>> Just checking, could this patch be accepted, please?
> 
> Yes, sorry for the delay. Here's my
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Steve, any objection?

Nope, our messages crossed in the post ;)

I'll push to drm-misc-next.

Thanks,
Steve

