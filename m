Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810B202DF
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 11:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4005891FF;
	Thu, 16 May 2019 09:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B621891FF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 09:53:05 +0000 (UTC)
Received: from localhost (unknown [80.215.244.179])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7D2D9240003;
 Thu, 16 May 2019 09:52:59 +0000 (UTC)
Date: Thu, 16 May 2019 11:11:05 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v10 0/2] drm/sun4i: sun6i_mipi_dsi: Fixes/updates
Message-ID: <20190516091105.er6oeyrnompwik3j@flea>
References: <20190512184128.13720-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20190512184128.13720-1-jagan@amarulasolutions.com>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2064902932=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2064902932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ce3qofktjm47bfnn"
Content-Disposition: inline


--ce3qofktjm47bfnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 13, 2019 at 12:11:25AM +0530, Jagan Teki wrote:
> This is v10 for the previous series[1] and few pathes are dropped
> as part of this series since it would require separate rework same
> will send in separately or another series.

APplied both, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ce3qofktjm47bfnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXN0pKQAKCRDj7w1vZxhR
xUFPAP9qQEmAom0RveVfdjeyYEidWvLU6MUme3eTHox9GhsoXQD6Aio7WpCJH0Hs
BM+RV1KwgBuakfuaClq/zq0ivu9hZgw=
=wdAl
-----END PGP SIGNATURE-----

--ce3qofktjm47bfnn--

--===============2064902932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2064902932==--
