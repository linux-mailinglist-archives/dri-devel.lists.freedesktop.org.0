Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A5627819
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D7210E286;
	Mon, 14 Nov 2022 08:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 591 seconds by postgrey-1.36 at gabe;
 Mon, 14 Nov 2022 03:45:24 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013710E06C;
 Mon, 14 Nov 2022 03:45:24 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4N9ZhN0wjhz1DF0;
 Mon, 14 Nov 2022 11:35:32 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4N9Zh54J8Kz9vSpc;
 Mon, 14 Nov 2022 11:35:17 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxus.zte.com.cn (FangMail) with ESMTPS id 4N9Zh15f5CzdmYkm;
 Mon, 14 Nov 2022 11:35:13 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N9Zgx2ZR1z4xVnR;
 Mon, 14 Nov 2022 11:35:09 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
 by mse-fl1.zte.com.cn with SMTP id 2AE3Z10W017281;
 Mon, 14 Nov 2022 11:35:01 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp04[null]) by mapi (Zmail) with MAPI id mid14;
 Mon, 14 Nov 2022 11:35:03 +0800 (CST)
Date: Mon, 14 Nov 2022 11:35:03 +0800 (CST)
X-Zmail-TransId: 2b066371b767ffffffffd26f1041
X-Mailer: Zmail v1.0
Message-ID: <202211141135031107049@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <bskeggs@redhat.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRybS9ub3V2ZWF1L2ZpZm86IHJlbW92ZSBkdXBsaWNhdGVkIGluY2x1ZGVkIGNoaWQuaA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2AE3Z10W017281
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID
 6371B783.000 by FangMail milter!
X-FangMail-Envelope: 1668396932/4N9ZhN0wjhz1DF0/6371B783.000/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6371B783.000/4N9ZhN0wjhz1DF0
X-Mailman-Approved-At: Mon, 14 Nov 2022 08:47:13 +0000
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yang.yang29@zte.com.cn, xu.panda@zte.com.cn, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xu Panda <xu.panda@zte.com.cn>

The chid.h is included more than once.

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index b7c9d6115bce..b19a3612b62e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -24,7 +24,6 @@
 #include "chan.h"
 #include "chid.h"
 #include "cgrp.h"
-#include "chid.h"
 #include "runl.h"
 #include "priv.h"

-- 
2.15.2
