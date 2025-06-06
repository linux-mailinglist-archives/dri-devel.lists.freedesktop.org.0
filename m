Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB5AAD0595
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF88B10EAE2;
	Fri,  6 Jun 2025 15:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PTss1BfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E17110EAE2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 15:43:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C74C44FE5;
 Fri,  6 Jun 2025 15:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306E5C4CEEB;
 Fri,  6 Jun 2025 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749224634;
 bh=iGO8SORWMUFTmXITj8rFdTt1r4Y7ccbtUi/G+XcmSPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PTss1BfYfzjfeaCqJHcIk9rN1rVP6zXkr1BE1bV8Xagd0K1cu1pVspxN6qSManx3u
 YDUt408omxAIU2Mkz4EfnaJAMVRhaSx2BiS1lDp4KDyO9eEzDKNXXcfI3F67xyEwX9
 33HLAp1gkNbRkWgEcEvjtoDcnfEG5hk0gtz9wCmcUynJgftSY9yI0sOsudk8pqMbTP
 EtXYjQ6UOh/tESGOEf3usNNX8t1mKGJxekjDwLMyGIrxWtRxvDdohG7vhOJYitGZ1L
 qNVyQkNhYqBh7VqbIFFojGffPr3LL/OV9obY09apIGhNI4y32HtjTxwA/kQdQtetGJ
 4q6zcBsugBs/g==
Date: Fri, 6 Jun 2025 16:43:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: jagan@amarulasolutions.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] dt-bindings: display: st7701: Add Winstar
 wf40eswaa6mnn0 panel
Message-ID: <20250606-copious-cubbyhole-28f5b9ad2e8b@spud>
References: <20250606114644.105371-1-eichest@gmail.com>
 <20250606114644.105371-3-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HKMTKpwMG6GAESTE"
Content-Disposition: inline
In-Reply-To: <20250606114644.105371-3-eichest@gmail.com>
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


--HKMTKpwMG6GAESTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 01:45:51PM +0200, Stefan Eichenberger wrote:
> The Winstar wf40eswaa6mnn0 panel is a square 4.0" TFT LCD with a
> resolution of 480x480 pixels.
>=20
> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HKMTKpwMG6GAESTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMMtAAKCRB4tDGHoIJi
0sZnAP0YfqTWoNBCd0YPO96H53A8CzEWr6Lzx1kGpGPNbT6O0AD/UcDVG79r85Mk
+8pxO2VNo4Vjkv73P8wTe+vfaNevgw8=
=CCyf
-----END PGP SIGNATURE-----

--HKMTKpwMG6GAESTE--
