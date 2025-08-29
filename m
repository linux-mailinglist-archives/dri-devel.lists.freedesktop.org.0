Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFEB3BEF9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E085810EBFC;
	Fri, 29 Aug 2025 15:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K68jz20C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7742310EBFC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:14:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E5F24480B;
 Fri, 29 Aug 2025 15:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90DAC4CEF0;
 Fri, 29 Aug 2025 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756480488;
 bh=k+zd4T4lSzfL8coBryVKuV0leuYZBzr8PX3IWC/2ywA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K68jz20CnBpOVER+ZgjqfAj4TaAjAF07Z8tT1lIK6bSlLdqjIqb97K/dXM1XdHh4Z
 SUvKQWTf/s96oTNV86+bHDFZ0NEjH3pcwNl5ANoEssKKhyoaJiGsAp3+tPT1X/cVBy
 R6h1mj4BbUcRCHcyzLFr/knrF5USp9y5DwbslgDVr7dyDBRSheSmc8Xe12+0L7ph8J
 C3dWO9SsUr332yNURgf6DcgpK+8C6OSBxUSux+A4JJpI2gj3wsKL/OIs4+hqYn2CXA
 8AH53kSlJ4T9/0UkD6wcjJKMyU1KlG0scfkWP2OukYkdHNZNcw7upVhqiRE6LbXI7C
 HZvTTybTwTVDg==
Date: Fri, 29 Aug 2025 16:14:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: panel: lvds: Append edt,etml0700z8dha in
 panel-lvds
Message-ID: <20250829-geek-unearned-786928b128af@spud>
References: <20250829-drm-misc-next-v1-1-fedb48cf50dd@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3aIRal9bDEDOJiKa"
Content-Disposition: inline
In-Reply-To: <20250829-drm-misc-next-v1-1-fedb48cf50dd@foss.st.com>
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


--3aIRal9bDEDOJiKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3aIRal9bDEDOJiKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLHD4gAKCRB4tDGHoIJi
0gCIAPYv2+V8kpg5sN3cfWsDPpNNmCuk3Nvh3+yfi2YaQtm/AQDcZ0ZEpTENDEoa
+f5cE4x5RJxDyD/okF68lUmTvCj9DA==
=7dgQ
-----END PGP SIGNATURE-----

--3aIRal9bDEDOJiKa--
