Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573E78EE67
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 15:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18A210E666;
	Thu, 31 Aug 2023 13:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E48410E666
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:18:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 360D6FEC
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:19:24 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D2B63F738
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:18:44 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:18:42 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 15/15] drm/panthor: Add an entry to MAINTAINERS
Message-ID: <ZPCTMnVb5FP0mRAe@e110455-lin.cambridge.arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-16-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230809165330.2451699-16-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On Wed, Aug 09, 2023 at 06:53:28PM +0200, Boris Brezillon wrote:
> Add an entry for the Panthor driver to the MAINTAINERS file.
> 
> v2:
> - New commit
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> 
> If anyone from Arm wants to volunteer to become a co-maintainer, that
> would be highly appreciated
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd882b87a3c6..6149ab68d461 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1624,6 +1624,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/panfrost/
>  F:	include/uapi/drm/panfrost_drm.h
>  
> +ARM MALI PANTHOR DRM DRIVER
> +M:	Boris Brezillon <boris.brezillon@collabora.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/panthor/
> +F:	include/uapi/drm/panthor_drm.h

Can we also add an entry for the bindings?

+F: Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml

Also, I would like to volunteer as maintainer alongside Steven, so can I
please get added too?

Best regards,
Liviu

> +
>  ARM MALI-DP DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau@arm.com>
>  S:	Supported
> -- 
> 2.41.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
