Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CF825F84
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 13:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB8B10E0E5;
	Sat,  6 Jan 2024 12:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40AA10E0E5
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 12:45:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rM62x-0002jz-SX; Sat, 06 Jan 2024 13:45:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rM62u-000oJI-JD; Sat, 06 Jan 2024 13:45:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rM62u-0040D8-1Y;
 Sat, 06 Jan 2024 13:45:00 +0100
Date: Sat, 6 Jan 2024 13:45:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V5 1/2] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI PVI
Message-ID: <6sgtepzkc74n6pxbbhzxnngba6sxt3kmzlnmalzj2m6xoumbk7@pjjxdlyd2hxh>
References: <20240106015623.193503-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="obswwz3a5ig4f6nw"
Content-Disposition: inline
In-Reply-To: <20240106015623.193503-1-aford173@gmail.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--obswwz3a5ig4f6nw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Adam,

On Fri, Jan 05, 2024 at 07:56:21PM -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
>=20
> Add binding for the i.MX8MP HDMI parallel video interface block.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Without looking at the patch's content: This lacks a Signed-off line by
you.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--obswwz3a5ig4f6nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWZS0sACgkQj4D7WH0S
/k5kEAf+Lpw58sawnK1oJ8ogItqt06RWvgtzj8d+2/FmvQhJKFmCCjCNTM5ULZC3
GYHgY8kcLNemfGdQnLFgxXVquBFK0PNg18WzqWJLobJ6eDf7hF9aNsNZvmvpJWR1
u6GJTAfaFYjyAoNRGkAi9U8xtT3LOGXcItqzq7epj/BbX34rwpMeGVi531fB8QSw
UkSstTOowG2sbJP5usDSEdmhe6ZmSUwVTSqfgyVyeZ9Le+9Dzck6LoUKqEi0OusI
j+Iaoi152n5EbQLFWoXHLppYNeFAlrCcJetgx5lyY+g2z2bjMyY1tV5JjUxAmA7b
CVq+fAJWs3xU5VfPweUIBXY3n/xvPw==
=Hn2F
-----END PGP SIGNATURE-----

--obswwz3a5ig4f6nw--
