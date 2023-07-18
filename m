Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C205275817B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB6A10E1B7;
	Tue, 18 Jul 2023 15:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B883D10E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:56:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C03961636;
 Tue, 18 Jul 2023 15:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E5BC433C7;
 Tue, 18 Jul 2023 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689695801;
 bh=OUGHLXWRvZQd4i149WLBrdAwtqzrKGDvVPyUoqibuF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qTKticjYbVQQLmTeraIKe4Qz5hsaBMNYKBSWjRdWymOQjCAeSYl/cbzrGVyJVGTlu
 te9NliQFYAHQYJJiTL8zUXlV3m8TWS2UNfrhT/oLET0tAeB8CW959AvNGpSOvhfJh0
 Xc9dzDDtvm9+bzIY2GY2EzzzLaQdc3tKUAYKBibCGJvmfganbbBNLwwt2kzCfm5FWQ
 0PYZ2Z8kCP35qqGU96rUMunAlkGsTVGX0d6FnH3CWY/7qRj/vM0dysv6F0Dmmel7gv
 y98hESioDjPW+eepPregpMMkAZsmjUzczPXVbGR3c4piTGei9kTPH0+yioxjslat++
 3ldAWnj/SR5AA==
Date: Tue, 18 Jul 2023 16:56:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: add jasonic
Message-ID: <20230718-endurance-dismiss-3aeab33dd7f2@spud>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <20230718-feature-lcd-panel-v1-1-e9a85d5374fd@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="79UkCYMlLnqwphdT"
Content-Disposition: inline
In-Reply-To: <20230718-feature-lcd-panel-v1-1-e9a85d5374fd@wolfvision.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--79UkCYMlLnqwphdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 05:31:50PM +0200, Michael Riesch wrote:
> Add vendor prefix for Jasonic Technology Ltd., a manufacturer
> of custom LCD panels.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 1e2e51401dc5..1dfafc339ddd 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -677,6 +677,8 @@ patternProperties:
>      description: iWave Systems Technologies Pvt. Ltd.
>    "^jadard,.*":
>      description: Jadard Technology Inc.
> +  "^jasonic,.*":
> +    description: Jasonic Technology Ltd.
>    "^jdi,.*":
>      description: Japan Display Inc.
>    "^jedec,.*":
>=20
> --=20
> 2.30.2
>=20

--79UkCYMlLnqwphdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLa2NAAKCRB4tDGHoIJi
0tbPAP42JYtxjnWsZ+Ip4AgG8fiZyGRzyI3eQ/Ek4AiJdA+mJwD/eN7iTbD3MFnp
9mOc1hfwV3/a0VWDJ63BpKNy3mR8ewo=
=Xf4S
-----END PGP SIGNATURE-----

--79UkCYMlLnqwphdT--
