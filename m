Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF248A9F49
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 17:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3565C10FCF3;
	Thu, 18 Apr 2024 15:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6084610FCF4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 15:57:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rxU8H-0006Yg-SF; Thu, 18 Apr 2024 17:57:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rxU8D-00D07n-UP; Thu, 18 Apr 2024 17:57:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rxU8D-003YUR-2e;
 Thu, 18 Apr 2024 17:57:01 +0200
Date: Thu, 18 Apr 2024 17:57:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 11/17] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
Message-ID: <ddqgzbhmkp57wupumrm7ht3bivohukfzebn5vez2ft2ksij4yc@irllweyitwoy>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-11-53388f3ed34b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mfe5lzcqzhilqxcv"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v3-11-53388f3ed34b@baylibre.com>
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


--mfe5lzcqzhilqxcv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Apr 18, 2024 at 04:16:59PM +0200, Alexandre Mergnat wrote:
> Add a compatible string for MediaTek Genio 350 MT8365's display PWM
> block: this is the same as MT8183.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml=
 b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index f8988af05287..180dd8366935 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -31,6 +31,7 @@ properties:
>                - mediatek,mt8188-disp-pwm
>                - mediatek,mt8192-disp-pwm
>                - mediatek,mt8195-disp-pwm
> +              - mediatek,mt8365-disp-pwm
>            - const: mediatek,mt8183-disp-pwm
> =20
>    reg:

As there is still no feedback about how this should be merged, I went on
and applied this patch to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mfe5lzcqzhilqxcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYhQswACgkQj4D7WH0S
/k7XLwf9E9OpRFmUhJZZk3JE9n1r/ktNvu8zeUbfAQag5XpWlYUY2beEvVqVuxZC
YtZvITxe3UZ0UpMk7znYoeI1PMZlUTyZwOEOvltlWl6macba9jX+VQ+xjK82f63C
A3rcI9ENcwhZWaHCstFPn/bjUp6Axjay+g/s7ROlANv+DzfuuB6qvGB9XWnegBap
dNX5ml9DULwd+nNqH5wWO1BEaVqLtsxd9tV+yitrdLW3AQnpfS95u9XH1MKDq/aS
f+X9nY+zJ3mb4nGhHCvq4Hw3jZkqobclHUVI9D7yD05LBe5HnVJji2dSOGssblDB
SjQo2XmiwuL8WgQ3MXKJZ2QiytiyPA==
=cDLN
-----END PGP SIGNATURE-----

--mfe5lzcqzhilqxcv--
