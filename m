Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C2059865D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA23110E7F4;
	Thu, 18 Aug 2022 14:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867128A523
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:47:21 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id w18so1250087qki.8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 07:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=gdljhD4izytPCTwhmdt8DBVVfc0NydPAltPgDipKvog=;
 b=g82HUFQii2wmby1hfCgT9TExPgrqjpjQTI0V0SCv/ehoBMgcmpcI2ss4SS+XzniIKe
 SbMlaOv5lxFbu7TXTZghyyAEsKuUtU1SXj7EvbStydhPlwkJJJrAG0feuvjTcocC0Oh+
 FGuz4i7rbGswYJSzqy1Pz3STdYRh2lJHyOjaErRx2o3T8+1w9qwJgz0s7Wi7sw/TIBUt
 BnzEURKUXaLdbsNoEuW/lJ5ZlvybV3750qqidvO58ZMNVFsK0YN27PmED2e6wR1G2334
 yOGBnwJUc8PLnofigmNml3oAHEPxAts7/eybKTxxdUWK4fL3xqT81PoQ7Sq0vsxctA6f
 N5pQ==
X-Gm-Message-State: ACgBeo0FGslrdFOZXq9DecReA/WdGOGnWwVfGGH/JEvNyDrTVOPb5cfN
 T40bXz3ckfGq7yMBD9Hnaw==
X-Google-Smtp-Source: AA6agR6os7Il7llhYeMa4bR2kBtfZkcv6PCsh86UdfBNsIhRKKgO+IREW4lBHpdZzuhJU3WR6VLMIQ==
X-Received: by 2002:a05:620a:2286:b0:6bb:5fa4:58 with SMTP id
 o6-20020a05620a228600b006bb5fa40058mr2241995qkh.202.1660834040446; 
 Thu, 18 Aug 2022 07:47:20 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:25d2:ea0d:b91c:d10a:6423:3870])
 by smtp.gmail.com with ESMTPSA id
 n1-20020ac86741000000b0031eebfcb369sm1049301qtp.97.2022.08.18.07.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 07:47:20 -0700 (PDT)
Received: (nullmailer pid 1843176 invoked by uid 1000);
 Thu, 18 Aug 2022 14:47:13 -0000
Date: Thu, 18 Aug 2022 08:47:13 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: Update email of Neil Armstrong
Message-ID: <20220818144713.GC1829017-robh@kernel.org>
References: <20220816095617.948678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816095617.948678-1-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 11:56:17AM +0200, Neil Armstrong wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> My professional e-mail will change and the BayLibre one will
> bounce after mid-september of 2022.
> 
> This updates the MAINTAINERS file, the YAML bindings and adds an
> entry in the .mailmap file.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .mailmap                                      |  1 +
>  .../amlogic/amlogic,meson-gx-ao-secure.yaml   |  2 +-
>  .../display/amlogic,meson-dw-hdmi.yaml        |  2 +-
>  .../bindings/display/amlogic,meson-vpu.yaml   |  2 +-
>  .../display/bridge/analogix,anx7814.yaml      |  2 +-
>  .../bindings/display/bridge/ite,it66121.yaml  |  2 +-
>  .../display/panel/sgd,gktw70sdae4se.yaml      |  2 +-
>  .../bindings/i2c/amlogic,meson6-i2c.yaml      |  2 +-
>  .../mailbox/amlogic,meson-gxbb-mhu.yaml       |  2 +-
>  .../bindings/media/amlogic,axg-ge2d.yaml      |  2 +-
>  .../bindings/media/amlogic,gx-vdec.yaml       |  2 +-
>  .../media/amlogic,meson-gx-ao-cec.yaml        |  2 +-
>  .../devicetree/bindings/mfd/khadas,mcu.yaml   |  2 +-
>  .../bindings/net/amlogic,meson-dwmac.yaml     |  2 +-
>  .../bindings/phy/amlogic,axg-mipi-dphy.yaml   |  2 +-
>  .../phy/amlogic,meson-g12a-usb2-phy.yaml      |  2 +-
>  .../phy/amlogic,meson-g12a-usb3-pcie-phy.yaml |  2 +-
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml |  2 +-
>  .../bindings/reset/amlogic,meson-reset.yaml   |  2 +-
>  .../bindings/rng/amlogic,meson-rng.yaml       |  2 +-
>  .../bindings/serial/amlogic,meson-uart.yaml   |  2 +-
>  .../bindings/soc/amlogic/amlogic,canvas.yaml  |  2 +-
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  2 +-
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  2 +-
>  .../usb/amlogic,meson-g12a-usb-ctrl.yaml      |  2 +-
>  .../watchdog/amlogic,meson-gxbb-wdt.yaml      |  2 +-
>  MAINTAINERS                                   | 20 +++++++++----------
>  27 files changed, 36 insertions(+), 35 deletions(-)

Applied, thanks!

Rob
