Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90BA753C7
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 02:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF8610E1FF;
	Sat, 29 Mar 2025 01:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XXYeE0Mn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BB010E1FF
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 01:01:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F4FD439A9;
 Sat, 29 Mar 2025 01:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8B2C4CEE5;
 Sat, 29 Mar 2025 01:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743210074;
 bh=sqiKEDM9mdNJ8ZhtkSRpedz2piPMJrTIfUBcVnm0wuI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=XXYeE0MnBGIpDfBQGvUWD1EdVC033KEdbhDYfQLiNbWRLjXZAK7QWChM0/Aj8dxLX
 hxdbKPZrRbNhThUttUB9xTmzBDWLwBY+TvZOJTljBC58CHq3WIyZJ4Lknk5qJAljOM
 5bfUY+h20y16BivtUP8YkNtEk7UVb/lo2pG/kMLmzRmXphwcXnGi7MWkHhbJ71WZ/S
 pObFcbdVtf8P2hjwObQvXsv+EVHQDmCiwe2F4yZeKIDKlLQp1BRgUX+vyPxhU42Ghq
 sD5QDLxqHWdasH56sSUEqkQVcIvi+wVRldnhRMBuP+qXyH8p2LzXnktllbqoqL1R8y
 KzIbY8XRN84pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 1A290380AA79; Sat, 29 Mar 2025 01:01:52 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-WS-lDPPmxnbG3W@carbonx1>
References: <Z-WS-lDPPmxnbG3W@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-WS-lDPPmxnbG3W@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.15-rc1
X-PR-Tracked-Commit-Id: 86d16cd12efa547ed43d16ba7a782c1251c80ea8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51aad189f8e0f926c0977d180cae6a78df445f27
Message-Id: <174321011079.3019715.58612314047981354.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 01:01:50 +0000
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

The pull request you sent on Thu, 27 Mar 2025 19:03:38 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51aad189f8e0f926c0977d180cae6a78df445f27

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
