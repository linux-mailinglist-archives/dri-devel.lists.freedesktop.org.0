Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EF534A60
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 08:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF0810F424;
	Thu, 26 May 2022 06:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38810F477
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 06:28:32 +0000 (UTC)
X-UUID: 1fcc9c13c4904a2fb9047121447749a4-20220526
X-UUID: 1fcc9c13c4904a2fb9047121447749a4-20220526
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1815677509; Thu, 26 May 2022 14:31:21 +0800
X-ns-mid: postfix-628F1E05-2327746001
Received: from localhost.localdomain (unknown [172.20.4.120])
 by cs2c.com.cn (NSMail) with ESMTPA id 1B8DE3848645;
 Thu, 26 May 2022 06:28:21 +0000 (UTC)
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] radeon: Fix spelling typo in comment
Date: Thu, 26 May 2022 14:27:57 +0800
Message-Id: <20220526062757.1155581-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: pengfuyuan <pengfuyuan@kylinos.cn>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix spelling typo in comment.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 include/video/radeon.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/video/radeon.h b/include/video/radeon.h
index 005eae19ec09..72f94ccfa725 100644
--- a/include/video/radeon.h
+++ b/include/video/radeon.h
@@ -750,7 +750,7 @@
 #define WAIT_DMA_GUI_IDLE			   (1 << 9)
 #define WAIT_2D_IDLECLEAN			   (1 << 16)
 
-/* SURFACE_CNTL bit consants */
+/* SURFACE_CNTL bit constants */
 #define SURF_TRANSLATION_DIS			   (1 << 8)
 #define NONSURF_AP0_SWP_16BPP			   (1 << 20)
 #define NONSURF_AP0_SWP_32BPP			   (1 << 21)
-- 
2.25.1

