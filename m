Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E968C9D8C44
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 19:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E2310E044;
	Mon, 25 Nov 2024 18:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p0ynx1E/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7701A10E044
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 18:34:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5871C5C5BCC;
 Mon, 25 Nov 2024 18:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6216C4CECE;
 Mon, 25 Nov 2024 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732559673;
 bh=JlD8cOO1Yjm2yGyyTDVEs+BQCZaC+W9ZTw/SyE3P7q4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0ynx1E/us39O/NKjbBoX2iW7NgQq5slVY5bvWwklfBD5F0aeIJjWsKiI4QIKu278
 wusA9VPa60doThLFtHVqHoc9sIr/tOxGf4wzihNZawoztdL5gXSIQBENoCh1IWIze1
 n5RVeMfrtMe/Q5Gd/Kv124pR5HUyEQq2chm2iGwl2/MP4WHOz3JF0+FQeZRtuj6YkB
 0LwQojEIZPJPLQpF3oB5YnxGbZmDFr06lZmTi4+XmAy9r0SHocLF18xLsQ/dgIBuvf
 3XBJlxO/nMl4bueD4TrfH/tGolncGWrYgpjeGx7aRWxeVCX65qS7LK2O5ri1+1EzIn
 CxdJTe3qoSf2w==
Date: Mon, 25 Nov 2024 18:34:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Document Multi-Inno
 Technology MI0700A2T-30 panel
Message-ID: <20241125-scrambler-deflate-94d3d8287dae@spud>
References: <20241125013413.160725-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="er50jnaB09MzuKld"
Content-Disposition: inline
In-Reply-To: <20241125013413.160725-1-marex@denx.de>
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


--er50jnaB09MzuKld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 02:33:35AM +0100, Marek Vasut wrote:
> Add Multi-Inno Technology MI0700A2T-30 7" 800x480 LVDS panel
> compatible string.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--er50jnaB09MzuKld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0TDNAAKCRB4tDGHoIJi
0t+BAPwJK3sTtY0Ga9f59jbW26X1wmXT3KOYrwebq7Er4STrwgEAuax7ZtUusMoU
xQTNnrutqcE48mD9J8OGL31h2IZZrwQ=
=/V7M
-----END PGP SIGNATURE-----

--er50jnaB09MzuKld--
