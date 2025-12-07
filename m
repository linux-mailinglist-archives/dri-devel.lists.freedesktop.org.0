Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABFDCAAFB6
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 01:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8729D10E315;
	Sun,  7 Dec 2025 00:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jXOhY9PC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1069110E315
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 00:30:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BFCF76013D;
 Sun,  7 Dec 2025 00:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73518C4CEF5;
 Sun,  7 Dec 2025 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765067403;
 bh=/wIqNsbddTbTJvTxffaNLl/GC641Zm08IRIfWEIrL7c=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jXOhY9PC7YbnwaWXKpQovKfPovfYjj2cCLZ31sdvLaKxpRN44D8K+PA1T+czRIlq6
 2dWnc9M8BNYM+HUKkF/zs0rsDPTWKBmbJxabOITzJrBY64tvM9A/eusEQvcZC3wOa4
 XfiR8KT5I4x8pXTao5ysH3mGLI9VN9BxUbCaBhmuVEdXfDjWMWIq06tadLoJtZwvbZ
 T/Xro2ak/wozAPw5lu9QL+SWA0lsfCnPbzG4ehZ+WULVm2PQmJHNcUZctzIDFjmEeU
 4eBUCWotsxBb+6rMkzGvq7Ob9D0TTAofsOXJZkpwM1POLn55F3xvyFNLHTwGPs7QuD
 GSl8MTKXszEjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 78B9C3808200; Sun,  7 Dec 2025 00:27:01 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes for v6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aTSVGN47DAA1AvGH@carbonx1>
References: <aTSVGN47DAA1AvGH@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTSVGN47DAA1AvGH@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.19-rc1
X-PR-Tracked-Commit-Id: 164312662ae9764b83b84d97afb25c42eb2be473
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d1d44032f7b8b9edb14e82315fdf504740940c1
Message-Id: <176506721993.2244723.5295017210633049557.pr-tracker-bot@kernel.org>
Date: Sun, 07 Dec 2025 00:26:59 +0000
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

The pull request you sent on Sat, 6 Dec 2025 21:42:00 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d1d44032f7b8b9edb14e82315fdf504740940c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
