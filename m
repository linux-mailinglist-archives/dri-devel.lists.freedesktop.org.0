Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6583C7C8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 17:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412CE10E559;
	Thu, 25 Jan 2024 16:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE11510E3E3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 16:22:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rT2V4-0000zy-GW; Thu, 25 Jan 2024 17:22:46 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rT2V3-002KHN-PZ; Thu, 25 Jan 2024 17:22:45 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1rT2V3-000F7e-2L;
 Thu, 25 Jan 2024 17:22:45 +0100
Message-ID: <7897d74f90aa516f6b8e753e9e9befc64c113a69.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] drm/etnaviv: Update hardware headers from rnndb
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 25 Jan 2024 17:22:45 +0100
In-Reply-To: <CAH9NwWdXVCfzUy88n49g0ZqaC9KVLuw7Des9JpT5t1sif7qy5Q@mail.gmail.com>
References: <20240125-etnaviv-npu-v2-0-ba23c9a32be1@pengutronix.de>
 <20240125-etnaviv-npu-v2-1-ba23c9a32be1@pengutronix.de>
 <CAH9NwWdXVCfzUy88n49g0ZqaC9KVLuw7Des9JpT5t1sif7qy5Q@mail.gmail.com>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2024-01-25 at 17:14 +0100, Christian Gmeiner wrote:
> >=20
> > Update the state HI header from the rnndb commit
> > 8d7ee714cfe2 ("Merge pull request #24 from pH5/unknown-3950").
> >=20
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> You missed my R-b from the v1 series for this patch - please include
> it the next time!
>=20
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

Sorry,=C2=A0I'm trying the b4 prep/send workflow and hadn't internalized ye=
t
that "b4 trailers -u" is still a necessary manual step.

regards
Philipp
