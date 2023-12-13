Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2111C810F74
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC5410E595;
	Wed, 13 Dec 2023 11:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C4E10E595
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:08:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rDN6O-0002aF-Kp; Wed, 13 Dec 2023 12:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rDN6M-00FYCV-Ag; Wed, 13 Dec 2023 12:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rDN6M-002FTL-0C; Wed, 13 Dec 2023 12:08:30 +0100
Date: Wed, 13 Dec 2023 12:08:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <20231213110829.bjaxjjiyy4ug7o67@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kl2l3xgmnlmlkt4p"
Content-Disposition: inline
In-Reply-To: <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, kernel@pengutronix.de,
 Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kl2l3xgmnlmlkt4p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,

On Wed, Dec 13, 2023 at 09:36:49AM +0100, Maxime Ripard wrote:
> On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> > > On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > clk_rate_exclusive_get() returns zero unconditionally. Most users "=
know"
> > > > that and don't check the return value. This series fixes the four u=
sers
> > > > that do error checking on the returned value and then makes function
> > > > return void.
> > > >=20
> > > > Given that the changes to the drivers are simple and so merge confl=
icts
> > > > (if any) should be easy to handle, I suggest to merge this complete
> > > > series via the clk tree.
> > >=20
> > > I don't think it's the right way to go about it.
> > >=20
> > > clk_rate_exclusive_get() should be expected to fail. For example if
> > > there's another user getting an exclusive rate on the same clock.
> > >=20
> > > If we're not checking for it right now, then it should probably be
> > > fixed, but the callers checking for the error are right to do so if t=
hey
> > > rely on an exclusive rate. It's the ones that don't that should be
> > > modified.
> >=20
> > If some other consumer has already "locked" a clock that I call
> > clk_rate_exclusive_get() for, this isn't an error. In my bubble I call
> > this function because I don't want the rate to change e.g. because I
> > setup some registers in the consuming device to provide a fixed UART
> > baud rate or i2c bus frequency (and that works as expected).
>=20
> [a long text of mostly right things (Uwe's interpretation) that are
> however totally unrelated to the patches under discussion.]

The clk API works with and without my patches in exactly the same way.
It just makes more explicit that clk_rate_exclusive_get() cannot fail
today and removes the error handling from consumers that is never used.

Yes, my series doesn't fix any race conditions that are there without
doubt in some consumers. It also doesn't make the situation any worse.
It also doesn't fix other problems that are orthogonal to the intention
of this patch series (neither makes it any of them any worse).

It's just dead code removal and making sure no new dead code of the same
type is introduced in the future.

Is there anyone working on improving the clk framework regarding how clk
rate exclusivity works? I'd probably not notice, but I guess there is
noone that I need to consider for. And if in the future someone
redesigns how all that works *and* clk_rate_exclusive_get() stays around
*and* that makes it possible that clk_rate_exclusive_get() fails (and
thus breaking all consumers that don't care for the actual clk rate and
only want it to not change), then they'll have to review all users
anyhow and reintroduce error handling. I can live with that and suggest
until then we're happy that we have a few drivers with less dead code
than before.

Cheers!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kl2l3xgmnlmlkt4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV5kK0ACgkQj4D7WH0S
/k4Eugf/TStPMZiYghA+qeYfwNXsEudTquLXEPqhja/JKNv9WiKYrt43bIE6RaeZ
uqnkw/3MfPy9251IlDl8hjB/hahPAVFA1/FP1n1+q+G4fWTLeEHj8+SErxvfZyrv
QHRLnpLc5OFul0s5WRLBUR6S7Vnu22YiZ0fWFGsakm5CS/BsVxJ/IDsZdss7XBTp
Auy00X3wur3dEdwcVZin6favSPTHv/pLecde0Jh7GsTUmenaP74HE5jWnutVqPRh
D/YfxJz4FVfe8iaFR02v9z7oBlnGuZyCQU9vyebyVNVV6orHYSXgFN8WhdZ1WuBT
RxqsIej1c9x4ergK7wRTHJUz6ZP3Lg==
=b9cr
-----END PGP SIGNATURE-----

--kl2l3xgmnlmlkt4p--
