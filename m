Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2987EC581
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 15:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58BC10E010;
	Wed, 15 Nov 2023 14:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3A210E010
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 14:40:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 95F2460CF6;
 Wed, 15 Nov 2023 14:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F7DC433C9;
 Wed, 15 Nov 2023 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700059207;
 bh=BaGIA4l4ejhYWBQISc1C+sD93500hrAcYx7aVH8JMVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qhDBs1seuSmSug6Q4RjM8AVkxVtJg3I1chbH7NIG18ioJz+zMIQR5EsTh/63/w8zO
 vbGelQqDTwYs9c7u1KpgqK6cXL8gxXge3QenH3Pa4t5IjVlFt99vgfgOYIuPCSgU64
 v7i8HaqbbJ3vZ9NiJTGj5oN5AyTF8cOKFkMp7gZw05j+c7DftEskPRI3Rbbfhv4l0g
 OaQHStJIW4IB43DEyLLl9WdNHzTsdp3UyNKswCrGlaPE2MfaHMqP1EubCJpXX6MK6T
 +Wwi8yZemDQpYLsau7/TWrzW/Wq5SLBibcSQNMgxeD2LVKeLFXWS3xA6ezMxcw1Pwz
 iE9BLLETPiX+Q==
Date: Wed, 15 Nov 2023 14:40:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1 2/3] dt-bindings: display: bridge: lt8912b: Add power
 supplies
Message-ID: <20231115-epidural-vantage-89ff91774805@squawk>
References: <20231115121338.22959-1-francesco@dolcini.it>
 <20231115121338.22959-3-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GZwI/uocM5eJlZ54"
Content-Disposition: inline
In-Reply-To: <20231115121338.22959-3-francesco@dolcini.it>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GZwI/uocM5eJlZ54
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 01:13:37PM +0100, Francesco Dolcini wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>=20
> Add Lontium lt8912b power supplies.
>=20
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor,

> ---
>  .../display/bridge/lontium,lt8912b.yaml       | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8=
912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912=
b.yaml
> index f201ae4af4fb..2cef25215798 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.ya=
ml
> @@ -55,6 +55,27 @@ properties:
>        - port@0
>        - port@1
> =20
> +  vcchdmipll-supply:
> +    description: A 1.8V supply that powers the HDMI PLL.
> +
> +  vcchdmitx-supply:
> +    description: A 1.8V supply that powers the HDMI TX part.
> +
> +  vcclvdspll-supply:
> +    description: A 1.8V supply that powers the LVDS PLL.
> +
> +  vcclvdstx-supply:
> +    description: A 1.8V supply that powers the LVDS TX part.
> +
> +  vccmipirx-supply:
> +    description: A 1.8V supply that powers the MIPI RX part.
> +
> +  vccsysclk-supply:
> +    description: A 1.8V supply that powers the SYSCLK.
> +
> +  vdd-supply:
> +    description: A 1.8V supply that powers the digital part.
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.25.1
>=20

--GZwI/uocM5eJlZ54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVTYQAAKCRB4tDGHoIJi
0ra9AP9qgkDDNxwgVnODaITFA4y+M13nhrU7tTP38T1RTbT5VAD+IT57rAccR244
fPUa50O7sdrTRuV6XocSiiIKqp5eNQ4=
=DqWG
-----END PGP SIGNATURE-----

--GZwI/uocM5eJlZ54--
