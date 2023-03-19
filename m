Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E586C0544
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 22:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0459810E1A5;
	Sun, 19 Mar 2023 21:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838B710E1A5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 21:09:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pe0GL-0002OT-MM; Sun, 19 Mar 2023 22:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pe0G8-005Ikp-Ii; Sun, 19 Mar 2023 22:08:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pe0G7-006FDZ-Jd; Sun, 19 Mar 2023 22:08:07 +0100
Date: Sun, 19 Mar 2023 22:08:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Message-ID: <20230319210808.apsba7oj32kt7ree@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wzczx3bc4ifbxgea"
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
 linux-nvidia@lists.surfsouth.com, Robert Jarzmik <robert.jarzmik@free.fr>,
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
 Zhang Qilong <zhangqilong3@huawei.com>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>, Dongliang Mu <dzm91@hust.edu.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wzczx3bc4ifbxgea
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Dropped Bartlomiej Zolnierkiewicz and Michal Januszewski from Cc, their
email addresses bounced]

On Sun, Mar 19, 2023 at 07:04:54PM +0100, Helge Deller wrote:
> Hello Uwe,
>=20
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
>=20
> Regarding the new "remove_new" struct member I'd prefer a better name but=
 don't
> have any idea yet...

Ideally we won't have to life with it for long. The eventual plan is to
switch back to "remove" once all drivers are converted. So I didn't
think intensively about a better name. Did you know that struct
i2c_driver has a "temporary" .probe_new() callback since 2016?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wzczx3bc4ifbxgea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQXebcACgkQj4D7WH0S
/k6QzAf9FFe2XXai/3YyjlJCEmMUktQCnGsZAQL0Q6KlNzN/QDhFin/mK+//+AWd
fr9WI9Gvg8J2cb9k0wI5/gp/8qNlttscKB+YgE5GrE/Cph4oZg3CKWx3SBYQewPf
kaVGx0cjiL/TCMe2/aDf7c8RshaJdKgeiY0L4g7MEaH6OSU/cR2jwZyjKzodH8bj
nNJPVJviqsma1znGkf1odS40YiHP5VqDGvPmSXz/6Z3P/CMb4/WymZULgameRAdm
O3MaikHNKGY72mqrQgM4W5UYNWBRFVYf2XuGQF9CV423/8O1hqQ5/cxXXblKBCRJ
OiI7uoY3VVdDKivhWmJyIZDJkfdWEg==
=s2rT
-----END PGP SIGNATURE-----

--wzczx3bc4ifbxgea--
