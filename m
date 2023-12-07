Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35FF808280
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E83F10E821;
	Thu,  7 Dec 2023 08:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 316CF10E821
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=JoDdbs1Wrd/5YB34shDi+Os3xSvT1skK3pYG7RWo9/8=;
 b=piEgUb0B0pJoPEnz/h//4n9PcqCUGXky7twxwiMouZIWRHdqNxC9ccnF56Vto+
 Oy15MkxM67x+1DvFHTdhVJFkbhEAkwJ9/Z1y7J3PYgwMXKgm7ubTBAeXFMUrEEcQ
 9UuSJi+LFrhQ9FGEXciAvpqUgzNHuyNoxzpIjxiOVAFfs=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g2-3 (Coremail) with SMTP id _____wDnb9JAfHFlkGmwEw--.43967S2;
 Thu, 07 Dec 2023 16:03:16 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v4 17/17] MAINTAINERS: Add myself as a reviewer for rockchip
 drm
Date: Thu,  7 Dec 2023 16:03:02 +0800
Message-Id: <20231207080302.652839-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207075906.651771-1-andyshrk@163.com>
References: <20231207075906.651771-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnb9JAfHFlkGmwEw--.43967S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr1xtF17uw13Gr1fAF4rAFb_yoW3Krg_WF
 WIq34kXr48CFZ8J3yvk3Z7G3sIyayFyan3Zrn7tw4kAa48XrWDtrZYkr1Ikrn8J3W8KrWq
 vay3Ga43Cr43ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnjQ6PUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBnBs-Xlghl3ZRWwABs1
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
index 788be9ab5b73..e50c47c1d411 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7158,6 +7158,7 @@ F:	include/linux/platform_data/shmob_drm.h
 DRM DRIVERS FOR ROCKCHIP
 M:	Sandy Huang <hjc@rock-chips.com>
 M:	Heiko Stübner <heiko@sntech.de>
+M:	Andy Yan <andy.yan@rock-chips.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.34.1

