Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E574E4569
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 18:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C93010E030;
	Tue, 22 Mar 2022 17:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E952210E030
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 17:43:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nWiXy-0001ho-U5; Tue, 22 Mar 2022 18:43:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nWiXu-002KwV-FK; Tue, 22 Mar 2022 18:43:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nWiXw-00AxAG-1c; Tue, 22 Mar 2022 18:43:52 +0100
Date: Tue, 22 Mar 2022 18:43:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add fsl,imx21-lcdc docs
Message-ID: <20220322174351.hla4d4fbfmdh3gvw@pengutronix.de>
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
 <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
 <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
 <20220128175829.vjm66rs7eu7pk2my@pengutronix.de>
 <YflvS007gL5mLa9k@robh.at.kernel.org>
 <b91696142ff5e27afae9ad2125c39a4f937d072f.camel@pengutronix.de>
 <20220221135536.3arbh2ucih4jn4ti@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gf5abkaroff55vt5"
Content-Disposition: inline
In-Reply-To: <20220221135536.3arbh2ucih4jn4ti@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gf5abkaroff55vt5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Feb 21, 2022 at 02:55:36PM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Feb 10, 2022 at 06:54:13PM +0100, Lucas Stach wrote:
> > Am Dienstag, dem 01.02.2022 um 11:35 -0600 schrieb Rob Herring:
> > > On Fri, Jan 28, 2022 at 06:58:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > On Fri, Jan 28, 2022 at 07:04:10AM -0600, Rob Herring wrote:
> > > > > On Fri, Jan 28, 2022 at 4:59 AM Uwe Kleine-K=F6nig
> > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > >=20
> > > > > > From: Marian Cichy <m.cichy@pengutronix.de>
> > > > > >=20
> > > > > > This files documents the device tree for the new imx21-lcdc DRM=
 driver.
> > > > >=20
> > > > > No, bindings document h/w and the h/w has not changed. We already=
 have
> > > > > a binding for the LCDC.
> > > >=20
> > > > Just to be sure we're talking about the same thing: You're refering=
 to
> > > > Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt, right?
> > >=20
> > > Looks right...
> > >=20
> > > > I'm unsure what to do now. Should the two different bindings just be
> > > > described in the same file? Should I stick to fsl,imx21-fb even for=
 the
> > > > new binding? (The hardware unit is named LCDC, so the name chosen h=
ere
> > > > is the better one.) Please advise.
> > >=20
> > > Yes, the name is unfortunate, but it should be 1 binding, 1 file, and=
=20
> > > unchanged (unless you want to add new optional properties).=20
> >
> > The old FB driver binding is pretty insane. Except the reg and
> > interrupt properties it is very confused about things. It exposes
> > internal implementation details (like specifying verbatim register
> > settings in the DT) and other properties are just misplaced, like the
> > lcd-supply property that controls the panel power supply.
> >=20
> > I really don't think that trying to stay backwards compatible here is a
> > win for anyone. Anyone willing to switch their systems running on a 15
> > year old SoC to the new DRM driver probably doesn't mind if they have
> > to modify the DTS to make it work. Can we please let the FB driver die
> > in peace and have a clean slate driver/binding for the DRM driver?
>=20
> Does this feedback change anything on your side? My expectation is that
> the graphics people will be happy about every fb driver being replaced
> by a DRM driver and there will be hardly any incentive to add a layer
> over the DRM driver to make it honor the old fb binding.
>=20
> Assume I convert the old binding to yaml and then add the newly
> supported binding to that using a big oneOf, would that be an acceptable
> compromise?

I'd like to get forward with this driver. What would be a good way to
continue here?=20

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gf5abkaroff55vt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmI6CtMACgkQwfwUeK3K
7AmEHwf6A2WIo831P0Vi/Ta/NAYjYQevEb8kYc5hZuuds8bhhtbW5RLG1arIQwU8
898QQFeMRc9mBROTkQL5e41iDAq1HwCNgh/wnwA8n1x1ogWLFJW3r4yUVa7Qaq82
rffajNDzcsgzegN/ibpmPRYf+ep9xEfhzEKJKuGjcF7U1l4yxZVS0Q4u7wbNmrac
CXDxOTZGLvyxAoWXUA5CXBXh2S5WEIgOV/t8O/3AbChY5mUSt3HXBOKo2DjMXI/q
+y5c0GvraqTXLecebf74sBOrsmYD8Krnql+tQhv3jLhdZqivS2eI+NPnaJGx4kfU
CsfSVyaysdqwlCOVF/lwazIK6Hfncw==
=Edlc
-----END PGP SIGNATURE-----

--gf5abkaroff55vt5--
