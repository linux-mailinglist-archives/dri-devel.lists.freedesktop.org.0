Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA35600FE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0756410EC06;
	Wed, 29 Jun 2022 13:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jun 2022 13:10:31 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9021310EC06
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:10:31 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 316B81C0B8F; Wed, 29 Jun 2022 15:10:30 +0200 (CEST)
Date: Wed, 29 Jun 2022 15:10:29 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.19 04/22] drm/vc4: crtc: Use an union to store
 the page flip callback
Message-ID: <20220629131029.GF13395@duo.ucw.cz>
References: <20220628022518.596687-1-sashal@kernel.org>
 <20220628022518.596687-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="aPdhxNJGSeOG9wFI"
Content-Disposition: inline
In-Reply-To: <20220628022518.596687-4-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: emma@anholt.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>,
 stable@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aPdhxNJGSeOG9wFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Maxime Ripard <maxime@cerno.tech>
>=20
> [ Upstream commit 2523e9dcc3be91bf9fdc0d1e542557ca00bbef42 ]
>=20
> We'll need to extend the vc4_async_flip_state structure to rely on
> another callback implementation, so let's move the current one into a
> union.

This and [04/22] drm/vc4: crtc: Use an union to store the page flip
callback is queued for 4.9 / 4.19, preparing for change that is not
queued into 4.19.

Please drop at least from 4.9 and 4.19.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--aPdhxNJGSeOG9wFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYrxPRQAKCRAw5/Bqldv6
8vunAJ9lfwO+e+BGTRNn3nLenP8oCx3WkACeKN+qG6clKzbdd92Cy422TOmsId8=
=f3LC
-----END PGP SIGNATURE-----

--aPdhxNJGSeOG9wFI--
