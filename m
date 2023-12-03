Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4F8022B1
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113DB10E04B;
	Sun,  3 Dec 2023 11:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C8B10E04B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:21:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A495F60A4D;
 Sun,  3 Dec 2023 11:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8120DC433C8;
 Sun,  3 Dec 2023 11:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701602483;
 bh=MtoDgjTd0eW3xuxtFTScJaI5BBvCigtIXDxq6ftJ4Oc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oiCjNXB3rh7aKBzesTl9Xho+oEaayFU5F2dEkPISUztZ5cTQvLItsWqIxfuEAGBe9
 mxRM0Z96a+85iSKDqvQe0huepKh10hOpC8UsVZdnUipYXO9Do6EoEzvLkT3x/XRiyr
 +MzAX3LvqxI1dr10A0nOJLE/sE+ucFWM7QsTaS7Si80U+iivLHQxV/6Mv+6lg5pAK+
 N9FxiRQJ/5gfyuiRWDvQxBiDA5jiKdrVCwwFhZG7gLnDs0N+Euuh++MbDiCkpzUghU
 Qs+6GVfJ3omSuMOHh6foI8PxE+z+3rYd5K+TIVY8fHlF43fcEfUQOglOMHIta8K1Rs
 LwEKm12/aKC+w==
Date: Sun, 3 Dec 2023 11:21:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add boe,bp082wx1-100
 8.2" panel
Message-ID: <20231203-stank-schnapps-255fa10d9d69@spud>
References: <20231202081157.47222-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IMUZZr2DfqD2i5gR"
Content-Disposition: inline
In-Reply-To: <20231202081157.47222-1-tony@atomide.com>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--IMUZZr2DfqD2i5gR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 10:11:52AM +0200, Tony Lindgren wrote:
> This panel is found on Motorola mapphone tablets mz607 to mz609.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -73,6 +73,8 @@ properties:
>        - auo,t215hvn01
>          # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
>        - avic,tm070ddh03
> +        # BOE BP082WX1-100 8.2" WXGA (1280x800) LVDS panel
> +      - boe,bp082wx1-100
>          # BOE BP101WX1-100 10.1" WXGA (1280x800) LVDS panel
>        - boe,bp101wx1-100
>          # BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
> --=20
> 2.43.0

--IMUZZr2DfqD2i5gR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxkrQAKCRB4tDGHoIJi
0sm4AP9saCc2bdB9RQ3P4/FRNFVKp5AT7IdH7NY9HdZQme/YqQD+JHX3VC7TnDsS
oZYIeG+0n2t0wwQEEC1z1LurFgI6YwQ=
=Vgb9
-----END PGP SIGNATURE-----

--IMUZZr2DfqD2i5gR--
