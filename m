Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C7F67A6E1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 00:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EF410E287;
	Tue, 24 Jan 2023 23:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A886E10E287
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 23:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=uT0YqJBPmKZz3fozeGYWLQMLCtqA1Ku+GS9mk6AzqdM=; b=dp37X6xtz89np8/GExSy0zXPiL
 Jb5cQq9yOlyiOxKLUxZ2UaopDWtB6/6EqG6psJDMnIdbaZegFfrUyX+DuNWrezKN2DIcqmyo750+X
 wsuhTxz+Yul0HXGK3oF7T15d3pmOtVHB5QvTJIUqS+QRBJbsz5dpatF7W7ewqjsQHb3rk2rl2ouss
 8yxBxUOBe2Kt/xeF4vG1I5XnpPGrKwxgHc/tSfhLTWjcnYd/BS8nWWnHrUn035Mi5ah4LGsWOsYJ9
 ldG0tTBL3FxS2a49FE1BF6jRo9+d/AL9fY0V2iFo0Tfpgv6nLcgBrz05h/CyS1F8sa7gQ400OtOwb
 Z++1vSXA==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pKSoN-005eDB-5c; Tue, 24 Jan 2023 23:34:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: Kconfig: fix a spelling mistake
Date: Tue, 24 Jan 2023 15:34:42 -0800
Message-Id: <20230124233442.22305-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct a spelling mistake (reported by codespell).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
-- 
 drivers/gpu/drm/bridge/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -326,7 +326,7 @@ config DRM_TI_DLPC3433
 	  input that produces a DMD output in RGB565, RGB666, RGB888
 	  formats.
 
-	  It supports upto 720p resolution with 60 and 120 Hz refresh
+	  It supports up to 720p resolution with 60 and 120 Hz refresh
 	  rates.
 
 config DRM_TI_TFP410
