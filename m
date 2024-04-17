Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51F58A7D87
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 09:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53EA10F4A3;
	Wed, 17 Apr 2024 07:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FF910F4A3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 07:58:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx0BW-0006cy-IA; Wed, 17 Apr 2024 09:58:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx0BU-00Ckm6-DJ; Wed, 17 Apr 2024 09:58:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rx0BU-002e2n-0y;
 Wed, 17 Apr 2024 09:58:24 +0200
Date: Wed, 17 Apr 2024 09:58:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 00/18] Add display support for the MT8365-EVK board
Message-ID: <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nkhfub2sueyozzkj"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
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


--nkhfub2sueyozzkj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 16, 2024 at 05:53:01PM +0200, Alexandre Mergnat wrote:
> Alexandre Mergnat (16):
>       [...]
>       dt-bindings: pwm: mediatek,pwm-disp: add power-domains property
>       dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
> [...]
> base-commit: 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e
> change-id: 20231023-display-support-c6418b30e419

I cannot find 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e, neither in next
nor in stable nor in drm-misc nor in Linus' repository.

For sure it's not based on next, because otherwise you'd have noticed
that the power-domains property is already documented there. (Currently
as fb7c3d8ba039df877886fd457538d8b24ca9c84b.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nkhfub2sueyozzkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYfgR8ACgkQj4D7WH0S
/k7mIQf+PbzquhwUkWhMaS47IM1H6SK1o8TJsEIaR6wb6Yy4bRV+XUEXe+POTalM
BhknR+V0xm/DcBuQivWKRYfDF/jZUJ/DZ60ila73u0xZRbJhLQLY27RNP/URC3uj
OdBwmD7H6JXYaFs1Rb0oYIyl8lpNtoIJIBDqh/tO7sXYWZtXTr6SXQeEPdhuPn3U
mhZhnfOgESFdC6P41I2AP/MJ/lxTo+k8l0rZ7iD1TiimDtziKX/uH/bPNr/NVS7D
qcL/ItrLaC0O7HA8uuUjxTIpbkPRPKFQKYrCYo0FzOYwv78RwW3qu4bVofMmbx1u
JAVxhSAOAKBafJzgDfONyOIB6du9XA==
=C88w
-----END PGP SIGNATURE-----

--nkhfub2sueyozzkj--
