Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FE06D5761
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 06:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B63B10E0AB;
	Tue,  4 Apr 2023 04:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF6D210E0AB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 04:01:06 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8AxJIT+oCtk1U8WAA--.34530S3;
 Tue, 04 Apr 2023 12:01:02 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur39oCtkMO4UAA--.18983S2; 
 Tue, 04 Apr 2023 12:01:01 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Li Yi <liyi@loongson.cn>, Javier Martinez Canillas <javierm@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] video/aperture: fix typos
Date: Tue,  4 Apr 2023 12:01:01 +0800
Message-Id: <20230404040101.2165600-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur39oCtkMO4UAA--.18983S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AF1UZrW7CryrAF17KFyrtFb_yoW8tw4rpF
 sYgFyUCr1DKr4jgayj9a10yFyrWa93Xay5KFyUA3ya9wn8Ca4rXrWUGFWkG3WDJryku3Wa
 vFn8Zr18CF4DZrJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
 ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
 87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
 xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
 1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
 6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
 AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
 vjxU466zUUUUU
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 EFI FB, VESA FB or VGA FB etc are belong to firmware based framebuffer
 driver.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/video/aperture.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 41e77de1ea82..b009468ffdff 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -20,7 +20,7 @@
  * driver can be active at any given time. Many systems load a generic
  * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
  * During later boot stages, they replace the generic driver with a dedicated,
- * hardware-specific driver. To take over the device the dedicated driver
+ * hardware-specific driver. To take over the device, the dedicated driver
  * first has to remove the generic driver. Aperture functions manage
  * ownership of framebuffer memory and hand-over between drivers.
  *
@@ -76,7 +76,7 @@
  * generic EFI or VESA drivers, have to register themselves as owners of their
  * framebuffer apertures. Ownership of the framebuffer memory is achieved
  * by calling devm_aperture_acquire_for_platform_device(). If successful, the
- * driveris the owner of the framebuffer range. The function fails if the
+ * driver is the owner of the framebuffer range. The function fails if the
  * framebuffer is already owned by another driver. See below for an example.
  *
  * .. code-block:: c
@@ -126,7 +126,7 @@
  * et al for the registered framebuffer range, the aperture helpers call
  * platform_device_unregister() and the generic driver unloads itself. The
  * generic driver also has to provide a remove function to make this work.
- * Once hot unplugged fro mhardware, it may not access the device's
+ * Once hot unplugged from hardware, it may not access the device's
  * registers, framebuffer memory, ROM, etc afterwards.
  */
 
@@ -203,7 +203,7 @@ static void aperture_detach_platform_device(struct device *dev)
 
 	/*
 	 * Remove the device from the device hierarchy. This is the right thing
-	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
+	 * to do for firmware-based fb drivers, such as EFI, VESA or VGA. After
 	 * the new driver takes over the hardware, the firmware device's state
 	 * will be lost.
 	 *
-- 
2.25.1

