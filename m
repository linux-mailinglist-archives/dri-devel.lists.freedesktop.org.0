Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED9116661D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813E36EE3A;
	Thu, 20 Feb 2020 18:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994B96EE3A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:21:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so5754425wru.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FLQOH9riV6bFnFPNci/o2V3RsyT9zQcugeSuzJ4+APw=;
 b=bzP21wdaTykJ7XHCzZTKyLo7n9cas4Ot3nD7IR8LYB0jMXt8OVKomt6RHJfq0QlrpL
 BahOYtcez6AIRpFy4HNfR40VE92CMk38aabUWDbDBzKNQuEm2yd9JpAOWHJ4ltn4j+GA
 CAnaaqLOMlzY126ZCH883XVy6hH1y3QFkljMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FLQOH9riV6bFnFPNci/o2V3RsyT9zQcugeSuzJ4+APw=;
 b=DUzLr+1PGyFNtg992isUWVde4C4VM8+yZv73D1SfZGndpJUMVNvEDr7iVdMlqwhdbc
 uyLhaGeLqKAt46Iph7tX0xkw4EzjOhVTEvFre1fPKAFLPV8QceKHBIn2tzViVtWV7EpZ
 62pm6gyMnUZ56044ffF9/hvqTzGOJk+alyfjKcTNq8jtQxBXQ/TvbE283cU5BFrW+FFF
 Kom2SlmTO3muoJR7D2hMntrYDwfQMDNZ+HcgVFoSx+9qGEoYNgUiNLa7plLyX64LZPIv
 mPME0rgBL/coeYlv04jw4VTexHHiQIkdzJCmUQ+r/6Bpp9saUMBQfLn/fzABUw9Cjh5f
 uTRA==
X-Gm-Message-State: APjAAAWjcRqoBWdpX4yEj4clGejr/tSin0Pdqek0/rZuPlNf9dO2+ecB
 amKJTUwJiMWpRiDdWZA3jqlSofBuBEw=
X-Google-Smtp-Source: APXvYqw1ybsioYVYfKBGixZn5QL3Uy3/BZC3RQWesaOKICFKZWYG/xRUW5IyZmpycWFZcE2yTi8uLQ==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr45368799wrp.12.1582222904314; 
 Thu, 20 Feb 2020 10:21:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x7sm434828wrq.41.2020.02.20.10.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 10:21:43 -0800 (PST)
Date: Thu, 20 Feb 2020 19:21:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update myself email address
Message-ID: <20200220182141.GY2363188@phenom.ffwll.local>
References: <20200220090328.25932-1-xinliang.liu@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220090328.25932-1-xinliang.liu@linaro.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 09:03:28AM +0000, Xinliang Liu wrote:
> Update myself email address.
> Add John Stultz as a reviewer. Thanks John.
> Update git tree to drm-misc

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess you're going to push this to drm-misc?
-Daniel

> 
> Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 978766c6715e..befc3c0afc75 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5600,12 +5600,13 @@ S:	Maintained
>  F:	drivers/gpu/drm/gma500/
>  
>  DRM DRIVERS FOR HISILICON
> -M:	Xinliang Liu <z.liuxinliang@hisilicon.com>
> +M:	Xinliang Liu <xinliang.liu@linaro.org>
>  M:	Rongrong Zou <zourongrong@gmail.com>
> +R:	John Stultz <john.stultz@linaro.org>
>  R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
>  R:	Chen Feng <puck.chen@hisilicon.com>
>  L:	dri-devel@lists.freedesktop.org
> -T:	git git://github.com/xin3liang/linux.git
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/hisilicon/
>  F:	Documentation/devicetree/bindings/display/hisilicon/
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
