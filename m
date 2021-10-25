Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1304397D9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B15B89F08;
	Mon, 25 Oct 2021 13:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401789F08;
 Mon, 25 Oct 2021 13:49:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="210434817"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="210434817"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 06:49:23 -0700
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="446237645"
Received: from vadimmik-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 06:49:19 -0700
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Add Tvrtko as drm/i915 co-maintainer
Date: Mon, 25 Oct 2021 16:49:07 +0300
Message-Id: <20211025134907.20078-1-joonas.lahtinen@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Add Tvrtko Ursulin as a co-maintainer for drm/i915 driver.
Tvrtko will bring added bandwidth and focus to the GT/GEM domain
(drm-intel-gt-next).

This will help with the increased driver maintenance efforts, allows
alternating the drm-intel-gt-next pull requests and also should increase
the coverage for the maintenance in general.

Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98aa1f55ed41..07553156a1c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9361,6 +9361,7 @@ INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
 M:	Jani Nikula <jani.nikula@linux.intel.com>
 M:	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
+M:	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
 L:	intel-gfx@lists.freedesktop.org
 S:	Supported
 W:	https://01.org/linuxgraphics/
-- 
2.31.1

