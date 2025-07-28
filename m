Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50BB137E1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 11:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECFA10E0DE;
	Mon, 28 Jul 2025 09:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VwYfiZLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80F10E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 09:44:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D7279600BB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 09:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C8CC4CEF8;
 Mon, 28 Jul 2025 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753695871;
 bh=3mgkEihmtU/EZh/G1SDyR/OWTIA5RrNL3zyp2vDAy5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VwYfiZLlxdB2XBvGAtxYuDU0LWeezFjBMa1qtwDEqeoacclQmMArNMqPrzRGI6o/b
 nsJ6rovnpLSuxLSQh8jC7XXuJRYPTmYJ2a8MsLGkwIj2hFWjzj0BJr2m4ySO9e74op
 mBWwjheqJ6/oicfhpwm1ta3f2STenfWzQAuepdGNoUISiYVXghZTxyrbRnziS7nzRD
 YuIefnCjHLL8hVt5b++y1HIEwEyRiO/t99gtNTI9MfX4LL6e0ewEGCzPTXL7fBLAt4
 rEwc9fyX596jiK/GhJDYH/8AYrAdrolwH6wRxio4YCF4+OU/ipGyHSuyn7XJuQMPSr
 xh/R2S04z3U1Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] gpu: drm: display: drm_dp_cec: update Hans' email address
Date: Mon, 28 Jul 2025 11:41:57 +0200
Message-ID: <c34e8330df68015a2bc5c436c0b8ca57f3295b3e.1753695717.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753695717.git.hverkuil+cisco@kernel.org>
References: <cover.1753695717.git.hverkuil+cisco@kernel.org>
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

From: Hans Verkuil <hverkuil@xs4all.nl>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
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

