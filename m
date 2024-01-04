Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C75823D36
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 09:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA9510E3DB;
	Thu,  4 Jan 2024 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED45810E3DB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 08:14:39 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rLIs9-0001V5-5A; Thu, 04 Jan 2024 09:14:37 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: analogix_dp: get encoder port ID from DT
Date: Thu,  4 Jan 2024 09:14:34 +0100
Message-Id: <170435598415.3166964.13191960299780787341.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103181301.3339595-1-l.stach@pengutronix.de>
References: <20240103181301.3339595-1-l.stach@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Jan 2024 19:13:01 +0100, Lucas Stach wrote:
> The VOP2 driver needs this port ID to properly configure the
> display data routing.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: get encoder port ID from DT
      commit: bb056046c2139c72e20a5b6fc39c9caaf9eac2b8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
