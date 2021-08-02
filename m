Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D03DD134
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 09:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035636E45D;
	Mon,  2 Aug 2021 07:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486026E18F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 06:43:39 +0000 (UTC)
X-QQ-mid: bizesmtp54t1627886166t1wjxynb
Received: from localhost.localdomain (unknown [113.89.245.207])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 02 Aug 2021 14:36:05 +0800 (CST)
X-QQ-SSF: 01100000002000208000D00A0000000
X-QQ-FEAT: OsimOZKSvxonSGGczXtaA2ObroLm+KKPf8cxqLSqbTpMC1VmB56KQeitaVuyo
 PbrETuEBDbFwWfzGajnbpETYB8L32VkCk1Ywz6f03gNyxwC0MayMaq+ZLM8WokFroxQ0Gn4
 OPo/f1UW1ZXac+UwkbwnYh0e5x2WtvkwIpAwtHLpmg1MeWlkodytM4oU3xeAbQTHwygcbgC
 W9/XF1qrdT6vr0B4ZBVbUMBN65JZLQMFXowF0XLSk0+yggOQN4Ph0iGH9QNR3GSCOAEqy4L
 yGA4ksYyJMm+NPon0oUmMVgH1WeXFld6GMwhGm6xamzKB15g2V10TNY4lbBj53tO5CUgPpI
 Q7DPIQf/p9DwT0cdOkaHfSp5EgrSQ==
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@sipeed.com>
Subject: [PATCH 4/4] MAINTAINERS: add simple-dbi driver
Date: Mon,  2 Aug 2021 14:35:38 +0800
Message-Id: <20210802063538.75583-5-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210802063538.75583-1-icenowy@sipeed.com>
References: <20210802063538.75583-1-icenowy@sipeed.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1
X-Mailman-Approved-At: Mon, 02 Aug 2021 07:32:22 +0000
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

As I pushed the simple-dbi driver, add myself as the maintainer now.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a00771b9fe2..e05c4910c062 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5803,6 +5803,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
 
+DRM DRIVER FOR GENERIC MIPI-DBI LCD PANELS
+M:	Icenowy Zheng <icenowy@sipeed.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/simple-dbi.yaml
+F:	drivers/gpu/drm/tiny/simple-dbi.c
+
 DRM DRIVER FOR GENERIC USB DISPLAY
 M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
-- 
2.30.2

