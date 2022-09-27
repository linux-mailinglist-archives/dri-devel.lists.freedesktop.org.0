Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF755EBF22
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 12:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD8F10E3E4;
	Tue, 27 Sep 2022 10:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBD610E572
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 10:02:02 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1od7PL-0008JS-DY; Tue, 27 Sep 2022 12:01:43 +0200
Message-ID: <69b833f3e386018999f258b27bef0baeb27fb256.camel@pengutronix.de>
Subject: Re: [PATCH] headers: Remove some left-over license text in
 include/uapi/drm/
From: Lucas Stach <l.stach@pengutronix.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Russell King
 <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Christian Gmeiner <christian.gmeiner@gmail.com>, Inki
 Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Date: Tue, 27 Sep 2022 12:01:39 +0200
In-Reply-To: <e5cacd121ddb2a595cede602036b1bdfbee020d5.1664113376.git.christophe.jaillet@wanadoo.fr>
References: <e5cacd121ddb2a595cede602036b1bdfbee020d5.1664113376.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, dem 25.09.2022 um 15:43 +0200 schrieb Christophe JAILLET:
> There is already a SPDX-License-Identifier tag, so the corresponding
> license text can be removed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For the etnaviv part:
Acked-by: Lucas Stach <l.stach@pengutronix.de>

Regards,
Lucas

> ---
>  include/uapi/drm/armada_drm.h  |  4 ----
>  include/uapi/drm/etnaviv_drm.h | 12 ------------
>  include/uapi/drm/exynos_drm.h  |  5 -----
>  include/uapi/drm/omap_drm.h    | 12 ------------
>  4 files changed, 33 deletions(-)
> 
> diff --git a/include/uapi/drm/armada_drm.h b/include/uapi/drm/armada_drm.h
> index af1c14c837c5..f711e63a9758 100644
> --- a/include/uapi/drm/armada_drm.h
> +++ b/include/uapi/drm/armada_drm.h
> @@ -2,10 +2,6 @@
>  /*
>   * Copyright (C) 2012 Russell King
>   *  With inspiration from the i915 driver
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
>   */
>  #ifndef DRM_ARMADA_IOCTL_H
>  #define DRM_ARMADA_IOCTL_H
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
> index af024d90453d..13dd1d1a9d41 100644
> --- a/include/uapi/drm/etnaviv_drm.h
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -1,18 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
>   * Copyright (C) 2015 Etnaviv Project
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published by
> - * the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #ifndef __ETNAVIV_DRM_H__
> diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
> index a51aa1c618c1..a96fa566433c 100644
> --- a/include/uapi/drm/exynos_drm.h
> +++ b/include/uapi/drm/exynos_drm.h
> @@ -6,11 +6,6 @@
>   *	Inki Dae <inki.dae@samsung.com>
>   *	Joonyoung Shim <jy0922.shim@samsung.com>
>   *	Seung-Woo Kim <sw0312.kim@samsung.com>
> - *
> - * This program is free software; you can redistribute  it and/or modify it
> - * under  the terms of  the GNU General  Public License as published by the
> - * Free Software Foundation;  either version 2 of the  License, or (at your
> - * option) any later version.
>   */
>  
>  #ifndef _UAPI_EXYNOS_DRM_H_
> diff --git a/include/uapi/drm/omap_drm.h b/include/uapi/drm/omap_drm.h
> index 5a142fad473c..b51dad32122d 100644
> --- a/include/uapi/drm/omap_drm.h
> +++ b/include/uapi/drm/omap_drm.h
> @@ -4,18 +4,6 @@
>   *
>   * Copyright (C) 2011 Texas Instruments
>   * Author: Rob Clark <rob@ti.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published by
> - * the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #ifndef __OMAP_DRM_H__


