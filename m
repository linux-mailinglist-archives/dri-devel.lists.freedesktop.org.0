Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE17D3D06
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38E010E15B;
	Mon, 23 Oct 2023 17:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EB610E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:04:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8B053B81A71;
 Mon, 23 Oct 2023 17:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92865C433C7;
 Mon, 23 Oct 2023 17:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698080643;
 bh=Z9iY3lsaZZ0k2Yw6281j4HRYsuuLhnj+PAotK0K3VDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PDyPGJr3cK+jKb5Cq6EVOd3FAvj4jLd1F5V5I2zaSliCU4SDbKApT9Rn3rgvbcB/e
 h96zO1DsiEGno/PSW6UhjDGACMyFRcts7xpOnFhKLV24YqpawYWsdPdFRBT571oEMZ
 IrPmsb6HRdJTq6n+Uo836v53fH/5gKP0iIFMPA07msGpOWiK8AWIQCoUZlyWW3uKZU
 a4I1A3mdePhDk5Lb5DHLzXBL4tTlGwxyfeeKf4eIfCyNzdv/xppPOA4Ij+9U3pc+Dt
 +ISwR95IHhxVQJQntGzb62eA2io51O2nTyxGhxyj6gJbmUC38uTS0jCnBdxWs2kRa0
 TizIz5NDcMF+w==
Date: Mon, 23 Oct 2023 18:03:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 01/18] dt-bindings: display: mediatek: aal: add binding
 for MT8365 SoC
Message-ID: <20231023-sharpness-uplifting-634566c6b4ff@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-1-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PbLYAkV5QGg0voCF"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-1-5c860ed5c33b@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-pwm@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PbLYAkV5QGg0voCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 04:40:01PM +0200, Alexandre Mergnat wrote:
> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.

> Then, add MT8365 binding along with MT8183 SoC.

s/binding/compatible/, here and in the subject.

Cheers,
Conor.

>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index 7fd42c8fdc32..840b48a878ca 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -35,6 +35,7 @@ properties:
>                - mediatek,mt8188-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> +              - mediatek,mt8365-disp-aal
>            - const: mediatek,mt8183-disp-aal
> =20
>    reg:
>=20
> --=20
> 2.25.1
>=20

--PbLYAkV5QGg0voCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTanfQAKCRB4tDGHoIJi
0tPUAP9cTTvfIBq9I7y7WjmhtsRZbhjBWhdUzs8mmYekmW17xAEAnCJCpDVwVruG
ZkQOxyU76MLSecahlFO14YNh1wBwEAk=
=wX+W
-----END PGP SIGNATURE-----

--PbLYAkV5QGg0voCF--
