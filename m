Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B1149FFD5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 18:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A4D10E20B;
	Fri, 28 Jan 2022 17:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DAD10E20B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 17:58:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDVW7-0007CF-Gp; Fri, 28 Jan 2022 18:58:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDVW6-00D2qh-C8; Fri, 28 Jan 2022 18:58:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDVW4-0020eJ-Pc; Fri, 28 Jan 2022 18:58:32 +0100
Date: Fri, 28 Jan 2022 18:58:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add fsl,imx21-lcdc docs
Message-ID: <20220128175829.vjm66rs7eu7pk2my@pengutronix.de>
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
 <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
 <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wwvqn6rq4f3zbpyi"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
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


--wwvqn6rq4f3zbpyi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Fri, Jan 28, 2022 at 07:04:10AM -0600, Rob Herring wrote:
> On Fri, Jan 28, 2022 at 4:59 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > From: Marian Cichy <m.cichy@pengutronix.de>
> >
> > This files documents the device tree for the new imx21-lcdc DRM driver.
>=20
> No, bindings document h/w and the h/w has not changed. We already have
> a binding for the LCDC.

Just to be sure we're talking about the same thing: You're refering to
Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt, right?

I'm unsure what to do now. Should the two different bindings just be
described in the same file? Should I stick to fsl,imx21-fb even for the
new binding? (The hardware unit is named LCDC, so the name chosen here
is the better one.) Please advise.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wwvqn6rq4f3zbpyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmH0LsIACgkQwfwUeK3K
7AkeEQf+LMan8puPvkLgFbK2uCYcIz0Dyw3DbTqzJHleg7llPDdKNntuorWhMdRj
HRZ/+EDA1lXkPaveSASiha8ew1KPAZ+H2wFDXsBPjRC38U0FdTi7+6G9TwQ4/AUw
BPXEx2Mxee2s8gMbFxjg6xUyhxo4Bf4VNvJw/JDV8g3CYLpRKMcoM1yAbQ9ElLaO
7hhrUZoIKOEUd8QLFSsFhMlWr/ThWmJoIARW7JXmVcrbrYulsPgDruMG3MiohiXw
zHnvBFHqSNVzbZm/9fMwxQQVF55ya5LwukyBQgzMccqOcSf5gOpwW45N/KPQYD4s
sxpX/6nsdpFVZ0gM/l3IAJrkWps/zA==
=/3WU
-----END PGP SIGNATURE-----

--wwvqn6rq4f3zbpyi--
