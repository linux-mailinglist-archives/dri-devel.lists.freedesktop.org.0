Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D5C1E8D6F
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687566E9B5;
	Sat, 30 May 2020 03:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6176E99F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:54 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D05B318F;
 Sat, 30 May 2020 05:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808252;
 bh=xtR/ewhQVIoVriN2rnDfIvgQNZEucR3xJd65+5/pWvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JgAtLqT0OYRq3aps4Wmv8ucYM885PVwb/x2lINSTFlHNIKjyt8jvIWfIsVMQYRW2x
 6Qw3hPCpHfmfJzOO3kcTx2nih/Y1D/QMa2mtIy7+L1Qq9fRG0ePtAZicMMyDPg1e7B
 lL3s2PtNf2z5IL6yEwo07bGfTpzXuYaDdR1JW+Ac=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/22] drm: mxsfb: Remove unnecessary spaces after tab
Date: Sat, 30 May 2020 06:10:14 +0300
Message-Id: <20200530031015.15492-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a cosmetic change only, no code change is included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index 607a6a5e6be3..f883b56caed3 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -16,11 +16,11 @@
 struct clk;
 
 struct mxsfb_devdata {
-	unsigned int	 transfer_count;
-	unsigned int	 cur_buf;
-	unsigned int	 next_buf;
-	unsigned int	 hs_wdth_mask;
-	unsigned int	 hs_wdth_shift;
+	unsigned int	transfer_count;
+	unsigned int	cur_buf;
+	unsigned int	next_buf;
+	unsigned int	hs_wdth_mask;
+	unsigned int	hs_wdth_shift;
 };
 
 struct mxsfb_drm_private {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
