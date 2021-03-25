Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62CA3492BC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74DE6ED25;
	Thu, 25 Mar 2021 13:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975196ED25
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:07:38 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:dd4e:1b63:5a5e:1980])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E752B1F464D6;
 Thu, 25 Mar 2021 13:07:36 +0000 (GMT)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Add linux-mediatek ML for drm Mediatek drivers
Date: Thu, 25 Mar 2021 14:07:28 +0100
Message-Id: <20210325130728.16634-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: chunkuang.hu@kernel.org, dafna.hirschfeld@collabora.com, airlied@linux.ie,
 dafna3@gmail.com, linux-kernel@vger.kernel.org, enric.balletbo@collabora.com,
 kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the linux-mediatek mailing list to drm Mediatek drivers

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e876927c60d..8260bc5afe66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5963,6 +5963,7 @@ DRM DRIVERS FOR MEDIATEK
 M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
 F:	drivers/gpu/drm/mediatek/
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
