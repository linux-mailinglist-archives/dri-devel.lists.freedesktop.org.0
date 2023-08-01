Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885876B6A5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751D10E0F4;
	Tue,  1 Aug 2023 14:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38B10E0F4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 14:03:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A6B6615B9;
 Tue,  1 Aug 2023 14:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D135C433C8;
 Tue,  1 Aug 2023 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690898615;
 bh=J1Kv0/7tNUUdsgbJSV348cn2wjwWWI28VoiCD919J1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRKTjP5gMBMuoyifvof5VTmSNc6vDWI9l5DkvIxTqN4QHv+XXe7n40Rbnar0jyB4E
 rhzGXQd0Q8thtuaf289xIFb0DvaVXzgJVlzdMSSBd/iKa+Qsk6cZ4BASCYKiYFl7Lv
 4LeI9+5CILuHfqT6mu+1xMMp4xTeO/aq+4C5lV+nn+MyUx9K2nZm5fqbFE0jMorNaY
 F4Y0KAz2vf1Y5mAyR0sUaDzx6kSNKGJcFwA2RFubIphJqnavP/xqSqNA6BPYP0PgPL
 xsAaz/2mMR9o2fYVFrN8Ywj0stbVbxxK9a6VfXgdK5h9RXbPUX4BczmD/9tT+6NkRX
 7BnuQyIex18Pw==
Date: Tue, 1 Aug 2023 15:03:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH v1 v1 2/7] dt-bindings: display: Add yamls for JH7110
 display system
Message-ID: <20230801-cash-squad-8a2e9154af8b@spud>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-3-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e6NUZOkjskRZqTKd"
Content-Disposition: inline
In-Reply-To: <20230801101030.2040-3-keith.zhao@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e6NUZOkjskRZqTKd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 06:10:25PM +0800, Keith Zhao wrote:
> StarFive SoCs JH7110 display system:
> lcd-controller bases verisilicon dc8200 IP,
> and hdmi bases Innosilicon IP.
> Add bindings for them.

Please, you can use more than 46 characters in a line!

Also, "v1 v1" does not a v2 make.

>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../starfive/starfive,display-subsystem.yaml  |  41 +++++++
>  .../starfive/starfive,jh7110-dc8200.yaml      | 107 ++++++++++++++++++
>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  92 +++++++++++++++
>  3 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-dc8200.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-inno-hdmi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive=
/starfive,display-subsystem.yaml
> new file mode 100644
> index 000000000..86018a8e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,display=
-subsystem.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,display-sub=
system.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive DRM master device
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> +
> +description:
> +  The Starfive DRM master device is a virtual device needed to list all
> +  display controller or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: starfive,display-subsystem
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |

A | is not needed when you do not have formatting to preserve.

> +      Should contain a list of phandles pointing to display interface po=
rts
> +      of display controller devices. Display controller definitions as d=
efined
> +      in Documentation/devicetree/bindings/display/starfive/
> +      starfive,jh7110-dc8200.yaml
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    display-subsystem {
> +        compatible =3D "starfive,display-subsystem";
> +        ports =3D <&dc_out>;
> +    };

Given Rob's bot complains, it looks like you never tested this.

> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/sta=
rfive,jh7110-dc8200.yaml
> new file mode 100644
> index 000000000..bebe2050c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-=
dc8200.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc82=
00.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive display controller
> +
> +description:
> +  The StarFive SoC uses the display controller based on Verisilicon IP
> +  to transfer the image data from a video memory
> +  buffer to an external LCD interface.
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-dc8200
> +
> +  reg:
> +    maxItems: 3

What do each of these represent?

> +
> +  interrupts:
> +    items:
> +      - description: The interrupt will be generated when DC finish one =
frame
> +
> +  clocks:
> +    items:
> +      - description: Clock for display system noc bus.
> +      - description: Pixel clock for display channel 0.
> +      - description: Pixel clock for display channel 1.
> +      - description: Clock for axi interface of display controller.
> +      - description: Core clock for display controller.
> +      - description: Clock for ahb interface of display controller.
> +      - description: External HDMI pixel clock.
> +      - description: Parent clock for pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: vout_noc_disp
> +      - const: vout_pix0
> +      - const: vout_pix1
> +      - const: vout_axi
> +      - const: vout_core
> +      - const: vout_vout_ahb
> +      - const: hdmitx0_pixel
> +      - const: vout_dc8200
> +
> +  resets:
> +    items:
> +      - description: Reset for axi interface of display controller.
> +      - description: Reset for ahb interface of display controller.
> +      - description: Core reset of display controller.
> +
> +  reset-names:
> +    items:
> +      - const: vout_axi
> +      - const: vout_ahb
> +      - const: vout_core

Please trim all the vouts from here & the clocks - especially the one
named "vout_vout_ahb".

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.

This file is empty, it has been converted to yaml.

> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,=
jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfive/=
starfive,jh7110-inno-hdmi.yaml
> new file mode 100644
> index 000000000..f6927acf6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-=
inno-hdmi.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno=
-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive JH7110 HDMI controller
> +
> +description:
> +  The StarFive JH7110 SoC uses the HDMI signal transmiter based on innos=
ilicon IP
> +  to generate HDMI signal from its input and transmit the signal to the =
screen.
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: "starfive,jh7110-inno-hdmi"
> +
> +  reg:
> +    minItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: The HDMI hot plug detection interrupt.
> +
> +  clocks:
> +    items:
> +      - description: System clock of HDMI module.
> +      - description: Mclk clock of HDMI audio.
> +      - description: Bclk clock of HDMI audio.
> +      - description: Pixel clock generated by HDMI module.
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: mclk
> +      - const: bclk
> +      - const: pclk
> +
> +  resets:
> +    items:
> +      - description: Reset for HDMI module.

For this & resets, you don't have a list & don't need items:

Cheers,
Conor.

--e6NUZOkjskRZqTKd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMkQrwAKCRB4tDGHoIJi
0hF/AQC/1GTXuwyc+w2g9RKifKromVQFlvBvFI0JlmYNLu6I9gEAqVJE6rLiklf3
jktEbPFxEUmQR4+8/IvlY0DbYWbksgw=
=bnBb
-----END PGP SIGNATURE-----

--e6NUZOkjskRZqTKd--
