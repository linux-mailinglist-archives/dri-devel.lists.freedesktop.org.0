Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C1ACC019
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 08:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B18F10E616;
	Tue,  3 Jun 2025 06:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Tue, 03 Jun 2025 06:18:30 UTC
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2383910E600;
 Tue,  3 Jun 2025 06:18:29 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-01 (Coremail) with SMTP id qwCowAD3atkIkj5oX8_TAg--.18275S2;
 Tue, 03 Jun 2025 14:11:20 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 airlied@redhat.com, ttabi@nvidia.com, bskeggs@nvidia.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/nouveau/vfn/r535: Convert comma to semicolon
Date: Tue,  3 Jun 2025 14:10:27 +0800
Message-Id: <20250603061027.1310267-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3atkIkj5oX8_TAg--.18275S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr4rCw4kuw4kuw1xGrW3ZFb_yoWDXFXEkF
 48X3Z3Cr4jkFZFganrAw4UZFyS9a4DZFZ7ZFyIqwnxGFW7JanrWwnIgry0qwnxtF47uF9x
 G3Z5X345G34agjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUS4EiUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
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

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
index 9446049642e1..d294844d9eae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
@@ -42,7 +42,7 @@ r535_vfn_new(const struct nvkm_vfn_func *hw,
 		return -ENOMEM;
 
 	rm->dtor = r535_vfn_dtor;
-	rm->intr = &tu102_vfn_intr,
+	rm->intr = &tu102_vfn_intr;
 	rm->user.addr = 0x030000;
 	rm->user.size = 0x010000;
 	rm->user.base.minver = -1;
-- 
2.25.1

