Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD7791BD1D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 13:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B32010E076;
	Fri, 28 Jun 2024 11:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775BE88CE4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:08:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sN9Sa-0007qu-SO; Fri, 28 Jun 2024 13:08:08 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sN9Sa-005afZ-FN; Fri, 28 Jun 2024 13:08:08 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sN9Sa-0006FG-1K;
 Fri, 28 Jun 2024 13:08:08 +0200
Message-ID: <f5eba5cba2563b96779d5dd3d7ab12d2e7658086.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/etnaviv: update hardware headers from rnndb
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date: Fri, 28 Jun 2024 13:08:08 +0200
In-Reply-To: <20240628104745.2602036-2-l.stach@pengutronix.de>
References: <20240628104745.2602036-1-l.stach@pengutronix.de>
 <20240628104745.2602036-2-l.stach@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2024-06-28 at 12:47 +0200, Lucas Stach wrote:
> Update state_hi.xml.h header from etna_viv commit
> 8f43a34fd9cd ("rndb: document FE current primitve debug reg")
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
