Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E45A92B8A23
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 03:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9F189DFB;
	Thu, 19 Nov 2020 02:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Thu, 19 Nov 2020 02:37:23 UTC
Received: from lechuck.jsg.id.au (jsg.id.au [193.114.144.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5890F89DB2;
 Thu, 19 Nov 2020 02:37:23 +0000 (UTC)
Received: from largo.jsg.id.au (largo.jsg.id.au [192.168.1.43])
 by lechuck.jsg.id.au (OpenSMTPD) with ESMTPS id 3db8c390
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 19 Nov 2020 13:30:41 +1100 (AEDT)
Received: from largo.jsg.id.au (localhost [127.0.0.1])
 by largo.jsg.id.au (OpenSMTPD) with ESMTP id 8ad35176;
 Thu, 19 Nov 2020 13:30:41 +1100 (AEDT)
From: Jonathan Gray <jsg@jsg.id.au>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Subject: [PATCH] drm/amd/display: change license of color_table.c
Date: Thu, 19 Nov 2020 13:30:41 +1100
Message-Id: <20201119023041.77269-1-jsg@jsg.id.au>
X-Mailer: git-send-email 2.26.2
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the license of color_table.c to match color_table.h granting
permission to modify and distribute.

Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
---
 .../amd/display/modules/color/color_table.c   | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_table.c b/drivers/gpu/drm/amd/display/modules/color/color_table.c
index 692e536e7d05..410f2a82b9a2 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_table.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_table.c
@@ -1,10 +1,26 @@
 /*
- * Copyright (c) 2019 Advanced Micro Devices, Inc. (unpublished)
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
  *
- * All rights reserved.  This notice is intended as a precaution against
- * inadvertent publication and does not imply publication or any waiver
- * of confidentiality.  The year included in the foregoing notice is the
- * year of creation of the work.
  */
 
 #include "color_table.h"
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
