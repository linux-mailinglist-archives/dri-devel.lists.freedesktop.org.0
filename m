Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301117417C8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 20:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3878B10E382;
	Wed, 28 Jun 2023 18:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AA210E382
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 18:06:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35SHrtkw003303; Wed, 28 Jun 2023 18:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Vf+gMe3gDaEuOiUszMmoo8Fn0AAsQrdDmiENOUVV52M=;
 b=Z4XRHAiLs26tipb5uqvuxxs6LlYnD2eiwqjjWfEIZR2QSizEemp0PSumYh/rPfoLUoBK
 Y9gCbxGJS5IUSWtkN6Kc2TSvh1ktWBCluKitzUykpn9dm9o6EdULU7kHLEz+QgpQTEVk
 2nRziCKL84OaMW7c8GQJaiI/1ZoWKjU5UGm8bgwNsTc01J2LGGjmk7I6q86csZxptsfa
 bq37bZqu7/vOKmhyE5rLpeYibyXMXN3ucRuXipe2L3rCLggsX89KUaA65DLDTzMnXrkn
 GPn/zZS6Ug5EfwKpnFbjcMKEkoIGmaEErhsxWGvrKI1JmFGpjn81PZfFXsrQA3oApO5/ Cw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rgetphky9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 18:05:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35SI5pVg017969
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 18:05:51 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 28 Jun 2023 11:05:50 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <labbott@redhat.com>, <Brian.Starkey@arm.com>, <jstultz@google.com>,
 <andersson@kernel.org>
Subject: [PATCH] MAINTAINERS: Remove Liam Mark from DMA-BUF HEAPS FRAMEWORK
Date: Wed, 28 Jun 2023 12:05:34 -0600
Message-ID: <20230628180534.31819-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VGaYmJbqHHfVXnxMwLw7rdShKmQFuLe6
X-Proofpoint-GUID: VGaYmJbqHHfVXnxMwLw7rdShKmQFuLe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_12,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=693 spamscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280161
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
Cc: linaro-mm-sig@lists.linaro.org, Jeffrey
 Hugo <quic_jhugo@quicinc.com>, linux-media@vger.kernel.or,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@codeaurora.org email addresses are no longer valid and will bounce.

I reached out to Liam about updating his entry under DMA-BUF HEAPS
FRAMEWORK with an @codeaurora.org address.  His response:

"I am not a maintainer anymore, that should be removed."

Liam currently does not have an email address that can be used to remove
this entry, so I offered to submit a cleanup on his behalf with Liam's
consent.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 76b53bafc03c..1781eb0a8dda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6168,7 +6168,6 @@ F:	kernel/dma/
 DMA-BUF HEAPS FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
-R:	Liam Mark <lmark@codeaurora.org>
 R:	Laura Abbott <labbott@redhat.com>
 R:	Brian Starkey <Brian.Starkey@arm.com>
 R:	John Stultz <jstultz@google.com>
-- 
2.40.1

