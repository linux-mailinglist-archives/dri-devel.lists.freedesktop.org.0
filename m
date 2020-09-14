Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005DF2698EF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AA86E7DD;
	Mon, 14 Sep 2020 22:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC7A6E7DD;
 Mon, 14 Sep 2020 22:34:26 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z13so1904835iom.8;
 Mon, 14 Sep 2020 15:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qawHL//JCsl3s+o/MBQptvseieD2pIXqGeERB4s68y0=;
 b=jGtJzf5c+PrQpK/zNEjvC0REZZIrlsrnRir7wguaZ7ORQaQcQTiMvBMvLSwtsRXG3a
 kpKekS5iWfYa+NTcjjZDosK+scNSuO1WrgX/SM2jjslF9RWy1E7l+thyvj370Weln3I/
 h9SO33cfVpp92vXAEexQL30e7T4+oNR/W4NPRv/W9ecG3T3+I9RSEe/FEc522ABlsyCX
 EsucQqjPuGXQZTQwFtreKP4o1wgkZyn68s3mLT787Ux1rqkuGEU88fPntnk+oev/6Sjw
 Fi60FDn/OfeTMauNrSyqrJhvHxZRB6xW2xadIpqUAEroz0p4T8FSR2eIvakPsOuoNKFy
 MFFw==
X-Gm-Message-State: AOAM533IK9uJkMy3blj7c8i5VXI804YSv9QFnagxE160Uz9m6ur6qxJz
 /K4dPxuqrM9tfWA9cKCehg==
X-Google-Smtp-Source: ABdhPJzIqAUlesX+PcK3HAo1XZVOGkzfK7XNe09zz72N2Yn2JpGtqmogpPHH5kwRGbL/iuCPfuI3Fw==
X-Received: by 2002:a05:6638:22ba:: with SMTP id
 z26mr15372869jas.55.1600122866346; 
 Mon, 14 Sep 2020 15:34:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w15sm7615180ilq.46.2020.09.14.15.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:34:25 -0700 (PDT)
Received: (nullmailer pid 388721 invoked by uid 1000);
 Mon, 14 Sep 2020 22:34:22 -0000
Date: Mon, 14 Sep 2020 16:34:22 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 05/13] dt-bindings: gpu: vivante, gc: Remove trailing
 whitespace
Message-ID: <20200914223422.GA388670@bogus>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-6-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Li Yang <leoyang.li@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Sep 2020 16:53:04 +0200, Krzysztof Kozlowski wrote:
> Remove whitespace at the end of line.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/vivante,gc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
