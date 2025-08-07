Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83762B1DAB8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 17:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8110610E0A0;
	Thu,  7 Aug 2025 15:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A6C10E0A0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 15:25:01 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id EB8FF1F00056
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 15:24:49 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 3CA49B012C2; Thu,  7 Aug 2025 15:24:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id 92918B012AF;
 Thu,  7 Aug 2025 15:24:44 +0000 (UTC)
Date: Thu, 7 Aug 2025 17:24:41 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 07/22] dt-bindings: vendor-prefixes: Shenzhen Baijie
 Technology
Message-ID: <aJTFOV_MK4GftLWu@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-7-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ho7mfi0SoROEEEAS"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-7-13b52f71fb14@linumiz.com>
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


--ho7mfi0SoROEEEAS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> Add entry for Shenzhen Baijie Technology (https://szbaijie.com)
>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index da01616802c7..81cbc8b6b195 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1466,6 +1466,8 @@ patternProperties:
>    "^synopsys,.*":
>      description: Synopsys, Inc. (deprecated, use snps)
>      deprecated: true
> +  "^szbaijie,.*":

It's quite common for Chinese companies to have their main location as a pr=
efix
in their name, for example Rockchip's full name is Fuzhou Rockchip Electron=
ics
Co., Ltd.

Since the company here calls itself "Baijie Technology" I think the "sz" pa=
rt
should be dropped from the vendor prefix and just be "baijie,.*".

All the best,

Paul

> +    description: Shenzhen Baijie Technology Co., Ltd.
>    "^tbs,.*":
>      description: TBS Technologies
>    "^tbs-biometrics,.*":
>=20
> --=20
> 2.39.5
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--ho7mfi0SoROEEEAS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiUxTkACgkQhP3B6o/u
lQwopA/+OeQYWbpgzDlU7JSXZXYWbcSY72g6g2qNUV8nGT5ut5lkOdPpDbag40ll
kW45uiqEwvjAqNjfNv2jP1oIIZJ/OzRfJ+5rFc0e5iskSa4bd8NOv8AHZMF0ibL6
Qc9N+qH1HdFiL/7e0btMZKjWTPTyoBqSLN2oJbEPrI14E/YyOpnmi0FQwP9tSBvD
GJHPXfijHfK/JJnlIV70cJSUugUvmcLzpy3JxoiuW8PModhutaIYXdZiyDsqWxBK
d+kxznL9QDfnY1qtQkse38eigagjwswfQXmSjTAXXNTFl+sQXFsKoxDZ21HBgd7X
3rwxa/hqesqIe6EPAs5xDQi6F2BOBa+ZLzLnjqmlj5FEZttLx/c8IePLqPHlKcg2
ycEsXE4XE0hpqs676aUwb/xVjVXbchBriZYX9ftKokBhRw/8AkRAUE6O4RNS4sGR
X+rhGpoaFKBiI2kcu1aF7cAjv6BhYfOhs9d6wFVfF0dDVsC2Cf+9pBMysCc0zSXX
/OLwkZj3sucRQHpNV5ZVsSQqR/ZUlae8K4INMLaMZFt97nW4EyCaHdmHlHrM7A7D
dp3NaIPkts0QyUswwDFY0Ahn/dqLKRxCVlUBix05YuGy0gbfigILHXxcERddkoyq
SG3VlZcyst6/ryITN66ZxWnPBrhxVFGN1NheSCPPe6E93GYPfuc=
=jRKT
-----END PGP SIGNATURE-----

--ho7mfi0SoROEEEAS--
