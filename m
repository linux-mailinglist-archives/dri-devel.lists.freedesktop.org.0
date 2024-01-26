Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F783DEB4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 17:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12F910FBDF;
	Fri, 26 Jan 2024 16:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D9010FBCC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 16:28:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34453CE350F;
 Fri, 26 Jan 2024 16:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE93FC43390;
 Fri, 26 Jan 2024 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706286439;
 bh=5iYUflzMQ861be+XTIVmFUr4Ln1Nim3H4SbxbbWe3ZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RDe6SlbwjI+YPW9Mq3T+ljgPcYzX/eBo9He4PP7xnAkQ3UIHA1WPDWOOgFnCWxTMX
 sbyVew7uKtuwUQY4TByWSHuO6vaiaJtVDqNewZEeaCSskHi0gt3PpGTuk8dcv4289E
 PRbgshtnZZP6EICURAZ6LAnGEe+ghr/mPM2wyY+CK6a2juWrTMtPM/aodsxN8MXpBU
 3RomL+greBDmnbBhFByxPOczWjQfWah3NNndvSZmlsvETcI2TYXFovfVKc4ZoAFw/j
 22AeT4kZ2SPTXDgvlkDvJiYLnbkRpSSr65VRZfhJlzCgyJeWDJqxzxooXRc5cCLuX8
 LdAswQElQIAOA==
Date: Fri, 26 Jan 2024 16:27:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Subject: Re: [PATCH RFC for upstream 1/4] dt-bindings: display: panel-simple:
 add ETML1010G3DRA
Message-ID: <20240126-briskly-clang-d1e6ad7d40e8@spud>
References: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
 <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-1-8ec5b48eec05@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r9lRgXrshhnzpKAU"
Content-Disposition: inline
In-Reply-To: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-1-8ec5b48eec05@phytec.de>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, upstream@lists.phytec.de,
 Primoz Fiser <primoz.fiser@norik.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r9lRgXrshhnzpKAU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Jan 26, 2024 at 09:57:23AM +0100, Yannic Moog wrote:
> Add Emerging Display Technology Corp. etml1010g3dra 10.1" LCD-TFT LVDS
> panel compatible string.
>=20
> Signed-off-by: Yannic Moog <y.moog@phytec.de>

> [PATCH RFC for upstream 1/4]

The "for upstream" here is not really relevant, what else would the
patch be for?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 11422af3477e..b6bbdb3dd2b2 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -139,6 +139,8 @@ properties:
>        - edt,etm0700g0edh6
>          # Emerging Display Technology Corp. LVDS WSVGA TFT Display with =
capacitive touch
>        - edt,etml0700y5dha
> +        # Emerging Display Technology Corp. 10.1" LVDS WXGA TFT Display =
with capacitive touch
> +      - edt,etml1010g3dra
>          # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
>          # capacitive touch
>        - edt,etmv570g2dhu
>=20
> --=20
> 2.34.1
>=20

--r9lRgXrshhnzpKAU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbPdYAAKCRB4tDGHoIJi
0sEDAQCUbSvrqkTDCHq38e07WTqHt54ixj8xqFG0ivlbAW5U1gEA4waKpK8VdRA+
t7JzmgjefDRvuYrmKoTlMNWpj1KBcAE=
=FDIS
-----END PGP SIGNATURE-----

--r9lRgXrshhnzpKAU--
