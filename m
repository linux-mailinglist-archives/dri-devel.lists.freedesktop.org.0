Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5593F4FF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 14:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0D810E3A7;
	Mon, 29 Jul 2024 12:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Z/Hta7Hn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1477510E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 12:17:54 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1722255448; bh=tnmIOvif+vMuCBE3EGoaZf2hukzKj22SPXaah5owu8g=;
 h=From:To:Cc:Subject:Date:From;
 b=Z/Hta7HnbeNlSgYg1U4xfiqxC37/5xnAxHzZWqKx03esDN3CzvP3UzwZbLRduPvpT
 SFqMudQDAhb5QhZobjp8Z7TzWqBtbZlsWBgPs7xLegENZyHvNXiX6BLnj3chsZww5j
 7MQ+oNTvoWWMAkUbecnd1rDe/MrEjaBAi5k1KbqGvsRW6qmPfGPKx9p5OsrAJibOui
 JajHetZU5aXIzBWGMSAU1e8jsYj8HGCqKl2qxFXMF2mWYDqlkK8pTpjGG7Xyb1t3KV
 NGw9xHfwPHkOhAhFx4p5R4xpHwvCu16XZ+4VdxR1gPwcHk4/uEFFfXi2YssckrY2Yy
 v9D/LrQa+D45Q==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46TCHIZr540506; Mon, 29 Jul 2024 15:17:18 +0300
From: Ofir Bitton <obitton@habana.ai>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 sfr@canb.auug.org.au
Cc: jgg@nvidia.com, yaron.avizrat@intel.com
Subject: [PATCH 0/1] Update on habanalabs maintainer status
Date: Mon, 29 Jul 2024 15:17:17 +0300
Message-Id: <20240729121718.540489-1-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
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

Hi Dave, Sima.

As I am about to leave Intel during the next weeks, I'm stepping
down from the maintainer role of the habanalabs driver.

Yaron Avizrat from Intel will replace me as the new maintainer.

Ofir Bitton (1):
  MAINTAINERS: Change habanalabs maintainer

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
2.34.1

