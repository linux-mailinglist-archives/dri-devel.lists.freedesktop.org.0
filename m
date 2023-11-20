Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8D7F12B9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D240410E3B0;
	Mon, 20 Nov 2023 12:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F1710E3AF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:06:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5329-0000qA-BQ; Mon, 20 Nov 2023 13:05:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5322-00AL9N-2Y; Mon, 20 Nov 2023 13:05:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5321-004MKG-NA; Mon, 20 Nov 2023 13:05:37 +0100
Date: Mon, 20 Nov 2023 13:05:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Russell King <linux@armlinux.org.uk>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Zhu Wang <wangzhu9@huawei.com>, Rob Herring <robh@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Thierry Reding <treding@nvidia.com>, Dan Carpenter <error27@gmail.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Deepak R Varma <drv@mailo.com>, Jani Nikula <jani.nikula@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 00/16] drm: Convert to platform remove callback
 returning void
Message-ID: <20231120120537.c22pbb2zovxvpdkf@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ufcnet56kc2kty3a"
Content-Disposition: inline
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
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
Cc: linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ufcnet56kc2kty3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped a few people from To that resulted in bounces before.]

On Thu, Nov 02, 2023 at 05:56:41PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this series converts all platform drivers below drivers/gpu/drm to use
> .remove_new(). It starts with a fix for a problem that potentially might
> crash the kernel that I stumbled over while implementing the conversion.
>=20
> Some of the conversion patches following this fix were already send in
> earlier series:
>=20
> 	https://lore.kernel.org/dri-devel/20230801110239.831099-1-u.kleine-koeni=
g@pengutronix.de
> 	https://lore.kernel.org/dri-devel/20230318190804.234610-1-u.kleine-koeni=
g@pengutronix.de
>=20
> and three patches (bridge/tpd12s015, exynos + tilcdc) are new. Parts of
> the above series were picked up, the patches resend here are not.

Apart from a Reviewed-by: by Toni Valkeinen for patch #16 and Inki Dae
who wrote to have taken patch #8 (but that didn't appear in neither next
nor drm-misc-next yet).

Also in v2 they didn't result in euphoric replies.

Can someone who cares about drm as a whole please care for this series
apply it?

Best regards
Uwe
=20
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ufcnet56kc2kty3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVbS5AACgkQj4D7WH0S
/k5ljwf/fbUqzZ6qYDVQTFo8CLF29RFHPtXKCYzB3ACPuZW1XDZ0nqpyOaOYlJTM
m/UywEGAcpJBi6xYedgzANfhEeHClU7sVWTu3FtErEmvMEdL6cRv3iGUUYJMJKaz
jaJgPT2edHjnQagw6EQVf35DRBHzIDAb+bAnGi35nLYit5bXGOUblE3/t/91GW0b
v7scQQKZizofPiQxmwS1ifbOZ0SrXDF6qQXCswjS21FAo0P96L1jUpoCIwiv6Cgk
0yQ8QkqHSbesIkzwtMwiAGA2iyF0CbMQziBwuCZEZqQHfinJK7BqJF+94UBXDaDj
DPQvaMnGHvaZZyw7O3SbZx8wAfxaLQ==
=KndO
-----END PGP SIGNATURE-----

--ufcnet56kc2kty3a--
