Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A997BB4A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 13:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0F710E25A;
	Wed, 18 Sep 2024 11:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HLa+huUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC1A10E259
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 11:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E1327A43815;
 Wed, 18 Sep 2024 11:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945BCC4CED0;
 Wed, 18 Sep 2024 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726657811;
 bh=sMliz4gd2eFGqi4kOsHVZgumrrOMtR68PGAmjugcjMU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HLa+huUgVHl4F+elncCOjwwY9h7ORr/YLcUoFyWk4wB8M4+rbrYBWaht5Qs8doHMS
 ii/pDDa7NEjr+mIRAawl7gI7up0/NjnDCQdL3pk4VivbE1bItUkM0j/xaZrbUcKyCS
 kFlTPMewP4L7l1c8YlZ03hChGbp+pAvYvFSbEB82Guoc8AzzYkIGyKwtkXaAdDU+L6
 Aoyp3YFk61xX8YfzQ9s4b10ur3MjFY0x0SAijPDjCp2vbdtf/twBSKEhqDUm7xid0r
 4nk98g/9YQV6zAT3jbSgEmS84JdNP6ifd3iXxFYZ7poaSIS+ZkLRMozR3cwRSHFWfk
 aZGlJuTYkdDVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9E3333806656; Wed, 18 Sep 2024 11:10:14 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZumkJA3zfB8AhDsF@carbonx1>
References: <ZumkJA3zfB8AhDsF@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZumkJA3zfB8AhDsF@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.12-rc1
X-PR-Tracked-Commit-Id: de5e89b6654ea0b021a5737e0f55fc6bed625550
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4960b002ce81f8e51245bfad0fb7eb4103962ff
Message-Id: <172665781355.783948.6236421147987972661.pr-tracker-bot@kernel.org>
Date: Wed, 18 Sep 2024 11:10:13 +0000
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

The pull request you sent on Tue, 17 Sep 2024 17:45:40 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4960b002ce81f8e51245bfad0fb7eb4103962ff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
