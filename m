Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FBC789DD5
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 14:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E201610E1AD;
	Sun, 27 Aug 2023 12:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989B410E1AD
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 12:20:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 781D661234;
 Sun, 27 Aug 2023 12:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C9FC433C8;
 Sun, 27 Aug 2023 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693138802;
 bh=HhxglvFxdy4JGa0XB+/DZKPFXAniIq8/vq4aNLO6Lxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwQBJVYTyIQvxX+Wt0k4rAwIAzYy/BoEM7OU1S5h1v54sBO8BAlwITx39Hsoo9ikf
 +V7ndNtcK8MR5aizx5Bg9kX/r3m66Vsgpwac+9tH6KCOLu+SWWKKmlH3obss1atQ9N
 OY5fWsGnFhfbuoJX/cbufzy89EalVGB1mdCFqavGeFkNtOJIX6zVmET0INeuq/r+/t
 aLFIJTi3t5Jr8cO66Imju8fT0zmDboFhlNtQqOflAMDQkuhseGYCLYuULq2TiAJRGV
 OWYK92NC43hSUmnPt3ypduzpVgZXJfIlGubcyTtGqUiTFHF+O6JXAwrGCGWIRwEvj2
 sz7O3ye1B3uGA==
Date: Sun, 27 Aug 2023 13:19:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/lvds-codec: add ti,sn65lvds94
Message-ID: <20230827-drum-food-09e417962032@spud>
References: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HDCjkBIVdY6Zlu4d"
Content-Disposition: inline
In-Reply-To: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HDCjkBIVdY6Zlu4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 12:54:28AM +0300, Dmitry Baryshkov wrote:
> Add compatible strings for TI sn65lvds94, LVDS serdes receiver.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.=
yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 84aafcbf0919..6ceeed76e88e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -41,6 +41,7 @@ properties:
>            - enum:
>                - ti,ds90cf364a # For the DS90CF364A FPD-Link LVDS Receiver
>                - ti,ds90cf384a # For the DS90CF384A FPD-Link LVDS Receiver
> +              - ti,sn65lvds94 # For the SN65DS94 LVDS serdes
>            - const: lvds-decoder # Generic LVDS decoders compatible fallb=
ack
>        - enum:
>            - thine,thc63lvdm83d # For the THC63LVDM83D LVDS serializer
> --=20
> 2.39.2
>=20

--HDCjkBIVdY6Zlu4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOs/bAAKCRB4tDGHoIJi
0gsHAQDlI///5Onx3bopmXNOAnIMexMaTQ+jgHpAawK/tZfHggD/UMK8I3uyVz18
XqVtMM+RIZK821kKR5URtkcvV6uxAgM=
=8shM
-----END PGP SIGNATURE-----

--HDCjkBIVdY6Zlu4d--
