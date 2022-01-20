Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240E1495542
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 21:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4607010E6D4;
	Thu, 20 Jan 2022 20:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7DA10E6D4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 20:07:55 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id bb37so10581822oib.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 12:07:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0IU04w6lXoVf2p8qlGn0KSlHKzkwLNdQp08IC4sJHbo=;
 b=VPs+lD6RkMDqvWYfvhwouccq9Y5stPjALd8ATNZ4sgyebOnIitanqQoQdXZxQZEeGL
 V88fIfoll27OnwqWzDMoEL07EFi/5Ptv7+2jobQZwP1j/s+D69UlW2EbDhJAeB3MUGBd
 NZYrHoJPLIDUPImew/ojkx0wAAY8J2t29DgIYCCUHawNCy45oa6GR6Pv59U655a8vEJ/
 vd1FtGS0CoS6a/K5mS/DVWJ8kTZzlHyEzQ3FY4/2VQXxNOFqry2WC1KMbPINg3QnAN4I
 nIFdNto5nuF7gb5lKTb86wvdWiW0uYFduxmqXQx/46CCL+EPfvjXaHjjyVBSlZAsOJhS
 rg3Q==
X-Gm-Message-State: AOAM533m/R39L39uNfO8rr2NNEDhk9Mb8whib3BhfSF7s2/nMVt+48KS
 HzgncmSojJo0H64QyDmK5Q==
X-Google-Smtp-Source: ABdhPJx04gzaTtiJD4/qo81zwd+L6nmtQ3jKG8vFtLsOLkkLlLZCH9dgBA3lT8xK8Z4bIGFl1vz3pw==
X-Received: by 2002:aca:702:: with SMTP id 2mr507991oih.44.1642709274761;
 Thu, 20 Jan 2022 12:07:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z18sm71856oot.33.2022.01.20.12.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:07:54 -0800 (PST)
Received: (nullmailer pid 1859159 invoked by uid 1000);
 Thu, 20 Jan 2022 20:07:52 -0000
Date: Thu, 20 Jan 2022 14:07:52 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/2] dt-bindings: google,cros-ec: drop Enric Balletbo i
 Serra from maintainers
Message-ID: <YenBGONi2YNjyXPb@robh.at.kernel.org>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
 <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, Simon Glass <sjg@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 11:40:09 +0100, Krzysztof Kozlowski wrote:
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
>  5 files changed, 5 deletions(-)
> 

Applied, thanks!
