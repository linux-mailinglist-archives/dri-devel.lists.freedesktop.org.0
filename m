Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266CC4328E7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 23:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F6389263;
	Mon, 18 Oct 2021 21:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9405389263
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 21:14:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="291834011"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="291834011"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 14:14:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="493770956"
Received: from lab-ah.igk.intel.com ([10.102.30.7])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 14:14:34 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH] MAINTAINERS: Update email of Andrzej Hajda
Date: Mon, 18 Oct 2021 21:13:53 +0000
Message-Id: <20211018211353.586986-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset=UTF-8
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

Beside updating email, the patch updates maintainers
of Samsung drivers.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .mailmap    |  1 +
 MAINTAINERS | 13 ++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/.mailmap b/.mailmap
index 4f6e37da60589..4283a86f70d26 100644
--- a/.mailmap
+++ b/.mailmap
@@ -40,6 +40,7 @@ Andrew Vasquez <andrew.vasquez@qlogic.com>
 Andrey Konovalov <andreyknvl@gmail.com> <andreyknvl@google.com>
 Andrey Ryabinin <ryabinin.a.a@gmail.com> <a.ryabinin@samsung.com>
 Andrey Ryabinin <ryabinin.a.a@gmail.com> <aryabinin@virtuozzo.com>
+Andrzej Hajda <andrzej.hajda@intel.com> <a.hajda@samsung.com>
 Andy Adamson <andros@citi.umich.edu>
 Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
 Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 54cd05d3aab65..e3fadb4ebced3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2546,7 +2546,7 @@ N:	s3c64xx
 N:	s5pv210
 
 ARM/SAMSUNG S5P SERIES 2D GRAPHICS ACCELERATION (G2D) SUPPORT
-M:	Andrzej Hajda <a.hajda@samsung.com>
+M:	Łukasz Stelmach <l.stelmach@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -2570,7 +2570,8 @@ S:	Maintained
 F:	drivers/media/platform/s5p-jpeg/
 
 ARM/SAMSUNG S5P SERIES Multi Format Codec (MFC) SUPPORT
-M:	Andrzej Hajda <a.hajda@samsung.com>
+M:	Marek Szyprowski <m.szyprowski@samsung.com>
+M:	Andrzej Hajda <andrzej.hajda@intel.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -6254,7 +6255,7 @@ F:	Documentation/devicetree/bindings/display/atmel/
 F:	drivers/gpu/drm/atmel-hlcdc/
 
 DRM DRIVERS FOR BRIDGE CHIPS
-M:	Andrzej Hajda <a.hajda@samsung.com>
+M:	Andrzej Hajda <andrzej.hajda@intel.com>
 M:	Neil Armstrong <narmstrong@baylibre.com>
 M:	Robert Foss <robert.foss@linaro.org>
 R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
@@ -16748,13 +16749,15 @@ F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
 F:	drivers/nfc/s3fwrn5
 
 SAMSUNG S5C73M3 CAMERA DRIVER
-M:	Andrzej Hajda <a.hajda@samsung.com>
+M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Andrzej Hajda <andrzej.hajda@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 F:	drivers/media/i2c/s5c73m3/*
 
 SAMSUNG S5K5BAF CAMERA DRIVER
-M:	Andrzej Hajda <a.hajda@samsung.com>
+M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Andrzej Hajda <andrzej.hajda@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
-- 
2.25.1

