Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270B2DBC62
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F0F89893;
	Wed, 16 Dec 2020 08:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7E89893
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 07:59:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BG7xj9f023354;
 Wed, 16 Dec 2020 01:59:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608105585;
 bh=aF/mhEwgmyuoZXdboblpZjH07AibWP+CYku1ROFLWoU=;
 h=From:To:CC:Subject:Date;
 b=mrfnFLezTmeWrlKwc/ez7Z/3GDr1JA1WvOeJbHkYQIfs6PQ1D9brCjxvdF5evfFyO
 BXhbvV6+oCKYMCwFfGDH7qAS4H8XCtD2gZvzTuYsIbRyk5vht0lhE/f647nN/prxCF
 jWKniTkLi1ED87RltXOVrd2xGBZfhzlZ4H84UeCE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BG7xjDa102617
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 01:59:45 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 16
 Dec 2020 01:59:45 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 16 Dec 2020 01:59:45 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BG7xh22062816;
 Wed, 16 Dec 2020 01:59:43 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 <jyri.sarha@iki.fi>
Subject: [PATCH] MAINTAINERS: Update addresses for TI display drivers
Date: Wed, 16 Dec 2020 09:59:17 +0200
Message-ID: <20201216075917.17481-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, tomba@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the maintainer email addresses for TI display drivers.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 281de213ef47..c21471497a18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5932,8 +5932,8 @@ F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
 F:	drivers/gpu/drm/stm
 
 DRM DRIVERS FOR TI KEYSTONE
-M:	Jyri Sarha <jsarha@ti.com>
-M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
+M:	Jyri Sarha <jyri.sarha@iki.fi>
+M:	Tomi Valkeinen <tomba@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -5943,15 +5943,15 @@ F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
 F:	drivers/gpu/drm/tidss/
 
 DRM DRIVERS FOR TI LCDC
-M:	Jyri Sarha <jsarha@ti.com>
-R:	Tomi Valkeinen <tomi.valkeinen@ti.com>
+M:	Jyri Sarha <jyri.sarha@iki.fi>
+R:	Tomi Valkeinen <tomba@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/tilcdc/
 F:	drivers/gpu/drm/tilcdc/
 
 DRM DRIVERS FOR TI OMAP
-M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
+M:	Tomi Valkeinen <tomba@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/ti/
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
