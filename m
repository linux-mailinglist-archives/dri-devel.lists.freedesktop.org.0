Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17998856A98
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24A10EA06;
	Thu, 15 Feb 2024 17:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cbco+Ket";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5744F10EA06
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:09:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94B4461DDC;
 Thu, 15 Feb 2024 17:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E8DC433F1;
 Thu, 15 Feb 2024 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708016955;
 bh=iYuaQPEfpoZMaguUakN8GMeMOfkpNsph0ragFrzOlps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbco+Ket1Xpt3QUm+m0Nii0K+QlMMiAk9HvlywVaCUu81Jp3Ghz9lHhZz3gLDRDlM
 EYI8a/utOCbK+iQR4kTi83Qpvr1WD9TW+1IEZjQmTP48CFo/oR7Ju66a1yhmFM8UfL
 DbQSoCCMS4CYS8LeG8Bvk3/oqFEY/73eAC2CM2RhoqrRycyjSX46rjSrTiDC47IvyO
 MxllMrmhCLXFC42wcLC1X0lALxG2XUW58QxpwyZoYPLBAtHPfc/gEksXrlSxtGzg+C
 HrGik8kiiFW//qYvfLPg1uc/LYliYpcdj98/p+jIdd94XuSBTH8a6CIzcF6g2QZyiy
 fL6Aogj/NCprw==
Date: Thu, 15 Feb 2024 17:09:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quentin.schulz@theobroma-systems.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: add prefix for admatec
 GmbH
Message-ID: <20240215-settle-province-41ad1a2f77e7@spud>
References: <20240215090442.3513760-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tGCrTqscGmACoUi4"
Content-Disposition: inline
In-Reply-To: <20240215090442.3513760-1-heiko@sntech.de>
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


--tGCrTqscGmACoUi4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 10:04:41AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> admatec GmbH is a german supplier for industrial displays.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

There's a fair few Admatec's it seems, so a link would be good:

Link: https://www.admatec.de/
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 1a0dc04f1db47..fef2e12b504ee 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -61,6 +61,8 @@ patternProperties:
>      description: Analog Devices, Inc.
>    "^adieng,.*":
>      description: ADI Engineering, Inc.
> +  "^admatec,.*":
> +    description: admatec GmbH
>    "^advantech,.*":
>      description: Advantech Corporation
>    "^aeroflexgaisler,.*":
> --=20
> 2.39.2
>=20

--tGCrTqscGmACoUi4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5FNgAKCRB4tDGHoIJi
0hx3AP9aePTSJI1q2YqKlAHMe+jLDYuIkE/T6r+mNA0NZhL55AD/X4ONMTJ5vE7+
EzhpHmzcA/qdoXcOzAmgfmMxb5xMYgo=
=nFDp
-----END PGP SIGNATURE-----

--tGCrTqscGmACoUi4--
