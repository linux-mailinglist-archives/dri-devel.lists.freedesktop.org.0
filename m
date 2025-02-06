Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3979BA2A406
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 10:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D534910E809;
	Thu,  6 Feb 2025 09:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mlMqEO9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC05410E809
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 09:17:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 561705C4BE6;
 Thu,  6 Feb 2025 09:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE27C4CEDD;
 Thu,  6 Feb 2025 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738833453;
 bh=OprUX3sf+GllvjoTCMMHPEd9To8pLBDgBAKjQLuN4bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mlMqEO9yqjddagGvhpyIFTCCScBLoIgdQQqQMCaV3jJZ5roJ3Rafcskhyg91jS88z
 xc9fT2zVeuM5WPf+6livRm1gQCXzW7oGbxdNYQ+/KVEUGbD1WvseO/ekE4tGTWcY70
 GEQY5xeGHhTx7J7YCnhVjokZcMMV/BvL1/7awqvro9cQ8JbJ5amYNcG8pC86iSRMZY
 bHFhuNo0O27tmaNs/EMKJTeS3TlYwayG0ddQng4Y3Qk4pb+qIV565y2Dzk08wYHNwC
 MzreoZNOVi/InNqbtYb8gJRqJLiAJELAABvnWp43MQ4EFpu29Tzfm2glpZGhG7CDZK
 xQXdLzaDPiX4w==
Date: Thu, 6 Feb 2025 10:17:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
Message-ID: <20250206-caped-premium-squid-595ecd@houat>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="s5i444uyid5tefem"
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
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


--s5i444uyid5tefem
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 11:10:54PM +0100, Sasha Finkelstein via B4 Relay wr=
ote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>=20
> Add the MAINTAINERS entries for the driver
>=20
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26f28ffd0f3433560d6db1518f9f95..4ce0d3bcf67910d909ba41261=
535dcb14a24a7b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2189,6 +2189,9 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/arm/apple/*
>  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.=
yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> +F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
> @@ -2208,6 +2211,8 @@ F:	drivers/bluetooth/hci_bcm4377.c
>  F:	drivers/clk/clk-apple-nco.c
>  F:	drivers/cpufreq/apple-soc-cpufreq.c
>  F:	drivers/dma/apple-admac.c
> +F:	drivers/gpu/drm/adp/
> +F:	drivers/gpu/drm/panel/panel-summit.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c

Sorry to figure it out that late, but how do you plan on maintaining it?
Where will the patches go through, and who will you send PR to?

Maxime

--s5i444uyid5tefem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6R+KQAKCRAnX84Zoj2+
dpFcAX9vWLHvXu193dJYEBiwU4fhNxzryOdXkTE4drAdUIoskcpd7us4hCIDO00j
dW3IY38BfRaxBKVSxfcDLKpB5L6e3vgphx4Fp+ODyheOilHTZ2A2Heqy+uVVhSmE
jpTyN5zhyA==
=D+sS
-----END PGP SIGNATURE-----

--s5i444uyid5tefem--
