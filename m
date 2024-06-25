Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C8916E02
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 18:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADCC10E6A0;
	Tue, 25 Jun 2024 16:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bR7IVHvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B3A10E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 16:24:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8EF02CE1C1E;
 Tue, 25 Jun 2024 16:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AD8C32781;
 Tue, 25 Jun 2024 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719332689;
 bh=lYDZtizy+im1T5YJ4mo2HhxfZZpr37Ozz/iQz39NWs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bR7IVHvz7zvwwpZnNmTN7xLrDnYTwByGNkr1jO/jOMCJHEaDyfsaA6/hSd3lnA8zI
 3DP2SVqQKObxwJRtz9aTgovlYpeLYUMKxnvmUiuIVEXO/Tjltt2r1xXeVQTkKw83qx
 pLN5nPjmXKZYj+mHEWHjEwo9OJBggqK/QXkXaRMBG8ltms3MEcbF/1MZHHQ9kMmEda
 Rl1mSkObSDTftIm7thxqE75oNyBiRM0uYnakLPmglWIUgeuMUqq6YWKtC+p6BdQOiV
 ZlELPAQqf4Jvvv+/RKvDisQLf4LXcFOOJcY6MUHc4D+cNsGpMtEoyA7LP1y/GSbThC
 q7064K3T1BuHA==
Date: Tue, 25 Jun 2024 17:24:44 +0100
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
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: panel-simple-dsi: add lincoln LCD197
 panel bindings
Message-ID: <20240625-strife-dynasty-1b9d28f937f9@spud>
References: <20240625142552.1000988-1-jbrunet@baylibre.com>
 <20240625142552.1000988-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XenD3tfZ7uLpcvf/"
Content-Disposition: inline
In-Reply-To: <20240625142552.1000988-3-jbrunet@baylibre.com>
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


--XenD3tfZ7uLpcvf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 04:25:49PM +0200, Jerome Brunet wrote:
> This adds the bindings for the 1080x1920 Licoln LCD197 DSI panel to
> panel-simple-dsi.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XenD3tfZ7uLpcvf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrvTAAKCRB4tDGHoIJi
0iaYAQCiFHD9IPGVzSbTPfTJrD2IbShD2Jmo8vjuglk8LNwNkQEAwqlMbOuWq+vX
B/r+amw8NtAdsB1hFHVlXxuPPc1lhgQ=
=fGVq
-----END PGP SIGNATURE-----

--XenD3tfZ7uLpcvf/--
