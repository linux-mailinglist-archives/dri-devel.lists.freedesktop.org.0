Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76253C3CD1D
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 18:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FDD10E997;
	Thu,  6 Nov 2025 17:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmMzs73V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2962010E997
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 17:27:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2AF74433B;
 Thu,  6 Nov 2025 17:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC827C116C6;
 Thu,  6 Nov 2025 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762450038;
 bh=lUYNwn621b4INnVv6cYUd9i8ygchqkVKYYeeytWLys8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AmMzs73VnjPXmC/0CawgwdAAECJ1wJXAWnwMQs7cvyNsJ8gcIKEmofrUeLkYBv1bd
 1dwbVsduZY9Hh2P4Er88otWdF/OtGWQBj59m5EtsoxzMWIQqz4I/gg5CSBj2A1TXk5
 +CDYE5TE1HSL3IZtGbNZ/4X9hMqqYJj3wEvS3IweFoWj2AE2jtIarNJYcPWV3e6Try
 T5g4cl/zNIMVWgstSipeHjVO7I4mYPDg0HSmdLE1UpofGJZx4AuNIgH3xfYWXSof1Y
 TW1r3xus5GPisF2NMyuBSwOVbEIQhFCmZEWc+SbXjqHg69Zu9aFNrWLLQm5Z4gR/u/
 7DpEB7V12nwxg==
Date: Thu, 6 Nov 2025 17:27:12 +0000
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
Subject: Re: [PATCH 2/9] dt-bindings: phy: rockchip-inno-dsidphy: Add
 compatible for rk3506
Message-ID: <20251106-litigate-cultivate-75a4aac333c7@spud>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V33MzIjcuA2BZAPY"
Content-Disposition: inline
In-Reply-To: <20251106020632.92-3-kernel@airkyi.com>
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


--V33MzIjcuA2BZAPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--V33MzIjcuA2BZAPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzacAAKCRB4tDGHoIJi
0hUTAQD7NwjnqRmBmopmm9xS3ZqfaL4Lj+EawXUG/K8Qy/2v1QEArBXv4nDqLv9S
VD0Fl63GQYh+57qF0vwhbIjEcBRyQgs=
=XWuK
-----END PGP SIGNATURE-----

--V33MzIjcuA2BZAPY--
