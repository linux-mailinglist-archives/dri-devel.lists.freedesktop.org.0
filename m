Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCC7E25DA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054D510E31D;
	Mon,  6 Nov 2023 13:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D4F10E31D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 13:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rnMNDpyxoXuBjO1HpY6K7hls9FBUliCJ2AJyFNMyWfA=; b=o3orki6tPz4bydqIMmSE1YRs+n
 ETFXnyneLCUiO9vbf6VqaZjZRRtLYp80s4qVMh76xpYRUCcqC6qKtf/d8QKkmGyocNT1YUkGdRb6q
 Idu8MZEUb/AHCB0yKO+ftVFu3kkXL9/q5LlfljJtxR52TOhWTD0VkivonsfGxQ0Jl/zTHcinqWZy9
 PQC1U7FUpJpvGsQU5+BXNql/c3TyNgZxJZVEb2pkqB0reFHUxOwHEp+VHv2VZHNHfvRk8e/7w5nrJ
 F3IVoJlu0qYesHQVzn7nhC+NDnvGSeSZmm1ugVQEdN8xgDd2uALMf56WTkeldJaVcxQJ9IlxUmF5Y
 TQnPWlAg==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qzzrv-00Ha6y-Ua; Mon, 06 Nov 2023 14:42:20 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] MAINTAINERS: Add Maira to V3D maintainers
Date: Mon,  6 Nov 2023 10:41:20 -0300
Message-ID: <20231106134201.725805-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've been contributing to V3D with improvements, reviews, testing and
debugging. Therefore, add myself as a co-maintainer of the V3D driver.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f13e476ed803..3213563756cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7108,6 +7108,7 @@ F:	drivers/gpu/drm/omapdrm/
 DRM DRIVERS FOR V3D
 M:	Emma Anholt <emma@anholt.net>
 M:	Melissa Wen <mwen@igalia.com>
+M:	Maíra Canal <mcanal@igalia.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
--
2.41.0

