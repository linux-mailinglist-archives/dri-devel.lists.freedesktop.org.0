Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F949DF03D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 12:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3D10E0A2;
	Sat, 30 Nov 2024 11:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Sat, 30 Nov 2024 11:42:04 UTC
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7366A10E0A2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 11:42:04 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id D3C681F0003D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 11:36:41 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 16292A66A3C; Sat, 30 Nov 2024 11:36:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE,URIBL_BLOCKED
 autolearn=no autolearn_force=no version=4.0.0
Received: from localhost.localdomain (unknown [192.168.1.64])
 by laika.paulk.fr (Postfix) with ESMTP id C5D45A66A38;
 Sat, 30 Nov 2024 11:36:35 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc: Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] MAINTAINERS: Update own email address from Bootlin to sys-base
Date: Sat, 30 Nov 2024 12:36:32 +0100
Message-ID: <20241130113632.3227864-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.47.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update my email address as I am no longer working at Bootlin and have
started my own consulting company: sys-base.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1fcc56bf2fb..ce165fd144ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -816,7 +816,7 @@ F:	drivers/media/platform/sunxi/sun4i-csi/
 
 ALLWINNER A31 CSI DRIVER
 M:	Yong Deng <yong.deng@magewell.com>
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -824,7 +824,7 @@ F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
 F:	drivers/media/platform/sunxi/sun6i-csi/
 
 ALLWINNER A31 ISP DRIVER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -833,7 +833,7 @@ F:	drivers/staging/media/sunxi/sun6i-isp/
 F:	drivers/staging/media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h
 
 ALLWINNER A31 MIPI CSI-2 BRIDGE DRIVER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -876,7 +876,7 @@ F:	drivers/thermal/sun8i_thermal.c
 
 ALLWINNER VPU DRIVER
 M:	Maxime Ripard <mripard@kernel.org>
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/sunxi/cedrus/
@@ -7219,7 +7219,7 @@ F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/logicvc/
-- 
2.47.0

