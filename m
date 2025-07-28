Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C675B1394D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA5A10E4D5;
	Mon, 28 Jul 2025 10:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lz5MpBRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBDA10E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 10:55:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4510A44E6B;
 Mon, 28 Jul 2025 10:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A9DC4CEF6;
 Mon, 28 Jul 2025 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753700118;
 bh=5OxUAZ7Y+sSxxYZPmZEOWfLe9nY/JcJ5UtKgik4FNkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lz5MpBRZHJH/gwuE6n0dcdYbeBbM2sVTsEyPo0Sw2EqSbL3aDXqVVMlQ2+V/w+/+3
 8q01FaoD2Opzs1yaows61zr/N+GtyjfOa0igyBa2p9++HPRAu8rJTAxyzWLELakxI0
 FJp9DJCWEH9yrHYMN3OXUEDmoFevSzhKs/TOCvFoaxG49kfj4jN8UcYKVYltFFY3yk
 bE3UpifX22Vn1WhC81Hjk7Jmkw72RnTCNZRpxLvOHHqGOQkUlbTSEOd5o1foZtAVQW
 O4dswrMb+qDBn6X6IKWtIjTlDkgdu4m209BbME7HApSLLnQlPQpg3Mm6MiEcCOseuZ
 TzGojawXe4YMA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: hans@jjverkuil.nl
Cc: Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] gpu: drm: display: drm_dp_cec: update Hans' email address
Date: Mon, 28 Jul 2025 12:54:57 +0200
Message-ID: <948b67aa923d0887b538912357c218c71417dac6.1753700097.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753700097.git.hverkuil+cisco@kernel.org>
References: <cover.1753700097.git.hverkuil+cisco@kernel.org>
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

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/display/drm_dp_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index ed31471bd0e2..d0dcc9b4b92d 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -41,7 +41,7 @@
  *
  * https://hverkuil.home.xs4all.nl/cec-status.txt
  *
- * Please mail me (hverkuil@xs4all.nl) if you find an adapter that works
+ * Please mail me (hverkuil@kernel.org) if you find an adapter that works
  * and is not yet listed there.
  *
  * Note that the current implementation does not support CEC over an MST hub.
-- 
2.47.2

