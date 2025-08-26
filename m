Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FBB371A7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE9E10E6AF;
	Tue, 26 Aug 2025 17:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q2XFkEO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9FC10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:47:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9180B404CE;
 Tue, 26 Aug 2025 17:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1C6C4CEF1;
 Tue, 26 Aug 2025 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756230443;
 bh=QdhdgGupXvzMsxi3UpqcbF6p+Oq4kYam9Hl4IiM7fG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2XFkEO5hy3tZUNuy04P05Aej+NwMNzR1V1UUeGsA/fYKNOeEEhmbJcM5+vZ8ng7b
 rx7xMK0sab0xgNWwV/j0jDXaGoAEcg/LkNW31RQVhyXVr2hoBBh4wTI2dx0gOjmoDG
 QB5kLtfemgBrb79VykIFQHNzIEIz5nFVjEsS4RVJoUPG0yMmzFXvjf/2flk1s7ccBk
 pIWbKD5uIpYgoOyTp3VG4sGVRtXQI0CpFhPjp7dFr/pZGlJfychkpuXYewWdrNhgyz
 wjt2dO+pj1Mj9oyQHoQzi6e76GYtZcb7WCFH0fYUa62OCUExt4FoTWVjzE5Ea9mRuu
 Cux9TYhmvn/8A==
Date: Tue, 26 Aug 2025 18:47:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: panel: lvds: Append
 ampire,amp19201200b5tzqw-t03 in panel-lvds
Message-ID: <20250826-fragility-darkish-715589203b6c@spud>
References: <20250826-drm-misc-next-v1-1-980d0a0592b9@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9HnhkVHANMCSoXTS"
Content-Disposition: inline
In-Reply-To: <20250826-drm-misc-next-v1-1-980d0a0592b9@foss.st.com>
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


--9HnhkVHANMCSoXTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--9HnhkVHANMCSoXTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK3zJQAKCRB4tDGHoIJi
0mGVAP9Zv6hXywWIK1K/hJyxUZD1xROsO1NNAjaR7gjBzzzg8QD/TGGd8P9i7J6r
x3M30PfiUvg1IznscukX12dypHsvAAs=
=fpYc
-----END PGP SIGNATURE-----

--9HnhkVHANMCSoXTS--
