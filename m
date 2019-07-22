Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF6709FD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F08289E14;
	Mon, 22 Jul 2019 19:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060C189E14
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:44:15 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 50758240005;
 Mon, 22 Jul 2019 19:44:12 +0000 (UTC)
Date: Mon, 22 Jul 2019 21:44:09 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: Need 5.3-rc1 in drm-misc-next
Message-ID: <20190722194409.rrabgelrriyjg364@flea>
References: <918c1fbb-4fbb-d4a4-0508-367234bb6dda@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <918c1fbb-4fbb-d4a4-0508-367234bb6dda@tronnes.org>
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
Cc: Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0416802238=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0416802238==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dqcb4be4bo4r5q2o"
Content-Disposition: inline


--dqcb4be4bo4r5q2o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, Jul 22, 2019 at 01:20:35PM +0200, Noralf Tr=F8nnes wrote:
> Hi drm-misc maintainers,
>
> I have this series:
>
> drm/tinydrm: Remove tinydrm.ko
> https://patchwork.freedesktop.org/series/63811/
>
> That depends on this -rc1 commit:
>
> e6f3f7e4dc76 ("spi: Add spi_is_bpw_supported()")
>
> I would would be nice if it would show up in drm-misc-next soon.

I just did it

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dqcb4be4bo4r5q2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTYSCQAKCRDj7w1vZxhR
xcEdAQCHpVW6fa7uliBSInNTEr2bF/9qLC0IieEsdDDefiGFnwEA1/fKDVYBzU8L
vQPYqX/AIfisWU7r2FXpa8O2eaTcWgs=
=3Bws
-----END PGP SIGNATURE-----

--dqcb4be4bo4r5q2o--

--===============0416802238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0416802238==--
