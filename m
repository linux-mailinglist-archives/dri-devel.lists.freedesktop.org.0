Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F24D9185CC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9FB10E037;
	Wed, 26 Jun 2024 15:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HqOqXDJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C73010E037
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 15:29:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BC847CE21E2;
 Wed, 26 Jun 2024 15:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC82C116B1;
 Wed, 26 Jun 2024 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719415779;
 bh=KYmFufaZOq+tPce2dbRFyvr/jertkuSk6czkmOSH2yY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HqOqXDJhMESXTHTIVuG4rMwahchgQPfA/xPdyLszHIa74qc7c+/tqnBMjIkEpaJlz
 B4t7LlD9dTHcQpG+AZmED327hygu+2cztsoYcMfmB2tTOOO60+irXO/HpMVJWCtXYj
 E5gfnfZyW5cGDAv2gDEX6BwyGlrOwrPBklrpg7AGk9J7KOn/2+HFy9rioPsspQtxSp
 RGdCLhJqNrdTq0J46AgY7fMT9+lV4Bb/6qaAnMgC4MECKP0MouMGeT5KE5xJsSvtO6
 h73VhOu+hIP9C6AWwkYIG9xkzaxDJA7rxS4tCphCXQoXlOXeoyJNLQAPCTnd/PQgdc
 +qkjL6JM848hQ==
Date: Wed, 26 Jun 2024 16:29:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: panel-simple-dsi: add lincoln LCD197
 panel bindings
Message-ID: <20240626-chowtime-coveted-93da3bf31bb7@spud>
References: <20240626142212.1341556-1-jbrunet@baylibre.com>
 <20240626142212.1341556-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="phGq938lt5gtN+KA"
Content-Disposition: inline
In-Reply-To: <20240626142212.1341556-2-jbrunet@baylibre.com>
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


--phGq938lt5gtN+KA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 04:22:07PM +0200, Jerome Brunet wrote:
> This adds the bindings for the 1080x1920 Lincoln LCD197 DSI panel to
> panel-simple-dsi.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--phGq938lt5gtN+KA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwz3QAKCRB4tDGHoIJi
0jOaAQDx/3F2dkEEHhkpmmB5G7WSj/Ti3O7ogsCSBE/sPvDpmgEAq09d+xd7eY9+
Qar6TEY8dfFapHFrGfP+PxVrfmLNWwk=
=hC5p
-----END PGP SIGNATURE-----

--phGq938lt5gtN+KA--
