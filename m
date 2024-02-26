Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6E867B4E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4772C10E6BB;
	Mon, 26 Feb 2024 16:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NMNkCPrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF38310E6BB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:13:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B96DFCE181F;
 Mon, 26 Feb 2024 16:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC0CC433F1;
 Mon, 26 Feb 2024 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708964003;
 bh=7rjH9bq8T1Xn8cctmwCDZXYP1NoBQVBwgod815KOOrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NMNkCPrRoykFEanaIRSJSFMm7HQg2eW9ink2vtz1NQjrq39IAm9O9o7TB045qLnZu
 sesscW6W6Xi8iFAqIwj32UB2cSTHyxSqYm4VIbsBtWUV8jaTFBASJWGQTfSXrcqznD
 DhmNQYmNjbxTPEh4FFrW750Op0CsDIB65flW06V6lcwsA3yN/TVtzeJ23PxCtlJv7c
 csZs3KZ2fx+hskR8BSDhK1mCxIgW9Qvw5xTQTztzqOCsCdR4QYz2sByYNq/5HVByRN
 TcaYysoZXj3gvYJtoyWoY7T10XTQiLRB6b2p8oJhi4gu9VL4uAoW8GlGbGPM/Kumnl
 xcLlME3WGiPzg==
Date: Mon, 26 Feb 2024 17:13:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: Update drm.git URL
Message-ID: <mbrgva4wfyh4jsbqtzwc3czixfj2cu7r7crt4csjkyhd7nmoep@enn7fmyfnnc2>
References: <20240226152123.131406-1-mripard@kernel.org>
 <871q8zp6yf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ec5bq3dgpztisfgn"
Content-Disposition: inline
In-Reply-To: <871q8zp6yf.fsf@minerva.mail-host-address-is-not-set>
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


--ec5bq3dgpztisfgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:43:04PM +0100, Javier Martinez Canillas wrote:
> Maxime Ripard <mripard@kernel.org> writes:
>=20
> Hello Maxime,
>=20
> > Now that the main DRM tree has moved to Gitlab, adjust the MAINTAINERS
> > git trees to reflect the location change.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
>=20
> Are you planning to post another patch to change the entries that point to
> the git://anongit.freedesktop.org/drm/drm-misc tree ?

Yes, by the time the drm-misc migration will happen (ie, mid-march)

Maxime

--ec5bq3dgpztisfgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdy4nwAKCRDj7w1vZxhR
xWSwAPwKxH1VSC/JSPF4N7jxfgtp2g89J0QLOwGIFb3f/JU3BgD+Oj0izG2xf2Se
0tjajB0RLxlOLu9GWK/BGm9vvJgJnwM=
=FJwd
-----END PGP SIGNATURE-----

--ec5bq3dgpztisfgn--
