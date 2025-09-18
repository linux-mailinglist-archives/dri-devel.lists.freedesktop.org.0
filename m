Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E5B857BE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CD110E8D4;
	Thu, 18 Sep 2025 15:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JOpCyvRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD7810E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5814A60211;
 Thu, 18 Sep 2025 15:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DB5C4CEE7;
 Thu, 18 Sep 2025 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758208396;
 bh=MTQzEFQiULsusrEoiFHrUIY5UVxjD6bMm0XeIsQK0Sg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOpCyvRDsW9Il8ySCZwzhVqD3CavFZiKMcDftrKXTocuE3EX+EulR0BgBXqiyUc86
 tm8a5J1XPpdfPQbuxnadH3s+xsujaYWZSLq29TMQtBMQyOg+Zoc8fA+QHo4j8dH4Z8
 jMcJ7h+NIry4rIQ7eqfM9FXlIdOdqcPQRTrG+pnv80g/G8q5hYVH8RcUC/H59+kgFB
 Xv1umMMLMHXPCeBEg7J3N6bSICWq7+SgtzE8EV8yb6VicWQ5gqWAZnxHTXe3otSbJS
 V16k9JQMtCC1H3BOQOyjtKE562+Mp7gAjqAOUin3tD6hdsG0GeaWbMR4k/ROEiu/kL
 L1ZC6uY72K4dA==
Date: Thu, 18 Sep 2025 16:13:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
Message-ID: <20250918-unbalance-shrubbery-8038941c6797@spud>
References: <20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com>
 <20250918-cpitchen-mainline_gfx2d-v2-1-6cfac9d56612@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h3/7+aMqJ6Ffw8WC"
Content-Disposition: inline
In-Reply-To: <20250918-cpitchen-mainline_gfx2d-v2-1-6cfac9d56612@microchip.com>
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


--h3/7+aMqJ6Ffw8WC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--h3/7+aMqJ6Ffw8WC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwhhgAKCRB4tDGHoIJi
0kTgAQD8JKUvi3YGAWpBtFlr+fWrmGnI2vCnimmP2oRKPXftkAEAjWLLhsT2G/h9
zhB4+qfto1vN11PxMJHIQRK+sDB5+Q4=
=0XOG
-----END PGP SIGNATURE-----

--h3/7+aMqJ6Ffw8WC--
