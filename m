Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5978F5DD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 00:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A2810E03F;
	Thu, 31 Aug 2023 22:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF97E10E03F;
 Thu, 31 Aug 2023 22:58:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VMuBtP016084; Thu, 31 Aug 2023 22:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=LeHx/bu9sqzcu7iYGYVOTU8QERkVIKa6K4Xyoea483A=;
 b=CbUBseVo13MM8E0VjdZKk26eFfu75f2WXvfEyzBtKiqbu/ANPNgS65QvE4iORbaxmwql
 4iVGwbYQ+VNPOa0OVW3bwfVgBbh+EvHOhH5drS5xzktzn78GU9qkRi02yDJY2ngLLHvn
 OFLP+1Bo/ZNASB2l8JAc8eZCEKVDMUv4f1Y1fIuwZZ5UJaoRyYEUQFlIh+Z0xJvcPPiW
 L4vRi1JSZRY7m5LLM1l3YTLTvF0haTLhKEPSKtXFTkvCrXc32gtNDEfKPfU6OtE+l4nP
 Ry3unE+StmI7sXe6woOGXmX1BijVbbqykSdajxe9mww6XCWOuEx/xo2UOJ93/qLA7Jik 0Q== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3str1nj0xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 22:57:59 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37VMvwwh023987
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 22:57:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 31 Aug 2023 15:57:57 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <neil.armstrong@linaro.org>
Subject: [PATCH] MAINTAINERS: Add Jessica as a reviewer for drm/panel
Date: Thu, 31 Aug 2023 15:57:36 -0700
Message-ID: <20230831225738.26527-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6xYigDXDExkppwKFHZIV3AaAvV3viZgI
X-Proofpoint-ORIG-GUID: 6xYigDXDExkppwKFHZIV3AaAvV3viZgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_20,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310204
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
Cc: sam@ravnborg.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As I participate more actively in the drm/panel subsystem, I would
like to get notified about new changes in this area.

Since I have contributed and continue to contribute to drm/panel,
add myself as a reviewer for the DRM panel drivers to help the review
process

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60ecad7576ff..797c1823d420 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7096,6 +7096,7 @@ F:	include/drm/gpu_scheduler.h
 
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
+R:	Jessica Zhang <quic_jesszhan@quicinc.com>
 R:	Sam Ravnborg <sam@ravnborg.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-- 
2.42.0

