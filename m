Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00825321
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2766889471;
	Tue, 21 May 2019 14:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955FC89458
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:58:41 +0000 (UTC)
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3C4E720014;
 Tue, 21 May 2019 14:58:38 +0000 (UTC)
Date: Tue, 21 May 2019 16:58:37 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fourcc: Fix the parameters name in the documentation
Message-ID: <20190521145837.aqbtbl2vkjntzlsv@flea>
References: <20190521110906.15268-1-maxime.ripard@bootlin.com>
 <20190521124130.GM21222@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190521124130.GM21222@phenom.ffwll.local>
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
Cc: kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0203480581=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0203480581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p35tw2i6zahzjbza"
Content-Disposition: inline


--p35tw2i6zahzjbza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 02:41:30PM +0200, Daniel Vetter wrote:
> On Tue, May 21, 2019 at 01:09:06PM +0200, Maxime Ripard wrote:
> > We introduced new functions in the commit bf39607c1614 ("drm/fourcc: Pass
> > the format_info pointer to drm_format_plane_width/height") based on
> > previous ones but with a slightly different prototype. However, the
> > documentation wasn't changed to reflect that change.
> >
> > Fixes: bf39607c1614 ("drm/fourcc: Pass the format_info pointer to drm_format_plane_width/height")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--p35tw2i6zahzjbza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOQSHQAKCRDj7w1vZxhR
xR85AP0ROO86LpMLZR8k1PYq4/cVA7L/GbvwSl/7TjjgDJybKwD/a9sj88uhmMTs
V6lFXTw7zXxVIGdzlmG5hDgyBUc15Qs=
=c9cU
-----END PGP SIGNATURE-----

--p35tw2i6zahzjbza--

--===============0203480581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0203480581==--
