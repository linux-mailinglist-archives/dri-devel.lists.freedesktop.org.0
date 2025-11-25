Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD987C830D6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 02:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BCE10E286;
	Tue, 25 Nov 2025 01:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064A210E286
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 01:55:31 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-03 (Coremail) with SMTP id rQCowAC3SdyMDCVpUkn1AQ--.427S2;
 Tue, 25 Nov 2025 09:55:24 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon
Date: Tue, 25 Nov 2025 09:47:40 +0800
Message-Id: <20251125014740.1059347-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3SdyMDCVpUkn1AQ--.427S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZFWDuF4rXw4DXFWDXFW7CFg_yoW8Jr1fpF
 4xK3yUAFWFyFW2kw4UAFn7Jw4Yyas7AFZ3GrWYgw1avw15XF1rJryaya4YyrWvyFW8u3Wa
 yF1qyr9xWa12vrUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_KwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUlYL9UUUUU=
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

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..d510ca8cfc4a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -746,7 +746,7 @@ static void mtk_hdmi_v2_change_video_resolution(struct mtk_hdmi *hdmi,
 	case HDMI_COLORSPACE_YUV420:
 		mtk_hdmi_yuv420_downsampling(hdmi, true);
 		break;
-	};
+	}
 }
 
 static void mtk_hdmi_v2_output_set_display_mode(struct mtk_hdmi *hdmi,
@@ -1157,7 +1157,7 @@ static int mtk_hdmi_v2_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_DRM:
 	default:
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -1185,7 +1185,7 @@ static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
 	default:
 		dev_err(hdmi->dev, "Unsupported HDMI infoframe type %u\n", type);
 		break;
-	};
+	}
 
 	return 0;
 }
-- 
2.25.1

