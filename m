Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260CB02852
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E2E10E3D6;
	Sat, 12 Jul 2025 00:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NgvinlAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81EF10E3D6
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:28:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A9635A550E5;
 Sat, 12 Jul 2025 00:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A39FC4CEED;
 Sat, 12 Jul 2025 00:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752280135;
 bh=oHdR+rd9ayhYY+O+Ztg6B70LwIfaZNbmLd6g5Ym5x8c=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=NgvinlAYB4AolRn5uRkduZfyQKbbnnFHRQ8Ta00mOT2ZbBz/2RiXB19x3GeSrRsKR
 memI7TXE5RpNARY4REE3MOJ2iHep+UhYgYxW6XRMYeaEuD62wE0/2i9Vu8nLlRX1xO
 dIafVi0FWT+TeVzvh4pLmqrJbDLMZ5JfICRWGv7Z/eucYPmdbSctstsUlhocNqQa93
 94yZecR6w+xBIyQNP8+bF2Ij44B5WnaB5ugS9bhhWEPLQAhwZIx250KiQ9VusMfzB0
 QdoiF/i1qfQgf5NBAj013537O9mY9VablhCSWjv6LQSJYUa3/lP42fJFROS9vEtSmN
 3g/pe+zcwog+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C6E383B275; Sat, 12 Jul 2025 00:29:18 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for 6.16-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aHGMDdZNDhjND0iT@phenom.ffwll.local>
References: <aHGMDdZNDhjND0iT@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aHGMDdZNDhjND0iT@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-07-12
X-PR-Tracked-Commit-Id: b7dc79a6332fe6f58f2e6b2a631bad101dc79107
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c2fe27971c3c9cc27de6e369385f6428db6c0b5
Message-Id: <175228015714.2445691.7721712957105667270.pr-tracker-bot@kernel.org>
Date: Sat, 12 Jul 2025 00:29:17 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
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

The pull request you sent on Sat, 12 Jul 2025 00:11:25 +0200:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c2fe27971c3c9cc27de6e369385f6428db6c0b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
