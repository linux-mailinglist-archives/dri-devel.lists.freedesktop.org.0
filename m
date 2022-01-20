Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9F495541
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 21:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E2110E6FB;
	Thu, 20 Jan 2022 20:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AA310E6D4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 20:07:49 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso9006348otj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 12:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A7A03fobW8KrhhrAYsRR6uBEmk1aUXQHP9DOBsxx+q0=;
 b=XEEelB1H2aYlMdPoPQhWROflA/X7g2ToME8WG9NftOtwPW3NQP8/kRcYuxx6oRrYkh
 RoMePikYBYBdUGGRJFNzCj48nOPrha6b8wgByPNHqb2uH4VE2gI1/M0a9EogRWyzJDHJ
 yymu8gh+F0Y6xSN5MUGgnO+li82QJVuZuGCrUkuNa0vVcDK9XZBuKP1eivxxibsoZstF
 Jxbh3jp7Ocnvkof7VBhQAmV8NLCYS48KUWcIBLd1mWEoXO0ttaxwSfofkNPOl7fweBkZ
 kpdfrAdr0AjiG3V2B45VzZWS/UiIKOHFCSJupc6d8MDDlikKCnXwdbqwMJEerSLtgmOU
 kP6w==
X-Gm-Message-State: AOAM531/3J8mgrhJ3tl0KF9Oe2ekqSXIF/937QULQ4UC5TlnwEl9838O
 Xe9mE/qJus8v7Zj5G9eqhA==
X-Google-Smtp-Source: ABdhPJxbxIflcch5R4oxGHShBE6tJfUiV1UbfNjqHTtYf43uNivgQHODfl34Q6F+PyYBwVlIKKujFA==
X-Received: by 2002:a9d:5a01:: with SMTP id v1mr304431oth.337.1642709268550;
 Thu, 20 Jan 2022 12:07:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o22sm74120oor.34.2022.01.20.12.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:07:47 -0800 (PST)
Received: (nullmailer pid 1858977 invoked by uid 1000);
 Thu, 20 Jan 2022 20:07:46 -0000
Date: Thu, 20 Jan 2022 14:07:46 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
 Serra from maintainers
Message-ID: <YenBEq1Gqpw8GJNQ@robh.at.kernel.org>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 Simon Glass <sjg@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 11:40:08 +0100, Krzysztof Kozlowski wrote:
> Enric Balletbo i Serra emails bounce:
> 
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> 
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
> bridge maintainers to Analogix ANX7814.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7814.yaml  | 4 +++-
>  .../bindings/display/bridge/google,cros-ec-anx7688.yaml       | 1 -
>  Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 1 -
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!
