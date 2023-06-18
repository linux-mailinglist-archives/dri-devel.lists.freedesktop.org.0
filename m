Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFD734C9D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346D710E0F9;
	Mon, 19 Jun 2023 07:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F8B10E06A
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:04:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAszk-0002xh-Qi; Sun, 18 Jun 2023 16:03:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAszJ-008HxW-4T; Sun, 18 Jun 2023 16:02:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qAszI-00FI3d-DW; Sun, 18 Jun 2023 16:02:40 +0200
Date: Sun, 18 Jun 2023 16:02:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <20230618140240.4gx4hmcf6rv5qvfi@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eb4c3srj26vyfosz"
Content-Disposition: inline
In-Reply-To: <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 19 Jun 2023 07:45:35 +0000
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
Cc: Raymond Tan <raymond.tan@intel.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, dri-devel@lists.freedesktop.org,
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
 Michal Simek <michal.simek@xilinx.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Danilo Krummrich <dakr@redhat.com>,
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
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
 Karol Herbst <kherbst@redhat.com>, Miaoqian Lin <linmq006@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
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


--eb4c3srj26vyfosz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again,

On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=F6nig wrote:
> > Actually, it was probably a mistake that these patches got merged to
> > linuxnext during the 4 days that you noticed. However, your patches
> > aren't dropped and are still present in drm-misc-next.
> >=20
> > drm-misc has a bit of a unique model and it's documented fairly well he=
re:
> >=20
> > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
>=20
> Is there a flaw then in this unique model (or its implementation) when
> drm-misc/for-linux-next moves in a non-fast-forward manner? This isn't
> expected, is it?

FTR, I checked historic next trees to find other trees where
for-linux-next were moved in a non-fast-forward manner[1]. I found:

	$ git for-each-ref --format=3D'%(refname)' refs/tags/next-* | while read n=
; do hn=3D$(git show $n:Next/SHA1s 2>/dev/null | awk '$1 =3D=3D "drm-misc" =
{ print $2 }'); if test -z "$hn"; then continue; fi; if test -n "$prevhn" &=
& ! git merge-base --is-ancestor "$prevhn" "$hn"; then if git merge-base --=
is-ancestor "$hn" linus/master; then merged=3Dx; else merged=3D"-"; fi; ech=
o "$n ($prevhn -> $hn) [$merged]"; fi; prevhn=3D$hn; done
	refs/tags/next-20151231 (e8b4855b5dd3e285d0ec18ed15468025abc1be9a -> e112e=
593b215c394c0303dbf0534db0928e87967) [x]
	refs/tags/next-20160212 (e24bfdd5052ca65e99fb835838da9d64b36ddc88 -> 382ab=
95d1af85381d8a5dff09b16a80c7e492534) [x]
	refs/tags/next-20170613 (18e51064c42ca3945b94dd4652156b62457962bc -> 2d7b5=
6378d32b0cf006f8944cbba4046df45dd25) [x]
	refs/tags/next-20180406 (3ae7fb202d86b7847f237daa474f3946bdc3b0c6 -> 41613=
a1a7df27a0aa34bf77d51278bbe8e108a8f) [x]
	refs/tags/next-20180517 (3131f209468d1514af378dd46eb34123d0af84ff -> 2045b=
22461c07a88dc3d2bab3cbfc6dc0c602fd4) [x]
	refs/tags/next-20190320 (e552f0851070fe4975d610a99910be4e9bf5d7bd -> 29054=
230f3e11ea818eccfa7bb4e4b3e89544164) [x]
	refs/tags/next-20190617 (9f9b25593ab4197318e3621201588ad8cd525c9b -> b1622=
cb3be4557fd086831ca7426eafe5f1acc2e) [x]
	refs/tags/next-20190723 (7aaddd96d5febcf5b24357a326b3038d49a20532 -> d8080=
97627e51d53cf9b1aa13239b5c4a6adaefb) [x]
	refs/tags/next-20190829 (66c2dee4ae10a2d841c40b9dd9c7141eb23eee76 -> 578d2=
342ec702e5fb8a77983fabb3754ae3e9660) [x]
	refs/tags/next-20191004 (d7d44b6fe40a98e960be92ea8617954c2596d140 -> 4092d=
e1ba34eb376791809fb366bc15f8a9e0b7c) [x]
	refs/tags/next-20191106 (8a537de0f3d8b655cb901c948ed863bf0b23277b -> cea35=
f5ad5ffac06ea29e0d7a7f748683e1f1b7d) [x]
	refs/tags/next-20191216 (0a5239985a3bc084738851afdf3fceb7d5651b0c -> d4e6a=
62d3769ef09bfe116b261a61ef871dea4f9) [x]
	refs/tags/next-20200123 (73896f60d4865657740c64821a7b18825a9bf96c -> db735=
fc4036bbe1fbe606819b5f0ff26cc76cdff) [x]
	refs/tags/next-20200415 (152cce0006abf7e17dfb7dc94896b044bda4e588 -> 74aae=
1c42f4a7f69934762f9e9f90a3ec335fef2) [x]
	refs/tags/next-20200521 (5bebaeadb30e8d1ed694bd9b63d4e424d333fe36 -> 0df3f=
f451287d71c620384eb7bb2cd3a8106412c) [x]
	refs/tags/next-20200617 (291ddeb621e4a9f1ced8302a777fbd7fbda058c6 -> cfe28=
f909ddd6ca854568870a7a9b46454e52b6f) [x]
	refs/tags/next-20200724 (9fadd6d1e2977bbd449d4fb99cde41ed6f71f668 -> 20673=
9119508d5ab4b42ab480ff61a7e6cd72d7c) [x]
	refs/tags/next-20200924 (ad44c03208e46b83e4ae3269e32c9e524aa71cf8 -> de194=
561359788871f7d8f5f7797557a2a166b4e) [x]
	refs/tags/next-20201027 (2580a493a97da4a302cb66251b558bfc04c16e68 -> 70bb9=
193728627e84e02eb0960b0aa138ae2cef5) [x]
	refs/tags/next-20201214 (c365d304d69ab2a38e1431323d17a216b7930e32 -> 05faf=
1559de52465f1e753e31883aa294e6179c1) [x]
	refs/tags/next-20210211 (5ceeb328637a01e0e54e2618cff129c6a1c31dba -> e2183=
fb135a7f62d317aa1c61eb3d1919080edba) [x]
	refs/tags/next-20210319 (5fd3de7a51855e086d9ce9d2d752489e9c15b850 -> 4cf1d=
8719aab0ad89690abb1d37ecf4552778420) [x]
	refs/tags/next-20210409 (167b400217121338a2beb78e09e2c77bd95491f5 -> 9c0fe=
d84d5750e1eea6c664e073ffa2534a17743) [x]
	refs/tags/next-20210615 (a3a5f9d0fb15da90820254ba735491887cc12099 -> 1bd8a=
7dc28c1c410f1ceefae1f2a97c06d1a67c2) [x]
	refs/tags/next-20210714 (34bd46bcf3de72cbffcdc42d3fa67e543d1c869b -> 35d28=
3658a6196b2057be562096610c6793e1219) [x]
	refs/tags/next-20210715 (35d283658a6196b2057be562096610c6793e1219 -> 85fd4=
a8a84316166640102676a356755ddec80e0) [-]
	refs/tags/next-20210726 (85fd4a8a84316166640102676a356755ddec80e0 -> 03b7c=
552d081b73ba814eefc257c704b4d096d93) [x]
	refs/tags/next-20210727 (03b7c552d081b73ba814eefc257c704b4d096d93 -> 87360=
168759879d68550b0c052bbcc2a0339ff74) [-]
	refs/tags/next-20210817 (87360168759879d68550b0c052bbcc2a0339ff74 -> 80cbd=
8808f85017b8aff4b223db68926b470be12) [x]
	refs/tags/next-20211101 (2b3374306b315be02db0f67d3102a0d1e1357270 -> b3ec8=
cdf457e5e63d396fe1346cc788cf7c1b578) [x]
	refs/tags/next-20211117 (bcae3af286f49bf4f6cda03f165fbe530f4a6bed -> a193f=
3b4e050e35c506a34d0870c838d8e0b0449) [x]
	refs/tags/next-20211217 (43d5ac7d07023cd133b978de473b3400edad941f -> d6c75=
c295f67b26fad8ba2e72db80e0f744e9da9) [x]
	refs/tags/next-20220317 (07f380da3ebd8d84fc866ccf83d93c667fcaaeaa -> f6d79=
0e5a7fe42706756c7fa1686d08d230610fc) [x]
	refs/tags/next-20220406 (67bae5f28c895f8737a1974c3f31cf12b9170b14 -> 21d13=
9a95682c6ade89a2151e44012c9797c0309) [x]
	refs/tags/next-20220513 (aebeb02dfccb61d6930112aede2db3db5b8e974e -> 6071c=
4c2a319da360b0bf2bc397d4fefad10b2c8) [x]
	refs/tags/next-20220610 (5ee8c8f930ba7d20717c4fc2d9f1ce0e757d1155 -> efeea=
efe9be56e8ae5e5b4e9ff6d2275ec977ec5) [x]
	refs/tags/next-20220715 (887ddf3251928dc39bfc58c5c62083d38a633c14 -> c96cf=
af8fc02d4bb70727dfa7ce7841a3cff9be2) [x]
	refs/tags/next-20220818 (2939deac1fa220bc82b89235f146df1d9b52e876 -> 8ba92=
49396bef37cb68be9e8dee7847f1737db9d) [x]
	refs/tags/next-20221007 (fdd0640b639070efb58226c96cea5861150e8dce -> 39dd0=
cc2e5bd0d5188dd69f27e18783cea7ff06a) [x]
	refs/tags/next-20221122 (e3ddd2d25533d1cc6f9fea421e4a5f16b60b3434 -> 29583=
dfcd2dd72c766422bd05c16f06c6b1fb356) [x]
	refs/tags/next-20230106 (03dec92c4f788c54a7c01b40a018f601eb8a6c52 -> 4c00a=
c500d0edd1a6730c4e8293834a694c1b304) [x]
	refs/tags/next-20230201 (d023d6f741c85bb00d2ca43d338327fbc150c113 -> aebd8=
f0c6f8280ba35bc989f4a9ea47469d3589a) [x]
	refs/tags/next-20230616 (c2807ecb529004ea6f2c2be823c495dc8491e205 -> cf683=
e8870bd4be0fd6b98639286700a35088660) [-]

so up to now it happend only three times (i.e. the lines with [-]) that
drm-misc/for-linux-next changed in a non-ff way and the commit wasn't
included later in the mainline (and for refs/tags/next-20230616 we
assume this will change to [x] during the next merge window)

So it seems to happen every few weeks ...

Best regards
Uwe

[1] My collection of historic next tags is incomplete, so there might be
more.

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eb4c3srj26vyfosz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSPDn8ACgkQj4D7WH0S
/k7L6gf/cytqkBFkHVXDoBVXRxPM1OePNsw21ry/f3tW70K2nNc4HnmoAL9mFRQ8
5wG1yAZjKMasYxKAfcYJMLYLtzHN4Y9Qp8sc1hxVSMIMocvRl3ZIiWzJfreVjIAe
7FTXkufJanMn7c9Qdh/J8JOtKpklVEZUUfRzINRBM+76I5EHPiQbJa6tn5LfA2Th
sRsDEpNjPqCakHoSrXXjaI+Hr96WW17ZMBahDJWoTbWsZxgT3iYw66xrHfCtfe9b
cvNTvLg1zU7Pss91qpOXPmy20SpgFp+azkcgV4fuRDBBzOWy8o60c+sHOakVGqEt
X09GAkhhnxYXlTriqgI34p9H1ew/0g==
=v7dB
-----END PGP SIGNATURE-----

--eb4c3srj26vyfosz--
