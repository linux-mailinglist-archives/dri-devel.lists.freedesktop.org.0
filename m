Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E89B8D1F69
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4BD1122E8;
	Tue, 28 May 2024 15:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EhadhZBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DABE1122E8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:01:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FBEB62183;
 Tue, 28 May 2024 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70411C3277B;
 Tue, 28 May 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716908468;
 bh=griTV/d48tFOAXbKZWjbvzau5IV3Ow0cB3k5rjAzDCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EhadhZBeE18WbKLGgiooW0VxGSBMEhOGF0MwqnuuP6kyWUWmWddS1L6G9AB8+8lm5
 jd1V5dCU0ZRklMWsON+LU9+l0O1ByZ/Y/GmZcuj+JmkXJ4KJgwz7ebYT+N0RXxE8Ho
 RYFvX1N6JjSPzDnv+ut2SQFeIBGkeyW1blw4RemLnIUH0d/6ZH6f4/2NPFmLXfsiEJ
 4bf9tDYqxR3zJ40ngwSx60e5oa/NG0NRfU5cYq8NB2LXw9ECQLxIAXSdmyIMlO58s4
 i8JBbcvamnRvXTHGyIgoaPbSQs2UO3v5DCr+FVPkSJNsHSi2QUHSpSBXpUn9MlF49l
 fsEWFwyBrCeKw==
Date: Tue, 28 May 2024 16:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8188 SoC
Message-ID: <20240528-flattop-foe-05d6ba73cc06@spud>
References: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
 <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lmQ6jMLH/WOT5YCV"
Content-Disposition: inline
In-Reply-To: <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
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


--lmQ6jMLH/WOT5YCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 11:25:12AM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Chers,
Conor.

--lmQ6jMLH/WOT5YCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlXxrwAKCRB4tDGHoIJi
0gxEAQCJxm0YW/F3sE3EG2ygW0Xz2I0KMa2JKGoLWElXy5gVRgEA4qAauCj9sAWK
GjEwoDHxelJzjM0hfALT/Qy2rP/GQQg=
=atEx
-----END PGP SIGNATURE-----

--lmQ6jMLH/WOT5YCV--
