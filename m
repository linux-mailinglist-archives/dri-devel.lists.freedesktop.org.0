Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCB75EDBD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C242F89E1D;
	Mon, 24 Jul 2023 08:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FFD89E1D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:35:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B110760FC6;
 Mon, 24 Jul 2023 08:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99BCC433C8;
 Mon, 24 Jul 2023 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690187722;
 bh=Z5HY1j3XekN0wuWmc3Gm3XQ0wBUul6TgGJXDB+eNZNs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HOuh8YN5DpUam/j60jnSdNhC+63dFxHoHy2Zk5oTqEVE/HlZ/7d3WO/ImXs/tq18K
 x7yJxNox45X7BJPu90lZdz7U/l/XZewqHKQnZSLZ5wL0B97k4qd5yLgUlaagCo2cG9
 gp7BRd7Q6IiBu4Yya45YTkG2WrqFiZ4Z9fpy2JeiTKWiOeFvy1etBCKm3GRnTWhLnL
 z1Bj5HhE5XVthlPbCOINK3Z/A3ms0wCdIGmP/0DPPri5XeZ6nVZx4sJA0mU0+YLWtW
 hi0CMmSIzw88J01sNzFn2ABTblavtbfhjobzWHwBkofmhcDYCYDQdxgAtULiCY70fH
 Xg5OXEONsHp/g==
From: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH RESEND v11] drm/bridge: it6505: Fix Kconfig indentation
Date: Mon, 24 Jul 2023 10:35:15 +0200
Message-ID: <169018770962.615452.8291957504440998877.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712065054.2377278-1-wenst@chromium.org>
References: <20230712065054.2377278-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Robert Foss <rfoss@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 14:50:53 +0800, Chen-Yu Tsai wrote:
> From: Pin-yen Lin <treapking@chromium.org>
> 
> Replace the spaces with tab characters in the Kconfig file.
> 
> 

Applied, thanks!

[1/1] drm/bridge: it6505: Fix Kconfig indentation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=dd9c1329027d



Rob

