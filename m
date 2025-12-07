Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF26CAB5EF
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 15:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBA110E07B;
	Sun,  7 Dec 2025 14:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BYT81afb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2005489654
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 14:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 051454364B;
 Sun,  7 Dec 2025 14:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710D8C4CEFB;
 Sun,  7 Dec 2025 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765116273;
 bh=8C8MINyFxoQnTXXKrera1BLyHOmMVGTXjhAaIdgVhA8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BYT81afbsj1snMK2wX5zH4Alvly0M7aUtaBVq+u6pT+lZRbuzEDilNogucCyqs+gs
 i7d422XDtQkOMsvWLvYjWb7KWC8GOMA9sCr6L0ksWWaxB1zdhKqt7ewcYQd1KqQp4H
 sPXuBXziZcGZq11ZeoOIzjlZkTHr2UXFu5SpLObSLiE3y5bshtL3lFRHvT6EbsTN+7
 dBJB0wouqsyat7kq9YY+sWlco6NNsj7LLaIsu19yjivch+s9pT8j7xH6kZVHqjUJmO
 8fIb9tk6gBOWzcinip/XgMSfoukWfJ6q2OSQsKPT2mxN1Ktgk6dIX7VY1cJfbYrs5F
 +1u/ywWgGJA9w==
Date: Sun, 7 Dec 2025 14:04:25 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Change Linus Walleij mail address
Message-ID: <20251207140425.2e373873@jic23-huawei>
In-Reply-To: <20251130-linusw-kernelorg-email-v1-1-bcdbff7b896c@kernel.org>
References: <20251130-linusw-kernelorg-email-v1-1-bcdbff7b896c@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 30 Nov 2025 17:14:45 +0100
Linus Walleij <linusw@kernel.org> wrote:

> I will be using my kernel.org mail address going forward.
>=20
> There is no point in splitting this MAINTAINERS patch up
> per subsystem, I will just include it with the rest of my
> patches to pin control in the next merge window.

Trivial but wrap a tiny bit short of the normal 75 chars.

>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

FWIW
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> #for-iio

Good opportunity to say thanks for all your effort in a broad range
of places!

Jonathan

> ---
>  MAINTAINERS | 58 +++++++++++++++++++++++++++++--------------------------=
---
>  1 file changed, 29 insertions(+), 29 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 181a58ec4a8d..13f61acdc8f7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -195,7 +195,7 @@ F:	drivers/pinctrl/pinctrl-upboard.c
>  F:	include/linux/mfd/upboard-fpga.h
> =20
>  AB8500 BATTERY AND CHARGER DRIVERS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  F:	Documentation/devicetree/bindings/power/supply/*ab8500*
>  F:	drivers/power/supply/*ab8500*
> =20
> @@ -2045,7 +2045,7 @@ F:	Documentation/devicetree/bindings/display/arm,hd=
lcd.yaml
>  F:	drivers/gpu/drm/arm/hdlcd_*
> =20
>  ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/arm,integrator.yaml
> @@ -2203,7 +2203,7 @@ F:	Documentation/devicetree/bindings/memory-control=
lers/arm,pl35x-smc.yaml
>  F:	drivers/memory/pl353-smc.c
> =20
>  ARM PRIMECELL SSP PL022 SPI DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/spi-pl022.yaml
> @@ -2216,7 +2216,7 @@ F:	drivers/tty/serial/amba-pl01*.c
>  F:	include/linux/amba/serial.h
> =20
>  ARM PRIMECELL VIC PL190/PL192 DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml
> @@ -2633,7 +2633,7 @@ F:	tools/perf/util/cs-etm.*
> =20
>  ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
>  M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  T:	git https://github.com/ulli-kroll/linux.git
> @@ -3035,7 +3035,7 @@ F:	include/dt-bindings/clock/mstar-*
>  F:	include/dt-bindings/gpio/msc313-gpio.h
> =20
>  ARM/NOMADIK/Ux500 ARCHITECTURES
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git
> @@ -3732,7 +3732,7 @@ F:	Documentation/devicetree/bindings/media/i2c/asah=
i-kasei,ak7375.yaml
>  F:	drivers/media/i2c/ak7375.c
> =20
>  ASAHI KASEI AK8974 DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-iio@vger.kernel.org
>  S:	Supported
>  W:	http://www.akm.com/
> @@ -6758,7 +6758,7 @@ S:	Maintained
>  F:	drivers/pinctrl/pinctrl-cy8c95x0.c
> =20
>  CYPRESS CY8CTMA140 TOUCHSCREEN DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/input/touchscreen/cy8ctma140.c
> @@ -6778,13 +6778,13 @@ Q:	http://patchwork.linuxtv.org/project/linux-med=
ia/list/
>  F:	drivers/media/common/cypress_firmware*
> =20
>  CYTTSP TOUCHSCREEN DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/input/touchscreen/cyttsp*
> =20
>  D-LINK DIR-685 TOUCHKEYS DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-input@vger.kernel.org
>  S:	Supported
>  F:	drivers/input/keyboard/dlink-dir685-touchkeys.c
> @@ -7653,13 +7653,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/ke=
rnel.git
>  F:	drivers/gpu/drm/tiny/appletbdrm.c
> =20
>  DRM DRIVER FOR ARM PL111 CLCD
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/pl111/
> =20
>  DRM DRIVER FOR ARM VERSATILE TFT PANELS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-pan=
el.yaml
> @@ -7709,7 +7709,7 @@ F:	Documentation/devicetree/bindings/display/panel/=
ebbg,ft8719.yaml
>  F:	drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> =20
>  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/tve200/
> @@ -7903,14 +7903,14 @@ F:	include/dt-bindings/clock/qcom,dsi-phy-28nm.h
>  F:	include/uapi/drm/msm_drm.h
> =20
>  DRM DRIVER FOR NOVATEK NT35510 PANELS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
>  F:	drivers/gpu/drm/panel/panel-novatek-nt35510.c
> =20
>  DRM DRIVER FOR NOVATEK NT35560 PANELS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
> @@ -8028,7 +8028,7 @@ F:	Documentation/devicetree/bindings/display/panel/=
raydium,rm67191.yaml
>  F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
> =20
>  DRM DRIVER FOR SAMSUNG DB7430 PANELS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.ya=
ml
> @@ -8112,7 +8112,7 @@ F:	Documentation/devicetree/bindings/display/solomo=
n,ssd13*.yaml
>  F:	drivers/gpu/drm/solomon/ssd130x*
> =20
>  DRM DRIVER FOR ST-ERICSSON MCDE
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
> @@ -8144,7 +8144,7 @@ F:	Documentation/devicetree/bindings/display/bridge=
/ti,sn65dsi86.yaml
>  F:	drivers/gpu/drm/bridge/ti-sn65dsi86.c
> =20
>  DRM DRIVER FOR TPO TPG110 PANELS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
> @@ -8188,7 +8188,7 @@ F:	drivers/gpu/drm/vmwgfx/
>  F:	include/uapi/drm/vmwgfx_drm.h
> =20
>  DRM DRIVER FOR WIDECHIPS WS2401 PANELS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.ya=
ml
> @@ -9482,7 +9482,7 @@ F:	include/linux/fanotify.h
>  F:	include/uapi/linux/fanotify.h
> =20
>  FARADAY FOTG210 USB2 DUAL-ROLE CONTROLLER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
>  F:	drivers/usb/fotg210/
> @@ -10669,7 +10669,7 @@ F:	drivers/gpio/gpio-sloppy-logic-analyzer.c
>  F:	tools/gpio/gpio-sloppy-logic-analyzer.sh
> =20
>  GPIO SUBSYSTEM
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  M:	Bartosz Golaszewski <brgl@bgdev.pl>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
> @@ -13033,7 +13033,7 @@ F:	Documentation/devicetree/bindings/iio/imu/inve=
nsense,icm42600.yaml
>  F:	drivers/iio/imu/inv_icm42600/
> =20
>  INVENSENSE MPU-3050 GYROSCOPE DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-iio@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.ya=
ml
> @@ -13948,7 +13948,7 @@ F:	drivers/auxdisplay/ks0108.c
>  F:	include/linux/ks0108.h
> =20
>  KTD253 BACKLIGHT DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
>  F:	drivers/video/backlight/ktd253-backlight.c
> @@ -14159,7 +14159,7 @@ F:	drivers/ata/pata_arasan_cf.c
>  F:	include/linux/pata_arasan_cf_data.h
> =20
>  LIBATA PATA FARADAY FTIDE010 AND GEMINI SATA BRIDGE DRIVERS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-ide@vger.kernel.org
>  S:	Maintained
>  F:	drivers/ata/pata_ftide010.c
> @@ -19663,7 +19663,7 @@ F:	Documentation/devicetree/bindings/pci/fsl,imx6=
q-pcie.yaml
>  F:	drivers/pci/controller/dwc/*imx6*
> =20
>  PCI DRIVER FOR INTEL IXP4XX
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
>  F:	drivers/pci/controller/pci-ixp4xx.c
> @@ -19774,7 +19774,7 @@ F:	drivers/pci/controller/cadence/pci-j721e.c
>  F:	drivers/pci/controller/dwc/pci-dra7xx.c
> =20
>  PCI DRIVER FOR V3 SEMICONDUCTOR V360EPC
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-pci@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/v3,v360epc-pci.yaml
> @@ -20219,7 +20219,7 @@ K:	(?i)clone3
>  K:	\b(clone_args|kernel_clone_args)\b
> =20
>  PIN CONTROL SUBSYSTEM
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git
> @@ -21631,7 +21631,7 @@ F:	Documentation/devicetree/bindings/watchdog/rea=
ltek,otto-wdt.yaml
>  F:	drivers/watchdog/realtek_otto_wdt.c
> =20
>  REALTEK RTL83xx SMI DSA ROUTER CHIPS
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  M:	Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
> @@ -23384,7 +23384,7 @@ S:	Supported
>  F:	net/smc/
> =20
>  SHARP GP2AP002A00F/GP2AP002S00F SENSOR DRIVER
> -M:	Linus Walleij <linus.walleij@linaro.org>
> +M:	Linus Walleij <linusw@kernel.org>
>  L:	linux-iio@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
>=20
> ---
> base-commit: 6156424a7d001cceeafe59b52209d6f36719b51d
> change-id: 20251130-linusw-kernelorg-email-0791125070f4
>=20
> Best regards,

