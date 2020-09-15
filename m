Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4F269F7E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1724B6E85B;
	Tue, 15 Sep 2020 07:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8049C6E85B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 07:17:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99E6AABCC;
 Tue, 15 Sep 2020 07:17:25 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch,
	sean@poorly.run
Subject: [PATCH] MAINTAINERS: Add Thomas as reviewer for ast, mgag200 and udl
Date: Tue, 15 Sep 2020 09:17:08 +0200
Message-Id: <20200915071708.4743-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm adding myself as reviewer for ast, mgag200 and udl. I've already
been keeping these drivers in shape for a while.

While at it I'm also setting the list and tree for ast and mgag200,
and update each driver's status to Supported. Working on these drivers
is part of my job.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 MAINTAINERS | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58ea37042d22..2baaec07cde3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5419,7 +5419,10 @@ F:	drivers/gpu/drm/aspeed/
 
 DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
-S:	Odd Fixes
+R:	Thomas Zimmermann <tzimmermann@suse.de>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/ast/
 
 DRM DRIVER FOR BOCHS VIRTUAL GPU
@@ -5507,7 +5510,10 @@ F:	include/uapi/drm/mga_drm.h
 
 DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
-S:	Odd Fixes
+R:	Thomas Zimmermann <tzimmermann@suse.de>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/mgag200/
 
 DRM DRIVER FOR MI0283QT
@@ -5652,8 +5658,9 @@ F:	drivers/gpu/drm/panel/panel-tpo-tpg110.c
 DRM DRIVER FOR USB DISPLAYLINK VIDEO ADAPTERS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Sean Paul <sean@poorly.run>
+R:	Thomas Zimmermann <tzimmermann@suse.de>
 L:	dri-devel@lists.freedesktop.org
-S:	Odd Fixes
+S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/udl/
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
