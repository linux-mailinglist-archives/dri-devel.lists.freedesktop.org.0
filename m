Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B781137A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 14:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C610E1BE;
	Wed, 13 Dec 2023 13:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 690D410E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 13:51:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12916C15;
 Wed, 13 Dec 2023 05:51:55 -0800 (PST)
Received: from [10.57.86.164] (unknown [10.57.86.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CA9A3F738;
 Wed, 13 Dec 2023 05:51:05 -0800 (PST)
Message-ID: <a1fe90bd-e852-475c-953e-ea51c118f68a@arm.com>
Date: Wed, 13 Dec 2023 13:51:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] drm/panthor: Add an entry to MAINTAINERS
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-15-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231204173313.2098733-15-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 17:33, Boris Brezillon wrote:
> Add an entry for the Panthor driver to the MAINTAINERS file.
> 
> v3:
> - Add bindings document as an 'F:' line.
> - Add Steven and Liviu as co-maintainers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

I'm not sure why my signed-off is here, but FWIW:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ba904b46efe..8d250ee2975f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1648,6 +1648,17 @@ F:	Documentation/gpu/panfrost.rst
>  F:	drivers/gpu/drm/panfrost/
>  F:	include/uapi/drm/panfrost_drm.h
>  
> +ARM MALI PANTHOR DRM DRIVER
> +M:	Boris Brezillon <boris.brezillon@collabora.com>
> +M:	Steven Price <steven.price@arm.com>
> +M:	Liviu Dudau <liviu.dudau@arm.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +F:	drivers/gpu/drm/panthor/
> +F:	include/uapi/drm/panthor_drm.h
> +
>  ARM MALI-DP DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau@arm.com>
>  S:	Supported

