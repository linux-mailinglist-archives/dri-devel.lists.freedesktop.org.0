Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B803044C9B7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA1D6E4DD;
	Wed, 10 Nov 2021 19:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0436E517
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:52:24 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so5512100otk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=idiDHIx887w76Be1+DoMm+DC/fAFpYxmnW+2ngUk+Lw=;
 b=4Uyk6+00hHlH2vYf7CwQsIqfxmaPrTnKwFW2UJgxKmpwEaNqTs7Vbpc/kvPC7CBAjH
 Zu9b8J1XyzXI/ilk6groIUNHDUmg7fP0oVP3WEF3yYge/ynNCgQypL0b2aAvuxY49Iw7
 BOu3h+2XLRvpkx9Ej4tQ+H4DM+NIbSyAVyXsSwIqzaeGA9v4xAyXHDwRVA4ScixalsGN
 4Rz4pOIseoXezQIXLw7MZxuMqQfrFxjB/pp0jIZVgV05oLM4EtXXV8CwUmkKwMK6J6XL
 fDewwKOnehxG3zbCIYgAC/EzUZ0PywXvLOb6lUkYD0dB6CNwZU821tWfFMgEMo0LyWup
 XHZw==
X-Gm-Message-State: AOAM5302y2oJ7ec/qau5GRqHn4vuaWYih1ur16yJFGhPor/19QRK8m2X
 U0I2wEpg6GjP3xfL5LKY/g==
X-Google-Smtp-Source: ABdhPJybq9LO3rX5SokDCkXN9j6OMCOI/V0Dfx02D+RWZ3KXqjzTHAnpYpaSp6MZwgVF6u6l3jseFQ==
X-Received: by 2002:a9d:7586:: with SMTP id s6mr1448044otk.158.1636573944136; 
 Wed, 10 Nov 2021 11:52:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k4sm168568oij.54.2021.11.10.11.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:52:23 -0800 (PST)
Received: (nullmailer pid 1856875 invoked by uid 1000);
 Wed, 10 Nov 2021 19:52:20 -0000
Date: Wed, 10 Nov 2021 13:52:20 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Subject: Re: [PATCH v3 5/5] dt-bindings: treewide: Update @st.com email
 address to @foss.st.com
Message-ID: <YYwi9P3b4tBmFVyv@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-6-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-6-patrice.chotard@foss.st.com>
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
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 olivier moysan <olivier.moysan@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Amelie Delaunay <amelie.delaunay@foss.st.com>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, jonathan cameron <jic23@kernel.org>,
 Le Ray <erwan.leray@foss.st.com>, linux-iio@vger.kernel.org,
 michael turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 baolin wang <baolin.wang7@gmail.com>, "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Marc Zyngier <maz@kernel.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, philippe cornu <philippe.cornu@foss.st.com>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 16:01:44 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Not all @st.com email address are concerned, only people who have
> a specific @foss.st.com email will see their entry updated.
> For some people, who left the company, remove their email.
> 
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: Ludovic Barre <ludovic.barre@foss.st.com>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: pascal Paillet <p.paillet@foss.st.com>
> Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/arm/sti.yaml                | 2 +-
>  Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml     | 4 ++--
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml        | 4 ++--
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml        | 2 +-
>  Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml  | 2 +-
>  Documentation/devicetree/bindings/crypto/st,stm32-crc.yaml    | 2 +-
>  Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml   | 2 +-
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml   | 2 +-
>  .../devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml  | 2 +-
>  .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml | 2 +-
>  .../devicetree/bindings/display/panel/raydium,rm68200.yaml    | 2 +-
>  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml   | 4 ++--
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml  | 4 ++--
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml    | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml      | 2 +-
>  .../devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml       | 2 +-
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>  .../devicetree/bindings/iio/adc/sigma-delta-modulator.yaml    | 2 +-
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml   | 2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++--
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml   | 2 +-
>  .../bindings/interrupt-controller/st,stm32-exti.yaml          | 4 ++--
>  Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml  | 4 ++--
>  Documentation/devicetree/bindings/media/st,stm32-cec.yaml     | 2 +-
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 2 +-
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml    | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stmfx.yaml           | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stpmic1.yaml         | 2 +-
>  Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml | 2 +-
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml         | 2 +-
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml        | 4 ++--
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml   | 2 +-
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 2 +-
>  .../devicetree/bindings/regulator/st,stm32-booster.yaml       | 2 +-
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml       | 2 +-
>  .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 2 +-
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml        | 4 ++--
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml       | 2 +-
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml       | 2 +-
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 2 +-
>  Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml   | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml     | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml     | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml | 2 +-
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml      | 4 ++--
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 4 ++--
>  .../devicetree/bindings/thermal/st,stm32-thermal.yaml         | 2 +-
>  Documentation/devicetree/bindings/usb/st,stusb160x.yaml       | 2 +-
>  Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml | 4 ++--
>  53 files changed, 65 insertions(+), 65 deletions(-)
> 

Applied, thanks!
