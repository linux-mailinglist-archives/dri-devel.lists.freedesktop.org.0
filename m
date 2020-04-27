Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5F1BADB6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 21:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07B6E0F4;
	Mon, 27 Apr 2020 19:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E52D6E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 19:18:51 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jT9H7-0008PW-0i; Mon, 27 Apr 2020 21:18:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-arm-kernel@lists.infradead.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-rockchip@lists.infradead.org, Zheng Bin <zhengbin13@huawei.com>,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com
Subject: Re: [PATCH] drm/rockchip: Remove unneeded semicolon
Date: Mon, 27 Apr 2020 21:18:38 +0200
Message-Id: <158801509401.47920.4814357124924437922.b4-ty@sntech.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200424074410.1070-1-zhengbin13@huawei.com>
References: <20200424074410.1070-1-zhengbin13@huawei.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Apr 2020 15:44:10 +0800, Zheng Bin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/rockchip/cdn-dp-reg.c:604:2-3: Unneeded semicolon
> drivers/gpu/drm/rockchip/cdn-dp-reg.c:622:2-3: Unneeded semicolon
> drivers/gpu/drm/rockchip/cdn-dp-reg.c:703:2-3: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Remove unneeded semicolon
      commit: 611e22b1d9f61a8742c99433de9ff40795574c61

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
