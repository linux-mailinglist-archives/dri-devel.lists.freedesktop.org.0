Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D89D0806
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FA86E91B;
	Wed,  9 Oct 2019 07:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 445 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2019 15:35:25 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C086789CF9;
 Tue,  8 Oct 2019 15:35:25 +0000 (UTC)
Received: from [85.152.157.71] (helo=fourier)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iHrWG-00075k-3c; Tue, 08 Oct 2019 17:35:24 +0200
Message-ID: <2affed488968f73884b6e6593325f76b4b6a6e1b.camel@igalia.com>
Subject: Re: XDC 2019 feedback and comments
From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?= <siglesias@igalia.com>
To: Xorg Members List <members@x.org>, "X.Org development"
 <xorg-devel@lists.x.org>, Mesa Dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, events@lists.x.org
Date: Tue, 08 Oct 2019 17:35:13 +0200
In-Reply-To: <578af7ed8a3ef8b91a362872471b29702c975529.camel@igalia.com>
References: <578af7ed8a3ef8b91a362872471b29702c975529.camel@igalia.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; s=20170329; 
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=GRCr3kkOgSoIN3AEt5pWd097RTjBvXKJYY0DSXTjIao=; 
 b=l48K6mVIT5uMCtbQzLwsM/i6aCFr/bv1b6BiT1mPJXWm4B8zUiyIBc7nVqFmKeXr3MuaB0XU0X+X3x5tXcJDvBWoTNs2DnqruXeJceZURRX4huV4FYTQ0bOOZGdo+BuThccU3knEbzE1/Qy11rJ/XKjr3UymxSaM2jyYSuK2hI11vnjv3uPU3f0Bl1B9nO875pysnVfQumNfhcruUt1c3Q+V9ydsdLSX6BymxcmgCmZ9xGSvXbZAoHoU5uxhpSpv6MiyqNiw3AaKU/4WhixtIoM2gwV9ZPqWmOB1ydobnvEoBh+ULrUNbkwtdUXB3Za3UeJFBPLu0hZZKKGIU6O6jg==;
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
Cc: "X.Org Foundation Board" <board@foundation.x.org>
Content-Type: multipart/mixed; boundary="===============1690973398=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1690973398==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-IafL/GaOmCQkMgEn8JBR"


--=-IafL/GaOmCQkMgEn8JBR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-10-08 at 17:27 +0200, Samuel Iglesias Gons=C3=A1lvez wrote:
> Hi all,
>=20
> Once more huge thanks to the entire team from Collabora,
> for their great work organizing XDC 2019!
>=20
> As usual we're looking for feedback on both XDC itself, and the CFP
> process and program selection. Both about what was great and should
> be
> kept for next year's edition, and where there's room for improvement.
> The board does keep some notes, for those interested in what we have
> already:
>=20
> - XDC notes for prospective organizers:=20
> https://www.x.org/wiki/Events/RFP/
>=20
> - CFP notes: https://www.x.org/wiki/Events/PapersCommittee/
>=20
> If you want to send in your comments in private, please send them to
> the x.org board.

Forgot to mention its email address: X.Org Foundation Board <
board@foundation.x.org>

Sam

>=20
> Cheers,
>=20
> Sam

--=-IafL/GaOmCQkMgEn8JBR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAl2crLEACgkQf/S6MvF9
w0MudhAAqPJtuIEbpbeRrkc0DBpM6/plg7z0sMfM04Uk2moyPZ19OweJ44VqPyFa
pjl+cKxdpVy3OT7JW2wkgsbaCPft1kAf1h7wOGSO8SgTbq0aK+xjOEOj6b9fScDX
VHs1DHN7XtLvLt+bcR0Ko0RXvppCUdGUSuFs7r6njLRzhohz7g0WGe1yh+oeyhiF
CJqTZmDljOaQktyC061HM6JSnYWpmOHCgNwc75q2TqVAGaOCkHeZ1Aanibe9fhE+
2q48dJBa9PCKaaFx2IHxsxzi1JSWnrYdAJ0CTGQWhNgR83mM6E/TDMnzF7IjoHA+
ajnbJW/NpBh0w0k6fw3BaG/CFGebkQxfhYlrkhxKA1sRgXSVObllw3lXuxGaCFhP
y9pdigQeBChAX8AGea8VLpQ6uE23jvkP4BefWLNqOq+bKpQ8WZVeQVcmfxSePb+k
jQTzU8zHCZXNKsiFU7leind6oC0LHjh0tiCTnYU5cqoKu0SEXKy20RNal5NAFYj2
qODl7bBgWR+vv4m0/uSdXSwfMpcHzhp1p91lrD6NUnNP93Qg6HZNv1z/Ki4wY/Hj
ypdClqR/ByuPHqGVpVXnUG4lCRI2+0T4RfQByBZT3TWEdkKtxN81RZAGkE0KkMvq
GbvZSR7ojEVsrN7A0/NxYA9h/L5n/XzLN+/rwum/Rx2E7kjEZCc=
=TX2x
-----END PGP SIGNATURE-----

--=-IafL/GaOmCQkMgEn8JBR--


--===============1690973398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1690973398==--

