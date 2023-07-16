Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB1B75500C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jul 2023 19:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8F910E05F;
	Sun, 16 Jul 2023 17:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F35E10E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 17:09:01 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qL5EK-0006nj-5v; Sun, 16 Jul 2023 19:08:20 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id D858F1F1E4D;
 Sun, 16 Jul 2023 17:08:14 +0000 (UTC)
Date: Sun, 16 Jul 2023 19:08:13 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] phy: Explicitly include correct DT includes
Message-ID: <20230716-rippling-wafer-1c986e593fc5-mkl@pengutronix.de>
References: <20230714174841.4061919-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nbfpe5avx7koqgt4"
Content-Disposition: inline
In-Reply-To: <20230714174841.4061919-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
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
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, devicetree@vger.kernel.org,
 Al Cooper <alcooperx@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Justin Chen <justin.chen@broadcom.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Alban Bedel <albeu@free.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Yu Chen <chenyu56@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-can@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, JC Kuo <jckuo@nvidia.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nbfpe5avx7koqgt4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14.07.2023 11:48:35, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/phy/phy-can-transceiver.c                     | 1 +

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for drivers/phy/phy-can-=
transceiver.c

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--nbfpe5avx7koqgt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmS0I/oACgkQvlAcSiqK
BOjjrwgArExbry3lxXJ0IU/QstoPtXDWo1kq+VrGdKo90TUKc6zRFxqvnUNRrjBk
9aVhw60wUadmaqmq+5XBpVPES7N6/lzVGQxqKvMo90pMkksfG+isH43EGgJKSCGW
50aecO37i/0V2xhrIoHdcChv/8G2ND7TCQRoREFPHZZAZCY8ounBXRoNZD0XmC8y
SxL3qs9NG4rSdKSzQuXZ9tNqThZ5R+dU+jXGeBYK2/yhaiBr9bLokg9qS4ZA2Keh
OIbgZeiYE8RrbwcPL1CrMYM/mY1MEyVqOTrWb6xzJZYYzJENZi11xoPi5nB+x2zP
F5frwLP70qIiMDMihQLMvpd/SRkwEA==
=Qdmr
-----END PGP SIGNATURE-----

--nbfpe5avx7koqgt4--
