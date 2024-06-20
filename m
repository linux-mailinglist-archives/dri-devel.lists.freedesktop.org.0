Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EC910AFC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0689A10EAC6;
	Thu, 20 Jun 2024 16:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xy3osjYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BE810EAC6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:04:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2AC75621E0;
 Thu, 20 Jun 2024 16:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75606C2BD10;
 Thu, 20 Jun 2024 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718899459;
 bh=74NqYGGd8KI2bPBP3+dGSQ19ivy6M2TEhoWU0GlnEqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xy3osjYtMtOv4n09wrrbA58sHtdDM5j3mppgOlwztKVRvcZbLJ8V+c2QRGV5gFIQK
 WsL653mUf8ApZamFXXs8y99CwtwjAQ66Ol/fWzbXnCbAHtmhovKiJRn/XoalzylSxW
 HXoXyFFyPyRQg4/iEwfaSgTPDSLPgvHIvws/b9wd6fVPdc2qCk8MWXECCVcqMlUd4h
 s8k+5afIc9MoZwaYkDuYpbchseBbQcMdHx4fylQ1OSJry4ieXEThPuVQmvA//Of0yQ
 qvlWsf25O5wm6CRPrNFry++sfoW6+mGxpBQv/ZjNMthpBIhFIt1q/fwgTfpH2UB/b+
 6XzMT2PN1emBw==
Date: Thu, 20 Jun 2024 17:04:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.co, dianders@google.com,
 hsinyi@google.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel-simple-dsi: add
 Starry-er88577 DSI panel bindings
Message-ID: <20240620-purgatory-used-9cf35fbc10c2@spud>
References: <20240620115245.31540-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240620115245.31540-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zWqryNqb5LRpYLSv"
Content-Disposition: inline
In-Reply-To: <20240620115245.31540-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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


--zWqryNqb5LRpYLSv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 07:52:44PM +0800, Zhaoxiong Lv wrote:
> This add the bindings for the 1280x800 TFT LCD Starry-er88577 DSI panel
> to panel-simple-dsi.
>=20
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zWqryNqb5LRpYLSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRS/wAKCRB4tDGHoIJi
0qliAQDqRjWAXDaYu4eZpMN2pRQts2JnHENHQFIjDChsjCLm1QEA4sxFd8eJwhRV
ZQR4YvYWx2E6sQz8c+CSLYkRt05INAU=
=Xqyj
-----END PGP SIGNATURE-----

--zWqryNqb5LRpYLSv--
