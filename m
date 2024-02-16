Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C898577D9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39E10E012;
	Fri, 16 Feb 2024 08:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDFF10E012
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:44:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ratoz-0006gU-9X; Fri, 16 Feb 2024 09:43:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ratox-0012d3-8w; Fri, 16 Feb 2024 09:43:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1ratox-005rTs-0Y;
 Fri, 16 Feb 2024 09:43:47 +0100
Date: Fri, 16 Feb 2024 09:43:47 +0100
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
Message-ID: <wkqqowh6ivn35d24n5ngdqno77wl7onrkdh43winac7bg7oekf@ykwhxujb4cjq>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
 <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
 <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
 <aamdttvdk3jmswvy3rw3debk3ouddkgjbs6xmixroe6kqakjw4@lnd5crcgoeyj>
 <2e96c824-47e8-48bd-9e03-8c7390b02d24@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cq33vkronfz22nrp"
Content-Disposition: inline
In-Reply-To: <2e96c824-47e8-48bd-9e03-8c7390b02d24@linaro.org>
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


--cq33vkronfz22nrp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Thu, Feb 15, 2024 at 07:44:53PM +0100, Krzysztof Kozlowski wrote:
> On 15/02/2024 11:02, Uwe Kleine-K=F6nig wrote:
> > On Mon, Feb 12, 2024 at 11:23:02AM +0100, Krzysztof Kozlowski wrote:
> >> On 08/02/2024 11:43, Lee Jones wrote:
> >>> Applied, thanks!
> >>>
> >>> [3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
> >>>       commit: cb946db1335b599ece363d33966bf653ed0fa58a
> >>>
> >>
> >> Next is still failing.
> >=20
> > Failing in the sense of dtbs_check, right?
>=20
> No, bindings were failing. dt_binding_check. This must not fail, so kind
> of bummer...
>=20
> >> Dharma,
> >> You must explain and clearly mark dependencies between patches.
> >>
> >> Lee,
> >> Can you pick up two previous patches as well?
> >=20
> > I applied the pwm patch now. If Lee wants to pick up this one via his
> > tree that would be fine for me, too. If that's the case please tell me,
> > then I'll drop it from my for-next branch again. Feel free to add
> > my Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> for pa=
tch
> > #2 then.
>=20
> At least next is happy.

The pwm binding is in next now (as
0fa319a1427f7c8d0af4c255316624f7e6f649a0) but dt_binding_check still
tells me (among others):

	Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/dis=
play/atmel/atmel,hlcdc-display-controller.yaml

This is what you meant, right? This goes away as soon as the first patch
(dt-bindings: display: convert Atmel's HLCDC to DT schema) is applied,
too. So next isn't completely happy yet.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cq33vkronfz22nrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXPIEIACgkQj4D7WH0S
/k7oDQgAhBtX499THTMoh/0hUXU71eAA/S5lMq1KvNvT9NGWXU+/7etMKgUxdmNr
+BLVyxYYkJ9eb+PUQLvIcmXR8aZgx9z4YpXLb+WiGW7WimGfPI0Q/fLZY7BZrMLA
DjakKBxO9u1oUP7acORjgZ4IAdYW2mny5U/LqVMnnWFafGcrX5UM4OumJZ7zTRn3
P3ZwycYlZLErUa5tebQk1lIYeFRvm480U+ZGr/SCIjN4MFycMOr7bls0c+HztokP
SoVVESp6bokSs0C7COdjZhZXacLybjMTCAer6b01jFRKhThwKNA63f+k2idvjEEI
I6snuKjGUsWInVK5KQwDpuL5xFLOXw==
=PMux
-----END PGP SIGNATURE-----

--cq33vkronfz22nrp--
