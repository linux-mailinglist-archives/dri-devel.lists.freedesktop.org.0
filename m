Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6F6E40AA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695910E379;
	Mon, 17 Apr 2023 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Sun, 16 Apr 2023 20:35:49 UTC
Received: from st43p00im-ztfb10061701.me.com (st43p00im-ztfb10061701.me.com
 [17.58.63.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1990310E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1681676969; bh=QOcoWbCcjc4S5ZBNccicx/PEXIx3g1kNuRyf36MJ7dQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=jmZwo9Qkr9SI/MA8gviFhsfb8kCAYV2NQx2LsTm3FzvbenVDtYoKOlWaHwfiamcwz
 9DgJGVqPg3w6Sc3gmRcRxDtKTNrQPYrqrxXxZmm9xPmZPP8OssmOsMam/Mu4rhcvvh
 tpRdMctppZ9zmqO83vJFDjySg00nQyX1BBiCp5rVOX15ixrywTEJUdSz3swCJMzboe
 clUuldfLwvptns5vEZQ1WOpgFYY6WnhTLEmUXm4Z2mHXTKJLaQBW7p1NPzWXLQUtNi
 Cb1Hh1ckTosMiemwj7j4W8aRMB49wa7w4B2HmChjjAB6TyRP2sYsRwAaLpFnwjwvkC
 wQ1tHu9A0qnsQ==
Received: from localhost (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
 by st43p00im-ztfb10061701.me.com (Postfix) with ESMTPSA id
 067712E0FD1; Sun, 16 Apr 2023 20:29:28 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: philippe.cornu@foss.st.com,
	arnd@arnd.de
Subject: [PATCH] MAINTAINERS: Update Alain Volmat's email address for drm/sti
Date: Sun, 16 Apr 2023 22:27:47 +0200
Message-Id: <20230416202747.62479-1-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1xLIxmdQxK7MZgk1QyxRp-bDz1-kadNu
X-Proofpoint-ORIG-GUID: 1xLIxmdQxK7MZgk1QyxRp-bDz1-kadNu
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2020-02-14=5F02,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=687
 suspectscore=0 clxscore=1011 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2304160194
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: linux-kernel@vger.kernel.org, patrice.chotard@foss.st.com,
 dri-devel@lists.freedesktop.org, Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update my email address for maintainer of the STi DRM driver.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e64787aace8..3cec7ad72389 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6952,7 +6952,7 @@ F:	Documentation/devicetree/bindings/display/rockchip/
 F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
-M:	Alain Volmat <alain.volmat@foss.st.com>
+M:	Alain Volmat <avolmat@me.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.34.1

