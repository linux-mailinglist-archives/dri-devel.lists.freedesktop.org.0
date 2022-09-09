Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488425B3BE3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 17:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E082B10E09F;
	Fri,  9 Sep 2022 15:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E8710E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 15:30:15 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oWfxD-0006GD-HL; Fri, 09 Sep 2022 17:30:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, wangjianli <wangjianli@cdjrlc.com>, daniel@ffwll.ch,
 airlied@linux.ie
Subject: Re: [PATCH] drm/rockchip: fix repeated words in comments
Date: Fri,  9 Sep 2022 17:30:01 +0200
Message-Id: <166273738605.3499664.4120092619093859297.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220908123616.19195-1-wangjianli@cdjrlc.com>
References: <20220908123616.19195-1-wangjianli@cdjrlc.com>
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Sep 2022 20:36:16 +0800, wangjianli wrote:
> Delete the redundant word 'in'.

Applied, thanks!

[1/1] drm/rockchip: fix repeated words in comments
      commit: fe53d167129e19ce01c056d85262427146cacf88

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
