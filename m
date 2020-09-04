Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594DF25DC53
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB066EC3C;
	Fri,  4 Sep 2020 14:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B57C6EC3B;
 Fri,  4 Sep 2020 14:53:51 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D529720722;
 Fri,  4 Sep 2020 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599231231;
 bh=hZGsIMRHkdPzXNT/RmVa15o3xjZybC5hUYWFtM6qSbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUCQELnMkTTQRFN+egZB5etIM9dt917pSa8i0aGmzymV0SP3GvgWaNONqMgpgNaeG
 rjlaRwlc8ka307F0do1PK9PgFKzgHKesR/Yl9R0WRguCvjavLODbga5ggdKSQo/nHf
 xa1AgGpF07wtepJMR7V2Oz/AoYh1HlRHZ+DUrAGg=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Li Yang <leoyang.li@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/13] dt-bindings: gpu: vivante,
 gc: Remove trailing whitespace
Date: Fri,  4 Sep 2020 16:53:04 +0200
Message-Id: <20200904145312.10960-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904145312.10960-1-krzk@kernel.org>
References: <20200904145312.10960-1-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove whitespace at the end of line.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/gpu/vivante,gc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/vivante,gc.yaml b/Documentation/devicetree/bindings/gpu/vivante,gc.yaml
index 67b71cad7b3b..3ed172629974 100644
--- a/Documentation/devicetree/bindings/gpu/vivante,gc.yaml
+++ b/Documentation/devicetree/bindings/gpu/vivante,gc.yaml
@@ -33,7 +33,7 @@ properties:
       - description: AXI/master interface clock
       - description: GPU core clock
       - description: Shader clock (only required if GPU has feature PIPE_3D)
-      - description: AHB/slave interface clock (only required if GPU can gate 
+      - description: AHB/slave interface clock (only required if GPU can gate
           slave interface independently)
     minItems: 1
     maxItems: 4
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
