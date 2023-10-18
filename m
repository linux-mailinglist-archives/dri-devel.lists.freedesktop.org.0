Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B754C7CD1B5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 03:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6330410E352;
	Wed, 18 Oct 2023 01:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B773D10E352;
 Wed, 18 Oct 2023 01:16:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R681e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VuOlVXl_1697591775; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VuOlVXl_1697591775) by smtp.aliyun-inc.com;
 Wed, 18 Oct 2023 09:16:16 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com, harry.wentland@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH -next] drm/amd/display: Remove unneeded semicolon
Date: Wed, 18 Oct 2023 09:16:14 +0800
Message-Id: <20231018011614.10883-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, Yang Li <yang.lee@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c:464:3-4: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6900
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
index 36baf35bb170..f45fbe820445 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
@@ -461,7 +461,7 @@ static void sort_pipes_for_splitting(struct dc_plane_pipe_pool *pipes)
 				swapped = false;
 			}
 
-		};
+		}
 	}
 }
 
-- 
2.20.1.7.g153144c

