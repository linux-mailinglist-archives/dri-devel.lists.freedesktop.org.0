Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F191D7B082E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 17:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF8210E040;
	Wed, 27 Sep 2023 15:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12B710E569
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 15:27:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 97D78B81800;
 Wed, 27 Sep 2023 15:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35E3C433C9;
 Wed, 27 Sep 2023 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695828433;
 bh=67MEpz13djP/cufNxhOgox+maC7Zu2vZGGlHmn7nedg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=mVoyV+3zNZw45lgOJmVUkEzMw+hGtRanF9TWHwcN81KjsgwDk0ROan3c0pQpcXFXn
 jO68UEBWV7+83qlrvmwUt97dU2oIxijgm5Jg4wXeF0tmuuphHwb5mM37J2Ie+PMyMX
 rVomAhSN6Eb74LzpGyy83M2om1fVqhr413PqmYMbzzAsE31HkPQ+LP5rw0+9wHSEwn
 SX9W6wHVAVLtxncMTJt2Vq25YVtdmuq2sNRcgXRwyNEtzMBIrrgWbTDG/toekTXpjr
 2b7gxZoNH5y4EbMpLYweeVbEhCXn/ucg9dCfHhPZ4JWNXvpUNPWMjNuzh1MchYTOno
 X2TZCmZ2Xe9pA==
Message-ID: <d891e81aa464193e9989b3be1ecbf784.mripard@kernel.org>
Date: Wed, 27 Sep 2023 15:27:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: Document that the NXP i.MX 8MQ DCSS driver
 goes thru drm-misc
In-Reply-To: <20230925154929.1.I3287e895ce8e68d41b458494a49a1b5ec5c71013@changeid>
References: <20230925154929.1.I3287e895ce8e68d41b458494a49a1b5ec5c71013@changeid>
Content-Transfer-Encoding: quoted-printable
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
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurentiu
 Palcu <laurentiu.palcu@oss.nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Sep 2023 15:49:29 -0700, Douglas Anderson wrote:
> As per the discussion on the lists [1], changes to this driver
> generally flow through drm-misc. Add a tag in MAINTAINERS to document
> this
>=20
> [1] https://lore.kernel.org/r/20230925054710.r3guqn5jzdl4giwd@fsr-ub1664-=
121.ea.freescale.net
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
