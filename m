Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD52627D2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6C46E9D6;
	Wed,  9 Sep 2020 07:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs49.siol.net [185.57.226.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7B56E876
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 16:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 3F059525E67;
 Tue,  8 Sep 2020 18:15:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id yIe6Ok0-c5LF; Tue,  8 Sep 2020 18:15:41 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id EF922525E3E;
 Tue,  8 Sep 2020 18:15:40 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe1-5-97.cable.triera.net
 [213.161.5.97]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 8C3F4525E44;
 Tue,  8 Sep 2020 18:15:39 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <mripard@kernel.org>, Martin Cerveny <m.cerveny@computer.org>
Subject: Re: [PATCH 2/2] drm/sun4i: mixer: Extend regmap max_register
Date: Tue, 08 Sep 2020 18:15:39 +0200
Message-ID: <4070865.r2PyUa1FLi@jernej-laptop>
In-Reply-To: <20200906162140.5584-3-m.cerveny@computer.org>
References: <20200906162140.5584-1-m.cerveny@computer.org>
 <20200906162140.5584-3-m.cerveny@computer.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: Martin Cerveny <m.cerveny@computer.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>Better guess. Secondary CSC registers are from 0xF0000.
>
>Signed-off-by: Martin Cerveny <m.cerveny@computer.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
