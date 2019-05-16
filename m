Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A420C96
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAFA89709;
	Thu, 16 May 2019 16:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C96189709
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 2ED4610A3516;
 Thu, 16 May 2019 09:09:44 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id MnM4LX1VAciX; Thu, 16 May 2019 09:09:43 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id E0D3310A3478;
 Thu, 16 May 2019 09:09:42 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 56A602FE3AA9; Thu, 16 May 2019 11:09:42 -0500 (CDT)
From: Eric Anholt <eric@anholt.net>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/4] drm/vc4: Binner BO management improvements
In-Reply-To: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
References: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 16 May 2019 09:09:39 -0700
Message-ID: <87zhnm1iv0.fsf@anholt.net>
MIME-Version: 1.0
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
Cc: Eben Upton <eben@raspberrypi.org>, David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0735953050=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0735953050==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Paul Kocialkowski <paul.kocialkowski@bootlin.com> writes:

> Changes sinve v8:
> * Added collected Reviewed-by;
> * Fixed up another problematic case as discussed on v8.

I think this is ready to go.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzdi0MACgkQtdYpNtH8
nujdBQ//VPW+1gMNzDYIfpDvDr/na0v1xDiS9WknV4ahnTVQpDNzR/IytYXNrs+y
2y3Oex+mpo7AXdsOgajXN0sdTV931+rBssiCT78TvP8wO4A0DScaY0dpkC464L+N
7YY3PA/LL52B4Wwto5Zf27M4jgNs1YurtxTGptpqR5mc4HpjG4MZeoBdkcDIn8XU
MyeY1m6gVDeUMXb3i1rOjaDSwe6fY7S3Kxz+i9wUQFAGsjCZKlKDsI36X5cQ20j8
FZvRCA4GPyOs+BVW9oXu0dmjV3hv4K9G4MZATArfK6VhUmed7pwD4hirfjFsHa5c
EM+mqognki0HOohp/W0V1MzBB7ShRcVeZLjH5ZcbI36O55NvwmXDYhMzfJoEOvN+
fXLNY7T+yzYD/Cuo/w8BLPO7likUvNEX+IZenAOvd+dh6qhdTQYrt9YZPc4ktdhK
MYurOKb44Ik+Nr9d9VCxUDC31I4Ml6t2/5gMLUwC4VuW7RkeDHvtth1XYvwVg21c
snD1H98uDzm4KAmUDIsuJubu/A4oFdhAUGG5hEoJmkVpYal0apjxy94FfEeNRLDZ
kwkr1GzDyQb7GC7R4r3NhQP1MXtFflmq9btZPGNMpsB46hjwuitC8eDT+gP6PyYX
Fz/nY3Pn0LFkbIxoKWVyZjI3sUMMrLldwKewOOvOnIn/Gf/cNdw=
=EdI/
-----END PGP SIGNATURE-----
--=-=-=--

--===============0735953050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0735953050==--
