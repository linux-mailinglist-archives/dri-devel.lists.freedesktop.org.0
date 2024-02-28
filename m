Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F109B86AC13
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37F510E0BB;
	Wed, 28 Feb 2024 10:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cNzLz3FJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4C410E221
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:22:59 +0000 (UTC)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DCE4672;
 Wed, 28 Feb 2024 11:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709115765;
 bh=NBJT+xyPCWOCTM9woSQ3m6Gr/j51oDt0MLOi0JvKSyw=;
 h=From:To:Cc:Subject:Date:From;
 b=cNzLz3FJG2PIim2J7ijZ0Z0mu7jrfvzKLwhzmHnY3ljM+9ybCFz35SFgfgyOfQtR5
 VKQKpE+KmWTCVxbUnnNddghuJkw/xm8eps0U64Kw0ihuKNjDofaUagOKN4ugDARrKf
 7KJf3gOa6AZTOD3T28KCos1roS2jTytj3W2voNew=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
Subject: [PATCH 0/2] drm/fourcc.h: Add libcamera to Open Source Waiver
Date: Wed, 28 Feb 2024 11:22:42 +0100
Message-ID: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
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

As suggested by Sima, add libcamera to the list of projects to which the
Open Source Waiver notice applies.

To maintain the paragraph readable, make a list out of the projects to which
such notice applies.

Jacopo Mondi (2):
  drm/fourcc.h: List of Open Source Waiver projects
  drm/fourcc.h: Add libcamera to Open Source Waiver

 include/uapi/drm/drm_fourcc.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

--
2.43.2

