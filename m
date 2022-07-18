Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D4577D05
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D111CAC3AA;
	Mon, 18 Jul 2022 08:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9F3AC39D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:01:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a5so15810151wrx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EK/PyrCNkBnlX66xu/A86VOtZLOGQOnQ3EAsI4jwwLs=;
 b=E/xeUuNs05KUVADZyJyNFUpKuJxRdu9NEFLMOZCBcuN952j/Owkme851aSvCKNGbTI
 J82pNKaUZXW3MsXfgYQkmqYPtSSJRpnlnIKW1x6ZXbsHb0QgX/4a7Y/Nl8QEG8JfdyrX
 NxF2jaTlYAQL/ftGR2uVIoyjx7hIbhS2IBdKUkYSWpMZlvIjyuXBK4LF3T3WAeD/37Di
 qR6hhfA2QZgCGfuRR5PK5Nb9girdvMVAY2f8Z29sfAvoAzz1jjp/Z6FRUDdtqW4xjJcu
 UZo6H8KySzH/MzRnoxUadpkyPBoUZ6hBepSGg/z4fIxR8vY2An1ILVTGNJvk3B+haKIJ
 YJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EK/PyrCNkBnlX66xu/A86VOtZLOGQOnQ3EAsI4jwwLs=;
 b=1oEeaClLKsADP+9gk+6tyrAy3pggmoiEtTtJC4juchRrBO4QyBu2RXwicoi4HrabIV
 B8Ibq3oMzaUTH5jnxy/iyxkikVZ1McyszKRzReJFaDFm6E1Q6vZXAl/TsRC4wqrC71/g
 j9m9v2qBbKt6Dzm7tKL4RcEvYYJycXUE0Q5rrtRYXY4l0QD8lzdliJcNgki/rYYdESWC
 SXge5sY5xfLIZVoWsec+PWrcLnUQ35xSWaLmBVlDIPWZScEv0laCFY/Bf0Ya8WCmi3tm
 hxclgGFpHFmpDUrAHX2ESzqXokbvek/79H6X5k7tN4+nnLd7DHOD0AlD2A25j2x/MgWr
 1+lA==
X-Gm-Message-State: AJIora/rP+WWTz80WZYYPsTLjrlsBgA70KVzB/ypov5cLTT8/XAyWs5b
 mwqJRp/juoDdpUzdE+/Z3Ul7OYuuuY+lkQ==
X-Google-Smtp-Source: AGRyM1unlywfMyuuEeydp83qp+LPcuTnNl9wvgjw97RxHNFjcTn8eB3huN0ScUhpFPsixl9pOgD0Yg==
X-Received: by 2002:a05:6000:2a7:b0:21d:bbda:4fcd with SMTP id
 l7-20020a05600002a700b0021dbbda4fcdmr21765520wry.316.1658131317400; 
 Mon, 18 Jul 2022 01:01:57 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 z24-20020a05600c221800b003a310fe1d75sm8681894wml.38.2022.07.18.01.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 01:01:57 -0700 (PDT)
Date: Mon, 18 Jul 2022 09:01:55 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: backlight: Update Lee Jones' email
 address
Message-ID: <YtUTc4rUQLb6dYrM@google.com>
References: <20220714112533.539910-1-lee@kernel.org>
 <20220714112533.539910-7-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220714112533.539910-7-lee@kernel.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jul 2022, Lee Jones wrote:

> Going forward, I'll be using my kernel.org for upstream work.
> 
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-leds@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  Documentation/devicetree/bindings/leds/backlight/common.yaml    | 2 +-
>  .../devicetree/bindings/leds/backlight/gpio-backlight.yaml      | 2 +-
>  .../devicetree/bindings/leds/backlight/led-backlight.yaml       | 2 +-
>  .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml   | 2 +-
>  .../devicetree/bindings/leds/backlight/pwm-backlight.yaml       | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
