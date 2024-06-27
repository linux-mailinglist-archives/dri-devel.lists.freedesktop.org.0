Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71191AC6E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 18:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1023010E101;
	Thu, 27 Jun 2024 16:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKjRxvxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9FA10E101
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:18:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1D9C9CE3326;
 Thu, 27 Jun 2024 16:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153EFC2BBFC;
 Thu, 27 Jun 2024 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719505103;
 bh=gmT88TfnjaS2vhKOWeRDOUNUQ6+OhlkFPvnZgNOTto0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKjRxvxGEPrpl4qtAvlcLOEdC28cCVGWJ+wUUw2a237jDiriozhi8pogh5Aqi+8Vl
 ut+jywh5Fdnaa29+CZJv38cMz49da/Kfv3vQ/lA+EgEkWKeJyMA4yoKfEim1MbTW8L
 tzxmQqIytPNoh569tqMgRiEjOyH2+jXtGstW1kWejG4B7S5NN+LHZM7r5Tvwb1zqv0
 0TPOcI27uB9j8hEuvOqcOOGk5q4c+/oWYucEZdOFg3czx30HbL50bC9lEw8bjXRp/Y
 iI0LxdluK0HuSzyuroroJFLPlW0U6LJBn4p+YpRpcO48UysLxnC5+sKfeSUAxVBMCI
 WD1bddLVF7xWA==
Date: Thu, 27 Jun 2024 17:18:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 thierry.reding@gmail.com, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Jiangsu Smartwin
 SMMT043480272A-A19
Message-ID: <20240627-gloating-unsnap-bfe0f45c8715@spud>
References: <20240626161714.4057983-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3zxCmR2rZoVz2I/F"
Content-Disposition: inline
In-Reply-To: <20240626161714.4057983-1-m.felsch@pengutronix.de>
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


--3zxCmR2rZoVz2I/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 06:17:12PM +0200, Marco Felsch wrote:
> Add compatible to panel-simple for Jiangsu Smartwin Electronics
> SMMT043480272A-A19 4.3" 480x272 LCD-TFT panel.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3zxCmR2rZoVz2I/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2QyQAKCRB4tDGHoIJi
0qUQAQDNtUooY97mEN8EqltkKioCV7gjVL4rr85IfXPhZYFmRwEAmY62ml6PzPJm
bGL3KxkjR7YB/4xDoSzdzyr7bFTbbgU=
=r+Zr
-----END PGP SIGNATURE-----

--3zxCmR2rZoVz2I/F--
