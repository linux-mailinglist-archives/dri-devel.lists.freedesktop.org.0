Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A840A6FB261
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 16:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8B210E2CC;
	Mon,  8 May 2023 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2AB10E2CC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 14:14:19 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QFNZf3b5PzDqH8;
 Mon,  8 May 2023 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1683555258; bh=xjLi8otpsO/6SHn6sDWygyoBsEGLeTNSCfDBJz5U3uk=;
 h=From:To:Cc:Subject:Date:From;
 b=FchiBQ0wnwpwSBIwBlaAIVRjElH+vjdH0+z9T32xAsk+s3gLRjd90HY25B/SR7u5H
 5xtxlNqiv/y7TJbQO5E+O4qSy5kiKg0Yc+RVyD38GzQ6GmjR970jrFURMrfDYIii2d
 kFRV8mpmgDTd2KOUk4+ZszOY822m3Khevsr8CFAI=
X-Riseup-User-ID: B3EC3C098B7909A584E61C762005B098961C593F0E50863A16C33812F51BE315
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4QFNZb4XSjzJq7D;
 Mon,  8 May 2023 14:14:15 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH] MAINTAINERS: Add Maira to VKMS maintainers
Date: Mon,  8 May 2023 11:10:39 -0300
Message-Id: <20230508141038.327160-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've been contributing to VKMS with improvements, reviews, testing and
debugging. Therefore, add myself as a co-maintainer of the VKMS driver.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 276298cfc7ee..63e9b1e8c113 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6721,6 +6721,7 @@ F:	drivers/gpu/drm/udl/
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
 M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
 M:	Melissa Wen <melissa.srw@gmail.com>
+M:	Maíra Canal <mairacanal@riseup.net>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
 R:	Daniel Vetter <daniel@ffwll.ch>
 L:	dri-devel@lists.freedesktop.org
-- 
2.40.1

