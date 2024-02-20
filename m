Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC3A85B585
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292BC10E1DD;
	Tue, 20 Feb 2024 08:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495EF10E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 08:39:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rcLeg-00082X-Iy; Tue, 20 Feb 2024 09:39:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rcLef-001oAI-4n; Tue, 20 Feb 2024 09:39:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rcLef-008LlF-08;
 Tue, 20 Feb 2024 09:39:09 +0100
Date: Tue, 20 Feb 2024 09:39:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: Dharma.B@microchip.com, krzysztof.kozlowski@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, 
 linux-pwm@vger.kernel.org, Hari.PrasathGE@microchip.com,
 Manikandan.M@microchip.com, Conor.Dooley@microchip.com
Subject: Re: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Message-ID: <qywehfpajronx457jzaxpynjnae6wpl5uvswetr6nrtmmcm5wl@7rl5jfqsofzn>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
 <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
 <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
 <ffd43756-b24e-4f19-be33-0e33047ad70c@microchip.com>
 <20240220082026.GG10170@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qejo3o7k6h2mp3hz"
Content-Disposition: inline
In-Reply-To: <20240220082026.GG10170@google.com>
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


--qejo3o7k6h2mp3hz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Feb 20, 2024 at 08:20:26AM +0000, Lee Jones wrote:
> On Tue, 20 Feb 2024, Dharma.B@microchip.com wrote:
> > On 12/02/24 3:53 pm, Krzysztof Kozlowski wrote:
> > > On 08/02/2024 11:43, Lee Jones wrote:
> > >> On Fri, 02 Feb 2024 05:47:33 +0530, Dharma Balasubiramani wrote:
> > >>> Convert the atmel,hlcdc binding to DT schema format.
> > >>>
> > >>> Align clocks and clock-names properties to clearly indicate that th=
e LCD
> > >>> controller expects lvds_pll_clk when interfaced with the lvds displ=
ay. This
> > >>> alignment with the specific hardware requirements ensures accurate =
device tree
> > >>> configuration for systems utilizing the HLCDC IP.
> > >>>
> > >>> [...]
> > >>
> > >> Applied, thanks!
> > >>
> > >> [3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
> > >>        commit: cb946db1335b599ece363d33966bf653ed0fa58a
> > >>
> > >=20
> > > Next is still failing.
>
> If this continues to be an issue, I can just remove the commit.

The missing part in next is that patch 1 isn't included. So the options
are:

 a) Someone (dri or dt folks?) merges patch 1
    This fixes the state in next, though some commits stay around that
    fail dt_binding_check

 b) Someone (mfd or dt?) merges all 3 patches in one go and the two
    patches already applied are dropped.
    This makes dt_binding_check happy for all revs.

For me a) is good enough, but I guess the dri people are not aware there
is something to do for them?! Would be nice if Sam or Boris commented.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qejo3o7k6h2mp3hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXUZSwACgkQj4D7WH0S
/k7RwggAn5k8z+bYxn2HgADIEc6MbdHU9mSeQkIedBDJ7eKUR9WZ1pe+Srnu1tVr
WrbdWq3sSF9lnSbmq+jH/W6Rp2m1T/8d17EqgmBblQM31IHwt/aJO6y0Ey3qrE91
tF3NOvg4sDPwl0E+WSKOSl0fk9Qk0zhL161D6FREDGwt2KAZ5MKIxYvIobYDLHmb
sqKfYhfHR7r3FfhvtPTkWrTdhasrsrxNY1Jkff8UuznodekV+O6j5UaQyLCZRzRS
+kw+V/q9YQW1PdpNX8GuUYeArlXwco8mSS3iVm7KbAJDg20lGumcEJGr9u8WRB3d
pduGmFRvTTV/J2sLRDjAX4oijX45fA==
=2XIV
-----END PGP SIGNATURE-----

--qejo3o7k6h2mp3hz--
