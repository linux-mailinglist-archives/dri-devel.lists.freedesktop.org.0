Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA90612C43
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 19:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9546F10E0BB;
	Sun, 30 Oct 2022 18:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B11810E0BB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 18:34:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B06EAB80DA7;
 Sun, 30 Oct 2022 18:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6394CC433D6;
 Sun, 30 Oct 2022 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667154885;
 bh=Kdx/aQdgYf1+FBPYtOWMrOrqkh6NJT68OlABNPE/Wow=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GYnhGpdM0837slfoJ1UrpV7L4CAu+SVD/Oh455f21wQfB1qAaDXPW4g5eZjRIwyw7
 p6qUHoO6PrWW52PqRXVNCbBWPxmSXhymWYso1M7rV8pwfYJqcE2uQXngKRmLKcvLaC
 yfG64y3gGy5MYeQGhYq1Y49KSDVNezecl0WflPRW5bv801nN44WD9C8VWI8cjSGPfz
 WnIelbfLnATVh4n0XrKK99Bk0UJ8l6s/REb98wvFyw3rgCfw+jQXA/sBrO5VUT+JWF
 FzbDM1l8CYaklluAn25INqg/bHxrg5wXIx9xylEfK90SOdiLWFLLhu3AsPHB/Bp8Dc
 IWDTZqIxp6pHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 51131C4166D; Sun, 30 Oct 2022 18:34:45 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes for v6.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y16vjgbo+tx6lArZ@ls3530>
References: <Y16vjgbo+tx6lArZ@ls3530>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <Y16vjgbo+tx6lArZ@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.1-rc3
X-PR-Tracked-Commit-Id: 3c6bf6bddc84888c0ce163b09dee0ddd23b5172a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b72018ab8236c3ae427068adeb94bdd3f20454ec
Message-Id: <166715488532.31922.18039345236961645035.pr-tracker-bot@kernel.org>
Date: Sun, 30 Oct 2022 18:34:45 +0000
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sun, 30 Oct 2022 18:08:30 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b72018ab8236c3ae427068adeb94bdd3f20454ec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
