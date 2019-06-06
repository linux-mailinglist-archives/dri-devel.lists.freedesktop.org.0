Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E136FA1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75426893A2;
	Thu,  6 Jun 2019 09:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DC5893A2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:14:45 +0000 (UTC)
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1B4A31C0011;
 Thu,  6 Jun 2019 09:14:40 +0000 (UTC)
Date: Thu, 6 Jun 2019 11:14:40 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] drm: panel-orientation-quirks: Add quirk for GPD
 MicroPC
Message-ID: <20190606091440.qomxukz72puwq7vy@flea>
References: <20190524125759.14131-1-hdegoede@redhat.com>
 <20190524125759.14131-2-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190524125759.14131-2-hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0453124665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0453124665==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x6pw66kal3z3a3li"
Content-Disposition: inline


--x6pw66kal3z3a3li
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 24, 2019 at 02:57:59PM +0200, Hans de Goede wrote:
> GPD has done it again, make a nice device (good), use way too generic
> DMI strings (bad) and use a portrait screen rotated 90 degrees (ugly).
>
> Because of the too generic DMI strings this entry is also doing bios-date
> matching, so the gpd_micropc data struct may very well need to be updated
> with some extra bios-dates in the future.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For both patches,
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--x6pw66kal3z3a3li
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPjZgAAKCRDj7w1vZxhR
xbBXAQCOJ2wgV19cdDYHKCWgkr3K+piif4YmS5cYfRgY09kgAAEA2J8f6ugs86uI
XT0AvMd/b5e0fYJOpM1YQVbqPDddOQA=
=7X95
-----END PGP SIGNATURE-----

--x6pw66kal3z3a3li--

--===============0453124665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0453124665==--
