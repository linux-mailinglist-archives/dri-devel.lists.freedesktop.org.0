Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E822E3E2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB99E6E161;
	Mon, 27 Jul 2020 02:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3036E135
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:27 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FEC72F14;
 Mon, 27 Jul 2020 04:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815644;
 bh=0zWO97i63iiJ2UP2xyaHZ3aWRv0p238hSJCDJLrrZ3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lTdTpwtyePUffRfjF9B3jNmToIey53ixqYhviKQNfcUFFoG6HYT3mYosx1FSz0dZx
 3jS6fLIZr2PQwq8TR5gEhq++mVk9D7dfaLN+oNovQIBCUOdFtpUsUYfO9FiaoB6ne7
 emnn/9DIi6G+7ptBTVBFbECLat30+XaUb+cljWEI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 21/22] drm: mxsfb: Remove unnecessary spaces after tab
Date: Mon, 27 Jul 2020 05:06:53 +0300
Message-Id: <20200727020654.8231-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
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
