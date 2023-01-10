Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58624663C3C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AF910E49C;
	Tue, 10 Jan 2023 09:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B87910E49C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:07:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFAax-0003QR-FA; Tue, 10 Jan 2023 10:06:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFAat-0052H5-LN; Tue, 10 Jan 2023 10:06:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFAat-00BdOT-0a; Tue, 10 Jan 2023 10:06:55 +0100
Date: Tue, 10 Jan 2023 10:06:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
Message-ID: <20230110090654.ghj6rioikxse33e3@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-39-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qqqxmrosspknf2od"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-39-uwe@kleine-koenig.org>
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, kernel@pengutronix.de,
 Ajay Gupta <ajayg@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wolfram Sang <wsa@kernel.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qqqxmrosspknf2od
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I fatfingered my git tooling and got the author of this patch wrong. My
intention is that the author is

	Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

and not my other self with my private email address. Tell me if I should
resend to simplify patch application.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qqqxmrosspknf2od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO9KqwACgkQwfwUeK3K
7Amq9Af/bhERrP2wBTbI0bf/LVvtMXtRXUixJH+ZL6xN83V8+eSRWhuwIFzGsPRi
Mv6VpfiAN5hxmrJEI8Bfuf5rM7T9M5lIyIW2DSFNuP869rHAP55S/jrQBk7MwzbB
G6GhRtrvuayA14YbibdNtSZurkfFXfDgR5JC5YIhU36mapp4TlFrcOUiDaLhiK6N
KudVd5Wz0EhP3ZnCmiGQia58si2AaML6EY9hj+8RITLgYlgnnIx67xS9/5WQHm3D
e8Q7Lr0pSD/JMK9MeuNJiFlbKJ8hl7p7cvULmhQI57B8mzmkAdJ7E/gHqeF/VREM
K255RQnqP2j9/BnvAZJEZJ//wdBIAw==
=tuul
-----END PGP SIGNATURE-----

--qqqxmrosspknf2od--
