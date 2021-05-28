Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6923946D0
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 20:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809EE6F606;
	Fri, 28 May 2021 18:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E10A6E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 18:09:55 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lmgvd-0006Ve-LQ; Fri, 28 May 2021 20:09:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/rockchip: remove unused function
Date: Fri, 28 May 2021 20:09:41 +0200
Message-Id: <162222530163.2887132.15884573129584763057.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1618476421-114429-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1618476421-114429-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Apr 2021 16:47:01 +0800, Jiapeng Chong wrote:
> Fix the following clang warning:
> 
> drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c:320:20: warning: unused
> function 'dsi_set' [-Wunused-function].

Applied, thanks!

[1/1] drm/rockchip: remove unused function
      commit: 7455cedf7c4d4d5d808913e14d859705612c54ce

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
