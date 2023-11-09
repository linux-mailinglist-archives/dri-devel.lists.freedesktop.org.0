Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589C27E7063
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D40110E8EE;
	Thu,  9 Nov 2023 17:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424F310E0E4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:34:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 97066B81E6A;
 Thu,  9 Nov 2023 17:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446C9C433C8;
 Thu,  9 Nov 2023 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699551297;
 bh=veQWpyDM4onYmh1xiPJAD0ivfDvih3X2s70cbv5GcvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R2MS1QwT+Zqp6WDAybXlZ7u9BeEQIBbtcbs+uG5F7GbZzNgzyp1cxENY4a0RMc2Ba
 fDX8qxTGvQlIfsGKUPHTUJtT9aPtABpmcFhgCDWzbn6C5sL3phfs+4YMu0/yOrFP0y
 QeL3+/YjuSrTDGgD/tqUQOk4JuxOvpJ5sT848d+a1mOsbCzrq3mrXCzI7qqm+jCbXc
 8YibFddiyPWDzcM+Jb87cj8Pfeo6YfEDvtPGoiE1QLmgn2VaCIlIWuyvAk9AvsisKb
 BK13LmhwP0amZ6L/zg/VSUp9SxuMYEJQV1R8pwwIgQYL5+2i1Ckv5vi4ipdjLrgM2U
 x0sIK1xls0s0w==
Date: Thu, 9 Nov 2023 17:34:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 02/12] dt-bindings: soc: amlogic, meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Message-ID: <20231109-dictator-hedging-94b0dec505b5@spud>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sZblbYTITPv0dWts"
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sZblbYTITPv0dWts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:00:03AM +0100, Neil Armstrong wrote:
> Add a thirst example covering the meson-axg-hhi-sysctrl variant and more

What on earth is a thirst example? Some sort of "hysterical raisins"
type of thing?

My confusion about that word aside,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> importantly the phy subnode.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-=
gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic=
,meson-gx-hhi-sysctrl.yaml
> index 16977e4e4357..2edf4ccea845 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-=
sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-=
sysctrl.yaml
> @@ -158,3 +158,44 @@ examples:
>              };
>          };
>      };
> +
> +    bus@ff63c000 {
> +        compatible =3D "simple-bus";
> +        reg =3D <0xff63c000 0x1c00>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0x0 0xff63c000 0x1c00>;
> +
> +        system-controller@0 {
> +            compatible =3D "amlogic,meson-axg-hhi-sysctrl", "simple-mfd"=
, "syscon";
> +            reg =3D <0 0x400>;
> +
> +            clock-controller {
> +                compatible =3D "amlogic,axg-clkc";
> +                #clock-cells =3D <1>;
> +                clocks =3D <&xtal>;
> +                clock-names =3D "xtal";
> +            };
> +
> +            power-controller {
> +                compatible =3D "amlogic,meson-axg-pwrc";
> +                #power-domain-cells =3D <1>;
> +                amlogic,ao-sysctrl =3D <&sysctrl_AO>;
> +
> +                resets =3D <&reset_viu>,
> +                         <&reset_venc>,
> +                         <&reset_vcbus>,
> +                         <&reset_vencl>,
> +                         <&reset_vid_lock>;
> +                reset-names =3D "viu", "venc", "vcbus", "vencl", "vid_lo=
ck";
> +                clocks =3D <&clk_vpu>, <&clk_vapb>;
> +                clock-names =3D "vpu", "vapb";
> +            };
> +
> +            phy {
> +                compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
> +                #phy-cells =3D <0>;
> +                status =3D "disabled";
> +            };
> +        };
> +    };
>=20
> --=20
> 2.34.1
>=20

--sZblbYTITPv0dWts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0YOgAKCRB4tDGHoIJi
0uT6AP0d47elZ0SGrlap1u+Eghh/HJKast4ARo3Asny2i7xKDQEAuoscsk9XDXKL
6UJ5EqFhBaW1Jp3Azcaxaou/fLGf4AQ=
=dC1C
-----END PGP SIGNATURE-----

--sZblbYTITPv0dWts--
