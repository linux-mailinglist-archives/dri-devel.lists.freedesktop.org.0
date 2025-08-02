Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D9B18F83
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 19:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D14910E0B0;
	Sat,  2 Aug 2025 17:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eAKRrtqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C339610E0B0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 17:02:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F1875C3074;
 Sat,  2 Aug 2025 17:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0044DC4CEEF;
 Sat,  2 Aug 2025 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754154143;
 bh=AzapRyBiWriYrOq122HstKBoVFLICyZpLuwOIPeKcbY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=eAKRrtqZ8kzbmYub1dcJZOU9FTaDBADv8/YP4wvqBIVfdGZkeB6Tkh8vk1ua1kcuD
 +A/9nPS9PYuMiTHdYPAc5Hq0no8FzZbFj1lVAs/s8ZRzIRkKQMWz6R1BNBMWCmEMYI
 rYDSozNSWHbr3MZkfJyRPpQJI8GlHe9VR/p4kmxX24nna9MSQzS82qWAzwuCfxlxdE
 gWGHqsleleuca8MvcClvIwy6U/TDS356mRDWqIMXdWXE196lQJe9h9T0SO+71Zlycy
 GJdruiRfkABxUK0sGculoIOAobKvAYeSftoorLyZqPQVliiCZdW4X+qYIYvPQ+saHI
 FAaoHt3leIfYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F4B383BF57; Sat,  2 Aug 2025 17:02:39 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aI3wuBNWPyKhHbnC@p100>
References: <aI3wuBNWPyKhHbnC@p100>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <aI3wuBNWPyKhHbnC@p100>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.17-rc1
X-PR-Tracked-Commit-Id: 81b96e4aef9592493873507eec52eca68f0721ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eacf91b0c78a7113844830ed65ebf543eb9052c5
Message-Id: <175415415789.201848.14590140157219989268.pr-tracker-bot@kernel.org>
Date: Sat, 02 Aug 2025 17:02:37 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

The pull request you sent on Sat, 2 Aug 2025 13:04:24 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eacf91b0c78a7113844830ed65ebf543eb9052c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
