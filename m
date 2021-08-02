Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F473DD132
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516FD6E46B;
	Mon,  2 Aug 2021 07:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Mon, 02 Aug 2021 06:45:22 UTC
Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDFB6E03D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 06:45:22 +0000 (UTC)
X-QQ-mid: bizesmtp54t1627886155tdindvhj
Received: from localhost.localdomain (unknown [113.89.245.207])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 02 Aug 2021 14:35:53 +0800 (CST)
X-QQ-SSF: 01100000002000208000D00A0000000
X-QQ-FEAT: E35I0CyQR8OdSgGCn+Q9PBM7YxN3WDE1WI55NloPRRsta8vQOgT6Z+9BPZf2l
 RWYwawxu5NEg2An0zJqCDiSEAQEpSYBxaaj8FiZcRbOUMzkgAJ7cf/o3s6BvVdOY5ndF/va
 B/ow4IdmD+kx3/+3KNpiBKVxaShA4MfrbcSMlG9TaW9p1ju8hpXonP0VcAw6rgugpVnRfHc
 sptAunYzFVIyWbpNXJTeFFgylCJrtygqW6JyP7rOWfwoaXFBz99mr4U++Brnz4aZQaZJM53
 oCQSg7WGtMVoKugNKtvwpw15+NmCk+aA3DrTJLxnMBs/EB23B5NpjCeFF7KcsE+X25BNSW4
 6Xs7/L4zeVd7NWkQa2Vd4hVh4Tw1g==
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@sipeed.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add Zhishengxin
Date: Mon,  2 Aug 2021 14:35:35 +0800
Message-Id: <20210802063538.75583-2-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210802063538.75583-1-icenowy@sipeed.com>
References: <20210802063538.75583-1-icenowy@sipeed.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam4
X-Mailman-Approved-At: Mon, 02 Aug 2021 07:32:22 +0000
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

Shenzhen Zhishengxin Technology Co., Ltd. is a LCD module supplier.

Add vendor prefix for it.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 62cb1d9341f5..d8fdec851f38 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1334,6 +1334,8 @@ patternProperties:
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
     description: Shenzhen Zkmagic Technology Co., Ltd.
+  "^zsx,.*":
+    description: Shenzhen Zhishengxin Technology Co., Ltd.
   "^zte,.*":
     description: ZTE Corp.
   "^zyxel,.*":
-- 
2.30.2


