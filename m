Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A763F516A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 21:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A9F89A8C;
	Mon, 23 Aug 2021 19:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68ED89A8C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 19:40:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06CDD613D0;
 Mon, 23 Aug 2021 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629747649;
 bh=j71WdEv6Jpnetb8lOkq2Nq+HDd18F6EPNLaNkhipJj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QT0TUhGNo9DyLiFnK7ZRR3dTCzWUuBzLr/9CsP//c0AsFdW/T5zQCW57qF73e5Zeb
 LngHY9Ga7zxsOzUTszTbnH40yDHQ4vP8spqV3SbEnfWp0tE+LfqVs3+Mk1T6lb5ydM
 8e8VKUco2zGbB0678IRqpIAc1IfZfUd2l1yM1cXBDtA153+NoZFMNEh9RwuOPAb0Z8
 Oaq+f/RoqCVpC9mDZ9DNlXdZYbLjcbGjNJ9R+weqrLdt1Nor2NCoJPq4MvGxZbdWP6
 BpjMo2MkSFony1t7NtHqPz04PJJ6nFRooMU7mLza08/CWSYs6q/kfTbUYRByIoTfmp
 K1kfHSs7b57kQ==
Date: Mon, 23 Aug 2021 20:40:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Dillon Min <dillon.minfei@gmail.com>, alsa-devel@alsa-project.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: panel: ili9341: correct
 indentation
Message-ID: <20210823194022.GE4380@sirena.org.uk>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
 <YSP5UGRATAjuRteM@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline
In-Reply-To: <YSP5UGRATAjuRteM@ravnborg.org>
X-Cookie: APL hackers do it in the quad.
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 23, 2021 at 09:38:56PM +0200, Sam Ravnborg wrote:
> On Mon, Aug 23, 2021 at 06:37:55PM +0100, Mark Brown wrote:

> > [2/2] dt-bindings: sound: rt1015p: correct indentation
> >       commit: 0aeb17d1728257f29131a290f0cc8e281cc7274c

> I am confused here.
> Did you apply both patches or only the one touching sound?

> I will pick up the panel patch otherwise.

Only the second patch, it's the only one listed above and the subject
says subset.

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEj+aYACgkQJNaLcl1U
h9ClAQf9GdZp+od3AaNAgXcmo215Bu0e9MGJHFtwWkD+ZFNnarLK9zWH5feM/WDM
72DyLI12wP9dbnQRL6AVlWTUwHiHbGxR5ecJwrGOx3+mkzwltvOiG52swo30V5yO
1rjxW8zoOKIzQ+FfBc/bu+r899PyFRNDYdGcIRpR315V+gy3qqhl7aNaCsLsdHcT
Lw69UT3qXu2zcqWsWAwAyOTaUO24SGfphxPK35CG3aWyI8oF78mzYKoqRiJftRaM
PVlnaImAl8wGMeEtR23bh2mJHtjUgYRpqsuJeKW5U4jAlcARAdA6Ka4tekGfM46d
keVRV5CSGwLWho2G/lo6K24Ex7e1/Q==
=UIFw
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
