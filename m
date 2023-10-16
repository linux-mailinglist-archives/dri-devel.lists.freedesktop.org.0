Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5557CAB04
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 16:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE8B10E1DF;
	Mon, 16 Oct 2023 14:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154FF10E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 14:11:40 +0000 (UTC)
Received: from i53875b5b.versanet.de ([83.135.91.91] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qsOJc-00062e-LJ; Mon, 16 Oct 2023 16:11:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/4] Some cleanup of vop2 driver
Date: Mon, 16 Oct 2023 16:11:25 +0200
Message-Id: <169746544053.926160.14655120322858248122.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013122001.1594009-1-andyshrk@163.com>
References: <20231013122001.1594009-1-andyshrk@163.com>
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
Cc: s.hauer@pengutronix.de, sjoerd.simons@collabora.com,
 sebastian.reichel@collabora.com, hjc@rock-chips.com,
 Andy Yan <andy.yan@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Oct 2023 20:20:01 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> This is a preparation for the upcoming support for rk3588 vop.
> Patch 1 remove unused struct
> Patch 2 remove NR_LAYERS macro to support more layers on rk3588
> Patch 3 are plane format fix
> Patch 4 is a format rename
> 
> [...]

Applied, thanks!

[1/4] drm/rockchip: remove unused struct in vop2
      commit: ac1c11c23fc51c1ba51a3ed586df40ffe6b1de35
[2/4] drm/rockchip: remove NR_LAYERS macro on vop2
      commit: dc00748adcf03d754bf43035c668bc5b20fb6597

So I've picked up the pretty straight-forward patches for now.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
