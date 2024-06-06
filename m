Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C578FF18C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 18:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C16610E9E7;
	Thu,  6 Jun 2024 16:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gNGO0PbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7527610E9E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 16:05:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 400CC61D13;
 Thu,  6 Jun 2024 16:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D407BC2BD10;
 Thu,  6 Jun 2024 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717689939;
 bh=Lu8jE+PpQrJ9rKiJgM4BtzKKEXwwzn1wiTlU2tSNTrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gNGO0PbOZdvXPRWlJYkCYaQHf3SEe5vPvKRl9if8VRl+HSAkJ1/IiBwZTgu9GovXe
 4NZxaa3zBlTOP3SB1oxjixNj7P9F0TrxCQajREW/VdC2IFMn6+37aJPd2ONPvQhfhe
 YR46CEmv9kLvAbGnF66f1btEx9O2eXmbxaMhEBB3PM0A/T6izR8tSEyi4dvFp9cAJv
 CTpamye+1Nml5FGHJnD07st+YKW49u+T9saKeQBYKR0KkyVz3AnFFzcp9WY2vnjYX2
 1Aj4ARKDdQ5Xj/zZtS+4IrHRS1HuNHV9REANUCamL1PdXjlWUi3pUZEjHuSb3YA/yV
 rJMgXbR/g0dJA==
Date: Thu, 6 Jun 2024 17:05:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add PrimeView
Message-ID: <20240606-bony-uncork-639bf5f5a86e@spud>
References: <20240606080104.3663355-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OzGtGIXnx3xQBVvB"
Content-Disposition: inline
In-Reply-To: <20240606080104.3663355-1-primoz.fiser@norik.com>
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


--OzGtGIXnx3xQBVvB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 10:01:02AM +0200, Primoz Fiser wrote:
> The Prime View International (PVI) is a LCD panel manufacturer.
>=20
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--OzGtGIXnx3xQBVvB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmHeTgAKCRB4tDGHoIJi
0vSIAP4vtTElMVNIt+IxTzTFIyac8JRQzjmTj5aL6WHxyN2PGgD+P5G4G7qcpysY
/d74lX1VtZI5Kw1/vctZb5vGR+tbegU=
=xb4P
-----END PGP SIGNATURE-----

--OzGtGIXnx3xQBVvB--
