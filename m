Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059727A93AB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E3710E5AC;
	Thu, 21 Sep 2023 10:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
 [67.231.157.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1F10E5AC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:47:58 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
 by m0048204.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 38LAAl79045758
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 06:47:57 -0400
From: Ian Ray <ian.ray@ge.com>
To: peter.senna@gmail.com, martyn.welch@collabora.co.uk,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v3 2/2] MAINTAINERS: Update entry for
 megachips-stdpxxxx-ge-b850v3-fw
Date: Thu, 21 Sep 2023 13:47:51 +0300
Message-Id: <20230921104751.56544-2-ian.ray@ge.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20230921104751.56544-1-ian.ray@ge.com>
References: <20230921104751.56544-1-ian.ray@ge.com>
X-Proofpoint-GUID: rAOlqyy7CsZYbROgj3fkcdfeW56lO8rW
X-Proofpoint-ORIG-GUID: rAOlqyy7CsZYbROgj3fkcdfeW56lO8rW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_07,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 mlxscore=0 mlxlogscore=897 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309210093
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace Martin, who has left GE.

Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf0f54c..31bb835 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13524,7 +13524,7 @@ F:	drivers/usb/mtu3/
 
 MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
 M:	Peter Senna Tschudin <peter.senna@gmail.com>
-M:	Martin Donnelly <martin.donnelly@ge.com>
+M:	Ian Ray <ian.ray@ge.com>
 M:	Martyn Welch <martyn.welch@collabora.co.uk>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
-- 
2.10.1

