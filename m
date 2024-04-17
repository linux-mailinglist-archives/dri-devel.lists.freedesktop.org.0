Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C238A8474
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CC1113516;
	Wed, 17 Apr 2024 13:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED03113516
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:26:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx5IP-0007GI-7I; Wed, 17 Apr 2024 15:25:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx5IM-00CnkN-Su; Wed, 17 Apr 2024 15:25:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rx5IM-002rHj-2Y;
 Wed, 17 Apr 2024 15:25:50 +0200
Date: Wed, 17 Apr 2024 15:25:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
Message-ID: <5vqnkgp77tir5j5cumo62pm2cw4xjabexu7nk3kze4gk4ri5dn@g3pee2beuuco>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
 <1db01bd8-0936-40e5-9f1b-7ea34746bef1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2mhwzpvshnycjgzu"
Content-Disposition: inline
In-Reply-To: <1db01bd8-0936-40e5-9f1b-7ea34746bef1@collabora.com>
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


--2mhwzpvshnycjgzu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 17, 2024 at 12:19:19PM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> > According to the Mediatek MT8365 datasheet, the display PWM block has
> > a power domain.
> >=20
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>=20
> It's the same for at least MT8195, MT8183 and I think MT8192 as well... so
> not having that from the beginning is actually a mistake.
>=20
> Please add a Fixes tag and resend, after which:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

You mean similar to:

	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit=
/?id=3Dfb7c3d8ba039df877886fd457538d8b24ca9c84b

? It seems someone you know well was quicker :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2mhwzpvshnycjgzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYfzd0ACgkQj4D7WH0S
/k644QgApZcXCwxXpE1GPvpexO/Vc5AFPTJkm7FRBnwJJkvRZ1ycT6cFchMCCuDk
54zNsJAXca62uylo+g0umyShBTdJtfK1/jrxOFPvuA+8sdm6j2zXdQGxrq2QozhU
52gFI/sNHpKkYT/ky/xaUHOpbw/BK8bc/6mkaCoKcZg3aB3U/lJsgIX1x9d/Uqo6
70f0ssIQn1KRrZj66GjL2o9m9A8aZ5shpR3TTBtnjw1/K6I2aAU7VUX4R5Uda7ol
bdrw0/GGO0IuYZ+q+F2LLbRTFE2oHy3ZzNQlJ8HBj2e160g1Mo+AQqfqcEwZe8C6
4qWjBjl/FQQtdEludY7c04KB7u+YSg==
=3M09
-----END PGP SIGNATURE-----

--2mhwzpvshnycjgzu--
