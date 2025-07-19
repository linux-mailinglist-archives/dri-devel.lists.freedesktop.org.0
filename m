Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE88B0AEE4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 10:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFCF10E021;
	Sat, 19 Jul 2025 08:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2F710E021
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 08:47:30 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4bkgJv6fGNzCgyH
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 16:47:27 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4bkgJr54Ltz5wLJM
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 16:47:24 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bkgJm52g6z6Fy5s
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 16:47:20 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4bkgJW2pPNz4xPST;
 Sat, 19 Jul 2025 16:47:07 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
 by mse-fl2.zte.com.cn with SMTP id 56J8l3Vu037829;
 Sat, 19 Jul 2025 16:47:03 +0800 (+08)
 (envelope-from zhang.enpei@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Sat, 19 Jul 2025 16:47:05 +0800 (CST)
Date: Sat, 19 Jul 2025 16:47:05 +0800 (CST)
X-Zmail-TransId: 2af9687b5b89ffffffff99b-cee31
X-Mailer: Zmail v1.0
Message-ID: <20250719164705961iryN2w6eDrp8KeLJMkI6-@zte.com.cn>
Mime-Version: 1.0
From: <zhang.enpei@zte.com.cn>
To: <andrzej.hajda@intel.com>
Cc: <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYnJpZGdlOiBwYW5lbDogY29udmVydCB0byB1c2UgRVJSX0NBU1QoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 56J8l3Vu037829
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: zhang.enpei@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.35.20.165 unknown Sat, 19 Jul 2025 16:47:28 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 687B5B9E.001/4bkgJv6fGNzCgyH
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use ERR_CAST() since the macro clearly indicates that this is a pointer
to an error value and a type conversion was performed.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
---
 drivers/gpu/drm/bridge/panel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 184a8b7049a7..7d2d67e56cee 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -291,7 +291,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
        panel_bridge = devm_drm_bridge_alloc(panel->dev, struct panel_bridge, bridge,
                                             &panel_bridge_bridge_funcs);
        if (IS_ERR(panel_bridge))
-               return (void *)panel_bridge;
+               return ERR_CAST(panel_bridge);

        panel_bridge->connector_type = connector_type;
        panel_bridge->panel = panel;
-- 
2.25.1
