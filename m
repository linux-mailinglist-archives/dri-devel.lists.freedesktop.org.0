Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44368BFDA74
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FF510E81E;
	Wed, 22 Oct 2025 17:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fQa0Q8Qk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522710E822
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:43:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1AFD440169;
 Wed, 22 Oct 2025 17:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24339C4CEE7;
 Wed, 22 Oct 2025 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761154984;
 bh=8cgZeKAMGPlRgEjWBkK7WS/8uFyCBbFVbv60l3Wo1wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fQa0Q8QkLSOV0X8dmllokpPrd5FCEHOn+J2meQuaZjTM14DWbc6Nkc78KkCh60WZt
 L7S3cJx2XVSXAL1qflRGWoEgVtcQNzrlbTsWpf48NVd0As7tJIbDVMINUdsDqOQaU+
 7DsQMolDHhgzMsXf55cs8vphra177SqHgwBHemUPDzCOmogNJirFxRHnD++hyZMc5W
 zCVf8aw60KVgkq61q08ewdVDH7p8l9rPBh9B+oDtF23p4H/VeXwy7/81a47DyccugW
 lzg7Wi3anzmuFKlX7U9KAmp0VOIVsOIidSTN+k9wRP7Q5D8RAcgmq+nm4GbLgEK2ut
 WhmaIGLSDE0mg==
Date: Wed, 22 Oct 2025 18:42:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Add the Leadtek
 LTK08QV25BYL panel
Message-ID: <20251022-darkness-defuse-6504a820c648@spud>
References: <20251021073408.195959-1-herve.codina@bootlin.com>
 <20251021073408.195959-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jwrhqCsj33Gacxlu"
Content-Disposition: inline
In-Reply-To: <20251021073408.195959-2-herve.codina@bootlin.com>
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


--jwrhqCsj33Gacxlu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 09:34:03AM +0200, Herve Codina wrote:
> The Leadtek LTK08QV25BYL is a 2.8" 240x320 DSI display.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jwrhqCsj33Gacxlu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkXogAKCRB4tDGHoIJi
0rm5AQDBeaboyDOSZC/aXcCqNi6TUmP3JhPlvaDgxuah9wCgyQEA9G2hl02CYcRN
2A9DgmWaIFWTifkheRkHWvklxuDnLww=
=QIKs
-----END PGP SIGNATURE-----

--jwrhqCsj33Gacxlu--
