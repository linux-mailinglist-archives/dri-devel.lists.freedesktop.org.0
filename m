Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BED5623
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 14:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E1A6E0FD;
	Sun, 13 Oct 2019 12:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204A86E0FD
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 12:10:53 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 7A3FA8025A; Sun, 13 Oct 2019 14:10:34 +0200 (CEST)
Date: Sun, 13 Oct 2019 14:10:46 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 2/8] backlight: qcom-wled: restructure the qcom-wled
 bindings
Message-ID: <20191013121045.GN5653@amd>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============1249840067=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1249840067==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSnC4ZPPfhCvD8sN"
Content-Disposition: inline


--aSnC4ZPPfhCvD8sN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-09-30 12:09:07, Kiran Gunda wrote:
> Restructure the qcom-wled bindings for the better readability.
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>

I applied 1,2 to my branch, it should appear in -next shortly.

yaml conversion can be done in a followup...

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--aSnC4ZPPfhCvD8sN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jFEUACgkQMOfwapXb+vIpIgCfdMwca9CUvoL/C0TtvEIIn2qE
fhkAnikG/2Cv/Oc9PYANCpjnBy8OHGiN
=wClR
-----END PGP SIGNATURE-----

--aSnC4ZPPfhCvD8sN--

--===============1249840067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1249840067==--
