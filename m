Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6AF3094D4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D496ECB7;
	Sat, 30 Jan 2021 11:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTP id B29776EAAF
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:50:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.241])
 by APP-01 (Coremail) with SMTP id qwCowAB3f5dq2hNgS+dXAA--.46225S2;
 Fri, 29 Jan 2021 17:50:36 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/kmb: Remove unneeded semicolon
Date: Fri, 29 Jan 2021 09:50:32 +0000
Message-Id: <20210129095032.53810-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAB3f5dq2hNgS+dXAA--.46225S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4kAw47ArWrZw4kuFyxuFg_yoW8Zw4fpF
 WUG3yvvry2qrs7tF1jya1fA3WYka4UtFWxGFWqgaySgF4Y9F93Aw15u397A34Fya1xZ3s7
 C39FgFy3ZasayrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4UJVW0ow
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4fMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
 IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84a0PUUUUU==
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCggQA1z4jVWsigAAsL
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fix semicolon.cocci warnings:
drivers/gpu/drm/kmb/kmb_dsi.c:284:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:304:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:321:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:340:3-4: Unneeded semicolon
drivers/gpu/drm/kmb/kmb_dsi.c:364:2-3: Unneeded semicolon

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4b5d82af84b3..231041b269f5 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -281,7 +281,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_PPS_YCBCR422_16B:
 		data_type_param.size_constraint_pixels = 2;
@@ -301,7 +301,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_LPPS_YCBCR422_20B:
 	case DSI_LP_DT_PPS_YCBCR422_24B:
@@ -318,7 +318,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_PPS_RGB565_16B:
 		data_type_param.size_constraint_pixels = 1;
@@ -337,7 +337,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 		default:
 			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
 			return -EINVAL;
-		};
+		}
 		break;
 	case DSI_LP_DT_PPS_RGB666_18B:
 		data_type_param.size_constraint_pixels = 4;
@@ -361,7 +361,7 @@ static u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
 	default:
 		DRM_ERROR("DSI: Invalid data_type %d\n", data_type);
 		return -EINVAL;
-	};
+	}
 
 	*params = data_type_param;
 	return 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
