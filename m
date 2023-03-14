Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49A6B90C6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 11:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59E510E76E;
	Tue, 14 Mar 2023 10:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A72610E76E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:58:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1pc2Lu-0000nD-Cz; Tue, 14 Mar 2023 11:57:58 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1pc2Ls-0043Zf-Vk; Tue, 14 Mar 2023 11:57:56 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1pc2Ls-0003rQ-4L; Tue, 14 Mar 2023 11:57:56 +0100
Message-ID: <480b8008828f2c17553e2a6575fe1b75e95d296b.camel@pengutronix.de>
Subject: Re: [PATCH v6 0/2] drm/imx/lcdc: Implement DRM driver for imx25
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, Liu
 Ying <victor.liu@nxp.com>, Danilo Krummrich <dakr@redhat.com>, Lucas Stach
 <l.stach@pengutronix.de>
Date: Tue, 14 Mar 2023 11:57:56 +0100
In-Reply-To: <20230306115249.2223042-1-u.kleine-koenig@pengutronix.de>
References: <20230306115249.2223042-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mo, 2023-03-06 at 12:52 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> in response to Philipp's reply to v5 here comes a v6. The code changes ar=
e:

Thank you, pushed to drm-misc-next.

regards
Philipp
