Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330A72090A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 20:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723710E0ED;
	Fri,  2 Jun 2023 18:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984A210E0ED
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 18:21:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE71564FE2;
 Fri,  2 Jun 2023 18:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A609C433D2;
 Fri,  2 Jun 2023 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685730115;
 bh=wZmST5GqZfwNaXvG5ams1yOqiopsMBnwXrGfs0DzrKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HxHBZ0/iZ+gWdLqiKl6YbDXzHpA124IhNDjyA68Fln6QGStTGDWjKUkHIrFN9xTU7
 95B8CQ+aTdp9EW0NAufAfu/J99ZNMwPbFr0ROwPlNVB7+jpFxMx4LoXtuy9pAQyjKp
 8sFG56C83swAIV2LURY2SsrrpVNha0ZqJsDjMfybtxHfV32X2XqmjFOSjFBudnww0z
 AJ29/B2AeOuC4120GlF7y0cLJjI57ri2lUvIUm+mGMJOCxPSJ3vb+PEriH+04FpxU4
 sMVMnuhAk1pTDZNQ5psWuVJ1IGHN46Bcy7i+HMOhMbxJbBNqzcuqQWNs71k5HLKuqk
 ENBfjRGZl6hew==
Date: Fri, 2 Jun 2023 19:21:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Message-ID: <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-2-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MvIfnYU0aT/WgDUu"
Content-Disposition: inline
In-Reply-To: <20230602074043.33872-2-keith.zhao@starfivetech.com>
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


--MvIfnYU0aT/WgDUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Keith,

On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
> Add bindings for JH7110 display subsystem which
> has a display controller verisilicon dc8200
> and an HDMI interface.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../display/verisilicon/starfive-hdmi.yaml    |  93 +++++++++++++++
>  .../display/verisilicon/verisilicon-dc.yaml   | 110 ++++++++++++++++++
>  .../display/verisilicon/verisilicon-drm.yaml  |  42 +++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   7 ++
>  5 files changed, 254 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon=
/starfive-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon=
/verisilicon-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon=
/verisilicon-drm.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/verisilicon/starfi=
ve-hdmi.yaml b/Documentation/devicetree/bindings/display/verisilicon/starfi=
ve-hdmi.yaml
> new file mode 100644
> index 000000000000..c30b7954a355
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/verisilicon/starfive-hdmi=
=2Eyaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/verisilicon/starfive-hdmi.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive HDMI transmiter
> +
> +description:
> +  The StarFive SoC uses the HDMI signal transmiter based on innosilicon =
IP

Is innosilicon the same thing as verisilicon? Also
s/transmiter/transmitter/, both here and in the title.


> +  to generate HDMI signal from its input and transmit the signal to the =
screen.
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,hdmi

Is this going to work on every SoC that StarFive has ever & will ever
make? Please use soc-based compatibles ;)

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
> +
> +  reset-names:
> +    items:
> +      - const: hdmi_tx

You only have one item here, you don't need the "items: - const:",
"const:" alone will do.


> diff --git a/Documentation/devicetree/bindings/display/verisilicon/verisi=
licon-dc.yaml b/Documentation/devicetree/bindings/display/verisilicon/veris=
ilicon-dc.yaml
> new file mode 100644
> index 000000000000..1322502c4cde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/verisilicon/verisilicon-d=
c.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/verisilicon/verisilicon-dc.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive display controller
> +
> +description:
> +  The StarFive SoC uses the display controller based on Verisilicon IP
> +  to transfer the image data from a video memory
> +  buffer to an external LCD interface.

Is it based on Verisilicon IP, or is it exactly that verisilicon IP? I
ask because...

> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: verisilicon,dc8200

=2E..the compatible is the verisilicon IP. I would be a lot happier if
the compatibles were set yp for something like:
"starfive,jh7110-foo", "verisilicon,dc8200"

> diff --git a/Documentation/devicetree/bindings/display/verisilicon/verisi=
licon-drm.yaml b/Documentation/devicetree/bindings/display/verisilicon/veri=
silicon-drm.yaml
> new file mode 100644
> index 000000000000..aed8d4af2c55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/verisilicon/verisilicon-d=
rm.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/verisilicon/verisilicon-drm.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Verisilicon DRM master device
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> +
> +description: |
> +  The Verisilicon DRM master device is a virtual device needed to list a=
ll
> +  display controller or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: verisilicon,display-subsystem

Same here.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 82d39ab0231b..52c04fd098be 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1436,6 +1436,8 @@ patternProperties:
>      description: Variscite Ltd.
>    "^vdl,.*":
>      description: Van der Laan b.v.
> +  "^verisilicon,.*":
> +    description: Verisilicon Technologies, Inc.

This should be in it's own patch.

Cheers,
Conor.

>    "^vertexcom,.*":
>      description: Vertexcom Technologies, Inc.
>    "^via,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2a0496448b7f..293aa13d484c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7049,6 +7049,13 @@ F:	Documentation/devicetree/bindings/display/brcm,=
bcm2835-*.yaml
>  F:	drivers/gpu/drm/vc4/
>  F:	include/uapi/drm/vc4_drm.h
> =20
> +DRM DRIVERS FOR VERISILICON
> +M:	Keith Zhao <keith.zhao@starfivetech.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/verisilicon/
> +
>  DRM DRIVERS FOR VIVANTE GPU IP
>  M:	Lucas Stach <l.stach@pengutronix.de>
>  R:	Russell King <linux+etnaviv@armlinux.org.uk>
> --=20
> 2.34.1
>=20

--MvIfnYU0aT/WgDUu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHozOwAKCRB4tDGHoIJi
0qGfAQCOw/FcLRxZ76ev3AIGXrIb1ZeNQe+VXPB56KKXU2pSxwEArYO0igKszta9
cCp+5+8uMIkgXInjUhRVx70UBTTb9gs=
=sbrO
-----END PGP SIGNATURE-----

--MvIfnYU0aT/WgDUu--
