Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0ADCD7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4189089207;
	Mon, 29 Apr 2019 07:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF968925E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2019 12:29:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 44rCzS381Wz1rKY3;
 Fri, 26 Apr 2019 14:29:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 44rCzS25h7z1rgsF;
 Fri, 26 Apr 2019 14:29:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BXQTjIr906P9; Fri, 26 Apr 2019 14:29:22 +0200 (CEST)
X-Auth-Info: apaWWv1zufYYSTRzq1Jxz4zStL4Kl2Kh/UizkK4XUpw=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 26 Apr 2019 14:29:22 +0200 (CEST)
Date: Fri, 26 Apr 2019 14:29:14 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3 1/2] dt-bindings: display/panel: Add KOE
 tx14d24vm1bpa display description
Message-ID: <20190426142914.45adfdae@jawa>
In-Reply-To: <20190404112243.9473-1-lukma@denx.de>
References: <20180412143715.6828-1-lukma@denx.de>
 <20190404112243.9473-1-lukma@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1984841823=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1984841823==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QOX5Xd8fL4u/irJU0gONYsV"; protocol="application/pgp-signature"

--Sig_/QOX5Xd8fL4u/irJU0gONYsV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> This commit adds documentation entry description for KOE's 5.7"
> display.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>=20
> ---
> Previous discussion (and Rob's Reviewed-by) about this patch
> https://patchwork.kernel.org/patch/10339595/
>=20
> Changes for v3 :
> - New patch

Gentle ping on this patch...

> ---
>  .../bindings/display/panel/koe,tx14d24vm1bpa.txt   | 42
> ++++++++++++++++++++++ 1 file changed, 42 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> new file mode 100644 index 000000000000..be7ac666807b --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> @@ -0,0 +1,42 @@ +Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x
> 240) TFT LCD panel +
> +Required properties:
> +- compatible: should be "koe,tx14d24vm1bpa"
> +- backlight: phandle of the backlight device attached to the panel
> +- power-supply: single regulator to provide the supply voltage
> +
> +Required nodes:
> +- port: Parallel port mapping to connect this display
> +
> +This panel needs single power supply voltage. Its backlight is
> conntrolled +via PWM signal.
> +
> +Example:
> +--------
> +
> +Example device-tree definition when connected to iMX53 based board
> +
> +	lcd_panel: lcd-panel {
> +		compatible =3D "koe,tx14d24vm1bpa";
> +		backlight =3D <&backlight_lcd>;
> +		power-supply =3D <&reg_3v3>;
> +
> +		port {
> +			lcd_panel_in: endpoint {
> +				remote-endpoint =3D <&lcd_display_out>;
> +			};
> +		};
> +	};
> +
> +Then one needs to extend the dispX node:
> +
> +	lcd_display: disp1 {
> +
> +		port@1 {
> +			reg =3D <1>;
> +
> +			lcd_display_out: endpoint {
> +				remote-endpoint =3D <&lcd_panel_in>;
> +			};
> +		};
> +	};




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/QOX5Xd8fL4u/irJU0gONYsV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlzC+ZoACgkQAR8vZIA0
zr0lYAf+IJnNCKzyRLvnjXawDB53bWGwWygFn8+i87scG/6xNTrawduWFhndYwoA
D8L0QtjGUwBt3H/VRzjdciKlUlUT8DjMrpnbA6X2MSW2bvlH0xwyUQfr/MsmWNIq
j6Y92E1kDnYfWWY1OzaOqfjtxqJ92dxM7CnHBRy2HdGl6fa9nYlnD6/I8T9BvkxJ
M20W6KCVIRqrg7mioponoRm34A7WyEqWNV3sUYScPTJlyS+rOemLl7Lm1B4dbdhc
myut2GPixVxzeJ9nlQJY7yTIzynteDePCL4pWYd49I62nke2qQ0QbrCh0OwuHjgb
3/boIMTzYLUAcdSSDdl+iGBIY+d3ew==
=7oyd
-----END PGP SIGNATURE-----

--Sig_/QOX5Xd8fL4u/irJU0gONYsV--

--===============1984841823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1984841823==--
