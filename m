Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D408356D46F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 08:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6BF14A355;
	Mon, 11 Jul 2022 06:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B141614A353
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 06:01:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u12so7042556eja.8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 23:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AvY5ls+s7Ti9jwycw1jgl+ZZYp3856dYd8r/DxlHTzY=;
 b=WIYY290mzxiAc7yrO7y+fy6TbsFW93MM/+ndWA/sc9uBtPgNQZhpOM1GZyZnsVMfga
 vfmdeBFuD9N/CX3Km1XBW0/W/0mwOlfOg8099bZY1/WzCRYEgq0DbgPFjEZYJf3JFmkB
 P8RjXHAR/c+1df1n8P34YZynYX29e3e5kjPgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AvY5ls+s7Ti9jwycw1jgl+ZZYp3856dYd8r/DxlHTzY=;
 b=y+sTcMPkk2rCgaQVdlk6LoYOHiAkSe3gHMx9bjt6+j0JXhBTbosV3t9KFIt7opwJDA
 V/GjNOmBogR4576KQEDY0kW+V0rKMOM3JsceZoCpjlX7X4l3U6JYEZelqJFO9Ulpb+Ei
 s3qVwVxp+MCpeqFmfdcSrgDYI/yDOUY0AXTX9iv2MLCmIT0MVbz5MmeTEdoXitQQiVxQ
 koCtDGnhYmKoYFgKsfk30MUuSzHqAGNYKCG9Ivpwf6scwom8E9u23uBlEsnDByw0YiF7
 KplWJgsDxp2LFkqurFDWyYCObxZVJWVuZaYaa2YxocIP+cY1ye2Ji/HmS9dC4CGNNt9t
 XoQQ==
X-Gm-Message-State: AJIora/tWajU9DabvAOEU3k2G7q+6GWiM3E39tdSoRvWyWN8QL7tpLc+
 tJKYESxreTpi+hk8BZb8TnuWAB08tdGUxmXMCmvTig==
X-Google-Smtp-Source: AGRyM1vy9ZcqIuN1PXefdJ6lzxPGtjD8jxLbcRmcG4r+aLKQHAZuFuPW9VuWE3naXqRgKQu1U6LJUuQOWZ51tPc+UCk=
X-Received: by 2002:a17:906:84f0:b0:72b:5cf4:465d with SMTP id
 zp16-20020a17090684f000b0072b5cf4465dmr1533871ejb.705.1657519275187; Sun, 10
 Jul 2022 23:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220615093900.344726-1-sunil@amarulasolutions.com>
 <20220615093900.344726-3-sunil@amarulasolutions.com>
 <0bb1761f-4fa4-c6e2-852f-f110d026eac0@sholland.org>
In-Reply-To: <0bb1761f-4fa4-c6e2-852f-f110d026eac0@sholland.org>
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Mon, 11 Jul 2022 11:31:03 +0530
Message-ID: <CAM+7aWuor4rhDDTwLd1CLk+6bxY+yiAjBsPdCH0H3KU1Poq6uQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: sun8i: Add R16 Vista E board from
 RenewWorldOutreach
To: Samuel Holland <samuel@sholland.org>
Content-Type: multipart/alternative; boundary="0000000000009b2fd405e38147de"
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
 Christopher Vollo <chris@renewoutreach.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009b2fd405e38147de
Content-Type: text/plain; charset="UTF-8"

Hi Samuel,

On Sun, Jul 3, 2022 at 1:12 PM Samuel Holland <samuel@sholland.org> wrote:

> On 6/15/22 4:39 AM, Suniel Mahesh wrote:
> > The R16-Vista-E board from RenewWorldOutreach based on allwinner
> > R16(A33).
> >
> > General features:
> > - 1GB RAM
> > - microSD slot
> > - Realtek Wifi
> > - 1 x USB 2.0
> > - HDMI IN
> > - HDMI OUT
> > - Audio out
> > - MIPI DSI
> > - TI DLPC3433
> >
> > It has also connectors to connect an external mini keypad.
> >
> > Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> >
> > ---
> > Changes for v2:
> > - Add missing compatible string
> > - insert missing signatures of contributors
> > ---
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 361 ++++++++++++++++++
> >  2 files changed, 362 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 184899808ee7..b5966c0742e1 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1353,6 +1353,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> >       sun8i-r16-nintendo-nes-classic.dtb \
> >       sun8i-r16-nintendo-super-nes-classic.dtb \
> >       sun8i-r16-parrot.dtb \
> > +     sun8i-r16-renew-vista-e.dtb \
> >       sun8i-r40-bananapi-m2-ultra.dtb \
> >       sun8i-r40-oka40i-c.dtb \
> >       sun8i-s3-elimo-initium.dtb \
> > diff --git a/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> > new file mode 100644
> > index 000000000000..45f620203c33
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> > @@ -0,0 +1,361 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2022 RenewWorldOutreach
> > + * Copyright (C) 2022 Amarula Solutions(India)
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun8i-a33.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +     model = "RenewWorldOutreach R16-Vista-E";
> > +     compatible = "renewworldoutreach,r16-vista-e",
> "allwinner,sun8i-r16", "allwinner,sun8i-a33";
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     gpio-keys-polled {
> > +             compatible = "gpio-keys-polled";
> > +             poll-interval = <100>;
> > +
> > +             ok {
> > +                     label = "ok";
> > +                     linux,code = <KEY_OK>;
> > +                     gpios = <&pio 4 0 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             left {
> > +                     label = "left";
> > +                     linux,code = <KEY_LEFT>;
> > +                     gpios = <&pio 4 1 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             right {
> > +                     label = "right";
> > +                     linux,code = <KEY_RIGHT>;
> > +                     gpios = <&pio 4 2 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             up {
> > +                     label = "up";
> > +                     linux,code = <KEY_UP>;
> > +                     gpios = <&pio 4 3 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             down {
> > +                     label = "down";
> > +                     linux,code = <KEY_DOWN>;
> > +                     gpios = <&pio 4 4 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             back {
> > +                     label = "back";
> > +                     linux,code = <KEY_BACK>;
> > +                     gpios = <&pio 4 5 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             power {
> > +                     label = "power";
> > +                     linux,code = <KEY_POWER>;
> > +                     gpios = <&pio 4 6 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             vol-down {
> > +                     label = "vol-down";
> > +                     linux,code = <KEY_VOLUMEDOWN>;
> > +                     gpios = <&pio 7 3 GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             vol-up {
> > +                     label = "vol-up";
> > +                     linux,code = <KEY_VOLUMEUP>;
> > +                     gpios = <&pio 7 9 GPIO_ACTIVE_LOW>;
> > +             };
> > +     };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +
> > +             battery-led0 {
> > +                     label = "renew-e:battery-led0";
> > +                     gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             battery-led1 {
> > +                     label = "renew-e:battery-led1";
> > +                     gpios = <&r_pio 0 3 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             battery-led2 {
> > +                     label = "renew-e:battery-led2";
> > +                     gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             battery-led3 {
> > +                     label = "renew-e:battery-led3";
> > +                     gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             pad-intz {
> > +                     label = "renew-e:pad-intz";
> > +                     gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>;
> > +                     default-state = "on";
> > +             };
>
> Is this really an LED, or just a generic output?
>

this is an LED


>
> > +
> > +             battery-led4 {
> > +                     label = "renew-e:battery-led4";
> > +                     gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             volume-led0 {
> > +                        label = "renew-e:volume-led0";
> > +                        gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
> > +                };
>
> Indent with tabs, please.
>

indenting, sending a v3

>
> > +
> > +             volume-led1 {
> > +                     label = "renew-e:volume-led1";
> > +                     gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             volume-led2 {
> > +                     label = "renew-e:volume-led2";
> > +                     gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             volume-led3 {
> > +                     label = "renew-e:volume-led3";
> > +                     gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             volume-led4 {
> > +                     label = "renew-e:volume-led4";
> > +                     gpios = <&pio 6 10 GPIO_ACTIVE_HIGH>;
> > +             };
> > +
> > +             fans-on {
> > +                     label = "renew-e:fans-on";
> > +                     gpios = <&pio 4 14 GPIO_ACTIVE_HIGH>; /*
> FAN_ON/OFF: PE14 */
> > +                     default-state = "on";
> > +             };
>
> Does this drive an LED or control a fan? If it controls a fan, it should
> use the
> gpio-fan binding, and not pretend to be an LED.
>
> it controls a fan
changing the binding to gpio-fan


> It also does not validate against the gpio-leds binding:
>
> sun8i-r16-renew-vista-e.dtb: leds: 'fans-on', 'pad-intz' do not match any
> of the
> regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>
> > +     };
> > +
> > +     reg_vcc5v0: vcc5v0 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc5v0";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +     };
> > +};
> > +
> > +&codec {
> > +     status = "okay";
> > +};
> > +
> > +&cpu0 {
> > +     cpu-supply = <&reg_dcdc3>;
> > +};
> > +
> > +&cpu0_opp_table {
> > +     opp-1104000000 {
> > +             opp-hz = /bits/ 64 <1104000000>;
> > +             opp-microvolt = <1320000>;
> > +             clock-latency-ns = <244144>; /* 8 32k periods */
> > +     };
> > +
> > +     opp-1200000000 {
> > +             opp-hz = /bits/ 64 <1200000000>;
> > +             opp-microvolt = <1320000>;
> > +             clock-latency-ns = <244144>; /* 8 32k periods */
> > +     };
> > +};
> > +
> > +&dai {
> > +     status = "okay";
> > +};
> > +
> > +&de {
> > +     status = "okay";
> > +};
> > +
> > +&dphy {
> > +     status = "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status = "okay";
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply = <&reg_dcdc1>;
> > +     bus-width = <4>;
> > +     non-removable;
> > +     status = "okay";
> > +};
> > +
> > +&mmc1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&mmc1_pg_pins>;
> > +     vmmc-supply = <&reg_dcdc1>;
> > +     bus-width = <4>;
> > +     broken-cd;
> > +     status = "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status = "okay";
> > +};
> > +
> > +&r_rsb {
> > +     status = "okay";
> > +
> > +     axp22x: pmic@3a3 {
> > +             compatible = "x-powers,axp223";
> > +             reg = <0x3a3>;
> > +             interrupt-parent = <&r_intc>;
> > +             interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> > +             eldoin-supply = <&reg_dcdc1>;
> > +             x-powers,drive-vbus-en;
> > +     };
> > +};
> > +
> > +#include "axp223.dtsi"
> > +
> > +&ac_power_supply {
> > +     status = "okay";
> > +};
> > +
> > +&reg_aldo1 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <3000000>;
> > +     regulator-max-microvolt = <3000000>;
> > +     regulator-name = "vcc-io";
> > +};
> > +
> > +&reg_aldo2 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <2500000>;
> > +     regulator-max-microvolt = <2500000>;
> > +     regulator-name = "vdd-dll";
> > +};
> > +
> > +&reg_aldo3 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <3000000>;
> > +     regulator-max-microvolt = <3000000>;
> > +     regulator-name = "avcc";
> > +};
> > +
> > +&reg_dc1sw {
> > +     regulator-name = "vcc-lcd";
> > +};
> > +
> > +&reg_dc5ldo {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <900000>;
> > +     regulator-max-microvolt = <1400000>;
> > +     regulator-name = "vdd-cpus";
> > +};
> > +
> > +&reg_dcdc1 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <3000000>;
> > +     regulator-max-microvolt = <3000000>;
> > +     regulator-name = "vcc-3v0";
> > +};
> > +
> > +&reg_dcdc2 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <900000>;
> > +     regulator-max-microvolt = <1400000>;
> > +     regulator-name = "vdd-sys";
> > +};
> > +
> > +&reg_dcdc3 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <900000>;
> > +     regulator-max-microvolt = <1400000>;
> > +     regulator-name = "vdd-cpu";
> > +};
> > +
> > +&reg_dcdc5 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <1500000>;
> > +     regulator-max-microvolt = <1500000>;
> > +     regulator-name = "vcc-dram";
> > +};
> > +
> > +&reg_dldo1 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <3300000>;
> > +     regulator-max-microvolt = <3300000>;
> > +     regulator-name = "vcc-3v3-main1";
> > +};
> > +
> > +&reg_dldo2 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <3300000>;
> > +     regulator-max-microvolt = <3300000>;
> > +     regulator-name = "vcc-3v3-main2";
> > +};
> > +
> > +&reg_dldo3 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <3300000>;
> > +     regulator-max-microvolt = <3300000>;
> > +     regulator-name = "vcc-3v3-main3";
> > +};
> > +
> > +&reg_dldo4 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <3300000>;
> > +     regulator-max-microvolt = <3300000>;
> > +     regulator-name = "vcc-3v3-main4";
> > +};
> > +
> > +&reg_eldo1 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt = <1200000>;
> > +     regulator-max-microvolt = <1200000>;
> > +     regulator-name = "vcc-1v2-hdmi";
> > +};
> > +
> > +&reg_drivevbus {
> > +     regulator-name = "usb0-vbus";
> > +     status = "okay";
> > +};
> > +
> > +&reg_rtc_ldo {
> > +     regulator-name = "vcc-rtc";
> > +};
> > +
> > +&sound {
> > +     status = "okay";
> > +     simple-audio-card,routing =
> > +             "Left DAC", "AIF1 Slot 0 Left",
> > +             "Right DAC", "AIF1 Slot 0 Right";
>
> Please use "DACL" and "DACR" here, instead of the AIF1 Slot 0 widgets. The
> AIF1
> Slot 0 widgets do not accurately describe the audio routing and are only
> kept
> for backward compatibility.
>
> making the changes as suggested


> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart0_pb_pins>;
> > +     status = "okay";
> > +};
> > +
> > +&usb_otg {
> > +     dr_mode = "host";
> > +     status = "okay";
> > +};
> > +
> > +&usbphy {
> > +     usb0_vbus-supply = <&reg_vcc5v0>;
>
> You enable drivevbus and label it as "usb0-vbus". But this suggests the
> VBUS is
> always on. Which is correct?
>

yes, VBUS is always on


>
> > +     status = "okay";
> > +};
> >
>
>

--0000000000009b2fd405e38147de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Samuel,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 3, 2022 at 1:12 PM =
Samuel Holland &lt;<a href=3D"mailto:samuel@sholland.org">samuel@sholland.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 6/15/22 4:39 AM, Suniel Mahesh wrote:<br>
&gt; The R16-Vista-E board from RenewWorldOutreach based on allwinner<br>
&gt; R16(A33).<br>
&gt; <br>
&gt; General features:<br>
&gt; - 1GB RAM<br>
&gt; - microSD slot<br>
&gt; - Realtek Wifi<br>
&gt; - 1 x USB 2.0<br>
&gt; - HDMI IN<br>
&gt; - HDMI OUT<br>
&gt; - Audio out<br>
&gt; - MIPI DSI<br>
&gt; - TI DLPC3433<br>
&gt; <br>
&gt; It has also connectors to connect an external mini keypad.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Vollo &lt;<a href=3D"mailto:chris@renewoutr=
each.org" target=3D"_blank">chris@renewoutreach.org</a>&gt;<br>
&gt; Signed-off-by: Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions=
.com" target=3D"_blank">jagan@amarulasolutions.com</a>&gt;<br>
&gt; Signed-off-by: Suniel Mahesh &lt;<a href=3D"mailto:sunil@amarulasoluti=
ons.com" target=3D"_blank">sunil@amarulasolutions.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; Changes for v2:<br>
&gt; - Add missing compatible string<br>
&gt; - insert missing signatures of contributors<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 361 ++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 362 insertions(+)<br>
&gt;=C2=A0 create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts=
<br>
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile<b=
r>
&gt; index 184899808ee7..b5966c0742e1 100644<br>
&gt; --- a/arch/arm/boot/dts/Makefile<br>
&gt; +++ b/arch/arm/boot/dts/Makefile<br>
&gt; @@ -1353,6 +1353,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun8i-r16-nintendo-nes-classic.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun8i-r16-nintendo-super-nes-classic.dtb \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun8i-r16-parrot.dtb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sun8i-r16-renew-vista-e.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun8i-r40-bananapi-m2-ultra.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun8i-r40-oka40i-c.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun8i-s3-elimo-initium.dtb \<br>
&gt; diff --git a/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts b/arch/arm/=
boot/dts/sun8i-r16-renew-vista-e.dts<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..45f620203c33<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts<br>
&gt; @@ -0,0 +1,361 @@<br>
&gt; +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2022 RenewWorldOutreach<br>
&gt; + * Copyright (C) 2022 Amarula Solutions(India)<br>
&gt; + */<br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +#include &quot;sun8i-a33.dtsi&quot;<br>
&gt; +<br>
&gt; +#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt; +#include &lt;dt-bindings/input/input.h&gt;<br>
&gt; +#include &lt;dt-bindings/leds/common.h&gt;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0model =3D &quot;RenewWorldOutreach R16-Vista-E&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;renewworldoutreach,r16-vista=
-e&quot;, &quot;allwinner,sun8i-r16&quot;, &quot;allwinner,sun8i-a33&quot;;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &amp;uart=
0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &quot=
;serial0:115200n8&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio-keys-polled {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
gpio-keys-polled&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0poll-interval =3D &lt=
;100&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;ok&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_OK&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 0 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0left {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;left&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_LEFT&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 1 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0right {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;right&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_RIGHT&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 2 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0up {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;up&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_UP&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 3 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0down {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;down&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_DOWN&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 4 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0back {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;back&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_BACK&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 5 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0power {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;power&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_POWER&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 6 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vol-down {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;vol-down&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_VOLUMEDOWN&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 7 3 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vol-up {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;vol-up&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,code =3D &lt;KEY_VOLUMEUP&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 7 9 GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0leds {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
gpio-leds&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0battery-led0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:battery-led0&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;r_pio 0 2 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0battery-led1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:battery-led1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;r_pio 0 3 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0battery-led2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:battery-led2&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;r_pio 0 4 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0battery-led3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:battery-led3&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;r_pio 0 5 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pad-intz {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:pad-intz&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 16 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0default-state =3D &quot;on&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<br>
Is this really an LED, or just a generic output?<br></blockquote><div><br><=
/div><div>this is an LED</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0battery-led4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:battery-led4&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;r_pio 0 6 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volume-led0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 label =3D &quot;renew-e:volume-led0&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 gpios =3D &lt;&amp;pio 7 2 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
Indent with tabs, please.<br></blockquote><div>=C2=A0</div><div>indenting, =
sending a v3=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volume-led1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:volume-led1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 6 13 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volume-led2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:volume-led2&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 6 12 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volume-led3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:volume-led3&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 6 11 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volume-led4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:volume-led4&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 6 10 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fans-on {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;renew-e:fans-on&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 4 14 GPIO_ACTIVE_HIGH&gt;; /* FAN_ON/OFF: PE1=
4 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0default-state =3D &quot;on&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<br>
Does this drive an LED or control a fan? If it controls a fan, it should us=
e the<br>
gpio-fan binding, and not pretend to be an LED.<br>
<br></blockquote><div>it controls a fan=C2=A0</div><div>changing the bindin=
g to gpio-fan</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
It also does not validate against the gpio-leds binding:<br>
<br>
sun8i-r16-renew-vista-e.dtb: leds: &#39;fans-on&#39;, &#39;pad-intz&#39; do=
 not match any of the<br>
regexes: &#39;(^led-[0-9a-f]$|led)&#39;, &#39;pinctrl-[0-9]+&#39;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_vcc5v0: vcc5v0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
regulator-fixed&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D &q=
uot;vcc5v0&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvo=
lt =3D &lt;5000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvo=
lt =3D &lt;5000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;codec {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;cpu0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cpu-supply =3D &lt;&amp;reg_dcdc3&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;cpu0_opp_table {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0opp-1104000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp-hz =3D /bits/ 64 =
&lt;1104000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp-microvolt =3D &lt=
;1320000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-latency-ns =3D =
&lt;244144&gt;; /* 8 32k periods */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0opp-1200000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp-hz =3D /bits/ 64 =
&lt;1200000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opp-microvolt =3D &lt=
;1320000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-latency-ns =3D =
&lt;244144&gt;; /* 8 32k periods */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;dai {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;de {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;dphy {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;ehci0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mmc0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vmmc-supply =3D &lt;&amp;reg_dcdc1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0non-removable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mmc1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;mmc1_pg_pins&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vmmc-supply =3D &lt;&amp;reg_dcdc1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0broken-cd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;ohci0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;r_rsb {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0axp22x: pmic@3a3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
x-powers,axp223&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x3a3&gt;=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =3D =
&lt;&amp;r_intc&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 32 IRQ_TYPE_LEVEL_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eldoin-supply =3D &lt=
;&amp;reg_dcdc1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x-powers,drive-vbus-e=
n;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +#include &quot;axp223.dtsi&quot;<br>
&gt; +<br>
&gt; +&amp;ac_power_supply {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_aldo1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;3000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-io&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_aldo2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;2500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;2500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vdd-dll&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_aldo3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;3000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;avcc&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dc1sw {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-lcd&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dc5ldo {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;900000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;1400000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vdd-cpus&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dcdc1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;3000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-3v0&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dcdc2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;900000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;1400000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vdd-sys&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dcdc3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;900000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;1400000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vdd-cpu&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dcdc5 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;1500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;1500000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-dram&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dldo1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-3v3-main1&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dldo2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-3v3-main2&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dldo3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-3v3-main3&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_dldo4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-3v3-main4&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_eldo1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;1200000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;1200000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-1v2-hdmi&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_drivevbus {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;usb0-vbus&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_rtc_ldo {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator-name =3D &quot;vcc-rtc&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;sound {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0simple-audio-card,routing =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Left DAC&quot;,=
 &quot;AIF1 Slot 0 Left&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Right DAC&quot;=
, &quot;AIF1 Slot 0 Right&quot;;<br>
<br>
Please use &quot;DACL&quot; and &quot;DACR&quot; here, instead of the AIF1 =
Slot 0 widgets. The AIF1<br>
Slot 0 widgets do not accurately describe the audio routing and are only ke=
pt<br>
for backward compatibility.<br>
<br></blockquote><div>making the changes as suggested</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +};<br>
&gt; +<br>
&gt; +&amp;uart0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;uart0_pb_pins&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;usb_otg {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dr_mode =3D &quot;host&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;usbphy {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usb0_vbus-supply =3D &lt;&amp;reg_vcc5v0&gt;;<br>
<br>
You enable drivevbus and label it as &quot;usb0-vbus&quot;. But this sugges=
ts the VBUS is<br>
always on. Which is correct?<br></blockquote><div><br></div><div>yes, VBUS =
is always on</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000009b2fd405e38147de--
