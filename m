Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338157F60C6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 14:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2BF10E74F;
	Thu, 23 Nov 2023 13:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E1110E74F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 13:49:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77CE8614E2;
 Thu, 23 Nov 2023 13:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D77C433C8;
 Thu, 23 Nov 2023 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700747391;
 bh=Ran+HOMzMulZc35R1BVI8jtdePgjE69xnnBf17aaGis=;
 h=From:To:Cc:Subject:Date:From;
 b=dfs5dufT0A6i43Pq8Ams02vvkPNKqgEAwDU8PicNGDsRwqNvJU/WmQaQgLBcU2Pqz
 +qP+JikYVTz8YFKtsGdE0CR6CYmsEntuHy8jCTCRsOGLE1WfYJcpuZbg4qoczBAAln
 QymN3/qmMpw1liIoINoi1iUtHyqAHaWTI0rZwshr3cC1Y6huoTg7sPJg6UicQKJ+iG
 Y5b4YmlcpH1ciq2nCl5/z7DSjQUT1iMhPO0M4klutAI8syKBOSmWLca87JtZfgFqHs
 2NA4eFEVpRh3/h50P7nK1XkzGySPdVXCNezLny/gOePAPkeWmuqualXIA6iN8VMpEu
 /ClSGPDj3ZX+w==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH] dt-bindings: display: mediatek: dsi: remove Xinlei's mail
Date: Thu, 23 Nov 2023 14:49:27 +0100
Message-Id: <20231123134927.2034024-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xinlei Lee's mail is bouncing:

<xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] said:
    550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply to
    RCPT TO command)

Remove it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 4a7a9ff21996..8611319bed2e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -10,7 +10,6 @@ maintainers:
   - Chun-Kuang Hu <chunkuang.hu@kernel.org>
   - Philipp Zabel <p.zabel@pengutronix.de>
   - Jitao Shi <jitao.shi@mediatek.com>
-  - Xinlei Lee <xinlei.lee@mediatek.com>
 
 description: |
   The MediaTek DSI function block is a sink of the display subsystem and can
-- 
2.39.2

