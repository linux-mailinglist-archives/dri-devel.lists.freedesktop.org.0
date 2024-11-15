Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF379CFD9F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 10:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155C10E15B;
	Sat, 16 Nov 2024 09:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 544 seconds by postgrey-1.36 at gabe;
 Fri, 15 Nov 2024 09:49:55 UTC
Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com
 [111.22.67.139])
 by gabe.freedesktop.org (Postfix) with ESMTP id 46C9E10E82E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 09:49:55 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
 by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16737171f762-fd079;
 Fri, 15 Nov 2024 17:40:48 +0800 (CST)
X-RM-TRANSID: 2ee16737171f762-fd079
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from ubuntu.localdomain (unknown[10.55.1.70])
 by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46737171f3dd-ddfd6;
 Fri, 15 Nov 2024 17:40:48 +0800 (CST)
X-RM-TRANSID: 2ee46737171f3dd-ddfd6
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: robdclark@gmail.com
Cc: quic_abhinavk@quicinc.com, sean@poorly.run, konradybcio@kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhujun2@cmss.chinamobile.com
Subject: [PATCH] drm/msm: Fix spelling mistake "swtich" to "switch"
Date: Fri, 15 Nov 2024 01:40:45 -0800
Message-Id: <20241115094045.7491-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 16 Nov 2024 09:51:27 +0000
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

There is a spelling mistake, Please fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index cab01af55d22..d28fac3fb6a8 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -563,7 +563,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value name="IN_IB_END" value="0x0a" variants="A6XX-"/>
 	<!-- handles IFPC save/restore -->
 	<value name="IN_GMU_INTERRUPT" value="0x0b" variants="A6XX-"/>
-	<!-- preemption/context-swtich routine -->
+	<!-- preemption/context-switch routine -->
 	<value name="IN_PREEMPT" value="0x0f" variants="A6XX-"/>
 
 	<!-- TODO do these exist on A5xx? -->
-- 
2.17.1



