Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E6F918293
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA310E8AD;
	Wed, 26 Jun 2024 13:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WGxX/tQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002E110E8AD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:35:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 580E9619FD;
 Wed, 26 Jun 2024 13:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831EDC32782;
 Wed, 26 Jun 2024 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719408918;
 bh=/f7qXJRAQAHwAWa526EQGIlJOvnCKod+JBCXhprTJl8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WGxX/tQ535wBYJrTvCEBxdUcJdDU2wG4w/cALO73RVMqPEOSv8vF5Lq69tQ+261Rn
 rUKZHcTI0NU5mrRfXK+2sJgIddVDBQjXtv2pGbe8vfj1/9/5+dV8NLsQ+R3G2Ai47V
 f6Ftby9yzajYJV1owvL4VOEIX6GjgWAwA0bRT8xPTK3wuNz8Bwcagvl0MznMDf10dj
 +skPVWTMaojKiPmkrunV2nXJD91HMC3Bv+PsNjpulnmnDnd5t/DcTBVEqEVqWwWt8k
 8GPp7nFGaHr0VZ+99iSZAw+sxXW1xE1zWUa5ax7oXnsQNTIkJizRWbyE6UDw8QjdzB
 ZjtQUDdxGHD1A==
From: Maxime Ripard <mripard@kernel.org>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH v2 1/2] MAINTAINERS: drm: vc4: Add Raspberry Pi
 as maintainers
Date: Wed, 26 Jun 2024 15:35:10 +0200
Message-ID: <171940890753.2204713.7508698225650706276.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
References: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Fri, 21 Jun 2024 14:19:25 +0100, Dave Stevenson wrote:
> Add myself as maintainer for VC4 alongside Maxime, and
> our internal review list as reviewer.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
