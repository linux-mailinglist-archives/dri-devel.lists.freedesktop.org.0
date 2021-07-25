Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFC3D4E37
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 17:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F183E6E3F2;
	Sun, 25 Jul 2021 15:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Sun, 25 Jul 2021 15:07:47 UTC
Received: from rosenzweig.io (unknown [138.197.143.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8D46E3F2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 15:07:47 +0000 (UTC)
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] documentation: Update #nouveau IRC channel network
Date: Sun, 25 Jul 2021 11:00:06 -0400
Message-Id: <20210725150007.2818-1-alyssa@rosenzweig.io>
X-Mailer: git-send-email 2.30.2
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

Like many free software projects, Nouveau recently moved from Freenode
to OFTC. Update the reference.

v3: Add acks.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Karol Herbst <kherbst@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org
---
 Documentation/driver-api/thermal/nouveau_thermal.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/thermal/nouveau_thermal.rst b/Documentation/driver-api/thermal/nouveau_thermal.rst
index 79ece266c..aa10db6df 100644
--- a/Documentation/driver-api/thermal/nouveau_thermal.rst
+++ b/Documentation/driver-api/thermal/nouveau_thermal.rst
@@ -90,7 +90,7 @@ Bug reports
 -----------
 
 Thermal management on Nouveau is new and may not work on all cards. If you have
-inquiries, please ping mupuf on IRC (#nouveau, freenode).
+inquiries, please ping mupuf on IRC (#nouveau, OFTC).
 
 Bug reports should be filled on Freedesktop's bug tracker. Please follow
 https://nouveau.freedesktop.org/wiki/Bugs
-- 
2.30.2

