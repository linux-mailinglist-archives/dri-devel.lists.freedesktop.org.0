Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE8734576
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88DB10E101;
	Sun, 18 Jun 2023 08:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462A210E01F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 16:14:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAYXl-0000MG-Vh; Sat, 17 Jun 2023 18:12:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAYXI-0085VF-9t; Sat, 17 Jun 2023 18:12:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAYXH-00F4tf-3X; Sat, 17 Jun 2023 18:12:23 +0200
Date: Sat, 17 Jun 2023 18:12:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="57sfyizjoix7o42y"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Sun, 18 Jun 2023 08:21:45 +0000
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
Cc: Raymond Tan <raymond.tan@intel.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Wang Jianzheng <wangjianzheng@vivo.com>,
 Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Karol Herbst <kherbst@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laura Nao <laura.nao@collabora.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
 Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--57sfyizjoix7o42y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[expanding recipents by the other affected persons]

On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> On Thu, Jun 1, 2023 at 8:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > this patch series adapts the platform drivers below drivers/gpu/drm
> > > to use the .remove_new() callback. Compared to the traditional .remov=
e()
> > > callback .remove_new() returns no value. This is a good thing because
> > > the driver core doesn't (and cannot) cope for errors during remove. T=
he
> > > only effect of a non-zero return value in .remove() is that the driver
> > > core emits a warning. The device is removed anyhow and an early return
> > > from .remove() usually yields a resource leak.
> > >
> > > By changing the remove callback to return void driver authors cannot
> > > reasonably (but wrongly) assume any more that there happens some kind=
 of
> > > cleanup later.
> >
> > I wonder if someone would volunteer to add the whole series to
> > drm-misc-next?!
>=20
> It looks as if Neil applied quite a few of them already, so I looked
> at what was left...
>=20
> I'm a little hesitant to just apply the whole kit-and-caboodle to
> drm-misc-next since there are specific DRM trees for a bunch of them
> and it would be better if they landed there. ...so I went through all
> the patches that still applied to drm-misc-next, then used
> 'scripts/get_maintainer.pl --scm' to check if they were maintained
> through drm-misc. That still left quite a few patches. I've applied
> those ones and pushed to drm-misc-next:
>=20
> 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> callback returning void
> 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning void
> b957812839f8 drm/v3d: Convert to platform remove callback returning void
> e2fd3192e267 drm/tve200: Convert to platform remove callback returning vo=
id
> 84e6da7ad553 drm/tiny: Convert to platform remove callback returning void
> 34cdd1f691ad drm/tidss: Convert to platform remove callback returning void
> d665e3c9d37a drm/sun4i: Convert to platform remove callback returning void
> 0c259ab19146 drm/stm: Convert to platform remove callback returning void
> 9a865e45884a drm/sti: Convert to platform remove callback returning void
> 3c855610840e drm/rockchip: Convert to platform remove callback returning =
void
> e41977a83b71 drm/panfrost: Convert to platform remove callback returning =
void
> cef3776d0b5a drm/panel: Convert to platform remove callback returning void
> bd296a594e87 drm/mxsfb: Convert to platform remove callback returning void
> 38ca2d93d323 drm/meson: Convert to platform remove callback returning void
> fd1457d84bae drm/mcde: Convert to platform remove callback returning void
> 41a56a18615c drm/logicvc: Convert to platform remove callback returning v=
oid
> 980ec6444372 drm/lima: Convert to platform remove callback returning void
> 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returning=
 void
> c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning v=
oid
> a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback returni=
ng void
> 9a32dd324c46 drm/aspeed: Convert to platform remove callback returning vo=
id
> 2c7d291c498c drm/arm/malidp: Convert to platform remove callback returnin=
g void
> a920028df679 drm/arm/hdlcd: Convert to platform remove callback returning=
 void
> 1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning vo=
id

Together with the patches that were applied later the topmost commit
=66rom this series is c2807ecb5290 ("drm/omap: Convert to platform remove
callback returning void"). This commit was part for the following next
tags:

	$ git tag -l --contains c2807ecb5290
	next-20230609
	next-20230613
	next-20230614
	next-20230615

However in next-20230616 they are missing. In next-20230616
drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088660.
Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that are
also not included with a different commit id). The 37 patches dropped
are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:

	$ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290
	     1  Christophe JAILLET
	     2  Jessica Zhang
	     5  Karol Wachowski
	     1  Laura Nao
	    27  Uwe Kleine-K=C3=B6nig
	     1  Wang Jianzheng


I guess this was done by mistake because nobody told me about dropping
my/these patches? Can c2807ecb5290 please be merged into drm-misc-next
again?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--57sfyizjoix7o42y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSN22YACgkQj4D7WH0S
/k4acwf9GPr1IWMMQ6HjlOCWYhOEksB+3DWauF61C+SdDvqLOvPu/hNGcgWuwYzV
BhgtD4JwOuwoZ/zMLhOT+HdRBvqpsEyg0A44UMz9fwnqPDQ+mn1Gw7N/C9Z30JCo
ncUw3rL4mH4QPXAVskP+YtAbPs+ZuiIYs89B9nBkm6NEcjNg4rISZlFHoxsUhs8B
7ECcmnW76ezXSAdGrOHzGzJ+YCZJYEKqJdx9GgRcwJwHMF0KyYyoVxhEqXYODOJe
v3SNgzxSS9K7/PSziTNotU7oZnrh9TlSAmoFVX6b7gYyDQv2EpcFDJ9zhsMJI6IJ
tLKT6eARconsFWkjgb/fPWgMHMzjmw==
=hehC
-----END PGP SIGNATURE-----

--57sfyizjoix7o42y--
