Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861FFA3135B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 18:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAFF10E735;
	Tue, 11 Feb 2025 17:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E9k3qkjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82E110E735
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 17:45:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5512CA4080B;
 Tue, 11 Feb 2025 17:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AA6C4CEDD;
 Tue, 11 Feb 2025 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739295902;
 bh=IYEdhM4+0ThJA5HBQ6fog3jXewUj4csh1viDFDkpai0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E9k3qkjgL6pH80ogRArHzdsx5uXVtG3u0YUqpr9Ctdj8+/NLeRJVtC5aWh0pv7SvB
 APDjgEdJa1asJr+n64E1KRS82QrLsBOg7I7gWcqBKST5xUPZTywIQWHpEazNJP+rXP
 SKyFInhbhBCQAv0NGotAeReU9GsYfF8ehoC7j7gh6mJ9RIfaMJ6qWR0aXnrQUo3VRX
 OP2yNSSM575zXmwMDf7zWU9HICS1E8X2R1bNrXMiAPrIiyguUQZ1p4Djdojc1Bljwp
 qvfECtxwWS2LzSLesxKSpzS/kunHUNnQ2trVkqP7xU6ByRY95YsKOT9yGqfvCwCmaD
 kBDXUVqY2dOlg==
Date: Tue, 11 Feb 2025 17:44:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen <sunny.shen@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 "Paul Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 2/5] dt-bindings: display: mediatek: postmask: Modify
 rules for MT8196
Message-ID: <20250211-darkened-justify-f559a0bf2a81@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-3-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AN5oWCXPj8Gvwucf"
Content-Disposition: inline
In-Reply-To: <20250211025317.399534-3-sunny.shen@mediatek.com>
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


--AN5oWCXPj8Gvwucf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:52:51AM +0800, Sunny Shen wrote:
> Add a compatible string for MediaTek MT8196 SoC

$subject and $body don't match here.

>=20
> Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,postmask.yaml  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,postmask.yaml
> index fb6fe4742624..29624ac191e1 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> @@ -27,6 +27,7 @@ properties:
>            - enum:
>                - mediatek,mt8186-disp-postmask
>                - mediatek,mt8188-disp-postmask
> +              - mediatek,mt8196-disp-postmask
>            - const: mediatek,mt8192-disp-postmask
> =20
>    reg:
> --=20
> 2.34.1
>=20

--AN5oWCXPj8Gvwucf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uMmAAKCRB4tDGHoIJi
0q/GAQCeCuVWfWkn+7Uog5I98DkIcobNbcbPvlOVI5tiUcEtDAD6Amsq2F0zICow
GXQ53Xxni3csTCSSopUVF4waDJeG3QA=
=UYkB
-----END PGP SIGNATURE-----

--AN5oWCXPj8Gvwucf--
