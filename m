Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3304F0AA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 00:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FD66E92F;
	Fri, 21 Jun 2019 22:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906CC6E92F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 22:13:29 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 2CCC2805DE; Sat, 22 Jun 2019 00:13:15 +0200 (CEST)
Date: Sat, 22 Jun 2019 00:13:25 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Message-ID: <20190621221325.GA2343@amd>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
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
 Brian Dodge <bdodge09@gmail.com>, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Peter Bacon <pbacon@psemi.com>,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2011993797=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2011993797==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [Sorry to those receiving this twice... had to dig this out from the
> archives and sent it to the lists from the wrong mailer]
>=20
> On 27/11/2018 00:44, Brian Dodge wrote:
> >Thank you Pavel, that is a good point.
> >
> >The chip vendor has indicated that there is no reason to maintain the
> >old/improper prefix and wishes to go forward (only) with the "arctic"
> >prefix and any existing dts files are or will be updated.
>=20
> Looks like this patch series has fallen into the cracks a little.
>=20
> I think I assumed this info would end in the description of patch v2 1/3 =
(in
> order to answer Rob's feedback) and I sat and waited for a respin. On the
> other hand... I didn't actually say that explicitly anywhere! So... I'd
> recommend a respin perhaps with a small bit of text explaining how the
> vendor can state that any existing dts files will be updated. This is a
> peripheral device so these strings are probably embedded into OEM
> devicetrees rather than exclusively under the control of the vendor.

So in next email you give good reason not to apply this :-).

Anyway, this is Doc*/devicetree/, so not my area.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0NVoUACgkQMOfwapXb+vKcPQCeMXZLMpPGhmvkuIH+olZhfCFk
CVIAoLN12wP5S77RinlmdQ/jZIZqwCWD
=7Nqr
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

--===============2011993797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2011993797==--
