Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759251121D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CA310E22D;
	Wed, 27 Apr 2022 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E8E10EA5B;
 Tue, 26 Apr 2022 10:18:32 +0000 (UTC)
X-UUID: 839b2cb5bfb342069a8d8897af33cbe3-20220426
X-Spam-Fingerprint: 0
X-GW-Reason: 11109
X-Policy-Incident: 5pS25Lu25Lq66LaF6L+HMTDkurrpnIDopoHlrqHmoLg=
X-Content-Feature: ica/max.line-size 106 audit/email.address 1 meta/cnt.alert 1
X-UUID: 839b2cb5bfb342069a8d8897af33cbe3-20220426
X-User: oushixiong@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by nksmu.kylinos.cn
 (envelope-from <oushixiong@kylinos.cn>) (Generic MTA)
 with ESMTP id 1529660238; Tue, 26 Apr 2022 18:10:05 +0800
From: oushixiong <oushixiong@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd: Fix spelling typo in comment
Date: Tue, 26 Apr 2022 18:11:26 +0800
Message-Id: <20220426101126.1417207-1-oushixiong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Apr 2022 07:12:23 +0000
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
Cc: oushixiong <oushixiong@kylinos.cn>, Jiawei Gu <Jiawei.Gu@amd.com>,
 David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 John Clements <john.clements@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: oushixiong <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/amd/include/atomfirmware.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 7bd763361d6e..b7a1e2116e7e 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -3,7 +3,7 @@
 *  File Name      atomfirmware.h
 *  Project        This is an interface header file between atombios and OS GPU drivers for SoC15 products
 *
-*  Description    header file of general definitions for OS nd pre-OS video drivers
+*  Description    header file of general definitions for OS and pre-OS video drivers
 *
 *  Copyright 2014 Advanced Micro Devices, Inc.
 *
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
