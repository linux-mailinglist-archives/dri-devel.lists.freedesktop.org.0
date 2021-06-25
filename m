Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DB43B4AF9
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 01:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6914E6E09C;
	Fri, 25 Jun 2021 23:39:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCE36E09C;
 Fri, 25 Jun 2021 23:39:08 +0000 (UTC)
IronPort-SDR: xt9BAR5FV16Zz4z34/qYAzpQ1fewnmEjek0AAf5VDOqZlDFDzD9M02VAPkoDdyVka/jEIBXm5Z
 xy0/hc152ndw==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="194900483"
X-IronPort-AV: E=Sophos;i="5.83,300,1616482800"; d="scan'208";a="194900483"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 16:39:05 -0700
IronPort-SDR: i8U5WcHskJhxGvzE1KgMfAYgeLqbtcBS4oGUXIjieH/paRLRAV1OQ3FMunedEEVlcTcxEDrI27
 lJgv6/QzaPSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,300,1616482800"; d="scan'208";a="453975005"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 25 Jun 2021 16:39:03 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [CI] PR for new GuC v62.0.3 and HuC v7.9.3 binaries
Date: Fri, 25 Jun 2021 16:39:03 -0700
Message-Id: <20210625233903.1567481-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit 0f66b74b6267fce66395316308d88b0535aa3df2=
:=0D
=0D
  cypress: update firmware for cyw54591 pcie (2021-06-09 07:12:02 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://anongit.freedesktop.org/drm/drm-firmware adlp_updates=0D
=0D
for you to fetch changes up to 38983b6f28e0b217aedd7c5430081a60d6591732:=0D
=0D
  drm/i915/firmware: Add GuC v62.03 for ADLP (2021-06-25 11:51:11 -0700)=0D
=0D
----------------------------------------------------------------=0D
Anusha Srivatsa (2):=0D
      drm/i915/firmware: Add HuC v7.9.3 for TGL=0D
      drm/i915/firmware: Add GuC v62.03 for ADLP=0D
=0D
 WHENCE              |   7 +++++++=0D
 adlp_guc_62.0.3.bin | Bin 0 -> 336704 bytes=0D
 tgl_huc_7.9.3.bin   | Bin 0 -> 589888 bytes=0D
 3 files changed, 7 insertions(+)=0D
 create mode 100644 adlp_guc_62.0.3.bin=0D
 create mode 100644 tgl_huc_7.9.3.bin=0D
