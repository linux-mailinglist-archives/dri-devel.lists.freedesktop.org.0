Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF31C39A5C2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB236E857;
	Thu,  3 Jun 2021 16:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484486E575;
 Thu,  3 Jun 2021 16:30:22 +0000 (UTC)
IronPort-SDR: pOFBye+76RMxSgz+NbV6jP5RD9He8i+QBnntwb5BWkAZgYAGAECxoGIOjopn46uYSrdpjMlBrN
 EnA83jGuxe5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="203897382"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="203897382"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:30:20 -0700
IronPort-SDR: cOQADPy+xNULhYyV32H8PzxxDAFCVtMZHcmw048svqSUgVbbl/4gKBIrxYkINJjwKKcvvHzDgr
 1Gny6Py0xGvg==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="480285239"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:30:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/1] Use platform specific defaults for GuC/HuC enabling
Date: Thu,  3 Jun 2021 09:48:11 -0700
Message-Id: <20210603164812.19045-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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

Reviewed a long time ago, resending for CI + to dri-devel.

John Harrison (1):
  drm/i915/uc: Use platform specific defaults for GuC/HuC enabling

 drivers/gpu/drm/i915/i915_params.c | 2 +-
 drivers/gpu/drm/i915/i915_params.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.28.0

