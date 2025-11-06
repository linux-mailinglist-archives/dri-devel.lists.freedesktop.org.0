Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6349FC3CD35
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 18:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A500D10E99A;
	Thu,  6 Nov 2025 17:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FLwc/b9C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275D210E99A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 17:28:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F0EF8432E5;
 Thu,  6 Nov 2025 17:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C585BC4CEFB;
 Thu,  6 Nov 2025 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762450084;
 bh=bgxrGX1ncCHXXJp1kwwkg1TSvCMea4zbZRphFSfsxhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLwc/b9Cj6k5hUXPM9oYxjeswD8Vb1ej4/mcZDVLV0MmuNFlo+hLSwLEDhVYG9FgW
 2onU3Rj3cj25Sp6p7wA78X45e3lV0E274Qj4/fFwJbhu6X02vf+tVHiDX5nFbppzKk
 50GP1FEbI7eV5/ocbikVTV9B1i5WUB0+NiRUrBhyEl6byOJ25Ik3kariC2esEEJYPw
 iFULGRyotJ1WnSPGN6Y933gUd0H5d1YejDHnubSFeTWJy6dWVhtGODA1g5Hvpfxlm7
 utgvNAHF6d4dpnoaEdW6rUJJPrGoEMTe3GNBVRY6uuAj65ErVMlp986qDmisjXmPK/
 /8bCy4V5KvAnA==
Date: Thu, 6 Nov 2025 17:27:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 3/9] dt-bindings: display: rockchip,dw-mipi-dsi: Add
 compatible for rk3506
Message-ID: <20251106-watch-confining-6a3800cf81eb@spud>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3yjg8hVehVxlP0SN"
Content-Disposition: inline
In-Reply-To: <20251106020632.92-4-kernel@airkyi.com>
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


--3yjg8hVehVxlP0SN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3yjg8hVehVxlP0SN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzangAKCRB4tDGHoIJi
0mJSAP9jViavOmW7ijllM9pi+5hpceEFSeVprT+VVdypRaeBggEAraipNDFhLqIW
QknuBgh9VzGzJrCnn5mz8n4Ul7FO0Aw=
=9Uh8
-----END PGP SIGNATURE-----

--3yjg8hVehVxlP0SN--
