Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE30F34BB32
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 07:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B166E072;
	Sun, 28 Mar 2021 05:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD5C6E072
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 05:35:41 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id s2so7180312qtx.10
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 22:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdP4ZZZX6mQ1tenG4YVVE2wJVKUCCHOcqzR6vRzskWY=;
 b=AMYomJGJrHO5sm/jwJB0EG2D51iQ9zajdt+KhbP9kMaJOFynw42meirXG7ONMiHynp
 UQ+bjHBEiDaJCYVZy/tLAFxi73UhZcx94b1djFbdZx8JrACl566mTO8fbMMB5/vEVBNu
 K/sDfQKzxtGJwMXIyl5NL6bVUnBS+kgdQfFsRXMFjNPdzrHYfHzmITjSo/DKggu143Np
 rSpLWV1gKqgmOQfE+NudNsZKM+AgTBBH6CxJyRZZyT7esYwSUfpshpKXI2Z2bLUwQUA+
 FIPsnHdcv5yafw2zR5sEaA6KHA9dKHJzO2Xp3Gwnx7aFJzrV1lGD03scDYauH0Vr6N/j
 KRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdP4ZZZX6mQ1tenG4YVVE2wJVKUCCHOcqzR6vRzskWY=;
 b=FYy4vMrHZtH3mX+ojLp9KuV1qMaZqpBchGQW6l2UG4Vm8x0RX5yniQOBi81Qn1GKmS
 cMPe2Zyk+XkbNdjb4JeEXmG/gZE/voK9htIIgydpSbFrZbOUpGcmuS7PYy249FBjx5rz
 vT1kJ2SKQ/foyqZYnUHhxWiGRLe2BPwgl6rJgUZsSxDEbkXV2QGpG5bZFaBf4d6+a3F6
 Yj+/ifz4Gd946qOlWtxGN9ppVDWPH+ghFtlyyF4OTUrI0WD4LIHSdgMPjeazWz2CrMjE
 pBEvePyWBrNQure0GJvu2bKTOsoK4vlFGcrcnTEhL/7pjoXNNLYYGKysk094+/U3kp9d
 7AmQ==
X-Gm-Message-State: AOAM532Hmw20F/0kQQFgCJxRZMkQrPA1yTilXmpb8R5irfmVq75SIUJ6
 e5p0ptmW3DKVI0/38JtsFIU=
X-Google-Smtp-Source: ABdhPJw+jo5SZ/TXLaw6w2dFpNvAdtbkBYA/2CACg9RY79xKl0p3m04eaaCICyw5aTp9z/eIEiuqIQ==
X-Received: by 2002:ac8:4d95:: with SMTP id a21mr17745913qtw.304.1616909740846; 
 Sat, 27 Mar 2021 22:35:40 -0700 (PDT)
Received: from localhost.localdomain ([187.39.20.240])
 by smtp.gmail.com with ESMTPSA id d3sm10585356qke.27.2021.03.27.22.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 22:35:40 -0700 (PDT)
From: Diego Viola <diego.viola@gmail.com>
To: alexander.deucher@amd.com
Subject: [TRIVIAL] drm/amd/display: fix typo: liason -> liaison
Date: Sun, 28 Mar 2021 02:35:04 -0300
Message-Id: <20210328053504.164301-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 573cf17262da..1b4b4f508662 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -121,7 +121,7 @@ MODULE_FIRMWARE(FIRMWARE_NAVI12_DMCU);
  * DOC: overview
  *
  * The AMDgpu display manager, **amdgpu_dm** (or even simpler,
- * **dm**) sits between DRM and DC. It acts as a liason, converting DRM
+ * **dm**) sits between DRM and DC. It acts as a liaison, converting DRM
  * requests into DC requests, and DC responses into DRM responses.
  *
  * The root control structure is &struct amdgpu_display_manager.
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
