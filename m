Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40142B583FD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F7F10E2FB;
	Mon, 15 Sep 2025 17:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sRb5sF/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F1B10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:51:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D385B60202;
 Mon, 15 Sep 2025 17:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6CFC4CEF1;
 Mon, 15 Sep 2025 17:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757958682;
 bh=fFdF5CMCTAnwISZ/eT+Yrx/sOBZpyVdhARbcIzdq8VU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRb5sF/bNQ34JDwzv2LB0JOxy9bYFZ+e7R8cPR1WaImljDF11kCCrpzEiUKGvLsi+
 HZa4tuxWeGLKXw1ZjCaOm4bHNIFe+lLBBBWyuqZ2j5ltYiJOkso94xIXk62ouG64Dm
 mB3b1TCOJ7qo8vTN4oSfSx4Z/8f6PAaNpzBlrNrQ8wKxa5mmdXKop2tKO4jedveEZY
 j3AUPBydRAZSw6YbOS/rsaouUKRdGm5ESTHPd2iAQEayn31iilu9EOSfWhZsCHzaR9
 pZentVVopng0ONFoSCIsZMXXK6V+5l+f7ubnk4hKAo2mhUrV4ltNhChzQGYhbS2GEp
 aCqjmEXNLCJVw==
Date: Mon, 15 Sep 2025 18:51:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250915-numerate-makeshift-c076500aaec3@spud>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
 <20250913002155.1163908-2-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vT2LutKl9MtQTSAL"
Content-Disposition: inline
In-Reply-To: <20250913002155.1163908-2-olvaffe@gmail.com>
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


--vT2LutKl9MtQTSAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vT2LutKl9MtQTSAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhSFAAKCRB4tDGHoIJi
0hyDAQD5XpyVrgwBrD8kkao4gH4YK4KfNqnZEXgFzHZtZFmiBQEA0WDTgBM88F9Z
PcXqDWyoUO1rnrO+HG6i4coKk1lnPQs=
=JkzN
-----END PGP SIGNATURE-----

--vT2LutKl9MtQTSAL--
