Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF7B65F463
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 20:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E2910E129;
	Thu,  5 Jan 2023 19:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287310E129
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 19:26:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 151F6B81B32;
 Thu,  5 Jan 2023 19:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1E86C433EF;
 Thu,  5 Jan 2023 19:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672946806;
 bh=s5g0WENZb5vwVZOYV8eJY5ke6jHO1BmPYsSPvs74uc8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=sGthtr9Y87pT0RGc0Es0XVEsdyaLR9+8zLFNLFQV2Lw3B4d/toBBrCWvYvC9AEcNY
 E0mzrZwkvnw+AlIELMqvCS5P9nDwnOH19ymKvk9MROY1lmPv+1Okxss3ISaGWN20DW
 BdWE1UYBFh4EdtZVlvFenYAea7WYrinMYgo+LeT1aB/xAm2WjSmFKHDIYeHfhE1h1Z
 OPJ0iVXyMTTN2i5AodQQgl+jlzon3w2XnJMQplfSj4n2lpfyxOq4Nx+l1gHclT8nVK
 d9s4I+hO5s9C9kJ4KMdh1J48LL03MmPEmvLdfJMeaPXuQ0K0ie/BycgwsdAqL0OlUz
 PF3uHL9RuGnbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8FB2CE5724A; Thu,  5 Jan 2023 19:26:46 +0000 (UTC)
Subject: Re: [GIT PULL - v2] fbdev fixes for v6.2-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y7aweqyDS7EmnDj8@ls3530>
References: <Y7aweqyDS7EmnDj8@ls3530>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <Y7aweqyDS7EmnDj8@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.2-rc3
X-PR-Tracked-Commit-Id: 634cf6ead93988b0da9ac054521ab63a3ba189db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e9af4b42660b2a8db067db8ff03db8a268d6a95
Message-Id: <167294680658.18567.5299201102789509394.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jan 2023 19:26:46 +0000
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

The pull request you sent on Thu, 5 Jan 2023 12:11:54 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e9af4b42660b2a8db067db8ff03db8a268d6a95

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
