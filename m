Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8D4950E1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FA3898E8;
	Thu, 20 Jan 2022 15:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72454898E8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:04:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c66so12680590wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 07:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+Aq1htCCe4J+KaYbiBgsGd/SMns1HeFPyllEeH0HLrE=;
 b=xDCfSkp4gVRyMCsNHMACNwvOjOLWGCCFvpl6FBksdSeKoOo8g6aWif0LxVqFjOA8K6
 SwgwL+uPlvH6X5/3gjhPYOvsH4UENcXKqKMQwxp9hLNBjiXf0PgD2pYGZNtl0Gm1VHL3
 WWOxhUf62gw61bEpmXA/voFCTI40ph5VuEWl+kUuds7jetvsgWyBD+vzhqGGncSGVSRI
 9QZqQzq+AOO1prrNXCDR9JIoLxWQBDBZRS2iSbsPNDuF6app0wb5qr0ONR+r9OQ1KkcN
 wViG/TyNyKD76jQEnzEXS6zldfkxblvIY691z0e8gIOaMgOGOnNPslRA/xTk6un6u4Ix
 yZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+Aq1htCCe4J+KaYbiBgsGd/SMns1HeFPyllEeH0HLrE=;
 b=27dzRVr1mPrsNcUi5NLzPiuNDtSeLLQ6GmwKq52ThyVsznjRNqWMTlSb7W81lj49on
 itK0RTXOB8TT8exXE8d66LqnE+b6FGhPs600dfCV5TO5PnF4T5rFiTI6np4azuTIMOkM
 0r5GpqiHVuhZOrOejvRqFb+sXxcukQZIsf9ygEdeYX6LIlGHonq0iyoc8ZmFdp3q23RJ
 dphK+p3aqjPLt4rx3yc7iMCVD2MebqrKzOEmhgYnqg6YOCMXS+zVZ+3wkx1PMGemEN6l
 UmTSUMCpzW1PcVOuwsTYZKPnzlqYlmYG+Au8jZF9lr1nFOztsSkcsodIPjCuTNnw9a5/
 rQ2w==
X-Gm-Message-State: AOAM533cTvo5EKLuhZ/ydrzwNptTIXqjwCQR+uO+z3n0tBlPKTfo+vXj
 Kjy7nYsDCuzmSLO4l/PJE0IJXg==
X-Google-Smtp-Source: ABdhPJxyBL43fH2rXCx547on3ZZXkYJE/PFoHnZpDzKy6MwUXjE0eMc+fSxR2ii4QVcAX1EUgjzuxg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr8271022wmc.35.1642691066931;
 Thu, 20 Jan 2022 07:04:26 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net.
 [86.15.223.86])
 by smtp.gmail.com with ESMTPSA id bg23sm3487872wmb.5.2022.01.20.07.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:04:26 -0800 (PST)
Date: Thu, 20 Jan 2022 15:04:24 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/2] dt-bindings: google,cros-ec: drop Enric Balletbo i
 Serra from maintainers
Message-ID: <Yel5+DiQoOtV7x6Q@google.com>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
 <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, linux-iio@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Glass <sjg@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022, Krzysztof Kozlowski wrote:

> Enric Balletbo i Serra emails bounce:
> 
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> 
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
>  .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
>  .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
>  Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -

>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -

Acked-by: Lee Jones <lee.jones@linaro.org>

>  5 files changed, 5 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
