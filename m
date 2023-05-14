Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B151701AFA
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 02:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B8A10E032;
	Sun, 14 May 2023 00:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED84E10E032
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 00:52:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 652E061532;
 Sun, 14 May 2023 00:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7B1EC433EF;
 Sun, 14 May 2023 00:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684025547;
 bh=qxamtKkRAoZRHqoBvnHzvqyqOuFPnLjYtgmn7P8WFYM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=N4c8ir2u1g9MR8bOjhZnyjqCMskRiD6+ADwl9Ng2PcOpB9eoskJhQRM74FtcJWZ2l
 rDsL7M0wFY6AOIAthdL0BPg549FzBEVz+a3bbuxLTplQH9+g3+21wfvXPpyr/JQLm2
 bWjqW5tkJMF4m6yn6yF1DZ3zEynauB6+a+rNXa7JRd8LAkWnM/CgHfTbt1WSiaSe+s
 /po3uO/SNZdCWLgbZ2GEQ4CgDJged0yA2NSkzM1+Nf2cj82TU5kU/lCtcv590+7i7a
 LY+tNVOZ4OKTzvcQivMuds2+yaD36QDkK4bkfg1eJ14pkoBoKDLRSnjC67Y/Kfg5bv
 PzjQG9sHKvMng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B2E17E49F61; Sun, 14 May 2023 00:52:27 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZGAd+wWXxlA+zvSs@ls3530>
References: <ZGAd+wWXxlA+zvSs@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZGAd+wWXxlA+zvSs@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.4-rc2
X-PR-Tracked-Commit-Id: 0bdf1ad8d10bd4e50a8b1a2c53d15984165f7fea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: adfbf653a3ba6bb8bbb84ed90bf4f1533db545d3
Message-Id: <168402554772.23680.10459468742364825475.pr-tracker-bot@kernel.org>
Date: Sun, 14 May 2023 00:52:27 +0000
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

The pull request you sent on Sun, 14 May 2023 01:32:11 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/adfbf653a3ba6bb8bbb84ed90bf4f1533db545d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
