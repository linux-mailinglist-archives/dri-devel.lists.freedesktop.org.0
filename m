Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B455114A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8610F2B1;
	Mon, 20 Jun 2022 07:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81A610F23D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 07:18:24 +0000 (UTC)
X-UUID: acaba29734624d179a7245cebab7e2cf-20220620
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.6, REQID:e9311f20-6b30-4099-917c-d278413dbe0d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:100,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS6885AD
 ,ACTION:quarantine,TS:195
X-CID-INFO: VERSION:1.1.6, REQID:e9311f20-6b30-4099-917c-d278413dbe0d, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:100,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_US65DF41,A
 CTION:quarantine,TS:195
X-CID-META: VersionHash:b14ad71, CLOUDID:98b42b3d-9948-4b2a-a784-d8a6c1086106,
 C
 OID:0c15e3eaddee,Recheck:0,SF:28|17|19|48|801,TC:nil,Content:3,EDM:-3,IP:n
 il,URL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: acaba29734624d179a7245cebab7e2cf-20220620
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 597411295; Mon, 20 Jun 2022 15:18:21 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 20 Jun 2022 15:18:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jun 2022 15:18:18 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH] MAINTAINERS: add Yunfei Dong as mediatek vcodec driver
 maintainer
Date: Mon, 20 Jun 2022 15:18:17 +0800
Message-ID: <20220620071817.11685-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have been working on mediatek driver development for a very long time,
and sent many patches to change the driver architecture. Add myself as
co-maintainer for mediatek vcodec driver.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e22a79ffa4d0..1b3a30f33f0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12389,6 +12389,7 @@ F:	drivers/media/platform/mediatek/vpu/
 MEDIATEK MEDIA DRIVER
 M:	Tiffany Lin <tiffany.lin@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
+M:	Yunfei Dong <yunfei.dong@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek,vcodec*.yaml
 F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
-- 
2.25.1

