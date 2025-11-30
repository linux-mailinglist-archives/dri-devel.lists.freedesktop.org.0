Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB6C95227
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 17:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063889A72;
	Sun, 30 Nov 2025 16:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e1JJWp4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BEB89A72
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 16:14:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D7E136014B;
 Sun, 30 Nov 2025 16:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5FDC4CEF8;
 Sun, 30 Nov 2025 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764519293;
 bh=Mx8Q61Ut2NMjVGiek8L2Ppr/wcjqwTTDVTB8wQMifek=;
 h=From:Date:Subject:To:Cc:From;
 b=e1JJWp4QrGccrc9V/8CPx9kIxOE0eDSW0VikgrfBKALo45Hv5bKaQcFBYo80BvyyF
 RcIipYkVBQmp1oqMdF5JrurJyavBM0o8ddQ1Fk1044zO+uXpzsdq52KkLhUXTDYY69
 sBNQCXaiuaSa9RVYxWRJx2ixMCqYV1pfs6tpzL5ByXx146nxaPuadlQqr516VMEukJ
 4N8TjcGEU8jbkRPlyuKzUUJyOkImVGaCPh0v5gV+Bfvp5tkfVvUUA+2BgqloISqqNN
 ibusWVDC+dhr++ThRfbFHW37ZhBR7kMc5qXA9xqIBWpKkYUYgnXuUHJEsRfa407ywq
 PGC7PO0xcVTcA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 30 Nov 2025 17:14:45 +0100
Subject: [PATCH] MAINTAINERS: Change Linus Walleij mail address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251130-linusw-kernelorg-email-v1-1-bcdbff7b896c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnA0kdUXmqwwPorELq3WkqAPx3
 S07fof/PyGLqWToqhNMds26pgKuKxjfQwqCOhWDI+eZG8KoacsHfsSSxNUCyjJoRGqfzM5TS/M
 DSvw1mfX3H7/667oBGLNjXGgAAAA=
X-Change-ID: 20251130-linusw-kernelorg-email-0791125070f4
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

I will be using my kernel.org mail address going forward.

There is no point in splitting this MAINTAINERS patch up
per subsystem, I will just include it with the rest of my
patches to pin control in the next merge window.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 MAINTAINERS | 58 +++++++++++++++++++++++++++++-----------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 181a58ec4a8d..13f61acdc8f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -195,7 +195,7 @@ F:	drivers/pinctrl/pinctrl-upboard.c
 F:	include/linux/mfd/upboard-fpga.h
 
 AB8500 BATTERY AND CHARGER DRIVERS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 F:	Documentation/devicetree/bindings/power/supply/*ab8500*
 F:	drivers/power/supply/*ab8500*
 
@@ -2045,7 +2045,7 @@ F:	Documentation/devicetree/bindings/display/arm,hdlcd.yaml
 F:	drivers/gpu/drm/arm/hdlcd_*
 
 ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/arm,integrator.yaml
@@ -2203,7 +2203,7 @@ F:	Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml
 F:	drivers/memory/pl353-smc.c
 
 ARM PRIMECELL SSP PL022 SPI DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/spi/spi-pl022.yaml
@@ -2216,7 +2216,7 @@ F:	drivers/tty/serial/amba-pl01*.c
 F:	include/linux/amba/serial.h
 
 ARM PRIMECELL VIC PL190/PL192 DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml
@@ -2633,7 +2633,7 @@ F:	tools/perf/util/cs-etm.*
 
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git https://github.com/ulli-kroll/linux.git
@@ -3035,7 +3035,7 @@ F:	include/dt-bindings/clock/mstar-*
 F:	include/dt-bindings/gpio/msc313-gpio.h
 
 ARM/NOMADIK/Ux500 ARCHITECTURES
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
@@ -3732,7 +3732,7 @@ F:	Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
 F:	drivers/media/i2c/ak7375.c
 
 ASAHI KASEI AK8974 DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	http://www.akm.com/
@@ -6758,7 +6758,7 @@ S:	Maintained
 F:	drivers/pinctrl/pinctrl-cy8c95x0.c
 
 CYPRESS CY8CTMA140 TOUCHSCREEN DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/touchscreen/cy8ctma140.c
@@ -6778,13 +6778,13 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/common/cypress_firmware*
 
 CYTTSP TOUCHSCREEN DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/touchscreen/cyttsp*
 
 D-LINK DIR-685 TOUCHKEYS DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-input@vger.kernel.org
 S:	Supported
 F:	drivers/input/keyboard/dlink-dir685-touchkeys.c
@@ -7653,13 +7653,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tiny/appletbdrm.c
 
 DRM DRIVER FOR ARM PL111 CLCD
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/pl111/
 
 DRM DRIVER FOR ARM VERSATILE TFT PANELS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
@@ -7709,7 +7709,7 @@ F:	Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 F:	drivers/gpu/drm/panel/panel-ebbg-ft8719.c
 
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tve200/
@@ -7903,14 +7903,14 @@ F:	include/dt-bindings/clock/qcom,dsi-phy-28nm.h
 F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER FOR NOVATEK NT35510 PANELS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt35510.c
 
 DRM DRIVER FOR NOVATEK NT35560 PANELS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
@@ -8028,7 +8028,7 @@ F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 
 DRM DRIVER FOR SAMSUNG DB7430 PANELS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
@@ -8112,7 +8112,7 @@ F:	Documentation/devicetree/bindings/display/solomon,ssd13*.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
 DRM DRIVER FOR ST-ERICSSON MCDE
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
@@ -8144,7 +8144,7 @@ F:	Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
 F:	drivers/gpu/drm/bridge/ti-sn65dsi86.c
 
 DRM DRIVER FOR TPO TPG110 PANELS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
@@ -8188,7 +8188,7 @@ F:	drivers/gpu/drm/vmwgfx/
 F:	include/uapi/drm/vmwgfx_drm.h
 
 DRM DRIVER FOR WIDECHIPS WS2401 PANELS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -9482,7 +9482,7 @@ F:	include/linux/fanotify.h
 F:	include/uapi/linux/fanotify.h
 
 FARADAY FOTG210 USB2 DUAL-ROLE CONTROLLER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	drivers/usb/fotg210/
@@ -10669,7 +10669,7 @@ F:	drivers/gpio/gpio-sloppy-logic-analyzer.c
 F:	tools/gpio/gpio-sloppy-logic-analyzer.sh
 
 GPIO SUBSYSTEM
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
@@ -13033,7 +13033,7 @@ F:	Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
 F:	drivers/iio/imu/inv_icm42600/
 
 INVENSENSE MPU-3050 GYROSCOPE DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
@@ -13948,7 +13948,7 @@ F:	drivers/auxdisplay/ks0108.c
 F:	include/linux/ks0108.h
 
 KTD253 BACKLIGHT DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
 F:	drivers/video/backlight/ktd253-backlight.c
@@ -14159,7 +14159,7 @@ F:	drivers/ata/pata_arasan_cf.c
 F:	include/linux/pata_arasan_cf_data.h
 
 LIBATA PATA FARADAY FTIDE010 AND GEMINI SATA BRIDGE DRIVERS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-ide@vger.kernel.org
 S:	Maintained
 F:	drivers/ata/pata_ftide010.c
@@ -19663,7 +19663,7 @@ F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
 F:	drivers/pci/controller/dwc/*imx6*
 
 PCI DRIVER FOR INTEL IXP4XX
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
 F:	drivers/pci/controller/pci-ixp4xx.c
@@ -19774,7 +19774,7 @@ F:	drivers/pci/controller/cadence/pci-j721e.c
 F:	drivers/pci/controller/dwc/pci-dra7xx.c
 
 PCI DRIVER FOR V3 SEMICONDUCTOR V360EPC
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/v3,v360epc-pci.yaml
@@ -20219,7 +20219,7 @@ K:	(?i)clone3
 K:	\b(clone_args|kernel_clone_args)\b
 
 PIN CONTROL SUBSYSTEM
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
@@ -21631,7 +21631,7 @@ F:	Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
 F:	drivers/watchdog/realtek_otto_wdt.c
 
 REALTEK RTL83xx SMI DSA ROUTER CHIPS
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 M:	Alvin Šipraga <alsi@bang-olufsen.dk>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
@@ -23384,7 +23384,7 @@ S:	Supported
 F:	net/smc/
 
 SHARP GP2AP002A00F/GP2AP002S00F SENSOR DRIVER
-M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Linus Walleij <linusw@kernel.org>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git

---
base-commit: 6156424a7d001cceeafe59b52209d6f36719b51d
change-id: 20251130-linusw-kernelorg-email-0791125070f4

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

