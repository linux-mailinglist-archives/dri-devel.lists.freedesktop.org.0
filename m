Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770443521D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FCF89C61;
	Wed, 20 Oct 2021 17:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A34689BB0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:57:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso3505847wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eUXnYsZJvnOAF9kzZYgcYvLxfHgvnwyAqbl51jXHyOk=;
 b=5SRvDSnW9NALjwV2LaLE+zMHcgRRVEur9K+oWOkjkMa/ekGvFZUUWHhW9wUXIuQQFC
 /a8o1NfWJf7n8u1WCsgJ6DZ9GzXI/vxRCErkva+u6IIt3Ftot2dLC5WyXE/qEkDejh1O
 kVqvbLZLsY4DiTy7nVUI0vKMtRJFIRvZDD1t4btCIGXSU0hbMQMrdw0UCQ2wHqq9fBJR
 XWDbyugS/eLkDqzecFcAtr+OSwjbVGG85VaokC0qIQ/n+uJRoJUbG37x3AckVjjiRCnA
 lG8sEAiA+g4Ih121u9/zb9evJ+eGwkaeaJ5PL8bBFb99jNQJs00eYaRrjJiruivZ0pZW
 5+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eUXnYsZJvnOAF9kzZYgcYvLxfHgvnwyAqbl51jXHyOk=;
 b=WNjFC1g192VmaC2j++KsXDog2gtPKCXrJPjRKUyizv1gEfjRR2M2Kqcf8B1L3hakjm
 tv+S4QqCqDtsiUD+3c4bG9a1YVkjlLoAh6WXq6WXilyZm1IIukyO7iJBBvBQDC8XchSq
 rAEx9OdUT3C6RHK12xwFQOqhkmJfk3ZLR2fZyzJP60tDY2UXhCuK+Ywj8GfxqcvVsoen
 YkXVqh0KDiL5Cm90rOhDe3b4Q6sgaZATzdK+/XXG6m2uGf6Wf/OTQzxDRuJOseAVP5Wu
 4Ky6bDbozFUejd+ojRGwZrqo4dWtxrnEfwWZIcMhzozsnyJ35uCgxTTh5M2/xHmGmJ64
 3/jg==
X-Gm-Message-State: AOAM533nLp16IwHNvnZweLpCPOHBeP2KkCU9ZGufR2/XADVvimfGfYzu
 dS1ILDZ2oX1PaMDXaYMAZSCOYw==
X-Google-Smtp-Source: ABdhPJw5z4pbgVNM5h6MqZvS0r0oCzcOE1i7EGAQsH0+8u7iGi3dGj0Z2eWsGRLSNwQEx+5xxoBcfQ==
X-Received: by 2002:a05:600c:892:: with SMTP id
 l18mr784909wmp.89.1634752641318; 
 Wed, 20 Oct 2021 10:57:21 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:d31f:1512:8915:e439?
 ([2001:861:44c0:66c0:d31f:1512:8915:e439])
 by smtp.gmail.com with ESMTPSA id s186sm3164965wme.14.2021.10.20.10.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:57:20 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Update email of Andrzej Hajda
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211018211353.586986-1-andrzej.hajda@intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1425b43a-e5ce-b70e-3c9d-a8735860baa5@baylibre.com>
Date: Wed, 20 Oct 2021 19:57:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018211353.586986-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 18/10/2021 23:13, Andrzej Hajda wrote:
> Beside updating email, the patch updates maintainers
> of Samsung drivers.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  .mailmap    |  1 +
>  MAINTAINERS | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 4f6e37da60589..4283a86f70d26 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -40,6 +40,7 @@ Andrew Vasquez <andrew.vasquez@qlogic.com>
>  Andrey Konovalov <andreyknvl@gmail.com> <andreyknvl@google.com>
>  Andrey Ryabinin <ryabinin.a.a@gmail.com> <a.ryabinin@samsung.com>
>  Andrey Ryabinin <ryabinin.a.a@gmail.com> <aryabinin@virtuozzo.com>
> +Andrzej Hajda <andrzej.hajda@intel.com> <a.hajda@samsung.com>
>  Andy Adamson <andros@citi.umich.edu>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54cd05d3aab65..e3fadb4ebced3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2546,7 +2546,7 @@ N:	s3c64xx
>  N:	s5pv210
>  
>  ARM/SAMSUNG S5P SERIES 2D GRAPHICS ACCELERATION (G2D) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Łukasz Stelmach <l.stelmach@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> @@ -2570,7 +2570,8 @@ S:	Maintained
>  F:	drivers/media/platform/s5p-jpeg/
>  
>  ARM/SAMSUNG S5P SERIES Multi Format Codec (MFC) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Marek Szyprowski <m.szyprowski@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> @@ -6254,7 +6255,7 @@ F:	Documentation/devicetree/bindings/display/atmel/
>  F:	drivers/gpu/drm/atmel-hlcdc/
>  
>  DRM DRIVERS FOR BRIDGE CHIPS
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  M:	Neil Armstrong <narmstrong@baylibre.com>
>  M:	Robert Foss <robert.foss@linaro.org>
>  R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> @@ -16748,13 +16749,15 @@ F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
>  F:	drivers/nfc/s3fwrn5

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

>  
>  SAMSUNG S5C73M3 CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/i2c/s5c73m3/*
>  
>  SAMSUNG S5K5BAF CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/i2c/s5k5baf.c
> 

