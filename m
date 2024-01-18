Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F66831851
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 12:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8785510E75D;
	Thu, 18 Jan 2024 11:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jan 2024 09:09:00 UTC
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com
 [45.254.49.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F1010E752
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:08:59 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPV6:2409:8a0c:261:c560:6481:a5f4:f907:1ca0])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 242BC8000B2;
 Thu, 18 Jan 2024 17:02:38 +0800 (CST)
From: Hu Haowen <2023002089@link.tyut.edu.cn>
To: ogabbay@kernel.org,
	corbet@lwn.net
Subject: [PATCH] docs/accel: correct links to mailing list archives
Date: Thu, 18 Jan 2024 17:01:40 +0800
Message-Id: <20240118090140.4868-1-2023002089@link.tyut.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRlJVkgaGh0dHUkeTE8aS1UTARMWGhIXJBQOD1
 lXWRgSC1lBWUlPS0JBQxpLGEFJTUpBGE5NS0FNT0NKQRpOHU9BHUJLTEFKGBpLWVdZFhoPEhUdFF
 lBWUtVS1VLVUtZBg++
X-HM-Tid: 0a8d1bcedd14b03akuuu242bc8000b2
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pi46SQw6IzwvKhANDj4vOBIR
 DBEKClFVSlVKTEtOTk1DTk5CSE1LVTMWGhIXVUlLSUhLS0lLQ0I7FxIVEFUPAg4PVR4fDlUYFUVZ
 V1kSC1lBWUlPS0JBQxpLGEFJTUpBGE5NS0FNT0NKQRpOHU9BHUJLTEFKGBpLWVdZCAFZQUpCTkk3
 Bg++
X-Mailman-Approved-At: Thu, 18 Jan 2024 11:17:37 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the mailing archive list lkml.org is obsolete, change the links into
lore.kernel.org's ones.

Signed-off-by: Hu Haowen <2023002089@link.tyut.edu.cn>
---
 Documentation/accel/introduction.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/accel/introduction.rst b/Documentation/accel/introduction.rst
index 89984dfececf..ae3030136637 100644
--- a/Documentation/accel/introduction.rst
+++ b/Documentation/accel/introduction.rst
@@ -101,8 +101,8 @@ External References
 email threads
 -------------
 
-* `Initial discussion on the New subsystem for acceleration devices <https://lkml.org/lkml/2022/7/31/83>`_ - Oded Gabbay (2022)
-* `patch-set to add the new subsystem <https://lkml.org/lkml/2022/10/22/544>`_ - Oded Gabbay (2022)
+* `Initial discussion on the New subsystem for acceleration devices <https://lore.kernel.org/lkml/CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com/>`_ - Oded Gabbay (2022)
+* `patch-set to add the new subsystem <https://lore.kernel.org/lkml/20221022214622.18042-1-ogabbay@kernel.org/>`_ - Oded Gabbay (2022)
 
 Conference talks
 ----------------
-- 
2.34.1

