Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B391605143
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 22:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8645210EAC4;
	Wed, 19 Oct 2022 20:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE7010EAC4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 20:24:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1olFbZ-0005rR-Ku; Wed, 19 Oct 2022 22:23:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1olFbY-000C52-Fz; Wed, 19 Oct 2022 22:23:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1olFbX-009A19-S0; Wed, 19 Oct 2022 22:23:55 +0200
Date: Wed, 19 Oct 2022 22:23:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>, Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] Make xilinxfb_release() return void
Message-ID: <20221019202355.qhvrlavvxlabwgom@pengutronix.de>
References: <20221019132422.78505-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eusgjvxyfskayn4d"
Content-Disposition: inline
In-Reply-To: <20221019132422.78505-1-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eusgjvxyfskayn4d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I failed to add a proper subject prefix. "fbdev: xilinxfb: " would have
been a good choice. I can resend, but I wouldn't say no if you are
willing to fixup while applying this patch :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eusgjvxyfskayn4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNQXNgACgkQwfwUeK3K
7AnLJgf/b6pvSKg3Pm/QbY//gtR2iXSnM2Fr1+rJe0kqaW9gkh5JN2FNsitXefXR
DtuwKShfoWPvM7kUg75oWFZoBHEL08U3VqAu6HmdcmOIvo9CZRdVDUfwIhwYLPIn
IE53kvls0r00OnXfqtg/E1am7+jgStHaTAn4QYyROTtSPLzZDzJj/F9f7PodgBgL
/C9k2hDf8VpcoSXho+xmpIWzdswZtTDT3ihxa8iS6LoUHAq7krq79WDrO6veUNxL
8R7gh3vIBA9lidLEAGVuCpMey87uei7aTRCrO4MnPXWoavu/0VBccNNPpyanI3+j
OOJ8Firg3/PnmVcCDUtd5FUAm+QzAA==
=07br
-----END PGP SIGNATURE-----

--eusgjvxyfskayn4d--
