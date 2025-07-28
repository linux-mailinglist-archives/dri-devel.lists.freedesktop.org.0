Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67ADB1380A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 11:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEE110E4A2;
	Mon, 28 Jul 2025 09:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fGfWLHTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10910E119
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 09:48:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 122045C5BCF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 09:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5B4C4CEF6;
 Mon, 28 Jul 2025 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753696118;
 bh=5OxUAZ7Y+sSxxYZPmZEOWfLe9nY/JcJ5UtKgik4FNkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fGfWLHTEyfpcloyCnDfkv/uMKbOvBBTipLkpylujkAxxEPe/cnVB0E20CTTq8LOdT
 r3l7Hcld+so+EXuCYnK3XHZPAO0zhrL11YfDcXQxqO70xTkwBBRHvTFNr7ROORjLES
 MDPSIVLMlpS8nMxMWwUZe3JQK4mNJNoKSCwDSwPKIt87JBxChbKTCrT9XD8B/JUket
 R3R3I1zaZGwYTV8M602W0kfPtVZ5MnYC1vEv6LBBJD8KmyO2rQqgArvkTNGDFOAvfh
 pRNDo5gKf5fSUxmXP9hkfKe+u8fBnjK5+BukhyfT3FP6LuO45aADSYIpHUfrSLg9D5
 GmlifRu/qCARQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCHv2 8/8] gpu: drm: display: drm_dp_cec: update Hans' email
 address
Date: Mon, 28 Jul 2025 11:47:03 +0200
Message-ID: <948b67aa923d0887b538912357c218c71417dac6.1753696023.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753696022.git.hverkuil+cisco@kernel.org>
References: <cover.1753696022.git.hverkuil+cisco@kernel.org>
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

