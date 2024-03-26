Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF1C88BCDB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17C610EDF5;
	Tue, 26 Mar 2024 08:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7995710E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 08:53:21 +0000 (UTC)
Received: from i53875aaf.versanet.de ([83.135.90.175] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rp2YQ-0000nO-2v; Tue, 26 Mar 2024 09:53:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 hjc@rock-chips.com, Andy Yan <andy.yan@rock-chips.com>,
 linux-kernel@vger.kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: vop2: Remove AR30 and AB30 format support
Date: Tue, 26 Mar 2024 09:53:08 +0100
Message-Id: <171144316040.1076426.18341528146329962592.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240304100952.3592984-1-andyshrk@163.com>
References: <20240304100952.3592984-1-andyshrk@163.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Mar 2024 18:09:52 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The Alpha blending for 30 bit RGB/BGR are not
> functioning properly for rk3568/rk3588, so remove
> it from the format list.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Remove AR30 and AB30 format support
      commit: 905f7d53a1bc105b22d9ffd03dc11b6b42ec6ba6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
