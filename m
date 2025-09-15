Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DCB5834C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3601010E518;
	Mon, 15 Sep 2025 17:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XQE73fdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFC310E518
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:20:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B888F40363;
 Mon, 15 Sep 2025 17:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D480C4CEFB;
 Mon, 15 Sep 2025 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757956799;
 bh=AJJvh5w1R9nXmEjFqkW+/hKYN+hA2MRPzYEwZlDdaW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQE73fdk9HVoEr27DncLojCtI3t2zTiAJZ1jG90/3TAllz/SdD2TZT2bB8wHpyvGf
 pPjbhfRitWlMchsQeePyfsowMhGqXLD44mmBjwFVszsuEk23JnZsTG2DL3nuzrUgTC
 DnW4auiS/7v6cGYh4fwS0dNhxQ9y2bDg9gMMXzoOtT5Sk3dOLb0jsTn3Gv5OgwwHK7
 nHBfHVsD31eRxYhrBfQP2hvUXdWwM2o4JFUyy9JAdFZ656ECly252AntEzKzWzVqMn
 oN13ZXFhLWgxi2vkiaX57UpI9eArYgJTgG0kGIxjlMXmTH48GFN5YXg8wz4N4ChXuP
 /JnHgVCCM7+Jg==
Date: Mon, 15 Sep 2025 18:19:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andrew Davis <afd@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Message-ID: <20250915-raisin-placidly-d440495fdf53@spud>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OipVD4JuPL8umPoi"
Content-Disposition: inline
In-Reply-To: <20250915143440.2362812-2-mwalle@kernel.org>
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


--OipVD4JuPL8umPoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--OipVD4JuPL8umPoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhKuQAKCRB4tDGHoIJi
0n0mAQDS/ZfHn4W7+zS0AA9bqS3UWH1Ag9jyYeFsCd98agveXgD/RF/LIo62w7p+
hPL25pXNWVcvLg8/Mu7ZElqxG4JDUAk=
=88JP
-----END PGP SIGNATURE-----

--OipVD4JuPL8umPoi--
