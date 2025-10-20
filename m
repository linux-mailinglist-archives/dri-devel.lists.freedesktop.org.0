Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24989BF2ABE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5509F10E154;
	Mon, 20 Oct 2025 17:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qSfz08Ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4210E154
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:19:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD4C2620CB;
 Mon, 20 Oct 2025 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559C4C4CEF9;
 Mon, 20 Oct 2025 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760980742;
 bh=d2jINvzcEowHYXUQtyByG0BLnrpPSoNJ9KYOgYddVTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qSfz08NsopoJBlCTowu9oCXd//s4JDWGOFYx3omXLXJefUl1UzZL5Mj0T1IQc2mhg
 vjerZuHSwJ2gZUmIvMwly4gwcb3GG8PvnLIeOQFv5UMVnBSWDQPQkl7Ceaoy1/zUim
 EHm/rD/S4Y36etd0uOEnCn7OZDn1ydWG/SzOlX6bnpkc6qmIht7vX8MBqL0csrtdsr
 rzSnz+qwouug/Z1RNrXtIL9Uj9l1WNPC/Q8uQtDFY0pe3+v2UFcdNTL8g887y9APim
 Kj0wJCYBA3qdka/oR7GbS4x8E2y+i2znYcmB7Q/42VhGaW+jEYL4Q9VAIiYCvQfFJ9
 q17inbhmJaWZg==
Date: Mon, 20 Oct 2025 18:18:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quentin.schulz@cherry.de,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 cn.liweihao@gmail.com, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/9] dt-bindings: display: rockchip: dw-hdmi: Add
 compatible for RK3368 HDMI
Message-ID: <20251020-showcase-crayon-660e4f67881a@spud>
References: <20251020082508.3636511-1-heiko@sntech.de>
 <20251020082508.3636511-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7YQcMoFn8RBCI1lI"
Content-Disposition: inline
In-Reply-To: <20251020082508.3636511-2-heiko@sntech.de>
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


--7YQcMoFn8RBCI1lI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--7YQcMoFn8RBCI1lI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZvAAAKCRB4tDGHoIJi
0gdnAP9UKaGnCPV2zaldvnd211nAHuvWh9YTAsetUvI6810yKwEAvc3hLDjMN6Zn
5Mim/845bWOoq9O19ETLpIYckAc7uAE=
=7vaE
-----END PGP SIGNATURE-----

--7YQcMoFn8RBCI1lI--
