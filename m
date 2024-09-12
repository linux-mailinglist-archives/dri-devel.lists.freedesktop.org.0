Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAF3976CF5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 17:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADCD10EBC4;
	Thu, 12 Sep 2024 15:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="V+lSdM29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789910EBC4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 15:04:20 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4LLq5xMLzDqpj;
 Thu, 12 Sep 2024 15:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726153460; bh=COHs87GVxy5Lw05efQyeO4Rt+U9sNmcRpFGBuku0KwM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=V+lSdM29xRXmS++zuqjAtIU6xS/exkwjEu1Mmvt6W/iNkRUL+N40WvVRlq2QLGg+D
 Q7JznIzH5Yuo0tXvEfJ80Zgq0ebcSeYF51LnU5BnhtSzC83kHFc0ifK/ICxbAkpRha
 yOSWE6xBQZbKf4CQhCPI5EWRJoch0CpOnbAYissk=
X-Riseup-User-ID: DCD0941570C4622093E0E8E6210C22C8A04D7AE62FD600F173C3BD9F25EB9400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4X4LLX3b67zJsSh;
 Thu, 12 Sep 2024 15:04:04 +0000 (UTC)
Message-ID: <386b3df4-dade-4ad0-b17a-3582b917b640@riseup.net>
Date: Thu, 12 Sep 2024 12:04:01 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as VKMS Maintainer
To: Maxime Ripard <mripard@kernel.org>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, sean@poorly.run, thomas.petazzoni@bootlin.com,
 linux-kernel@vger.kernel.org, seanpaul@google.com
References: <20240910-vkms-maintainer-v1-1-e7a6c7a4ae71@bootlin.com>
 <68da3932-10ab-4001-a978-f0f54034a64d@riseup.net>
 <ZuGJyfhkQe93jKlz@louis-chauvet-laptop>
 <20240911-functional-finch-of-competition-ad54e9@houat>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20240911-functional-finch-of-competition-ad54e9@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/11/24 10:01, Maxime Ripard wrote:
> On Wed, Sep 11, 2024 at 02:15:05PM GMT, Louis Chauvet wrote:
>> Le 10/09/24 - 15:57, Maira Canal a écrit :
>>> On 9/10/24 12:10, Louis Chauvet wrote:
>>>> I've been actively working on VKMS to provide new features and
>>>> participated in reviews and testing. To help Maìra with her work, add
>>>> myself as co-maintainer of VKMS.
>>>>
>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>
>>> Acked-by: Maíra Canal <mairacanal@riseup.net>
>>>
>>> Please, check the procedures to apply for commit rights in drm-misc and
>>> apply it. This way you will be able to commit your patches.
>>
>> Thanks for your support!
>>
>> I just checked the rules to become a commiter, and it requires at least 10
>> non-trivial patches, so I can't apply right now.
> 
> As far as I'm concerned, being a maintainer of a driver in drm-misc
> gives you automatically that right :)

+1

Best Regards,
- Maíra

> 
> Maxime
