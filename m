Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56757134EE3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 22:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A5D6E340;
	Wed,  8 Jan 2020 21:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9F6E340
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 21:30:58 +0000 (UTC)
Received: from labbott-the-desktop.fios-router.home
 (pool-96-235-39-235.pitbpa.fios.verizon.net [96.235.39.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 922852053B;
 Wed,  8 Jan 2020 21:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578519057;
 bh=PzZ+8bR3pupPgpGmt4T5sjcqeTUgCH6G9dafvqVJ07g=;
 h=From:To:Cc:Subject:Date:From;
 b=tyq9YdC024oJTM+SlDbVTTtpveA9i6G3dlYCqHZv+uI3wBrHABT/ipXjwDrpEp7/Z
 Zh33xkwaW6KQQpqiLxyNIOBVQmDJsUH7WZwrk/jbwnPR4R4V7JpZNt5QnZe8wYAVbQ
 IHjSiIqR5SaSDdRDtMcjJQiyqdl9DN+gAnmp66Ns=
From: labbott@kernel.org
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] MAINTAINERS: Update e-mail addresses for Laura Abbott
Date: Wed,  8 Jan 2020 16:30:55 -0500
Message-Id: <20200108213055.38449-1-labbott@kernel.org>
X-Mailer: git-send-email 2.24.1
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
Cc: Laura Abbott <labbott@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laura Abbott <labbott@kernel.org>

Consolodate everything under an @kernel.org address.

Signed-off-by: Laura Abbott <labbott@kernel.org>
---
Sumit, would you be willing to take this through your tree/drm-misc?
---
 .mailmap    | 3 +++
 MAINTAINERS | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a7bc8cabd157..1b67591657fc 100644
--- a/.mailmap
+++ b/.mailmap
@@ -144,6 +144,9 @@ Koushik <raghavendra.koushik@neterion.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+Laura Abbott <labbott@kernel.org> <lauraa@codeaurora.org>
+Laura Abbott <labbott@kernel.org> <labbott@redhat.com>
+Laura Abbott <labobtt@kernel.org> <laura@labbott.name>
 Leon Romanovsky <leon@kernel.org> <leon@leon.nu>
 Leon Romanovsky <leon@kernel.org> <leonro@mellanox.com>
 Leonid I Ananiev <leonid.i.ananiev@intel.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 8982c6e013b3..35b30e355f2f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1098,7 +1098,7 @@ F:	Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
 F:	drivers/rtc/rtc-goldfish.c
 
 ANDROID ION DRIVER
-M:	Laura Abbott <labbott@redhat.com>
+M:	Laura Abbott <labbott@kernel.org>
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 L:	devel@driverdev.osuosl.org
 L:	dri-devel@lists.freedesktop.org
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
