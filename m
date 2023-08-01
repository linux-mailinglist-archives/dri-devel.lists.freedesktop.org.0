Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7B76BEF1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 23:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63FE10E1DD;
	Tue,  1 Aug 2023 21:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C9F10E1DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 21:05:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98EDF61705;
 Tue,  1 Aug 2023 21:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9F7C433C8;
 Tue,  1 Aug 2023 21:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690923918;
 bh=k/0yaN5mmQBaHjig4m14XSWgvdujOdGEwmwnD1Xh0QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qdHvBB+KBf3Q5Vh5WxignzVfnsRm7UTycxrpHQHg1KaoDLAaRPlAlnukQ5S3IolzI
 aXaXjddBFFEFlI+rFlP7dEAynJaEaPB/fO3FBwYv5vG7+o1F/8L3U5KKrqu8NaDyhE
 YeHzPDB7jyZyGjodLsUN15ehzsQNrB8BIqkmhspxO/IK9yUdaWuNwBDJMA/dIQxj+N
 zDtJJGcFEkDRMAXQMtLyMpJiy1LT7UJnqMGW+LwxQpgDiENzojDy+aCnJZBSyYrLbO
 HHayuDCz7HKu9uMYYqTF+J2cLTENnUcMQqFaEMWQfiisegAgCpde+G3ohl1/FeWlOy
 ZSkVTKy/mh01g==
Date: Tue, 1 Aug 2023 22:05:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Jagan Teki <jagan@edgeble.ai>
Subject: Re: [PATCH 07/14] dt-bindings: display: rockchip-dw-mipi-dsi:
 Document rv1126 DSI
Message-ID: <20230801-fetch-playful-e3051d981fd1@spud>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
 <20230731110012.2913742-8-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PdhcfD1FdcYjrOlw"
Content-Disposition: inline
In-Reply-To: <20230731110012.2913742-8-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PdhcfD1FdcYjrOlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 04:30:05PM +0530, Jagan Teki wrote:
> Document the MIPI DSI for Rockchip RV1126.
>=20
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
>=20
>  .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,dw-mipi-dsi.yaml
> index 8e8a40879140..ccf79e738fa1 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi=
-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi=
-dsi.yaml
> @@ -18,6 +18,7 @@ properties:
>            - rockchip,rk3288-mipi-dsi
>            - rockchip,rk3399-mipi-dsi
>            - rockchip,rk3568-mipi-dsi
> +          - rockchip,rv1126-mipi-dsi
>        - const: snps,dw-mipi-dsi
> =20
>    interrupts:
> @@ -77,6 +78,7 @@ allOf:
>              enum:
>                - rockchip,px30-mipi-dsi
>                - rockchip,rk3568-mipi-dsi
> +              - rockchip,rv1126-mipi-dsi
> =20
>      then:
>        properties:
> --=20
> 2.25.1
>=20

--PdhcfD1FdcYjrOlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMlziQAKCRB4tDGHoIJi
0gcPAP4gYxp0Dt+dfNq++YlKsOoCR+vDHgItHbVYbqVWUVx9igD/QtRuD+0/S51/
eB12vTH+tqtbNz+9UQ1y1/p1e1VOSw4=
=r80M
-----END PGP SIGNATURE-----

--PdhcfD1FdcYjrOlw--
