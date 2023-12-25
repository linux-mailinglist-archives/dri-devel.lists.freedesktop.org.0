Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CB81DD51
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 01:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E33310E01F;
	Mon, 25 Dec 2023 00:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87A610E01F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 00:21:12 +0000 (UTC)
Received: from i5e86193c.versanet.de ([94.134.25.60] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rHYiR-0007kx-Rn; Mon, 25 Dec 2023 01:21:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/rockchip: vop2: clean up some inconsistent indenting
Date: Mon, 25 Dec 2023 01:21:05 +0100
Message-Id: <170346364425.2455794.13619549678241145924.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219062635.100718-1-jiapeng.chong@linux.alibaba.com>
References: <20231219062635.100718-1-jiapeng.chong@linux.alibaba.com>
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
Cc: tzimmermann@suse.de, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, mripard@kernel.org,
 andy.yan@rock-chips.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023 14:26:35 +0800, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1708 rk3588_calc_cru_cfg() warn: inconsistent indenting.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: clean up some inconsistent indenting
      commit: f40e61eb538d35661d6dda1de92867954d776c4a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
