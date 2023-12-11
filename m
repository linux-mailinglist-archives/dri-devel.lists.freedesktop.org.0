Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016980C8CD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 13:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2493E10E3D1;
	Mon, 11 Dec 2023 12:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
 by gabe.freedesktop.org (Postfix) with ESMTP id F280E10E3D1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=EZVVJRwESSfyxJj8cjY5o4AEGpnzdaLjkCRiW1DtUyM=;
 b=lilYDK4Rvv0jvU84xq4OPY6MN4B+MwwXJwm2cWWAM7seJv2e32u0Ug3eUOh+20
 7LIOt3WqOb0a8Zz5lYO7zWFCmR1wbAzTwiNdSOD66acS26Bd9WAw1xJ/382OmOM5
 xdwiW8X13geDiLqLrGirC9f5aL6fJLW1S9n/Skcl5xvNM=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g3-3 (Coremail) with SMTP id _____wDXvx3Z+XZl3Fm+Dw--.13317S2;
 Mon, 11 Dec 2023 20:00:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v5 16/16] MAINTAINERS: Add myself as a reviewer for rockchip
 drm
Date: Mon, 11 Dec 2023 20:00:23 +0800
Message-Id: <20231211120023.1785687-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211115547.1784587-1-andyshrk@163.com>
References: <20231211115547.1784587-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=all
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXvx3Z+XZl3Fm+Dw--.13317S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-nmiDUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBnAtDXlghl75lJwABsZ
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

As I am familiar with all the details of vop2 display
architecture, I can help review and test all related
changes in this subsystem, so add my email here to make
sure I get CC'd on rockchip drm changes.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e2c6187a3ac8..ef58773071fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7141,6 +7141,7 @@ F:	include/linux/platform_data/shmob_drm.h
 DRM DRIVERS FOR ROCKCHIP
 M:	Sandy Huang <hjc@rock-chips.com>
 M:	Heiko Stübner <heiko@sntech.de>
+M:	Andy Yan <andy.yan@rock-chips.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.34.1

