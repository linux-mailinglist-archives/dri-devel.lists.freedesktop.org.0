Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A051EE69
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 17:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384B110EC4E;
	Sun,  8 May 2022 15:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA42B10EC8F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 15:01:51 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nniPh-0000sz-2i; Sun, 08 May 2022 17:01:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: daniel@ffwll.ch, hjc@rock-chips.com, lyude@redhat.com, tzimmermann@suse.de,
 airlied@linux.ie, Ren Zhijie <renzhijie2@huawei.com>
Subject: Re: [PATCH v2 -next] drm/rockchip: Fix Kconfig dependencies
Date: Sun,  8 May 2022 17:01:34 +0200
Message-Id: <165202207401.1750960.18152793741312373410.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507100910.93705-1-renzhijie2@huawei.com>
References: <20220507100910.93705-1-renzhijie2@huawei.com>
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 7 May 2022 18:09:10 +0800, Ren Zhijie wrote:
> The DP-helper module has been replaced by the display-helper module.
> So the driver have to select it.

Applied, thanks!

[1/1] drm/rockchip: Fix Kconfig dependencies
      commit: 0b752df77633cc4c3606a6187e3ad37ad6925c15

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
