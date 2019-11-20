Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7467103DBF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 15:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F4D6E607;
	Wed, 20 Nov 2019 14:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390436E607
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:51:17 +0000 (UTC)
X-Originating-IP: 90.76.211.102
Received: from aptenodytes (lfbn-1-2154-102.w90-76.abo.wanadoo.fr
 [90.76.211.102])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id ECDB740005;
 Wed, 20 Nov 2019 14:51:14 +0000 (UTC)
Date: Wed, 20 Nov 2019 15:51:14 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <20191120145114.GB4331@aptenodytes>
References: <20190927100738.1863563-1-paul.kocialkowski@bootlin.com>
 <20190927100738.1863563-2-paul.kocialkowski@bootlin.com>
 <20190927222038.GA22180@bogus>
MIME-Version: 1.0
In-Reply-To: <20190927222038.GA22180@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0155707166=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0155707166==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 27 Sep 19, 17:20, Rob Herring wrote:
> On Fri, Sep 27, 2019 at 12:07:37PM +0200, Paul Kocialkowski wrote:
> > The Xylon LogiCVC is a display controller implemented as programmable
> > logic in Xilinx FPGAs.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../display/xylon,logicvc-display.yaml        | 313 ++++++++++++++++++
> >  1 file changed, 313 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xylon,log=
icvc-display.yaml
>=20
> Any response to my last mail on v1?

Just answered on that thread, sorry for the delay.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3VUuIACgkQ3cLmz3+f
v9H6/QgAmZDcI/0gblSW95D8aMF2UP+4tUc1NYzzzlGmCGvAisyVWulup7L5PvSv
uLxiM+7Kmq6KX9A0AOQ00+/d6noUI/sX9Zi6eY3EgyLQMnTNM87Z0SjSkO7oMkv2
67GflREHdXIBr/jOI/tQ1Tqd04otcEN0iy7fzziWrK0gf33JTIhYE/v1k/3HKJyw
jQjAU89SGWCTLrQUnWSXEkW7LyqX1XX/j5uVfeWJOBDdZYrHhpzRLvCRtbYKHqAk
69VZQSm6NsoPtYGaZmuuTzegqphpJ/wG0BdOa8hIofGmGHsiwI//Ndx28cUELQCi
rhXxUVq4zMUePbQId7kIskGuQjC3Kg==
=oRfo
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--

--===============0155707166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0155707166==--
