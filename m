Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC17B4626D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C2410EC29;
	Fri,  5 Sep 2025 18:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dSKc8NVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDB210EC29
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:41:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 23A2143C5B;
 Fri,  5 Sep 2025 18:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0543EC4CEF1;
 Fri,  5 Sep 2025 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757097663;
 bh=tPD/4gTqPC5pDHvLRJFLCSZXmAYarY7iaOLMnBlun2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dSKc8NVcXJTAtpE1KLM6abj/quuwlm8FkqpWbg7nlVLG86vhV2MxzwRTg/pBV+0Oe
 02QCqPk1RT35RO3Qyw/RanSMC4U/7fIa2BFaLkyxrfxPVVNKSfjMWmML90dum6q2i6
 JFWRKJ7X+Vplh6ZTKRYiguqZ/5FmjEbEZOGbFjuzS/Y8nUYyefWx0hojErplcmlWKW
 j7DgLT897jBGh9ygWH3DNlYDU/n3YfOMjD95/TKzyzaGvTlgmc9gEDGPPnOU62mrO8
 KhQN82r+0omH3qpYuDyfYNx2SFIh+6TufkH5t8EutIwNhlGZS3DIFJnz6NAhv617Cv
 IsiZ9DXB5Ja8g==
Date: Fri, 5 Sep 2025 19:40:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi
 720x1280
Message-ID: <20250905-lumpiness-elixir-d29599d3063b@spud>
References: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fsKq9MF9ZFFMAYqq"
Content-Disposition: inline
In-Reply-To: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
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


--fsKq9MF9ZFFMAYqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 10:01:54PM +0200, Marek Vasut wrote:
> Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fsKq9MF9ZFFMAYqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsuuQAKCRB4tDGHoIJi
0l54AP9ctqrqVd/7tPhoamoK/SxixmiA0Bral8abDxCWaTONPQD/Q7OMeI63GIiW
B3pE9QDCTvlrqe2rhoidFetRCA458wM=
=pPH8
-----END PGP SIGNATURE-----

--fsKq9MF9ZFFMAYqq--
