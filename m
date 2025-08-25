Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58F1B336CB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F1510E345;
	Mon, 25 Aug 2025 06:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RQrp85x4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DDD10E345
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 06:53:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 430975C10F1;
 Mon, 25 Aug 2025 06:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C20C116B1;
 Mon, 25 Aug 2025 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756104797;
 bh=e4plMWX7Y08I3aCOZjuwuqMbBWvJfYBKz86PFv30pzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RQrp85x4J7e52YNw7+dNTzmh5cKQcLUUZ6Ie2+STxCT6Tw5Xz0oDWOeXue/YEcYLu
 l8dal/icUZZG6p23O533C0WqbIgDn6VWi6cSYvBGmua8bBJoWK3Q7Zw23xh6ErS6lW
 JTLV43ss8hFaHaIggvjOjZm8hzknXHMW3584rqbm5g/JmiT3AOsYDQaJV1XZbXJZNe
 5IfpOb5Vthhxf1nfVKPR92fs3XsY7K+9MDTTX/LlT91vET+YZFjoV24qwijIFTUtiE
 bf2KQNY227cQfwudxrsmsCLcb5S0HpgPsfsLJnEvRgdGmvFsuU02kBG2Eo3M23z+hz
 a8kqy0SQq9ZUw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] gpu: drm: display: drm_dp_cec: update Hans' email address
Date: Mon, 25 Aug 2025 08:51:55 +0200
Message-ID: <9b18e1f8241e9df6d8f8b2286a197c25031de25b.1756104715.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756104715.git.hverkuil+cisco@kernel.org>
References: <cover.1756104715.git.hverkuil+cisco@kernel.org>
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
index 3b50d817c839..436bfe9f9081 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -42,7 +42,7 @@
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

