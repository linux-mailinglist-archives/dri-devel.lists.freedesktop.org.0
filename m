Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F956A330C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 18:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9537310E135;
	Sun, 26 Feb 2023 17:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D8CE10E143
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 17:03:38 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:37836.2141219623
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 2F346100238;
 Mon, 27 Feb 2023 01:03:35 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-c7zbh with ESMTP id
 22d209e39149478db6278f093e34b960 for maarten.lankhorst@linux.intel.com; 
 Mon, 27 Feb 2023 01:03:36 CST
X-Transaction-ID: 22d209e39149478db6278f093e34b960
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: suijingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v5 2/2] MAINTAINERS: add maintainers for DRM LSDC driver
Date: Mon, 27 Feb 2023 01:03:30 +0800
Message-Id: <20230226170330.5560-2-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230226170330.5560-1-15330273260@189.cn>
References: <20230226170330.5560-1-15330273260@189.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: suijingfeng <suijingfeng@loongson.cn>

This patch add myself as maintainer to fix following warning

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: suijingfeng <15330273260@189.cn>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97d814a19475..bb1d84a9ec73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7022,6 +7022,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/lima/
 F:	include/uapi/drm/lima_drm.h
 
+DRM DRIVERS FOR LOONGSON LSDC
+M:	suijingfeng <suijingfeng@loongson.cn>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/lsdc/
+
 DRM DRIVERS FOR MEDIATEK
 M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
-- 
2.25.1

