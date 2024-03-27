Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C888E20B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 14:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7E610EDAD;
	Wed, 27 Mar 2024 13:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y7jtTKcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3619D10EDAD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 13:18:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75E1A675;
 Wed, 27 Mar 2024 14:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711545457;
 bh=K5p0LQUVGEjvqZlnZQdHgOEYJ2uEEM4vsv9v1Xr+OhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y7jtTKcr2CCJPe2Q35s1BtZbsbxNS9bdvXO5tUBBMTz/t9tWOeuEfmvtNrDI2TEiG
 BxiNafgPsql1Qg6JkM9UTC4xTDDRrp4QOM/idKGkGFmTpYLsWFruNwZAzGWpvUY3+v
 3WQTEc1Ot0102n8nV6IkhmFjIouj5OGvpPVyjqrA=
Date: Wed, 27 Mar 2024 15:18:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer for Xilinx DRM
 drivers
Message-ID: <20240327131800.GA4666@pendragon.ideasonboard.com>
References: <20240327-xilinx-maintainer-v1-1-c5fdc115f448@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240327-xilinx-maintainer-v1-1-c5fdc115f448@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Wed, Mar 27, 2024 at 03:03:33PM +0200, Tomi Valkeinen wrote:
> Add myself as a co-maintainer for Xilinx DRM drivers to help Laurent.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Much appreciated :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1aabf1c15bb3..79ef5a6bf21b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7306,6 +7306,7 @@ F:	drivers/gpu/drm/xen/
>  
>  DRM DRIVERS FOR XILINX
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> 
> ---
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> change-id: 20240327-xilinx-maintainer-f6020f6cba4d

-- 
Regards,

Laurent Pinchart
