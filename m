Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D462F74B7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FA36E1BC;
	Fri, 15 Jan 2021 08:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C5D886E10A;
 Fri, 15 Jan 2021 03:42:03 +0000 (UTC)
Received: from zhangzhijie.loongson.cn (unknown [10.20.41.29])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxxbwADwFg4a0EAA--.5262S2;
 Fri, 15 Jan 2021 11:41:52 +0800 (CST)
From: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
To: alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu:this forword declear  maybe  not used
Date: Fri, 15 Jan 2021 11:41:52 +0800
Message-Id: <20210115034152.1800769-1-zhangzhijie@loongson.cn>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CM-TRANSID: AQAAf9AxxbwADwFg4a0EAA--.5262S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1kuw1DWr13tF15KF4kWFg_yoWkGrX_Ca
 y2qrn5Wr43JrnYqr12krWfWas2qrWrJr4kGr1xtF95t3srJry0yryDC3WxGa4ruw4Ig3W5
 Z3WqgF1ay3ZxKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUZa9-UUUUU=
X-CM-SenderInfo: x2kd0wx2klyx3h6o00pqjv00gofq/1tbiAQACAF3QvM2fqgABsL
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: mchehab+huawei@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 zhangzhijie@loongson.cn, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 2ee6edb3df93..ef4acb1d4a80 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -58,10 +58,10 @@
 /* Forward declarations */
 struct amdgpu_device;
 struct drm_device;
-struct amdgpu_dm_irq_handler_data;
 struct dc;
 struct amdgpu_bo;
 struct dmub_srv;
+struct dc_plane_state;
 
 struct common_irq_params {
 	struct amdgpu_device *adev;
@@ -438,11 +438,6 @@ struct amdgpu_dm_connector {
 
 extern const struct amdgpu_ip_block_version dm_ip_block;
 
-struct amdgpu_framebuffer;
-struct amdgpu_display_manager;
-struct dc_validation_set;
-struct dc_plane_state;
-
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
