Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1FC9F22F2
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 10:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2280B10E131;
	Sun, 15 Dec 2024 09:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ohA3nqr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 461F710E131
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=oadAC
 AsbvOl2AeR1k5LHO8GtmYMaw6HBWzUdLwJQTp0=; b=ohA3nqr96KikZ1YWkZ7n1
 HZ3OYFCe+vozwvMcWZWrZnimeEwTOuwKthkNuiVeQ7vstn8jFdiUYc5pLpQ6KdZ5
 4/Y8DqVs4Xu6kb5QWrIFtF5ws3XW6B5m7QQfHSNcB7fjymq44WkOw2xfNlKK57cq
 L6tFH/+aBq62wq+q8P7X7M=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgD3v+oQn15nIwqaHA--.23673S2;
 Sun, 15 Dec 2024 17:19:16 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: mripard@kernel.org, neil.armstrong@linaro.org,
 cristian.ciocaltea@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/bridge: synopsys: Fix Copyright Writing Style of
 dw-hdmi-qp
Date: Sun, 15 Dec 2024 17:19:06 +0800
Message-ID: <20241215091911.3446653-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgD3v+oQn15nIwqaHA--.23673S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw47ZrW7CF15Cr1xtF43Jrb_yoW3tFg_CF
 4xJr1DXrW0kFnYvanxAr43X3sFvw15uFWxWF18K3sxJa18Zrs5W3sxuFyUXrn8Zr1xtFZr
 Ja45WF45AFnIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1ZmR5UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0ha2Xmdek2W6JAAAs9
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

From: Andy Yan <andy.yan@rock-chips.com>

The standard writing style should be: Co., Ltd.
This fix the mail server warning:
DBL_SPAM(6.50)[co.ltd:url];

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
index 2115b8ef0bd6..74088e0d1d87 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) Rockchip Electronics Co.Ltd
+ * Copyright (c) Rockchip Electronics Co., Ltd.
  * Author:
  *      Algea Cao <algea.cao@rock-chips.com>
  */
-- 
2.34.1

