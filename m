Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4ADBC9D8C
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE4710EAA5;
	Thu,  9 Oct 2025 15:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8817A10EA9D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 15:47:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 234E91688;
 Thu,  9 Oct 2025 08:47:22 -0700 (PDT)
Received: from [10.1.34.29] (e122027.cambridge.arm.com [10.1.34.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2BE53F59E;
 Thu,  9 Oct 2025 08:47:28 -0700 (PDT)
Message-ID: <971fd0e3-474a-4685-ade2-f4563372f74d@arm.com>
Date: Thu, 9 Oct 2025 16:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] MAINTAINERS: Add Adrian Larumbe as Panfrost
 driver maintainer
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-13-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251007150216.254250-13-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 07/10/2025 16:01, Adrián Larumbe wrote:
> Add Adrian Larumbe as Panfrost driver maintainer.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Acked-by: Steven Price <steven.price@arm.com>

Welcome! And thank you for helping out.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5257d52679d6..cb68fdec3da4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2066,6 +2066,7 @@ F:	drivers/gpu/drm/arm/display/komeda/
>  ARM MALI PANFROST DRM DRIVER
>  M:	Boris Brezillon <boris.brezillon@collabora.com>
>  M:	Rob Herring <robh@kernel.org>
> +M:      Adrián Larumbe <adrian.larumbe@collabora.com>

NIT: it looks like you've used spaces not a tab.

Also while we're here...

@RobH: Does it still make sense for you to be listed as a maintainer? I
haven't seen you active on Panfrost for a while.

>  R:	Steven Price <steven.price@arm.com>

And given that I've been doing a fair bit of the merging recently I'm
wondering if I should upgrade myself to 'M'?

Thanks,
Steve

>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported

