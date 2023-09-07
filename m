Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517A797243
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 14:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382510E7C9;
	Thu,  7 Sep 2023 12:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56EE10E7B6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 12:25:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qeE52-0003uW-22; Thu, 07 Sep 2023 14:25:52 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qeE51-004eFm-Fz; Thu, 07 Sep 2023 14:25:51 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qeE50-000AUQ-2p;
 Thu, 07 Sep 2023 14:25:50 +0200
Message-ID: <6ad4d61247365ead2f93c6ddb450de73d4be0ab2.camel@pengutronix.de>
Subject: Re: [PATCH] MAINTAINERS: Update DRM DRIVERS FOR FREESCALE IMX entry
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Date: Thu, 07 Sep 2023 14:25:50 +0200
In-Reply-To: <20230906072803.1.Idef7e77e8961cbeb8625183eec9db0356b2eccd0@changeid>
References: <20230906072803.1.Idef7e77e8961cbeb8625183eec9db0356b2eccd0@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mi, 2023-09-06 at 07:28 -0700, Douglas Anderson wrote:
> As per the discussion on the lists [1], changes to this driver
> generally flow through drm-misc. If they need to be coordinated with
> v4l2 they sometimes go through Philipp Zabel's tree instead. List both
> trees in MAINTAINERS. Also update the title of this driver to specify
> that it's just for IMX 5/6 since, as per Philipp "There are a lot more
> i.MX that do not use IPUv3 than those that do."
>=20
> [1] https://lore.kernel.org/r/d56dfb568711b4b932edc9601010feda020c2c22.ca=
mel@pengutronix.de
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thank you,
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
