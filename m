Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2903217D16E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 05:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638216E26C;
	Sun,  8 Mar 2020 04:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71566E26C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 04:52:46 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (220-133-90-194.HINET-IP.hinet.net
 [220.133.90.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D34712072C;
 Sun,  8 Mar 2020 04:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583643166;
 bh=07rLvQ0WqPhuHx8qZF5jp9yGE4CzHoiFnGAEnIVs0gk=;
 h=From:To:Cc:Subject:Date:From;
 b=m4Zj2xDSjTGoaTSoUSQs6A03ymGE8HVvObv62K525CY3HmsFNgl4Z5A1Z3iGevjsT
 3cvQw3NuBTLUhe8anoVra/G9i1NlTCFUwY9+9+xVVh5i7vPTNKqVNP1fNodUqNOee3
 YH8pFI7s90dQVQ01uqGxnnsCIIQp1kE86Fvz59fk=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] MAINTAINERS: Update Chun-Kuang Hu's email address
Date: Sun,  8 Mar 2020 12:52:01 +0800
Message-Id: <20200308045201.3163-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update my email address to @kernel.org

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f..dceaeebce52a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5607,7 +5607,7 @@ F:	include/uapi/drm/lima_drm.h
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DRM DRIVERS FOR MEDIATEK
-M:	CK Hu <ck.hu@mediatek.com>
+M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
