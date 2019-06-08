Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FD3A5B1
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE24C892FB;
	Sun,  9 Jun 2019 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Sat, 08 Jun 2019 01:15:45 UTC
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BEA88FA1;
 Sat,  8 Jun 2019 01:15:45 +0000 (UTC)
Received: from chianamo (n58-108-67-123.per1.wa.optusnet.com.au
 [58.108.67.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: pabs3@bonedaddy.net)
 by smtp.bonedaddy.net (Postfix) with ESMTPSA id 141C7180041;
 Fri,  7 Jun 2019 21:07:06 -0400 (EDT)
Message-ID: <f1bad113987c43d11a99f58db43c720edfba6fbe.camel@bonedaddy.net>
Subject: Re: [PATCH 2/2] drm: add fallback override/firmware EDID modes
 workaround
From: Paul Wise <pabs3@bonedaddy.net>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <20190607151021.GJ21222@phenom.ffwll.local>
References: <20190607110513.12072-1-jani.nikula@intel.com>
 <20190607110513.12072-2-jani.nikula@intel.com>
 <20190607151021.GJ21222@phenom.ffwll.local>
Date: Sat, 08 Jun 2019 09:06:53 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.30.5-1.1 
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
Content-Type: multipart/mixed; boundary="===============0307298999=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0307298999==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-maax3mrChKPjJo+a28Ho"


--=-maax3mrChKPjJo+a28Ho
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-06-07 at 17:10 +0200, Daniel Vetter wrote:

> As discussed on irc, we need tested-by here from the reporters since
> there's way too many losing and frustrangingly few winning moves here.

I'm building it now, hopefully will be done today.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-maax3mrChKPjJo+a28Ho
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAlz7CikACgkQMRa6Xp/6
aaNE3w/9HX+8kIhfhFnjtAf7mZWmE1PXcqI+Fah4wpzl73fAjiHhWt7pl3tRdjbY
mdJZlgc4Ooqq+skAcTB2TZmCARp+GBAS6yQoVxrobOiT6fh1csjyyBXLpK9gEnBi
SVBeqsGzFuo/XT/VN2JiKw6Vu6QL9by9KJT6vWNNu0vM19acKOsVNmkzB2EtQNi6
Yvh7N45rnnbct/2zPvxGOzk8j2RIBQJRD1Izx2oAb+PW5EsZk+eZcZOwUDbwDhp7
Imw4jbiS8adARPzI7wcaRR3OqiuWM/VirJn7jFJM+DNHIkBu5QUII28cxQsy+vIL
8UPkVHRbJihvs8qY0WLOTM/TG1yyvts6olM9+xR6i7i5dG4xp/UWfhN9ouJtijVH
Zp0kYcqo4fA0hUm12UP4Pr8MSgJVU/81VZHpN3vw65ph/i5ia6AP42Ql6mxllM7J
f0II8entqNiqefP9qKiyKrL6GppO18D0yivBWTsXxbyyfR6EOr9+2HjA8g1c2Z6u
GSUMQxl05MPx9/tqqEfZ3Uo9iuqK7En+4ZcI+hhp01+wD+ymiO8/k/wdqFRvpA2X
u4FxMdUw8Cx2ism8or+1Xn4kSeCHM7/pB8/U4nC91d4gFXH8/1RJxCOfNvw+LQ1h
vQMNGo9n+aH4Q2CrEN/emzc4Wcpa5kAEWD3WcaFyLWrFwAJBbPI=
=ko3R
-----END PGP SIGNATURE-----

--=-maax3mrChKPjJo+a28Ho--


--===============0307298999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0307298999==--

