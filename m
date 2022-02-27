Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811DA4C5B3A
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 13:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FFE10E602;
	Sun, 27 Feb 2022 12:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85C710E8EA
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 12:47:41 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id BB3B88005A;
 Sun, 27 Feb 2022 13:47:39 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/5] drm/modes: Remove trailing whitespace
Date: Sun, 27 Feb 2022 13:47:10 +0100
Message-Id: <20220227124713.39766-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220227124713.39766-1-noralf@tronnes.org>
References: <20220227124713.39766-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Adef4UfG c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8
 a=LfDBrUgEAAAA:8 a=UdrTMzJVFnDzRRQ4zF0A:9 a=QEXdDO2ut3YA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=vFet0B0WnEQeilDPIY6i:22
 a=O_qpqY92pKIWs21-0QgL:22
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, david@lechnology.com,
 dave.stevenson@raspberrypi.com, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove trailing whitespace from a comment.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_modes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 96b13e36293c..77a4c8dd0bb8 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -127,7 +127,7 @@ EXPORT_SYMBOL(drm_mode_probed_add);
  * according to the hdisplay, vdisplay, vrefresh.
  * It is based from the VESA(TM) Coordinated Video Timing Generator by
  * Graham Loveridge April 9, 2003 available at
- * http://www.elo.utfsm.cl/~elo212/docs/CVTd6r1.xls 
+ * http://www.elo.utfsm.cl/~elo212/docs/CVTd6r1.xls
  *
  * And it is copied from xf86CVTmode in xserver/hw/xfree86/modes/xf86cvt.c.
  * What I have done is to translate it by using integer calculation.
-- 
2.33.0

