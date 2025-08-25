Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C0B347CC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DE810E509;
	Mon, 25 Aug 2025 16:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sTcPQNTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8978110E509
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:43:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 066225C622D;
 Mon, 25 Aug 2025 16:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D03C4CEED;
 Mon, 25 Aug 2025 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756140198;
 bh=TX9+vP2bWcTRF6M7qTWQFrs1kf9aQadhdDTstsDHILQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sTcPQNThS9MQ/B+UVcpnHzLbpBfLvLN5OxVsY31TQJpQVHDZkNqI3TDqRw5lNdeZb
 OvoKdBwTXAYElzerhPHQvrz5ZG7KEIV8l+Tw5AxjJyvgv7Z1Zm6xqBpgcXXqSBG0FN
 dW228ZjNOZsx/Q6oaLAH2oBNhUKREaoV4kGBM39cWdlUJMyzxuU+eS/rHVmPVirdJE
 2oa1DZSaCgZY4rsW3QzpQisWbowxcqeDceRNN8ZTxvrh8aDUGW8Zre5hDPODrKoYGa
 2OqIAWyyLFx6iMsrTN37C9Fyu1If984tIPEfQSQ0YFbMwpG/LkkuqXqRAYKYj8C3rk
 rYI8zV0iPtprg==
Date: Mon, 25 Aug 2025 17:43:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3 RESEND] dt-bindings: display: extend the simple
 bridge with MStar TSUMU88ADT3-LF-1
Message-ID: <20250825-enable-defection-1a6c71f97fca@spud>
References: <20250824092728.105643-1-clamor95@gmail.com>
 <20250824092728.105643-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ru7F0K2IIlOSUCt+"
Content-Disposition: inline
In-Reply-To: <20250824092728.105643-3-clamor95@gmail.com>
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


--Ru7F0K2IIlOSUCt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Ru7F0K2IIlOSUCt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKySoQAKCRB4tDGHoIJi
0lV6AQDKN8Bl2FlAJOol/GEne8FjWl6jL2eX5cDlccXnISsQfQD+KxXOzE2NO46X
SeRP1sCGOsOslu/gyYpBqkuFf5mrGgY=
=v7bc
-----END PGP SIGNATURE-----

--Ru7F0K2IIlOSUCt+--
