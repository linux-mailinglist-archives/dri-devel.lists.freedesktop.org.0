Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8322B9B0CB0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 20:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D46A10EB68;
	Fri, 25 Oct 2024 18:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QsaCGM3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB6610EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 18:10:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 557BF5C5F82;
 Fri, 25 Oct 2024 18:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB02C4CEE7;
 Fri, 25 Oct 2024 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729879823;
 bh=8sijDT/Ff+1t0myfCntf06u9CjTz1M02ecQUg3/BSkg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QsaCGM3qi+l3fCu6h+96IUWCyVhcjWle3QErjT0ERDy5GnVYHFsCFWvO3idBjTi+X
 D0DDqjibSqDjHAzfT0aL3433rv3zmEbBc7ZbyJ0L6KdNfGGup1NanC2RwULsJAsqBg
 8RHnCg2PkhHx/fjOS7dv+pgd+Dx835NWI2Wv1dbILYxVR7/xm58oql3SeIN677XZPR
 Uh0XHPF/6rmbU626om+ufzSRwiCosg9uL32NPgEgspFFcsZlyQSGTkonbb48vq63Gn
 eh8Rsjtk6i0vloW3zCg5wCy4zayCHA+Bxuy1mtbKj58RFFvrifSMDcwrEkMuQMOCIR
 kzjDjvhdsjPdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 65A553809A8B; Fri, 25 Oct 2024 18:10:31 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev late fixes for v6.12-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZxvBfDuqSC_TEM78@carbonx1>
References: <ZxvBfDuqSC_TEM78@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZxvBfDuqSC_TEM78@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.12-rc5
X-PR-Tracked-Commit-Id: 51521d2e2c35959cc70a62ccddf694965e29c950
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86d6688e6099594e732841ddad69fad196e95245
Message-Id: <172987983019.2993589.17998271439482235659.pr-tracker-bot@kernel.org>
Date: Fri, 25 Oct 2024 18:10:30 +0000
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

The pull request you sent on Fri, 25 Oct 2024 18:04:12 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.12-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86d6688e6099594e732841ddad69fad196e95245

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
