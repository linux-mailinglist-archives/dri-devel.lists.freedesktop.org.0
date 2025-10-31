Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A9C23108
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 03:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEF010EAAE;
	Fri, 31 Oct 2025 02:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KNCh1po7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8320410EAAE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:52:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 96468605E9;
 Fri, 31 Oct 2025 02:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477FAC4CEF1;
 Fri, 31 Oct 2025 02:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761879138;
 bh=Im42M7xRtyqFPfkNVVAoSWnaaqGHk49ypPzrZStjFNg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KNCh1po7Yo7CtDxuVcpeW2kaFDTX14DlKRQd3vW4hAehBd4srDwPAx9011GxFBrlK
 f4tZ9uCDC3iG+nepjolCrGGQ/cuVhoDt+XCrWmDrjoRbUNzQseUeuZx5L84H5DWUcM
 RMOxHJENL8KOUuNs36a3BusOQdP9xh9HBaIwhnJ6Oi7vG0ZkFjEwVidTcTsxc+4WaK
 Aymzq2TvVRpd//db029Bl2MTyi60hnWHlH49IdUE9b4fUhbSnZC/vcK3vz7ZAmPE6g
 KGXy0ocPouiyqLJviTY1UE0f7CclIBkanGqPTSxGLzC+IcIXWt823K7deE7Lfyu1hT
 Fu5FPr9IJMfyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ECB633A78A76; Fri, 31 Oct 2025 02:51:55 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes for v6.18-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aQOOz7Q27BbUo-_4@carbonx1>
References: <aQOOz7Q27BbUo-_4@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aQOOz7Q27BbUo-_4@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.18-rc4
X-PR-Tracked-Commit-Id: 7073c7fc8d8ba47194e5fc58fcafc0efe7586e9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a4819ac1913e78e41c8406df481a661d9469c350
Message-Id: <176187911454.4119220.5294540368410183025.pr-tracker-bot@kernel.org>
Date: Fri, 31 Oct 2025 02:51:54 +0000
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

The pull request you sent on Thu, 30 Oct 2025 17:14:07 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.18-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a4819ac1913e78e41c8406df481a661d9469c350

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
