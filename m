Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E416A1E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764E489817;
	Mon, 24 Feb 2020 09:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.netbsd.org (mail.NetBSD.org [IPv6:2001:470:a085:999::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343306E101
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 20:40:42 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 1508)
 id EF6C584D5A; Sun, 23 Feb 2020 20:40:41 +0000 (UTC)
Date: Sun, 23 Feb 2020 20:40:41 +0000
From: Maya Rashish <coypu@sdf.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vmwgfx: Correct typo in comment
Message-ID: <20200223204041.GA27186@homeworld.netbsd.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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

Signed-off-by: Maya Rashish <coypu@sdf.org>
Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
Co-authored-by: Thomas Klausner <wiz@NetBSD.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f47d5710cc95..5195c19d25a4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2016,7 +2016,7 @@ void vmw_disable_vblank(struct drm_device *dev, unsigned int pipe)
  * plugin and generate DRM uevent
  * @dev_priv: device private
  * @num_rects: number of drm_rect in rects
- * @rects: toplogy to update
+ * @rects: topology to update
  */
 static int vmw_du_update_layout(struct vmw_private *dev_priv,
 				unsigned int num_rects, struct drm_rect *rects)
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
