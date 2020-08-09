Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED682402C8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5F56E388;
	Mon, 10 Aug 2020 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF6E6E171;
 Sun,  9 Aug 2020 06:17:54 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id m22so6211699eje.10;
 Sat, 08 Aug 2020 23:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8/WAyXxEK6f4eGf236GZbQc5j4me7n0Ad/X2a4kTwOE=;
 b=g0wkBOA3EmdhKYruxbUmwfZmyVVTTidomJP8brzeZl79rzKBdFEI8mraRU6x8pZqlf
 OMasWBFRtzBR+dXkmerWTSMGVErG+6gCap7t9JAqwsy7SZvwAyvDHYOh29Fo8hXC+C6N
 VkU+xRYgfagEmoUY8iuHEKYtB+GOmRNYTGb8sUJoktf4T6P530ou9X63PDraRWYODKHT
 FAt5M4KU4em8Ppf1hcOU4by0PYNgM66MkWOx+ZJSjqqgBHV6o648IG8e3c02PmV+OGm1
 YfwJ62JXegpiBF0rA1UZppSgk9lC+O1TqsAqx+1YSCbL+HyvK7xTt2+1tBDOnE/z94p6
 uR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8/WAyXxEK6f4eGf236GZbQc5j4me7n0Ad/X2a4kTwOE=;
 b=OPsIbN56xtFIqZEmzo47iHyGLlGAlbcdG2Oh4z6/z8SuvnzXg+Yuph4V/N7gqFqRzd
 Ce6yb8gE0dZti17xmrcoC9IaZ53efroQfzqvBUW7NgbQTsyWGD7xHHh06cRP2Ggkr9x8
 MTUX5vvE0hzUFTD49rO1etcFJ6KZh7wrTj05GNo7Z42tE61veaXKbLfNxSPBNjxS9sLM
 A4lTG3nbki7nXlbG52jcAAj6Ekx2eFEsEoYLT8QBveQu6VyBJWSaYTZys+inNTLg7ymM
 dCVc1+IL4/ZWyruXaLjPrvsn0I3Cj7goCIcotXRkO7I61RYm5kSn+ZG6/zTD2P/tHnZw
 R39A==
X-Gm-Message-State: AOAM530RQzsHy9M0j3/QQWIB9Rj1dDbapWdjW/GAVtH7YxLNdk2e7yIF
 nozC+l1v4sWYcLxB3EZ87KQ=
X-Google-Smtp-Source: ABdhPJzAWTtG0O3pCQAx7xu92rq1VP07wg1HoGT+dX5bPPDs3LBi5kspOwUUzgtQT2hF3gwlm3mvyA==
X-Received: by 2002:a17:906:24d0:: with SMTP id
 f16mr15910842ejb.325.1596953873009; 
 Sat, 08 Aug 2020 23:17:53 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d48:c300:9164:4bc4:8f8b:2b7d])
 by smtp.gmail.com with ESMTPSA id j1sm5175454edq.58.2020.08.08.23.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 23:17:52 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] dma-buf.rst: repair length of title underline
Date: Sun,  9 Aug 2020 08:17:39 +0200
Message-Id: <20200809061739.16803-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With commit 72b6ede73623 ("dma-buf.rst: Document why indefinite fences are
a bad idea"), document generation warns:

  Documentation/driver-api/dma-buf.rst:182: \
  WARNING: Title underline too short.

Repair length of title underline to remove warning.

Fixes: 72b6ede73623 ("dma-buf.rst: Document why indefinite fences are a bad idea")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Daniel, please pick this minor non-urgent fix to your new documentation.

 Documentation/driver-api/dma-buf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 100bfd227265..13ea0cc0a3fa 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -179,7 +179,7 @@ DMA Fence uABI/Sync File
    :internal:
 
 Indefinite DMA Fences
-~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~
 
 At various times &dma_fence with an indefinite time until dma_fence_wait()
 finishes have been proposed. Examples include:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
