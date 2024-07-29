Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC893F4FE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 14:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4AA10E3A2;
	Mon, 29 Jul 2024 12:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="ggZkLv3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4062D10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 12:17:48 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1722255451; bh=aNa/8knRw4MxPkdgNaHGL3/rnMqufhdnerVUeIvW5wk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ggZkLv3JYbhghVVkJTM2JWAqpXCd+MJBYwZ0okDjqcS5ax5zWp+JEu8yHeNoXo9WD
 /hF6O8z9xtMB2jA+SGsAi7YD4/X3W1FdIE8hewEUbEnzZvmXjEpcs7x9l/4NpjLMeE
 t+w1AjFY2GK7ZKOGsnchBx9cDRla8GEDoJLYvmudSuNtcTpuYV3kTdRJM2Gc3+kVj8
 nAq7OlKYvKhBYu6Uq8BO5cqtMtLy251lKJbuKVbULcwHL7dNYYH8QPsxwihGo5XDgj
 ugSjmC8PFkEi+xG9U+zc4dtIhzY2RYuznqEDuYxzG2IgNThPowywiubhJWRbphalQQ
 eRuqVGr8CenUA==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46TCHIZs540506; Mon, 29 Jul 2024 15:17:19 +0300
From: Ofir Bitton <obitton@habana.ai>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 sfr@canb.auug.org.au
Cc: jgg@nvidia.com, yaron.avizrat@intel.com
Subject: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
Date: Mon, 29 Jul 2024 15:17:18 +0300
Message-Id: <20240729121718.540489-2-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729121718.540489-1-obitton@habana.ai>
References: <20240729121718.540489-1-obitton@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I will be leaving Intel soon, Yaron Avizrat will take the role
of habanalabs driver maintainer.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ed2d2dbcec81..a4b36590061e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9599,7 +9599,7 @@ S:	Maintained
 F:	block/partitions/efi.*
 
 HABANALABS PCI DRIVER
-M:	Ofir Bitton <obitton@habana.ai>
+M:	Yaron Avizrat <yaron.avizrat@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 C:	irc://irc.oftc.net/dri-devel
-- 
2.34.1

