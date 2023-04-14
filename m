Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E163A6E1E4B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E7410EC83;
	Fri, 14 Apr 2023 08:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392AA10EC82
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:30:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pnEp5-0004l4-Vm; Fri, 14 Apr 2023 10:30:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pnEp2-00B9ki-OF; Fri, 14 Apr 2023 10:30:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pnEp1-00D6uj-Ur; Fri, 14 Apr 2023 10:30:19 +0200
Date: Fri, 14 Apr 2023 10:30:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Message-ID: <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="meuxombxxc4zwoxv"
Content-Disposition: inline
In-Reply-To: <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--meuxombxxc4zwoxv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 10:21:05AM +0200, Krzysztof Kozlowski wrote:
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> > Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> > block: this is the same as MT8173.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.ya=
ml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > index 0088bc8e7c54..153e146df7d4 100644
> > --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> > @@ -22,7 +22,9 @@ properties:
> >            - mediatek,mt8173-disp-pwm
> >            - mediatek,mt8183-disp-pwm
> >        - items:
> > -          - const: mediatek,mt8167-disp-pwm
> > +          - enum:
> > +              - mediatek,mt6795-disp-pwm
> > +              - mediatek,mt8167-disp-pwm
>=20
> This does not look correct. You do not add compatible, you replace
> breaking all mt8167-disp-pwm. At least it looks like this from context.

I thought the old semantic to be:

	"mediatek,mt8167-disp-pwm"

and the new

	"mediatek,mt6795-disp-pwm" or "mediatek,mt8167-disp-pwm"

=2E What am I missing?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--meuxombxxc4zwoxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ5DxoACgkQj4D7WH0S
/k4b0gf/XGg5FqG1Mgkx3HAKSgi3PZuY2KSNIop4uRKh9jD6sSxX8ZOB5wNtwFbz
OwOpF/4bmEy9R4vW++134sQENrXwVv2QR8aMaolP298zl6s+qqTm1/8USwc3TVep
kTXMWWKuKFTBbj2viZrKSJUBT7C7I+VPcblxqtQnYe9AUZYJRCtLalvkECL+FgiZ
EbKGM99/7nbD7NPk33LTt0uEiaBrWoe7p4ehasD9uVW/7dhZAs44xQLFOR+XiT4U
Upy4cMJQtRqfISF44KBNw0Bm2Rm+Tqw3NoKTtPOQ1C36xzTHBnC+hp8ZoPFR/dYo
T9uMy4x52AKlzE9EAH2T/lOj/Rs5uQ==
=6UO4
-----END PGP SIGNATURE-----

--meuxombxxc4zwoxv--
