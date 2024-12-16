Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CEC9F2DE3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B8B10E573;
	Mon, 16 Dec 2024 10:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="hqhQggRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id F133610E573
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=S6qnJ
 txja4ClILgX/c0Vlv2awsUTJDJB43+KIjN/jV0=; b=hqhQggRh/PstSiDGwP6pQ
 U7qflVUhOcvga1qWLv3r6x5NLtbTNUQvC8+YkOF/tajUc9hAvFOaheVAQqZFDwWF
 xJczq9RrxvcQZuXCLfG9T7yzgK/xdhTFgFm1bmRWjSI9GZBzbJp934OyKVqR/8Qr
 7EMAOSsIiAKESciSBgzL6w=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgAHs7KI_F9n2qUHBg--.10101S2;
 Mon, 16 Dec 2024 18:10:20 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: mripard@kernel.org, neil.armstrong@linaro.org,
 cristian.ciocaltea@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2] drm/bridge: synopsys: Fix Copyright Writing Style of
 dw-hdmi-qp
Date: Mon, 16 Dec 2024 18:10:03 +0800
Message-ID: <20241216101015.3726517-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAHs7KI_F9n2qUHBg--.10101S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw47ZrW7CF15Cr1xtF43Jrb_yoWfKFg_CF
 48tr1kX3y0kFnYvanxAF43Z3sFv34UuayxXF1kKrn5Ja1kZrn5W3sruF9rXFnxZF1xKFZr
 Jay5XF4jyFnxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8hID7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRa3Xmdf+hNAZgABsg
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
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

---

Changes in v2:
- Use uppercase (C) part for consistency.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
index 2115b8ef0bd6..72987e6c4689 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) Rockchip Electronics Co.Ltd
+ * Copyright (C) Rockchip Electronics Co., Ltd.
  * Author:
  *      Algea Cao <algea.cao@rock-chips.com>
  */
-- 
2.34.1

