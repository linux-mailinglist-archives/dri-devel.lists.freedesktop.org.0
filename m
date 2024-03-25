Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BFA88AFE1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 20:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73210EAF7;
	Mon, 25 Mar 2024 19:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IpcGgUwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354910EB0A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 19:25:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 788DECE1CA3;
 Mon, 25 Mar 2024 19:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C93C433C7;
 Mon, 25 Mar 2024 19:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711394739;
 bh=rGP9xGOCge4nOY4nP6+eD+Sot3eKPSA1nfD7xBY8HuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IpcGgUwQLJDxpwGavp3EWJSHSGGpSh43ClVKZdCepyL2x6DEMu6xhMu1JliLYuHVR
 xZH81cfISok7RPbsgaJa0GSH5Qc2/V7i+mDILratepRARi1BVJ8JP6O0vSb0swti56
 uJCfwsbe68XKo7a8qhnjBtfErCCyxSDnEoqoDCXrn4t0h5M8mFCwpP3sDlVRHvQRS0
 FdIqTaFPkf1CGrd7rcXh3dOiFbF9aul9l7W5LUOiaVzilPHJGfLCPNwFkdbUpsVuds
 arPDD0K64SLFrW2xDrdl3QxMht8sYYdGDK4QhIBy7EOCBDKqYn81IgKO6G6n7bwOUa
 VD9zn+xrJBEzw==
Date: Mon, 25 Mar 2024 19:25:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 sam@ravnborg.org, quic_jesszhan@quicinc.com,
 neil.armstrong@linaro.org, megi@xff.cz, kernel@puri.sm,
 agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add GameForce Chi
Message-ID: <20240325-applied-abrasion-b68d2aa02854@spud>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
 <20240325134959.11807-5-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kp/qOKYudTbPvI5Q"
Content-Disposition: inline
In-Reply-To: <20240325134959.11807-5-macroalpha82@gmail.com>
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


--Kp/qOKYudTbPvI5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 08:49:58AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> The GameForce Chi is a handheld gaming device from GameForce powered
> by the Rockchip RK3326 SoC.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Kp/qOKYudTbPvI5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgHPrgAKCRB4tDGHoIJi
0hXbAP0dnSKtnfuf20yVSQvh0ORpJmBb6ZmEQNdHjanit5KNUwD/a00lfQf1GCpH
P5So6w6aKTED83lB5k0K931e2RpNUww=
=ktDR
-----END PGP SIGNATURE-----

--Kp/qOKYudTbPvI5Q--
