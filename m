Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578F4BDA0A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AE110E755;
	Mon, 21 Feb 2022 13:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B4E10E746
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:55:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nM9AA-0001oH-QV; Mon, 21 Feb 2022 14:55:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nM9AA-000R2g-0A; Mon, 21 Feb 2022 14:55:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nM9A8-004btz-JX; Mon, 21 Feb 2022 14:55:36 +0100
Date: Mon, 21 Feb 2022 14:55:36 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add fsl,imx21-lcdc docs
Message-ID: <20220221135536.3arbh2ucih4jn4ti@pengutronix.de>
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
 <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
 <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
 <20220128175829.vjm66rs7eu7pk2my@pengutronix.de>
 <YflvS007gL5mLa9k@robh.at.kernel.org>
 <b91696142ff5e27afae9ad2125c39a4f937d072f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o2hw64xq3ypny6bc"
Content-Disposition: inline
In-Reply-To: <b91696142ff5e27afae9ad2125c39a4f937d072f.camel@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o2hw64xq3ypny6bc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Feb 10, 2022 at 06:54:13PM +0100, Lucas Stach wrote:
> Am Dienstag, dem 01.02.2022 um 11:35 -0600 schrieb Rob Herring:
> > On Fri, Jan 28, 2022 at 06:58:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Fri, Jan 28, 2022 at 07:04:10AM -0600, Rob Herring wrote:
> > > > On Fri, Jan 28, 2022 at 4:59 AM Uwe Kleine-K=F6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > >=20
> > > > > From: Marian Cichy <m.cichy@pengutronix.de>
> > > > >=20
> > > > > This files documents the device tree for the new imx21-lcdc DRM d=
river.
> > > >=20
> > > > No, bindings document h/w and the h/w has not changed. We already h=
ave
> > > > a binding for the LCDC.
> > >=20
> > > Just to be sure we're talking about the same thing: You're refering to
> > > Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt, right?
> >=20
> > Looks right...
> >=20
> > > I'm unsure what to do now. Should the two different bindings just be
> > > described in the same file? Should I stick to fsl,imx21-fb even for t=
he
> > > new binding? (The hardware unit is named LCDC, so the name chosen here
> > > is the better one.) Please advise.
> >=20
> > Yes, the name is unfortunate, but it should be 1 binding, 1 file, and=
=20
> > unchanged (unless you want to add new optional properties).=20
>
> The old FB driver binding is pretty insane. Except the reg and
> interrupt properties it is very confused about things. It exposes
> internal implementation details (like specifying verbatim register
> settings in the DT) and other properties are just misplaced, like the
> lcd-supply property that controls the panel power supply.
>=20
> I really don't think that trying to stay backwards compatible here is a
> win for anyone. Anyone willing to switch their systems running on a 15
> year old SoC to the new DRM driver probably doesn't mind if they have
> to modify the DTS to make it work. Can we please let the FB driver die
> in peace and have a clean slate driver/binding for the DRM driver?

Does this feedback change anything on your side? My expectation is that
the graphics people will be happy about every fb driver being replaced
by a DRM driver and there will be hardly any incentive to add a layer
over the DRM driver to make it honor the old fb binding.

Assume I convert the old binding to yaml and then add the newly
supported binding to that using a big oneOf, would that be an acceptable
compromise?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o2hw64xq3ypny6bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmITmc8ACgkQwfwUeK3K
7AmniAf8Ct4fg5twSAlKSiuF07ixaUrS262i4p7TCom4fLi0yfech0zvIedUxKEb
nhdCJHOb45l8W7byK46qNfOlkwbthbNMdo4wNNow7H95+R6NlfiGCasBpYTJWJuA
wGj/pxEJ17dDpbYrPe0p2VUZOdMHUX2HjCGt9FvVPcnDLQRJ4a/v70zX30XjVA3t
HEoKYHI1iyFtj6keV4tYR+jZ+5MNGHLUuz2w/pRVqDAGrP6BnhmWcdnMvpZDWD78
uG7ajj4qRuKjpgTObSNbxBzLlkVS81Mnlt2PDvcP8xUs9nPiC92oxv1mizO5Pg6x
RbKZriz0lqd7hYn9R4enVfkH8P+R3w==
=YFY7
-----END PGP SIGNATURE-----

--o2hw64xq3ypny6bc--
