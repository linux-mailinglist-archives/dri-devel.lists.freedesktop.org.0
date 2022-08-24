Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728E59FE00
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD15214A4A2;
	Wed, 24 Aug 2022 15:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B389D10EAA1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:02:52 +0000 (UTC)
X-QQ-mid: bizesmtp66t1661346163t6mn2l4h
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 24 Aug 2022 21:02:42 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: ILHsT53NKPjOlNPuqpWWqWg50EYn8tzNunygvysfeek+xEh1PNauTIxWspfom
 ZAxbXsjhibOXgqXUV5+K3n1XQcGlKqgWMOFzwvU4BO5syIv4D5DtN89Zi/ToQ6Y43tFrpuz
 6gOxl8EUvZYZ/DilLpfeU5vdiFOa+je+SXFUMGZm1ZvmgwDMayJEYQXRrEJ1+jVHDyxRH/U
 ucAl7D9hGSilQhQeq2cJdh7AqDCdPecVCGkdLEHvgnU6vx5H1wRmGzc2kKIup+vpJtbIDuA
 WSZWlabs6YKP1TUjYCB3YbsWbs3HX35nRdQIObC1Doe/ugy2VPuoze68eWxT9Mna2zIY3ee
 hPYK0My0YjltM4VLyrW1DPe5SYtTXGBYCy6Oi8oc3TA4fBrnGrnzeVfkc16qg==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vboxvideo: fix repeated words in comments
Date: Wed, 24 Aug 2022 21:02:26 +0800
Message-Id: <20220824130226.33980-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 15:12:28 +0000
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'the'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/vboxvideo/vboxvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
index a5de40fe1a76..f60d82504da0 100644
--- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
+++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
@@ -43,7 +43,7 @@
  * VBE_DISPI_INDEX_VBOX_VIDEO is used to read the configuration information
  * from the host and issue commands to the host.
  *
- * The guest writes the VBE_DISPI_INDEX_VBOX_VIDEO index register, the the
+ * The guest writes the VBE_DISPI_INDEX_VBOX_VIDEO index register, the
  * following operations with the VBE data register can be performed:
  *
  * Operation            Result
-- 
2.36.1

