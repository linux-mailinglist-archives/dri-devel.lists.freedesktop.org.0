Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C5918289
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C831710E8A8;
	Wed, 26 Jun 2024 13:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kq69pMEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561C210E8A8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:34:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82575619B5;
 Wed, 26 Jun 2024 13:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CB8C2BD10;
 Wed, 26 Jun 2024 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719408870;
 bh=E3IselMobiJI8seDX3QY8p1hoY3Ox5xAWjz1e1BwllQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kq69pMEC9RAQYpo0KTNkKG4E3+MFn4h5GPK0DRneFYMcAwSH4TzIc31snnTvPjMdv
 yqiHD9fAZQyjQqJTYbTxXQ5TwfsXX/UdPvvd6OKIhjd8/VnpHBcYpePGjRSq2CpzMW
 6ftyV7HqFJ0RPwUwGViTVNiXbklEIX0IbC4t8wUD/iK1mX72G1WH5an4pwYMaeHr3I
 DSSbvUWyMhFdHIdQ7/TtrzJetq5OS+NiFepFc05HDhGm7sfPjVitdO6Ei0E0jCBQ1s
 sS299RtRQ2hnVHEFnKoaH8UIWC8TY1m1yt8EfDo7xvw9rzwOQ8ZURxadhLkjBGbonv
 yVgyaKxeMZYkw==
Date: Wed, 26 Jun 2024 15:34:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] MAINTAINERS: drm: vc4: Add Raspberry Pi as
 maintainers
Message-ID: <20240626-dynamic-certain-barnacle-cffc84@houat>
References: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="difu4vxpq2uxo35u"
Content-Disposition: inline
In-Reply-To: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
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


--difu4vxpq2uxo35u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 21, 2024 at 02:19:25PM GMT, Dave Stevenson wrote:
> Add myself as maintainer for VC4 alongside Maxime, and
> our internal review list as reviewer.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I just applied both patches. Congrats :)

Do you have a drm-misc account already?

Maxime

--difu4vxpq2uxo35u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnwY4wAKCRDj7w1vZxhR
xfT+AP9L53kv36EVdIJxvR/7+QNnp/7UFcz62mwmHaSVF/M0yQEAh1qVB6p4zpr7
9lLOi3pGKMI7OlWiOCifOIGYF1cxqA8=
=jXy/
-----END PGP SIGNATURE-----

--difu4vxpq2uxo35u--
