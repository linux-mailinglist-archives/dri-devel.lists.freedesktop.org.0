Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F128C6A79
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 18:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF73E10EA28;
	Wed, 15 May 2024 16:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ibTtL+uL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C07610E87F;
 Wed, 15 May 2024 16:22:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A58F6614F1;
 Wed, 15 May 2024 16:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D079C32789;
 Wed, 15 May 2024 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715790156;
 bh=1viUCWYrFo3uJS3ITlLVjLhbJegaUQZ/hfRHcrqV1Ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ibTtL+uLJranPiNsBTX+/GMRHyz2iKB/WQ8gLVpD71k1Hws4qZM+QoLzxv5PZXAn8
 9AoFHU2e/ic36BY5VFFU0Sp/hdqsckvYOD2VSdfyhGCWTslhpKt5hSiYKRH7mMRB6s
 9MxW0PV+vSnDyqI0pzQZAovZy9wkzvJ1ZL+f6tBKEIO2XRa0gjn6PatVtmDT8ItekS
 pN1G3M+K/+EVbNtwKUEAqvqOX7Y0KRrJSP2vMmcpyhhrvyqgbewkcppylYelYj8HI6
 YXpJ9izKrIIYLjscrL2AGowSIKtyfbU9QrshM0dDhMdXzEbrJP8+ITWeH+7zWmklMR
 HgGkTF8nCu5jA==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Ofir Bitton <obitton@habana.ai>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] MAINTAINERS: update Xe driver maintainers
Date: Wed, 15 May 2024 19:22:22 +0300
Message-Id: <20240515162222.12958-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515162222.12958-1-ogabbay@kernel.org>
References: <20240515162222.12958-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=true
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

Because I left Intel, I'm removing myself from the list
of Xe driver maintainers.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bd45a919aff..2469607ff5b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10863,7 +10863,6 @@ F:	include/uapi/drm/i915_drm.h
 
 INTEL DRM XE DRIVER (Lunar Lake and newer)
 M:	Lucas De Marchi <lucas.demarchi@intel.com>
-M:	Oded Gabbay <ogabbay@kernel.org>
 M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
 L:	intel-xe@lists.freedesktop.org
 S:	Supported
-- 
2.34.1

