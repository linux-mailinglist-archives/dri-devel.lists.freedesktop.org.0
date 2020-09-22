Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0627528B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C343D6E441;
	Wed, 23 Sep 2020 07:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F606E864
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:54:41 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 532B948296B;
 Tue, 22 Sep 2020 20:54:38 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Sierra <alex.sierra@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 Bernard Zhao <bernard@vivo.com>, Jonathan Kim <jonathan.kim@amd.com>,
 James Zhu <James.Zhu@amd.com>, Huang Rui <ray.huang@amd.com>,
 Leo Liu <leo.liu@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Jane Jian <Jane.Jian@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd:fix typoes in comments
Date: Tue, 22 Sep 2020 05:54:18 -0700
Message-Id: <20200922125431.27943-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSR4dS0gaHklIGkhKVkpNS0tMTEJJTENNTUxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDY6Aww*Oj8sTw5JCTMsTEk9
 PgkaCUlVSlVKTUtLTExCSUxCS0xDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBQkJKSDcG
X-HM-Tid: 0a74b5e1591393bakuws532b948296b
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the comment typo: "programm" -> "program".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c  | 4 ++--
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 770025a5e500..7c46937c1c0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -98,7 +98,7 @@ struct amdgpu_bo_list_entry;
 #define AMDGPU_PTE_MTYPE_NV10(a)       ((uint64_t)(a) << 48)
 #define AMDGPU_PTE_MTYPE_NV10_MASK     AMDGPU_PTE_MTYPE_NV10(7ULL)
 
-/* How to programm VM fault handling */
+/* How to program VM fault handling */
 #define AMDGPU_VM_FAULT_STOP_NEVER	0
 #define AMDGPU_VM_FAULT_STOP_FIRST	1
 #define AMDGPU_VM_FAULT_STOP_ALWAYS	2
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 3cafba726587..b0c0c438fc93 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -348,7 +348,7 @@ static int uvd_v4_2_start(struct amdgpu_device *adev)
 	/* Set the write pointer delay */
 	WREG32(mmUVD_RBC_RB_WPTR_CNTL, 0);
 
-	/* programm the 4GB memory segment for rptr and ring buffer */
+	/* program the 4GB memory segment for rptr and ring buffer */
 	WREG32(mmUVD_LMI_EXT40_ADDR, upper_32_bits(ring->gpu_addr) |
 				   (0x7 << 16) | (0x1 << 31));
 
@@ -541,7 +541,7 @@ static void uvd_v4_2_mc_resume(struct amdgpu_device *adev)
 	uint64_t addr;
 	uint32_t size;
 
-	/* programm the VCPU memory controller bits 0-27 */
+	/* program the VCPU memory controller bits 0-27 */
 	addr = (adev->uvd.inst->gpu_addr + AMDGPU_UVD_FIRMWARE_OFFSET) >> 3;
 	size = AMDGPU_UVD_FIRMWARE_SIZE(adev) >> 3;
 	WREG32(mmUVD_VCPU_CACHE_OFFSET0, addr);
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index a566ff926e90..6e57001f6d0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -253,7 +253,7 @@ static void uvd_v5_0_mc_resume(struct amdgpu_device *adev)
 	uint64_t offset;
 	uint32_t size;
 
-	/* programm memory controller bits 0-27 */
+	/* program memory controller bits 0-27 */
 	WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
 			lower_32_bits(adev->uvd.inst->gpu_addr));
 	WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
@@ -404,7 +404,7 @@ static int uvd_v5_0_start(struct amdgpu_device *adev)
 	/* set the wb address */
 	WREG32(mmUVD_RBC_RB_RPTR_ADDR, (upper_32_bits(ring->gpu_addr) >> 2));
 
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 			lower_32_bits(ring->gpu_addr));
 	WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 0a880bc101b8..d2d90fe5c6f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -583,7 +583,7 @@ static void uvd_v6_0_mc_resume(struct amdgpu_device *adev)
 	uint64_t offset;
 	uint32_t size;
 
-	/* programm memory controller bits 0-27 */
+	/* program memory controller bits 0-27 */
 	WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
 			lower_32_bits(adev->uvd.inst->gpu_addr));
 	WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
@@ -825,7 +825,7 @@ static int uvd_v6_0_start(struct amdgpu_device *adev)
 	/* set the wb address */
 	WREG32(mmUVD_RBC_RB_RPTR_ADDR, (upper_32_bits(ring->gpu_addr) >> 2));
 
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 			lower_32_bits(ring->gpu_addr));
 	WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index e07e3fae99b5..b44c8677ce8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -1073,7 +1073,7 @@ static int uvd_v7_0_start(struct amdgpu_device *adev)
 		WREG32_SOC15(UVD, k, mmUVD_RBC_RB_RPTR_ADDR,
 				(upper_32_bits(ring->gpu_addr) >> 2));
 
-		/* programm the RB_BASE for ring buffer */
+		/* program the RB_BASE for ring buffer */
 		WREG32_SOC15(UVD, k, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 				lower_32_bits(ring->gpu_addr));
 		WREG32_SOC15(UVD, k, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 927c330fad21..73699eafb51e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -910,7 +910,7 @@ static int vcn_v1_0_start_spg_mode(struct amdgpu_device *adev)
 	WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_RPTR_ADDR,
 			(upper_32_bits(ring->gpu_addr) >> 2));
 
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 			lower_32_bits(ring->gpu_addr));
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
@@ -1068,7 +1068,7 @@ static int vcn_v1_0_start_dpg_mode(struct amdgpu_device *adev)
 	WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_RPTR_ADDR,
 								(upper_32_bits(ring->gpu_addr) >> 2));
 
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 								lower_32_bits(ring->gpu_addr));
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 23a9eb5b2c8a..e5d29dee0c88 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -900,7 +900,7 @@ static int vcn_v2_0_start_dpg_mode(struct amdgpu_device *adev, bool indirect)
 	WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_RPTR_ADDR,
 		(upper_32_bits(ring->gpu_addr) >> 2));
 
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 		lower_32_bits(ring->gpu_addr));
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
@@ -1060,7 +1060,7 @@ static int vcn_v2_0_start(struct amdgpu_device *adev)
 	WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_CNTL, tmp);
 
 	fw_shared->multi_queue.decode_queue_mode |= FW_QUEUE_RING_RESET;
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 		lower_32_bits(ring->gpu_addr));
 	WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index e99bef6e2354..aa6f66c31709 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -887,7 +887,7 @@ static int vcn_v2_5_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, boo
 	WREG32_SOC15(VCN, inst_idx, mmUVD_RBC_RB_RPTR_ADDR,
 		(upper_32_bits(ring->gpu_addr) >> 2));
 
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32_SOC15(VCN, inst_idx, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 		lower_32_bits(ring->gpu_addr));
 	WREG32_SOC15(VCN, inst_idx, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
@@ -1067,7 +1067,7 @@ static int vcn_v2_5_start(struct amdgpu_device *adev)
 		WREG32_SOC15(VCN, i, mmUVD_RBC_RB_CNTL, tmp);
 
 		fw_shared->multi_queue.decode_queue_mode |= FW_QUEUE_RING_RESET;
-		/* programm the RB_BASE for ring buffer */
+		/* program the RB_BASE for ring buffer */
 		WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 			lower_32_bits(ring->gpu_addr));
 		WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
