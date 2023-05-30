Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055571630C
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 16:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A49D10E0B4;
	Tue, 30 May 2023 14:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D3710E0B4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 14:05:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q3zwD-0003Sh-GG; Tue, 30 May 2023 16:03:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q3zvu-003tca-VI; Tue, 30 May 2023 16:02:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q3zvt-009WG3-VA; Tue, 30 May 2023 16:02:41 +0200
Date: Tue, 30 May 2023 16:02:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Message-ID: <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bnfkrholsive5e6z"
Content-Disposition: inline
In-Reply-To: <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Kitt <steve@sk2.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Wang Qing <wangqing@vivo.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Jones <pjones@redhat.com>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Alexander Shiyan <shc_work@mail.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Xu Panda <xu.panda@zte.com.cn>, Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Yang Yingliang <yangyingliang@huawei.com>,
 kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Yu Zhe <yuzhe@nfschina.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, Zeng Heng <zengheng4@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Hyunwoo Kim <imv4bel@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yihao Han <hanyihao@vivo.com>,
 Timur Tabi <timur@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Zhang Qilong <zhangqilong3@huawei.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bnfkrholsive5e6z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped a few recipents that resulted in bounces before]

Hello,

On Sun, Mar 19, 2023 at 07:04:54PM +0100, Helge Deller wrote:
> On 3/19/23 00:53, Uwe Kleine-K=F6nig wrote:
> > this series adapts the platform drivers below drivers/video/fbdev to us=
e the
> > .remove_new() callback. Compared to the traditional .remove() callback
> > .remove_new() returns no value. This is a good thing because the driver=
 core
> > doesn't (and cannot) cope for errors during remove. The only effect of a
> > non-zero return value in .remove() is that the driver core emits a warn=
ing. The
> > device is removed anyhow and an early return from .remove() usually yie=
lds a
> > resource leak.
> >=20
> > By changing the remove callback to return void driver authors cannot
> > reasonably assume any more that there is some kind of cleanup later.
> >=20
> > The first patch simplifies the remove callback of one driver to obvious=
ly
> > always return zero. After that all drivers are converted trivially to
> > .remove_new().
>=20
> Thanks for that patch series. It's a nice cleanup.
> I've applied it to the fbdev "for-next" git tree for now to get some comp=
ile testing.
> I hope that's ok for you.

I found patches #7 up to #51 in next, but the first 6 patches are
missing. I guess this wasn't' done on purpose?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bnfkrholsive5e6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR2Af4ACgkQj4D7WH0S
/k7fcAgAhQtUQep3ieXfPdx48MXj3Vo7YHNUrrshT5bmWhmUNobb6zbidQ0oXZgm
U3/So+jY9f4ckmvcciAXhCOWyS4nTmtz37ll49zN64lGaNx52FcdlXJTO0yXCsHH
mCJ6kYJTujB5SPN8HX1qutW6YPBXQU/NDVfwKVtL+rKtyIBILPjvYPr1oR1b7yqG
ctGm0FrYfsTWt0QxtJ9RKIZ0K3aS4KVw3MIYhrU2Ia0WnOp7kDX8pHTodWmSa1Mo
4Q94Li8myjIht2cen4KYlfUYb5HjbPkoW3WaDMuTCDgMWiPZLvLHRyUGmhgj5IVz
b5F2RVP5DKQuSRcfK6b2i3tG6/wN7Q==
=RqLu
-----END PGP SIGNATURE-----

--bnfkrholsive5e6z--
