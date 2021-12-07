Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5746C7D0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 23:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA386E432;
	Tue,  7 Dec 2021 22:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32D6E0E6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 22:55:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82FE6B81EB9;
 Tue,  7 Dec 2021 22:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B16C341C3;
 Tue,  7 Dec 2021 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638917701;
 bh=sp0xm1WbDE3Fb/5V0cM4QWZ6D+dNtSoC1dtm8Wt6zSA=;
 h=From:To:Cc:Subject:Date:From;
 b=Kso+dWdkPbHMFoZDjt3VRPukSq7hZyVhE7XTBZP0D7n5/VubjR+3TGhcXxnkBPf3g
 FBQbBYL4lvny9ZiuUuETO0hIBLCP+pYYJLYI0/5ZpiES/Qm/QiNGh4qqDLEp61zKJo
 lXFaL3YktiooHh5iAAqcMGQdN/HD6wUcD1WONc5hR66ePErZrzMaYI9/i2u+XIeMZx
 HLGsvDxwL9b6VbLQYt5jAyHIjZo2I1DFz27fdSVq618oARRGFdD9ShEz3XfIPKysrj
 K6vHr8kzDAFIuXHJPo5z/nNq+tqKjXEDe4w11OlmglL1g6/Pokc2QeYI/6fYJJqdpw
 nt/9pfCZVCBCg==
From: labbott@kernel.org
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] MAINTAINERS: Update e-mail addresses for Laura Abbott
Date: Tue,  7 Dec 2021 17:54:58 -0500
Message-Id: <20211207225458.622282-1-labbott@kernel.org>
X-Mailer: git-send-email 2.33.1
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
Cc: Laura Abbott <labbott@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laura Abbott <labbott@kernel.org>

Consolodate everything under an @kernel.org address.

Signed-off-by: Laura Abbott <labbott@kernel.org>
---
Sumit, can you take this through your tree?
---
 .mailmap    | 3 +++
 MAINTAINERS | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 6277bb27b4bf..e7a5bb0c35ae 100644
--- a/.mailmap
+++ b/.mailmap
@@ -203,6 +203,9 @@ Koushik <raghavendra.koushik@neterion.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+Laura Abbott <labbott@kernel.org> <lauraa@codeaurora.org>
+Laura Abbott <labbott@kernel.org> <labbott@redhat.com>
+Laura Abbott <labobtt@kernel.org> <laura@labbott.name>
 Leonardo Bras <leobras.c@gmail.com> <leonardo@linux.ibm.com>
 Leonid I Ananiev <leonid.i.ananiev@intel.com>
 Leon Romanovsky <leon@kernel.org> <leon@leon.nu>
diff --git a/MAINTAINERS b/MAINTAINERS
index 43007f2d29e0..21ab7c9d1bee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5715,7 +5715,7 @@ DMA-BUF HEAPS FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 R:	Liam Mark <lmark@codeaurora.org>
-R:	Laura Abbott <labbott@redhat.com>
+R:	Laura Abbott <labbott@kernel.org>
 R:	Brian Starkey <Brian.Starkey@arm.com>
 R:	John Stultz <john.stultz@linaro.org>
 L:	linux-media@vger.kernel.org
-- 
2.33.1

