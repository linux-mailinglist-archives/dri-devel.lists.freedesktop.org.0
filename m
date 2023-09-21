Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFE7A9383
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C4810E5A8;
	Thu, 21 Sep 2023 10:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
 [67.231.157.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5591010E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:15:41 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
 by m0048204.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 38L3jhnr020091
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 06:15:40 -0400
From: Ian Ray <ian.ray@ge.com>
To: peter.senna@gmail.com, martyn.welch@collabora.co.uk,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 2/2] MAINTAINERS: Update entry for
 megachips-stdpxxxx-ge-b850v3-fw
Date: Thu, 21 Sep 2023 13:15:34 +0300
Message-Id: <20230921101534.53214-2-ian.ray@ge.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20230921101534.53214-1-ian.ray@ge.com>
References: <20230921101534.53214-1-ian.ray@ge.com>
X-Proofpoint-GUID: 3GttbwJHSRXA6giK_WnQviYFo8sH6AS0
X-Proofpoint-ORIG-GUID: 3GttbwJHSRXA6giK_WnQviYFo8sH6AS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_06,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 mlxscore=0 mlxlogscore=897 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309210089
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

