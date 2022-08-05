Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C958A715
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7E8AFE9C;
	Fri,  5 Aug 2022 07:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C321B3B8F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:16:27 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10edfa2d57dso2149107fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 00:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Q/T+QIHt6RBGKVt66We0b7UfyACA95UZ5BXvq/Bgq3I=;
 b=C0KqvfYBS8+mgapVuV82VPQV6HZaaEQCj0SLeshqujG4y2v8LyNgQvrHTR5HeEDTCx
 V6D1yyORKxe7uaHDxNyE30s0UoO9Ya9KsL+cNwrxz7hfQATBjQZiDajuViQLQCt4mcfE
 CPVyq1GQattSenh546lcMt16UHTy4EnfZ2BZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Q/T+QIHt6RBGKVt66We0b7UfyACA95UZ5BXvq/Bgq3I=;
 b=b5gRlbTbxMwZk0lhD26oIc0g/DpKm8jJC0MAPJzIXzq7IO9AHhk+SgwdUO3o8NyWrT
 Q2OcHfzOtnEkLzYdq74+ntQMBxmTgvk1KuM95pUnCLUc7s1WhWheTuFR/CNCX3UpOwpg
 2f2fV//kR9ZL4oBS2iISDGJXbD9bk+/MGUiS4dLWqNpbcnrrJF1lm/+rkGvurtgMsygN
 ecsH+C8Qm2A11PFJVjk9YTTGsgHgIvRfyne5AotJcJboONRL4ghELBCj2JA4pNkL0Kcm
 u5aiEJhSOTHZOvKyA5dj6Nd4c/LpejlqZEP92iaA67zo6qtTIPb6ANNifBcKCAzt3vDR
 hQkA==
X-Gm-Message-State: ACgBeo1Ra0BFQ6ITpg2KUBYx2apWefZ5j2Ti9AQ6eRRJMBU3pxqrpG6O
 9FzHymnyaTm8D3WN+/tqHyXOrFS1lov0/av8EiL6GA==
X-Google-Smtp-Source: AA6agR4DZo8o0b5A7gNC2gobryeMVyNPj2DPuz7D7dftFNvoJbzEmevpibP9V668c+d2lSmhnCKu0IwC6SzKArR7foo=
X-Received: by 2002:a05:6870:6015:b0:fe:340e:e854 with SMTP id
 t21-20020a056870601500b000fe340ee854mr2599749oaa.52.1659683785143; Fri, 05
 Aug 2022 00:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095721.1935377-1-sunil@amarulasolutions.com>
 <20220711095721.1935377-3-sunil@amarulasolutions.com>
In-Reply-To: <20220711095721.1935377-3-sunil@amarulasolutions.com>
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Fri, 5 Aug 2022 12:46:14 +0530
Message-ID: <CAM+7aWt79b4o-E0nZt0yvxg-7=Oqa6if=-C5xUUyG0wF2fUY4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: sun8i: Add R16 Vista E board from
 RenewWorldOutreach
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime.ripard@free-electrons.com>, 
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: multipart/alternative; boundary="00000000000073fcac05e5793e70"
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000073fcac05e5793e70
Content-Type: text/plain; charset="UTF-8"

Hi all,

Can you guys please review and comment for any changes.

Regards
Suniel

On Mon, Jul 11, 2022 at 3:27 PM Suniel Mahesh <sunil@amarulasolutions.com>
wrote:

> The R16-Vista-E board from RenewWorldOutreach based on allwinner
> R16(A33).
>
> General features:
> - 1GB RAM
> - microSD slot
> - Realtek Wifi
> - 1 x USB 2.0
> - HDMI IN
> - HDMI OUT
> - Audio out
> - MIPI DSI
> - TI DLPC3433
>
> It has also connectors to connect an external mini keypad.
>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
>  ---
>     Changes for v3:
>     - As suggested by Samuel Holland:
>     - changed binding to gpio-fan
>     - changed widgets to DACL and DACR to describe audio routing
>     - fixed indentation
>     - primary author of the commit should be the first signer
>
>     Changes for v2:
>     - Add missing compatible string
>     - insert missing signatures of contributors
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 362 ++++++++++++++++++
>  2 files changed, 363 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 184899808ee7..b5966c0742e1 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1353,6 +1353,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>         sun8i-r16-nintendo-nes-classic.dtb \
>         sun8i-r16-nintendo-super-nes-classic.dtb \
>         sun8i-r16-parrot.dtb \
> +       sun8i-r16-renew-vista-e.dtb \
>         sun8i-r40-bananapi-m2-ultra.dtb \
>         sun8i-r40-oka40i-c.dtb \
>         sun8i-s3-elimo-initium.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> new file mode 100644
> index 000000000000..ff72914eb110
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2022 RenewWorldOutreach
> + * Copyright (C) 2022 Amarula Solutions(India)
> + */
> +
> +/dts-v1/;
> +#include "sun8i-a33.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +       model = "RenewWorldOutreach R16-Vista-E";
> +       compatible = "renewworldoutreach,r16-vista-e",
> "allwinner,sun8i-r16", "allwinner,sun8i-a33";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               poll-interval = <100>;
> +
> +               ok {
> +                       label = "ok";
> +                       linux,code = <KEY_ENTER>;
> +                       gpios = <&pio 4 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               left {
> +                       label = "left";
> +                       linux,code = <KEY_LEFT>;
> +                       gpios = <&pio 4 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               right {
> +                       label = "right";
> +                       linux,code = <KEY_RIGHT>;
> +                       gpios = <&pio 4 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               up {
> +                       label = "up";
> +                       linux,code = <KEY_UP>;
> +                       gpios = <&pio 4 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               down {
> +                       label = "down";
> +                       linux,code = <KEY_DOWN>;
> +                       gpios = <&pio 4 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               back {
> +                       label = "back";
> +                       linux,code = <KEY_BACK>;
> +                       gpios = <&pio 4 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               power {
> +                       label = "power";
> +                       linux,code = <KEY_POWER>;
> +                       gpios = <&pio 4 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               vol-down {
> +                       label = "vol-down";
> +                       linux,code = <KEY_VOLUMEDOWN>;
> +                       gpios = <&pio 7 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               vol-up {
> +                       label = "vol-up";
> +                       linux,code = <KEY_VOLUMEUP>;
> +                       gpios = <&pio 7 9 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               battery-led0 {
> +                       label = "renew-e:battery-led0";
> +                       gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               battery-led1 {
> +                       label = "renew-e:battery-led1";
> +                       gpios = <&r_pio 0 3 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               battery-led2 {
> +                       label = "renew-e:battery-led2";
> +                       gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               battery-led3 {
> +                       label = "renew-e:battery-led3";
> +                       gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               battery-led4 {
> +                       label = "renew-e:battery-led4";
> +                       gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               volume-led0 {
> +                       label = "renew-e:volume-led0";
> +                       gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               volume-led1 {
> +                       label = "renew-e:volume-led1";
> +                       gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               volume-led2 {
> +                       label = "renew-e:volume-led2";
> +                       gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               volume-led3 {
> +                       label = "renew-e:volume-led3";
> +                       gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               volume-led4 {
> +                       label = "renew-e:volume-led4";
> +                       gpios = <&pio 6 10 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               led-pad-intz {
> +                       label = "renew-e:led-pad-intz";
> +                       gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>;
> +                       default-state = "on";
> +               };
> +       };
> +
> +       gpio-fan {
> +               compatible = "gpio-fan";
> +               gpios = <&pio 4 14 GPIO_ACTIVE_HIGH>; /* FAN_ON/OFF: PE14
> */
> +               gpio-fan,speed-map = <0 0 6000 1>;
> +       };
> +
> +       reg_vcc5v0: vcc5v0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc5v0";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +       };
> +};
> +
> +&codec {
> +       status = "okay";
> +};
> +
> +&cpu0 {
> +       cpu-supply = <&reg_dcdc3>;
> +};
> +
> +&cpu0_opp_table {
> +       opp-1104000000 {
> +               opp-hz = /bits/ 64 <1104000000>;
> +               opp-microvolt = <1320000>;
> +               clock-latency-ns = <244144>; /* 8 32k periods */
> +       };
> +
> +       opp-1200000000 {
> +               opp-hz = /bits/ 64 <1200000000>;
> +               opp-microvolt = <1320000>;
> +               clock-latency-ns = <244144>; /* 8 32k periods */
> +       };
> +};
> +
> +&dai {
> +       status = "okay";
> +};
> +
> +&de {
> +       status = "okay";
> +};
> +
> +&dphy {
> +       status = "okay";
> +};
> +
> +&ehci0 {
> +       status = "okay";
> +};
> +
> +&mmc0 {
> +       vmmc-supply = <&reg_dcdc1>;
> +       bus-width = <4>;
> +       non-removable;
> +       status = "okay";
> +};
> +
> +&mmc1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc1_pg_pins>;
> +       vmmc-supply = <&reg_dcdc1>;
> +       bus-width = <4>;
> +       broken-cd;
> +       status = "okay";
> +};
> +
> +&ohci0 {
> +       status = "okay";
> +};
> +
> +&r_rsb {
> +       status = "okay";
> +
> +       axp22x: pmic@3a3 {
> +               compatible = "x-powers,axp223";
> +               reg = <0x3a3>;
> +               interrupt-parent = <&r_intc>;
> +               interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +               eldoin-supply = <&reg_dcdc1>;
> +               x-powers,drive-vbus-en;
> +       };
> +};
> +
> +#include "axp223.dtsi"
> +
> +&ac_power_supply {
> +       status = "okay";
> +};
> +
> +&reg_aldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3000000>;
> +       regulator-max-microvolt = <3000000>;
> +       regulator-name = "vcc-io";
> +};
> +
> +&reg_aldo2 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <2500000>;
> +       regulator-max-microvolt = <2500000>;
> +       regulator-name = "vdd-dll";
> +};
> +
> +&reg_aldo3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3000000>;
> +       regulator-max-microvolt = <3000000>;
> +       regulator-name = "avcc";
> +};
> +
> +&reg_dc1sw {
> +       regulator-name = "vcc-lcd";
> +};
> +
> +&reg_dc5ldo {
> +       regulator-always-on;
> +       regulator-min-microvolt = <900000>;
> +       regulator-max-microvolt = <1400000>;
> +       regulator-name = "vdd-cpus";
> +};
> +
> +&reg_dcdc1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3000000>;
> +       regulator-max-microvolt = <3000000>;
> +       regulator-name = "vcc-3v0";
> +};
> +
> +&reg_dcdc2 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <900000>;
> +       regulator-max-microvolt = <1400000>;
> +       regulator-name = "vdd-sys";
> +};
> +
> +&reg_dcdc3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <900000>;
> +       regulator-max-microvolt = <1400000>;
> +       regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc5 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1500000>;
> +       regulator-max-microvolt = <1500000>;
> +       regulator-name = "vcc-dram";
> +};
> +
> +&reg_dldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-3v3-main1";
> +};
> +
> +&reg_dldo2 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-3v3-main2";
> +};
> +
> +&reg_dldo3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-3v3-main3";
> +};
> +
> +&reg_dldo4 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-3v3-main4";
> +};
> +
> +&reg_eldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1200000>;
> +       regulator-max-microvolt = <1200000>;
> +       regulator-name = "vcc-1v2-hdmi";
> +};
> +
> +&reg_drivevbus {
> +       regulator-name = "usb0-vbus";
> +       status = "okay";
> +};
> +
> +&reg_rtc_ldo {
> +       regulator-name = "vcc-rtc";
> +};
> +
> +&sound {
> +       status = "okay";
> +       simple-audio-card,routing =
> +               "Left DAC", "DACL",
> +               "Right DAC", "DACR";
> +};
> +
> +&uart0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_pb_pins>;
> +       status = "okay";
> +};
> +
> +&usb_otg {
> +       dr_mode = "host";
> +       status = "okay";
> +};
> +
> +&usbphy {
> +       /* VBUS is always on because it is wired to the power supply */
> +       usb0_vbus-supply = <&reg_vcc5v0>;
> +       status = "okay";
> +};
> --
> 2.25.1
>
>

--00000000000073fcac05e5793e70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBhbGwsPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5DYW4geW91IGd1eXMgcGxlYXNlIHJldmlldyBhbmQgY29tbWVudCBmb3IgYW55
IGNoYW5nZXMuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5SZWdhcmRzPC9kaXY+PGRpdj5TdW5p
ZWw8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIEp1bCAxMSwgMjAyMiBhdCAzOjI3IFBNIFN1bmll
bCBNYWhlc2ggJmx0OzxhIGhyZWY9Im1haWx0bzpzdW5pbEBhbWFydWxhc29sdXRpb25zLmNvbSI+
c3VuaWxAYW1hcnVsYXNvbHV0aW9ucy5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
PlRoZSBSMTYtVmlzdGEtRSBib2FyZCBmcm9tIFJlbmV3V29ybGRPdXRyZWFjaCBiYXNlZCBvbiBh
bGx3aW5uZXI8YnI+DQpSMTYoQTMzKS48YnI+DQo8YnI+DQpHZW5lcmFsIGZlYXR1cmVzOjxicj4N
Ci0gMUdCIFJBTTxicj4NCi0gbWljcm9TRCBzbG90PGJyPg0KLSBSZWFsdGVrIFdpZmk8YnI+DQot
IDEgeCBVU0IgMi4wPGJyPg0KLSBIRE1JIElOPGJyPg0KLSBIRE1JIE9VVDxicj4NCi0gQXVkaW8g
b3V0PGJyPg0KLSBNSVBJIERTSTxicj4NCi0gVEkgRExQQzM0MzM8YnI+DQo8YnI+DQpJdCBoYXMg
YWxzbyBjb25uZWN0b3JzIHRvIGNvbm5lY3QgYW4gZXh0ZXJuYWwgbWluaSBrZXlwYWQuPGJyPg0K
PGJyPg0KU2lnbmVkLW9mZi1ieTogU3VuaWVsIE1haGVzaCAmbHQ7PGEgaHJlZj0ibWFpbHRvOnN1
bmlsQGFtYXJ1bGFzb2x1dGlvbnMuY29tIiB0YXJnZXQ9Il9ibGFuayI+c3VuaWxAYW1hcnVsYXNv
bHV0aW9ucy5jb208L2E+Jmd0Ozxicj4NClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgJmx0Ozxh
IGhyZWY9Im1haWx0bzpqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPC9hPiZndDs8YnI+DQpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGhlciBWb2xsbyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNocmlzQHJlbmV3b3V0cmVhY2gu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+Y2hyaXNAcmVuZXdvdXRyZWFjaC5vcmc8L2E+Jmd0Ozxicj4N
CsKgLS0tPGJyPg0KwqAgwqAgQ2hhbmdlcyBmb3IgdjM6PGJyPg0KwqAgwqAgLSBBcyBzdWdnZXN0
ZWQgYnkgU2FtdWVsIEhvbGxhbmQ6PGJyPg0KwqAgwqAgLSBjaGFuZ2VkIGJpbmRpbmcgdG8gZ3Bp
by1mYW48YnI+DQrCoCDCoCAtIGNoYW5nZWQgd2lkZ2V0cyB0byBEQUNMIGFuZCBEQUNSIHRvIGRl
c2NyaWJlIGF1ZGlvIHJvdXRpbmc8YnI+DQrCoCDCoCAtIGZpeGVkIGluZGVudGF0aW9uPGJyPg0K
wqAgwqAgLSBwcmltYXJ5IGF1dGhvciBvZiB0aGUgY29tbWl0IHNob3VsZCBiZSB0aGUgZmlyc3Qg
c2lnbmVyPGJyPg0KPGJyPg0KwqAgwqAgQ2hhbmdlcyBmb3IgdjI6PGJyPg0KwqAgwqAgLSBBZGQg
bWlzc2luZyBjb21wYXRpYmxlIHN0cmluZzxicj4NCsKgIMKgIC0gaW5zZXJ0IG1pc3Npbmcgc2ln
bmF0dXJlcyBvZiBjb250cmlidXRvcnM8YnI+DQotLS08YnI+DQrCoGFyY2gvYXJtL2Jvb3QvZHRz
L01ha2VmaWxlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMSArPGJyPg0KwqBh
cmNoL2FybS9ib290L2R0cy9zdW44aS1yMTYtcmVuZXctdmlzdGEtZS5kdHMgfCAzNjIgKysrKysr
KysrKysrKysrKysrPGJyPg0KwqAyIGZpbGVzIGNoYW5nZWQsIDM2MyBpbnNlcnRpb25zKCspPGJy
Pg0KwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LXJlbmV3
LXZpc3RhLWUuZHRzPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL01h
a2VmaWxlIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGU8YnI+DQppbmRleCAxODQ4OTk4MDhl
ZTcuLmI1OTY2YzA3NDJlMSAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9NYWtl
ZmlsZTxicj4NCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlPGJyPg0KQEAgLTEzNTMs
NiArMTM1Myw3IEBAIGR0Yi0kKENPTkZJR19NQUNIX1NVTjhJKSArPSBcPGJyPg0KwqAgwqAgwqAg
wqAgc3VuOGktcjE2LW5pbnRlbmRvLW5lcy1jbGFzc2ljLmR0YiBcPGJyPg0KwqAgwqAgwqAgwqAg
c3VuOGktcjE2LW5pbnRlbmRvLXN1cGVyLW5lcy1jbGFzc2ljLmR0YiBcPGJyPg0KwqAgwqAgwqAg
wqAgc3VuOGktcjE2LXBhcnJvdC5kdGIgXDxicj4NCivCoCDCoCDCoCDCoHN1bjhpLXIxNi1yZW5l
dy12aXN0YS1lLmR0YiBcPGJyPg0KwqAgwqAgwqAgwqAgc3VuOGktcjQwLWJhbmFuYXBpLW0yLXVs
dHJhLmR0YiBcPGJyPg0KwqAgwqAgwqAgwqAgc3VuOGktcjQwLW9rYTQwaS1jLmR0YiBcPGJyPg0K
wqAgwqAgwqAgwqAgc3VuOGktczMtZWxpbW8taW5pdGl1bS5kdGIgXDxicj4NCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yMTYtcmVuZXctdmlzdGEtZS5kdHMgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdW44aS1yMTYtcmVuZXctdmlzdGEtZS5kdHM8YnI+DQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAwMDAwMC4uZmY3MjkxNGViMTEwPGJyPg0KLS0tIC9k
ZXYvbnVsbDxicj4NCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1yZW5ldy12aXN0
YS1lLmR0czxicj4NCkBAIC0wLDAgKzEsMzYyIEBAPGJyPg0KKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKTxicj4NCisvKjxicj4NCisgKiBDb3B5cmlnaHQgKEMp
IDIwMjIgUmVuZXdXb3JsZE91dHJlYWNoPGJyPg0KKyAqIENvcHlyaWdodCAoQykgMjAyMiBBbWFy
dWxhIFNvbHV0aW9ucyhJbmRpYSk8YnI+DQorICovPGJyPg0KKzxicj4NCisvZHRzLXYxLzs8YnI+
DQorI2luY2x1ZGUgJnF1b3Q7c3VuOGktYTMzLmR0c2kmcXVvdDs8YnI+DQorPGJyPg0KKyNpbmNs
dWRlICZsdDtkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2R0
LWJpbmRpbmdzL2lucHV0L2lucHV0LmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5n
cy9sZWRzL2NvbW1vbi5oJmd0Ozxicj4NCis8YnI+DQorLyB7PGJyPg0KK8KgIMKgIMKgIMKgbW9k
ZWwgPSAmcXVvdDtSZW5ld1dvcmxkT3V0cmVhY2ggUjE2LVZpc3RhLUUmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3JlbmV3d29ybGRvdXRyZWFjaCxyMTYtdmlzdGEt
ZSZxdW90OywgJnF1b3Q7YWxsd2lubmVyLHN1bjhpLXIxNiZxdW90OywgJnF1b3Q7YWxsd2lubmVy
LHN1bjhpLWEzMyZxdW90Ozs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYWxpYXNlcyB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2VyaWFsMCA9ICZhbXA7dWFydDA7PGJyPg0KK8KgIMKg
IMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgY2hvc2VuIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdGRvdXQtcGF0aCA9ICZxdW90O3NlcmlhbDA6MTE1MjAwbjgmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZ3Bpby1rZXlzLXBv
bGxlZCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2dw
aW8ta2V5cy1wb2xsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcG9sbC1p
bnRlcnZhbCA9ICZsdDsxMDAmZ3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBvayB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAm
cXVvdDtvayZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBs
aW51eCxjb2RlID0gJmx0O0tFWV9FTlRFUiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7JmFtcDtwaW8gNCAwIEdQSU9fQUNUSVZFX0xPVyZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgbGVmdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbGFiZWwgPSAmcXVvdDtsZWZ0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGxpbnV4LGNvZGUgPSAmbHQ7S0VZX0xFRlQmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9zID0gJmx0OyZhbXA7cGlvIDQgMSBH
UElPX0FDVElWRV9MT1cmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJpZ2h0IHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3JpZ2h0JnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxpbnV4LGNvZGUgPSAmbHQ7S0VZX1JJ
R0hUJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvcyA9
ICZsdDsmYW1wO3BpbyA0IDIgR1BJT19BQ1RJVkVfTE9XJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1cCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDt1cCZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW51eCxjb2Rl
ID0gJmx0O0tFWV9VUCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ3Bpb3MgPSAmbHQ7JmFtcDtwaW8gNCAzIEdQSU9fQUNUSVZFX0xPVyZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZG93biB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwg
PSAmcXVvdDtkb3duJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGxpbnV4LGNvZGUgPSAmbHQ7S0VZX0RPV04mZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9zID0gJmx0OyZhbXA7cGlvIDQgNCBHUElPX0FDVElWRV9M
T1cmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGJhY2sgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7YmFjayZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBsaW51eCxjb2RlID0gJmx0O0tFWV9CQUNLJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvcyA9ICZsdDsmYW1wO3BpbyA0
IDUgR1BJT19BQ1RJVkVfTE9XJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwb3dlciB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtwb3dlciZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW51eCxjb2RlID0gJmx0O0tF
WV9QT1dFUiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bp
b3MgPSAmbHQ7JmFtcDtwaW8gNCA2IEdQSU9fQUNUSVZFX0xPVyZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdm9s
LWRvd24gezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0g
JnF1b3Q7dm9sLWRvd24mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbGludXgsY29kZSA9ICZsdDtLRVlfVk9MVU1FRE9XTiZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7JmFtcDtwaW8gNyAzIEdQSU9f
QUNUSVZFX0xPVyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdm9sLXVwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3ZvbC11cCZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW51eCxjb2RlID0gJmx0O0tFWV9WT0xV
TUVVUCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb3Mg
PSAmbHQ7JmFtcDtwaW8gNyA5IEdQSU9fQUNUSVZFX0xPVyZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBsZWRzIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
Z3Bpby1sZWRzJnF1b3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiYXR0
ZXJ5LWxlZDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVs
ID0gJnF1b3Q7cmVuZXctZTpiYXR0ZXJ5LWxlZDAmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7JmFtcDtyX3BpbyAwIDIgR1BJT19BQ1RJ
VkVfSElHSCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmF0dGVyeS1sZWQxIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3JlbmV3LWU6YmF0dGVyeS1sZWQx
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9zID0g
Jmx0OyZhbXA7cl9waW8gMCAzIEdQSU9fQUNUSVZFX0hJR0gmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJhdHRl
cnktbGVkMiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwg
PSAmcXVvdDtyZW5ldy1lOmJhdHRlcnktbGVkMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvcyA9ICZsdDsmYW1wO3JfcGlvIDAgNCBHUElPX0FDVElW
RV9ISUdIJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiYXR0ZXJ5LWxlZDMgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7cmVuZXctZTpiYXR0ZXJ5LWxlZDMm
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb3MgPSAm
bHQ7JmFtcDtyX3BpbyAwIDUgR1BJT19BQ1RJVkVfSElHSCZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmF0dGVy
eS1sZWQ0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9
ICZxdW90O3JlbmV3LWU6YmF0dGVyeS1sZWQ0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9zID0gJmx0OyZhbXA7cl9waW8gMCA2IEdQSU9fQUNUSVZF
X0hJR0gmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZvbHVtZS1sZWQwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3JlbmV3LWU6dm9sdW1lLWxlZDAmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7
JmFtcDtwaW8gNyAyIEdQSU9fQUNUSVZFX0hJR0gmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZvbHVtZS1sZWQx
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90
O3JlbmV3LWU6dm9sdW1lLWxlZDEmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7JmFtcDtwaW8gNiAxMyBHUElPX0FDVElWRV9ISUdIJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB2b2x1bWUtbGVkMiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtyZW5ldy1lOnZvbHVtZS1sZWQyJnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9zID0gJmx0OyZhbXA7cGlv
IDYgMTIgR1BJT19BQ1RJVkVfSElHSCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdm9sdW1lLWxlZDMgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7cmVuZXct
ZTp2b2x1bWUtbGVkMyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBncGlvcyA9ICZsdDsmYW1wO3BpbyA2IDExIEdQSU9fQUNUSVZFX0hJR0gmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHZvbHVtZS1sZWQ0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBsYWJlbCA9ICZxdW90O3JlbmV3LWU6dm9sdW1lLWxlZDQmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7JmFtcDtwaW8gNiAxMCBH
UElPX0FDVElWRV9ISUdIJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsZWQtcGFkLWludHogezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7cmVuZXctZTpsZWQt
cGFkLWludHomcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Z3Bpb3MgPSAmbHQ7JmFtcDtwaW8gNCAxNiBHUElPX0FDVElWRV9ISUdIJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0LXN0YXRlID0gJnF1b3Q7b24m
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqB9
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBncGlvLWZhbiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2dwaW8tZmFuJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdwaW9zID0gJmx0OyZhbXA7cGlvIDQgMTQgR1BJT19BQ1RJVkVfSElH
SCZndDs7IC8qIEZBTl9PTi9PRkY6IFBFMTQgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncGlvLWZhbixzcGVlZC1tYXAgPSAmbHQ7MCAwIDYwMDAgMSZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmVnX3ZjYzV2MDogdmNjNXYwIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7cmVndWxhdG9yLWZpeGVk
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1
b3Q7dmNjNXYwJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoH07PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO2NvZGVjIHs8YnI+DQorwqAgwqAg
wqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFt
cDtjcHUwIHs8YnI+DQorwqAgwqAgwqAgwqBjcHUtc3VwcGx5ID0gJmx0OyZhbXA7cmVnX2RjZGMz
Jmd0Ozs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyZhbXA7Y3B1MF9vcHBfdGFibGUgezxicj4NCivC
oCDCoCDCoCDCoG9wcC0xMTA0MDAwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBv
cHAtaHogPSAvYml0cy8gNjQgJmx0OzExMDQwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoG9wcC1taWNyb3ZvbHQgPSAmbHQ7MTMyMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2xvY2stbGF0ZW5jeS1ucyA9ICZsdDsyNDQxNDQmZ3Q7OyAvKiA4IDMy
ayBwZXJpb2RzICovPGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
b3BwLTEyMDAwMDAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wcC1oeiA9IC9i
aXRzLyA2NCAmbHQ7MTIwMDAwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
b3BwLW1pY3Jvdm9sdCA9ICZsdDsxMzIwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjbG9jay1sYXRlbmN5LW5zID0gJmx0OzI0NDE0NCZndDs7IC8qIDggMzJrIHBlcmlvZHMg
Ki88YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtkYWkgezxi
cj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KK307PGJyPg0K
Kzxicj4NCismYW1wO2RlIHs8YnI+DQorwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1
b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtkcGh5IHs8YnI+DQorwqAgwqAgwqAgwqBz
dGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtlaGNp
MCB7PGJyPg0KK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQorfTs8
YnI+DQorPGJyPg0KKyZhbXA7bW1jMCB7PGJyPg0KK8KgIMKgIMKgIMKgdm1tYy1zdXBwbHkgPSAm
bHQ7JmFtcDtyZWdfZGNkYzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoGJ1cy13aWR0aCA9ICZsdDs0
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqBub24tcmVtb3ZhYmxlOzxicj4NCivCoCDCoCDCoCDCoHN0
YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO21tYzEg
ezxicj4NCivCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO21tYzFfcGdfcGlucyZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgdm1tYy1zdXBwbHkgPSAmbHQ7JmFtcDtyZWdfZGNkYzEmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoGJ1cy13aWR0aCA9ICZsdDs0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqBicm9r
ZW4tY2Q7PGJyPg0KK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQor
fTs8YnI+DQorPGJyPg0KKyZhbXA7b2hjaTAgezxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZx
dW90O29rYXkmcXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO3JfcnNiIHs8YnI+DQor
wqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqBheHAyMng6IHBtaWNAM2EzIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7eC1wb3dlcnMsYXhwMjIzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDNhMyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1wO3JfaW50YyZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDMyIElSUV9UWVBFX0xFVkVM
X0xPVyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWxkb2luLXN1cHBseSA9ICZs
dDsmYW1wO3JlZ19kY2RjMSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeC1wb3dl
cnMsZHJpdmUtdmJ1cy1lbjs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCit9Ozxicj4NCis8YnI+
DQorI2luY2x1ZGUgJnF1b3Q7YXhwMjIzLmR0c2kmcXVvdDs8YnI+DQorPGJyPg0KKyZhbXA7YWNf
cG93ZXJfc3VwcGx5IHs8YnI+DQorwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7
Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtyZWdfYWxkbzEgezxicj4NCivCoCDCoCDCoCDC
oHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSAmbHQ7MzAwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1t
aWNyb3ZvbHQgPSAmbHQ7MzAwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW5h
bWUgPSAmcXVvdDt2Y2MtaW8mcXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO3JlZ19h
bGRvMiB7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQorwqAgwqAg
wqAgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDsyNTAwMDAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsyNTAwMDAwJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90O3ZkZC1kbGwmcXVvdDs7PGJyPg0KK307
PGJyPg0KKzxicj4NCismYW1wO3JlZ19hbGRvMyB7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9y
LWFsd2F5cy1vbjs8YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZs
dDszMDAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9
ICZsdDszMDAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90
O2F2Y2MmcXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO3JlZ19kYzFzdyB7PGJyPg0K
K8KgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt2Y2MtbGNkJnF1b3Q7Ozxicj4NCit9
Ozxicj4NCis8YnI+DQorJmFtcDtyZWdfZGM1bGRvIHs8YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0
b3ItYWx3YXlzLW9uOzxicj4NCivCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0g
Jmx0OzkwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSAmbHQ7MTQwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVv
dDt2ZGQtY3B1cyZxdW90Ozs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyZhbXA7cmVnX2RjZGMxIHs8
YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4NCivCoCDCoCDCoCDCoHJl
Z3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzMwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzMwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmNjLTN2MCZxdW90Ozs8YnI+DQorfTs8YnI+DQor
PGJyPg0KKyZhbXA7cmVnX2RjZGMyIHs8YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlz
LW9uOzxicj4NCivCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzkwMDAw
MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTQw
MDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt2ZGQtc3lz
JnF1b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtyZWdfZGNkYzMgezxicj4NCivCoCDC
oCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1p
bi1taWNyb3ZvbHQgPSAmbHQ7OTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0b3It
bWF4LW1pY3Jvdm9sdCA9ICZsdDsxNDAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0
b3ItbmFtZSA9ICZxdW90O3ZkZC1jcHUmcXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1w
O3JlZ19kY2RjNSB7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQor
wqAgwqAgwqAgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDsxNTAwMDAwJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsxNTAwMDAwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90O3ZjYy1kcmFtJnF1b3Q7Ozxi
cj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtyZWdfZGxkbzEgezxicj4NCivCoCDCoCDCoCDCoHJl
Z3VsYXRvci1hbHdheXMtb247PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3Zv
bHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNy
b3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUg
PSAmcXVvdDt2Y2MtM3YzLW1haW4xJnF1b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDty
ZWdfZGxkbzIgezxicj4NCivCoCDCoCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KK8Kg
IMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt2Y2MtM3YzLW1haW4yJnF1b3Q7
Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtyZWdfZGxkbzMgezxicj4NCivCoCDCoCDCoCDC
oHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1t
aWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW5h
bWUgPSAmcXVvdDt2Y2MtM3YzLW1haW4zJnF1b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFt
cDtyZWdfZGxkbzQgezxicj4NCivCoCDCoCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0K
K8KgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt2Y2MtM3YzLW1haW40JnF1
b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtyZWdfZWxkbzEgezxicj4NCivCoCDCoCDC
oCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSAmbHQ7MTIwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9yLW1h
eC1taWNyb3ZvbHQgPSAmbHQ7MTIwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgcmVndWxhdG9y
LW5hbWUgPSAmcXVvdDt2Y2MtMXYyLWhkbWkmcXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCism
YW1wO3JlZ19kcml2ZXZidXMgezxicj4NCivCoCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1
b3Q7dXNiMC12YnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkm
cXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO3JlZ19ydGNfbGRvIHs8YnI+DQorwqAg
wqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90O3ZjYy1ydGMmcXVvdDs7PGJyPg0KK307PGJy
Pg0KKzxicj4NCismYW1wO3NvdW5kIHs8YnI+DQorwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtv
a2F5JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoHNpbXBsZS1hdWRpby1jYXJkLHJvdXRpbmcgPTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O0xlZnQgREFDJnF1b3Q7LCAmcXVvdDtE
QUNMJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O1JpZ2h0IERBQyZx
dW90OywgJnF1b3Q7REFDUiZxdW90Ozs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyZhbXA7dWFydDAg
ezxicj4NCivCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3VhcnQwX3BiX3BpbnMmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KK307PGJyPg0K
Kzxicj4NCismYW1wO3VzYl9vdGcgezxicj4NCivCoCDCoCDCoCDCoGRyX21vZGUgPSAmcXVvdDto
b3N0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJy
Pg0KK307PGJyPg0KKzxicj4NCismYW1wO3VzYnBoeSB7PGJyPg0KK8KgIMKgIMKgIMKgLyogVkJV
UyBpcyBhbHdheXMgb24gYmVjYXVzZSBpdCBpcyB3aXJlZCB0byB0aGUgcG93ZXIgc3VwcGx5ICov
PGJyPg0KK8KgIMKgIMKgIMKgdXNiMF92YnVzLXN1cHBseSA9ICZsdDsmYW1wO3JlZ192Y2M1djAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KK307
PGJyPg0KLS0gPGJyPg0KMi4yNS4xPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2
Pg0K
--00000000000073fcac05e5793e70--
