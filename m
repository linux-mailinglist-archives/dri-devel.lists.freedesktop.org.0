Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9331BBDFB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B6D6E3B0;
	Tue, 28 Apr 2020 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2FD6E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:00:48 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0EB2F401B3;
 Mon, 27 Apr 2020 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587996048; bh=TvL6zgUoy3Ma93zOu8++mMy1EHgdvRORz8x84bfFDmM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Y2BXpQb1pNCWanopEuRgGyuC9Hyv3CNXzfHVjFMXgxbZq181l13fJ1mPrZY3nX+v/
 caPdSdCuzMyF7ubAkxexP5q9nQ1VMu1dBeQi/Pmqe9Vwy+6Vg3HK+fqdBT5mRvnecV
 nXhBtQ/UTN1Tv3d4c2d9+qvZOTlUr2dXfJ/6nbjmY34Twmbd1OVWC9VXR4sQ4pGl1i
 4vNTDqY3eMalrNEVz9U7ndbWfBHd/UC1DLWchVrqr/UnWZ08hPlE3TnVVLyDhSqq8n
 gsqhWb4lvi94BeZHzofioQb5bIZwKYwfvKinVHcFZmvcUk93MvUk0+t4AT9qzyBg3+
 G5ogLAeTtLsjQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6B4D8A006D;
 Mon, 27 Apr 2020 14:00:45 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] MAINTAINERS: Add IPK MIPI DSI Host driver entry
Date: Mon, 27 Apr 2020 16:00:36 +0200
Message-Id: <abe4ca0b0662c17212fc5107080e949f1d3377c1.1587992776.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, David Airlie <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Creates entry for Synopsys DesignWare IPK DRM driver and
adds myself as maintainer.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad29107..9f4ee9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5507,6 +5507,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ste,mcde.txt
 F:	drivers/gpu/drm/mcde/
 
+DRM DRIVER FOR SYNOPSYS DESIGNWARE IPK
+M:	Angelo Ribeiro <angelo.ribeiro@synopsys.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	drivers/gpu/drm/ipk/
+F:	Documentation/devicetree/bindings/display/ipk/
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+
 DRM DRIVER FOR TDFX VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/tdfx/
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
