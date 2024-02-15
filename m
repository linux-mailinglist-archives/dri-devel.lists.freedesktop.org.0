Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8A855EA9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28BD10E540;
	Thu, 15 Feb 2024 10:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD9E10E540
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:02:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raYZC-0004fD-8S; Thu, 15 Feb 2024 11:02:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raYZA-000rGi-Vp; Thu, 15 Feb 2024 11:02:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raYZA-005HsV-2q;
 Thu, 15 Feb 2024 11:02:04 +0100
Date: Thu, 15 Feb 2024 11:02:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, sam@ravnborg.org, bbrezillon@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, 
 linux-pwm@vger.kernel.org, Dharma Balasubiramani <dharma.b@microchip.com>, 
 hari.prasathge@microchip.com, manikandan.m@microchip.com, 
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Message-ID: <aamdttvdk3jmswvy3rw3debk3ouddkgjbs6xmixroe6kqakjw4@lnd5crcgoeyj>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
 <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
 <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o2z5u2icip6vcnon"
Content-Disposition: inline
In-Reply-To: <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o2z5u2icip6vcnon
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 11:23:02AM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2024 11:43, Lee Jones wrote:
> > On Fri, 02 Feb 2024 05:47:33 +0530, Dharma Balasubiramani wrote:
> >> Convert the atmel,hlcdc binding to DT schema format.
> >>
> >> Align clocks and clock-names properties to clearly indicate that the L=
CD
> >> controller expects lvds_pll_clk when interfaced with the lvds display.=
 This
> >> alignment with the specific hardware requirements ensures accurate dev=
ice tree
> >> configuration for systems utilizing the HLCDC IP.
> >>
> >> [...]
> >=20
> > Applied, thanks!
> >=20
> > [3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
> >       commit: cb946db1335b599ece363d33966bf653ed0fa58a
> >=20
>=20
> Next is still failing.

Failing in the sense of dtbs_check, right?

> Dharma,
> You must explain and clearly mark dependencies between patches.
>=20
> Lee,
> Can you pick up two previous patches as well?

I applied the pwm patch now. If Lee wants to pick up this one via his
tree that would be fine for me, too. If that's the case please tell me,
then I'll drop it from my for-next branch again. Feel free to add
my Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> for patch
#2 then.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o2z5u2icip6vcnon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXN4RwACgkQj4D7WH0S
/k6aQggAqysz6fco+x2BEiMLKvymsmjxsyB2/87ERoRKMlE6OrSSbqyjTAhMSXeo
V66WmW2x3F1DhLcpwochJJIc2e4sFUWSJ1qfXPyGNTocDInGiLAhYZGqoBuOZBIN
nfJTFseFLQ429Y9Ip7uMet4TIhZjAX0t8cMGKDZSMU2h+Xeuj76BidSxgtiHErcP
k0ej0USTqRXvJ3IebZ7lbrhJBPF5CMAW9U83v9gqCbg85lVGANWcte/AcvPTKCcH
CERT4AOYikNxEQIC8PEhYWCwOcR9lkY4o0WPSUe6T/11eFmiga+uk+NDdRONRPN7
w3esiQ5TsIkYMiK/13Ve0Y8podbLnQ==
=g/pN
-----END PGP SIGNATURE-----

--o2z5u2icip6vcnon--
