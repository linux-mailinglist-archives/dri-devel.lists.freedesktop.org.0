Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059C1FD268
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063636E997;
	Wed, 17 Jun 2020 16:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B4B6E985
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:40:59 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88614D95;
 Wed, 17 Jun 2020 18:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592412054;
 bh=0zWO97i63iiJ2UP2xyaHZ3aWRv0p238hSJCDJLrrZ3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QD7NoOEpoILBgCk0TMYAkvr0EF2cWKbBu9YCjRJKb/zkOGDlEDUg3cr149e2WQc2P
 SDrOwjXMTxUi3T02TB53Eu0o4wj9RNEqF5/PvMVuK1futZx4RuHAYWtamOoFRpKT1z
 wLo9w5MLdboNah5ZaIm/sveUYvqN+YNGX0eFrRic=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 21/22] drm: mxsfb: Remove unnecessary spaces after tab
Date: Wed, 17 Jun 2020 19:40:14 +0300
Message-Id: <20200617164015.30448-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
References: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, robert.chiras@nxp.com, leonard.crestez@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a cosmetic change only, no code change is included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
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
