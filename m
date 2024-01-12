Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4282C7F2
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EA510EB84;
	Fri, 12 Jan 2024 23:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBF310EB95
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:25:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E65B61DBD;
 Fri, 12 Jan 2024 23:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9C90C433C7;
 Fri, 12 Jan 2024 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705101926;
 bh=K1MidH5sVBEyKNuPJH4olazqJE8kNJXKjQSNh6ZQ3dk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ebIg9RVYTpaZRq16zZ3v40lHfqgy4W9+ONkNeRhH0ZAv/opFgqF72oDxQDyk8fPMq
 TnGAOtC6xqFzlI7omvgUyEb8BgUYlJ5LKaqlXSy/g84SQyUNl7VRKeB4g4AMvR2b2c
 caERKRd6Fi786F0Fd6Gnq2dLYNK2Zt1Z18frQ3A/0tDP+zu5c50/SCn8AfEMBfoyTr
 R8NGIo7qrcJdZy7QI2udRER3BeGiVMMHXIG/b0tEHRajtjGm5H75QLIOlyssFlCWu5
 Ii+QOWh9fmKrSPBmMmHpiIxU+xVGHubdOQ+W34pw7jgTuAyXZNxbQ6xWFJc3wA49e2
 JlV8at917Q5vQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C15E0D8C96D; Fri, 12 Jan 2024 23:25:26 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.8-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZaFfWY-bB_b9dGrO@carbonx1>
References: <ZaFfWY-bB_b9dGrO@carbonx1>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZaFfWY-bB_b9dGrO@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.8-rc1
X-PR-Tracked-Commit-Id: 689237ab37c59b9909bc9371d7fece3081683fba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d97a78423c33f68ca6543de510a409167baed6f5
Message-Id: <170510192678.16457.5931859299348612306.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jan 2024 23:25:26 +0000
To: Helge Deller <deller@kernel.org>
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
Cc: Dave Airlie <airlied@redhat.com>, linux-fbdev@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 12 Jan 2024 16:48:41 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.8-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d97a78423c33f68ca6543de510a409167baed6f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
