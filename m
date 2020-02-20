Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004016661F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D106EE37;
	Thu, 20 Feb 2020 18:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF486EE37
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:22:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so3117001wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3/v5Hu91DzUTjSyXPg2lLYJt7Sv6ZPbFXaWSMfm6y6w=;
 b=IFFKH9WSN/QkXdBNv/+a6ztzExJPYnyrIrz0JQaY/T2fArtnPw/B5QOZQB5wpt5cal
 YSzdBpq5pCCrOcZ3OLx8tlH7TCSknC1JWiYyu7Xi0NSd+YczgkpStaEX+4nmPscxES73
 RO/g+cBFFEbHMd/Wnx0S0kU+WB4fvdo40A4+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3/v5Hu91DzUTjSyXPg2lLYJt7Sv6ZPbFXaWSMfm6y6w=;
 b=rtU6ynXKw9oyTSu3kPEbouUYlHopV3a4aKTQCcCnVt+LU8TT7qgsO4UvKGaRAl+i23
 FZg2fx86EkKZhWOj/sf9tKDGWftKd24gEv3NJctt7VXhSfLOPBNGRSx16eLcx6lf45Wt
 ELlOAAs7TrGIwnmdUmoMFEh7KD/Q/BfUb0k8pm0eomceRE4RZzIg7DABzzFN2dw3rboA
 nMXEK8jCVzO0WKUbE42bKQe0GVZzuFh3tbZLiJL64F5VI/nQykpa10mZ1lrVXNqT1PYP
 z/lYIcjLIMP+zsJg9yzSDQnY75NcG+sdqATuS0eqq16uaxr8xCBQs7mix2024QOsXjVY
 RwRg==
X-Gm-Message-State: APjAAAWba84+3iqkhlXrlzQ8CqznPRN6CS7gYylh225omi8Dsv/5S0lM
 jsDPX1B/6I04BKMKdWY00YcvTg==
X-Google-Smtp-Source: APXvYqwQkpdhBpgIVgxAMIpaA/XSea86r7YOUgGH22XQ48qcSeIYDdUhXZtgZobcVigyTIhr19VtfQ==
X-Received: by 2002:a05:600c:290e:: with SMTP id
 i14mr5856806wmd.139.1582222956457; 
 Thu, 20 Feb 2020 10:22:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm490337wrc.64.2020.02.20.10.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 10:22:35 -0800 (PST)
Date: Thu, 20 Feb 2020 19:22:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update myself email address
Message-ID: <20200220182234.GZ2363188@phenom.ffwll.local>
References: <20200220090328.25932-1-xinliang.liu@linaro.org>
 <20200220182141.GY2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220182141.GY2363188@phenom.ffwll.local>
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

On Thu, Feb 20, 2020 at 07:21:41PM +0100, Daniel Vetter wrote:
> On Thu, Feb 20, 2020 at 09:03:28AM +0000, Xinliang Liu wrote:
> > Update myself email address.
> > Add John Stultz as a reviewer. Thanks John.
> > Update git tree to drm-misc
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I guess you're going to push this to drm-misc?

Oh and I guess time for John Stultz to apply for drm-misc commit rights,
seems to be lacking.
-Daniel
> 
> > 
> > Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> > ---
> >  MAINTAINERS | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 978766c6715e..befc3c0afc75 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5600,12 +5600,13 @@ S:	Maintained
> >  F:	drivers/gpu/drm/gma500/
> >  
> >  DRM DRIVERS FOR HISILICON
> > -M:	Xinliang Liu <z.liuxinliang@hisilicon.com>
> > +M:	Xinliang Liu <xinliang.liu@linaro.org>
> >  M:	Rongrong Zou <zourongrong@gmail.com>
> > +R:	John Stultz <john.stultz@linaro.org>
> >  R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
> >  R:	Chen Feng <puck.chen@hisilicon.com>
> >  L:	dri-devel@lists.freedesktop.org
> > -T:	git git://github.com/xin3liang/linux.git
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> >  S:	Maintained
> >  F:	drivers/gpu/drm/hisilicon/
> >  F:	Documentation/devicetree/bindings/display/hisilicon/
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
