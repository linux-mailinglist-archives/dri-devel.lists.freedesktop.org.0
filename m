Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F5D2CAD5E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B766E02B;
	Tue,  1 Dec 2020 20:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Tue, 01 Dec 2020 20:33:31 UTC
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7492E6E91A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:33:31 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 1 Dec 2020 12:18:28 -0800
Received: from vertex.vmware.com (unknown [10.21.244.133])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id E3CAA20ACA;
 Tue,  1 Dec 2020 12:18:28 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/vmwgfx: add Zack Rusin as maintainer
Date: Tue, 1 Dec 2020 15:18:21 -0500
Message-ID: <20201201201828.808888-1-zackr@vmware.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Roland Scheidegger <sroland@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roland Scheidegger <sroland@vmware.com>

Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee673f7..55e3e2ef5f18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5712,6 +5712,7 @@ F:	drivers/gpu/drm/vboxvideo/
 DRM DRIVER FOR VMWARE VIRTUAL GPU
 M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 M:	Roland Scheidegger <sroland@vmware.com>
+M:	Zack Rusin <zackr@vmware.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://people.freedesktop.org/~sroland/linux
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
