Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E002DC251
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CE88984E;
	Wed, 16 Dec 2020 14:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168686E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:35:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d26so10166203wrb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=XSQ515YX1lL7SdLjwXSi0+PfZjksYfxwOfIy/7hxa2Q=;
 b=M855+cec+7hhTRXCte9mdlQBN4qId6bRJgg47Kf/7eMbmLnJEsFDvuRfa4o+Ji2I0t
 aySnCxp+wx+F02X1ev/kfdgAhk3QKUZ07ZVXjf3ec1S6jK4A7KMKAtEhrxedRRYs7Ycx
 GhZUsHtxksIj/2Zz+wpjjwcpKQ/0XmrpgexYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=XSQ515YX1lL7SdLjwXSi0+PfZjksYfxwOfIy/7hxa2Q=;
 b=iOz3MjI0qhLnkdaDVY+hDSMj7o5TFHIKRk1gZRy2XizwfpgNk0q3ECgPmz8VpAew1F
 nGXYeUTWFSd4RxVzkatvapkfD4cUBZIR7BfyRai6V/LirhniqfjwInkuLierKXuiozoC
 4hXqF+RBOf8Z102RILO4HoPvbATRqa0gs4WR2QDNBbPjhYFFNupzNCL2RGUWL/NC7ll9
 mQHu8pDGVRAtxw68zYZsLRXNyU7u8F4QJG9babmVuWUo6xfeTP+NtYX00pY4g17tpqXL
 j7mYwMCTJ6D7lMM6KfVvePTrR7C/cAIVfuRh1uRSe/b1WoapjVRhNcAlGSy4ksKfsAxP
 pqNQ==
X-Gm-Message-State: AOAM532Yc7lVW3+y63TARDzIYvnJfzYMsMQ99aR8L+Lj1AbxHMoOBr+e
 55VjRkA/0kHh9AuE78wcfnUvjQ==
X-Google-Smtp-Source: ABdhPJw6sopHtFhuCuY7z9Og6UwUsCkiLLAibKTKR25cmQkf0cApYj5FT6xFl2X2Mz1oqEAGeg7PSQ==
X-Received: by 2002:adf:f845:: with SMTP id d5mr20121128wrq.182.1608129313750; 
 Wed, 16 Dec 2020 06:35:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 125sm2841371wmc.27.2020.12.16.06.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:35:12 -0800 (PST)
Date: Wed, 16 Dec 2020 15:35:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] MAINTAINERS: Update addresses for TI display drivers
Message-ID: <X9obHqQ0BBtZaSyz@phenom.ffwll.local>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 jyri.sarha@iki.fi, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, tomba@kernel.org
References: <20201216075917.17481-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216075917.17481-1-tomi.valkeinen@ti.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: tomba@kernel.org, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, jyri.sarha@iki.fi,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 09:59:17AM +0200, Tomi Valkeinen wrote:
> Update the maintainer email addresses for TI display drivers.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 281de213ef47..c21471497a18 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5932,8 +5932,8 @@ F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
>  F:	drivers/gpu/drm/stm
>  
>  DRM DRIVERS FOR TI KEYSTONE
> -M:	Jyri Sarha <jsarha@ti.com>
> -M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +M:	Jyri Sarha <jyri.sarha@iki.fi>
> +M:	Tomi Valkeinen <tomba@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> @@ -5943,15 +5943,15 @@ F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
>  F:	drivers/gpu/drm/tidss/
>  
>  DRM DRIVERS FOR TI LCDC
> -M:	Jyri Sarha <jsarha@ti.com>
> -R:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +M:	Jyri Sarha <jyri.sarha@iki.fi>
> +R:	Tomi Valkeinen <tomba@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/tilcdc/
>  F:	drivers/gpu/drm/tilcdc/
>  
>  DRM DRIVERS FOR TI OMAP
> -M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +M:	Tomi Valkeinen <tomba@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/ti/
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
