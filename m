Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D351EE67
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 17:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509CC10EA53;
	Sun,  8 May 2022 15:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0C510EA53
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 15:01:45 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nniPh-0000sz-ES; Sun, 08 May 2022 17:01:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Yang Li <yang.lee@linux.alibaba.com>,
	hjc@rock-chips.com
Subject: Re: [PATCH -next] drm/rockchip: remove unneeded semicolon
Date: Sun,  8 May 2022 17:01:35 +0200
Message-Id: <165202207401.1750960.5749921686386411114.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505232659.4405-1-yang.lee@linux.alibaba.com>
References: <20220505232659.4405-1-yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 May 2022 07:26:59 +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1476:2-3: Unneeded
> semicolon

Applied, thanks!

[1/1] drm/rockchip: remove unneeded semicolon
      commit: 813bb91da10bb6638dfadad73f2f0a5f9883946b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
