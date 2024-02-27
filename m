Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F3868A4C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 08:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035FC10E323;
	Tue, 27 Feb 2024 07:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E6xVF3Tn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A6410E323
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:59:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93A2DCE191B;
 Tue, 27 Feb 2024 07:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F62CC433F1;
 Tue, 27 Feb 2024 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709020770;
 bh=V2POIK3p2R5mAZ+PgjNYXDT3wJhmgd1GHUT7dgBUXi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6xVF3TngTkqecM13kt/dH0h5I4Jmpnb4hUYS4eG1LBlXmLqLQdwVh48OLdyNsTzL
 Qabyuc2Mtaa0HwLkv3q3tTBbWREkaSycCAvYi5NdnwHUiFLmsU05x6fuhkJdSuAnjd
 qLK48f3x+WAjArvFCCcejPHgHBM62bEUzetSL2TpR9+u3kYPw9jf7r/epM2sWPb749
 dNd0Wrxfco0dlb9wLZ4yIQc9rU1zt5oqBwtr5r91rhBK7QksmyY+z6stXPibzz2A7Y
 OsHREM8T+tEU27R+zvKGXaDLbM+cmL7JIkNvS55t5tVpQ7doUY5OGSSteSmOQ/LIfx
 K2t7mMSqs4O7Q==
Date: Tue, 27 Feb 2024 08:59:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: Update drm.git URL
Message-ID: <4gci7c7dbgxejkxme2gierar2btcoqf57e56nzqz3wqrvbcamp@qzwv3o3ivzmh>
References: <20240226152123.131406-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lmze2nqcgva5ak7l"
Content-Disposition: inline
In-Reply-To: <20240226152123.131406-1-mripard@kernel.org>
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


--lmze2nqcgva5ak7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:21:23PM +0100, Maxime Ripard wrote:
> Now that the main DRM tree has moved to Gitlab, adjust the MAINTAINERS
> git trees to reflect the location change.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Applied to drm-next

Maxime

--lmze2nqcgva5ak7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd2WWgAKCRDj7w1vZxhR
xXAgAP4nf+kyHho75aFiY9RblJcUdjkKMfw7/9Id9wtxe5BVyAEAkrpoa+Hc7pmF
hCGHulbSUZ0/fhr7VTvoFvI06ZDb/AU=
=NYnw
-----END PGP SIGNATURE-----

--lmze2nqcgva5ak7l--
