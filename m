Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC9731B72
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305D610E50E;
	Thu, 15 Jun 2023 14:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77F6210E511
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:36:23 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38118.1572836322
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id A4EC7100295;
 Thu, 15 Jun 2023 22:36:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 f757833a38c0491a9b3e100f3191d20a for maarten.lankhorst@linux.intel.com; 
 Thu, 15 Jun 2023 22:36:21 CST
X-Transaction-ID: f757833a38c0491a9b3e100f3191d20a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH v15 2/2] MAINTAINERS: add maintainers for DRM LOONGSON driver
Date: Thu, 15 Jun 2023 22:36:13 +0800
Message-Id: <20230615143613.1236245-3-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615143613.1236245-1-15330273260@189.cn>
References: <20230615143613.1236245-1-15330273260@189.cn>
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
Cc: dri-devel@lists.freedesktop.org, inux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

This patch add Sui Jingfeng as maintainer to drm/loongson driver.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 225e20582a96..70262eb6e614 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6956,6 +6956,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/lima/
 F:	include/uapi/drm/lima_drm.h
 
+DRM DRIVERS FOR LOONGSON
+M:	Sui Jingfeng <suijingfeng@loongson.cn>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/loongson/
+
 DRM DRIVERS FOR MEDIATEK
 M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
-- 
2.25.1

