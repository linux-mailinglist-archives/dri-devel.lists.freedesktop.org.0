Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8ED4E5BE1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 00:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDA010E1B3;
	Wed, 23 Mar 2022 23:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9DD10E1B3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 23:36:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2863261803;
 Wed, 23 Mar 2022 23:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8342BC340EE;
 Wed, 23 Mar 2022 23:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648078576;
 bh=OhUtQJJcoj3Jnk+YaF08+vf4O/Og/N3qZbD+HriaA6o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FxYxD7nCVLDq6hbcb3BiqybyqBqZNuMPjqlSSwRXchs5bpYJ/FdHkokYDmMRSwtg8
 Emnn3ie0xYYJyPLLiHISd5/3FvuPX5i8WLGJ1g3Hq0qe2D4N2skzt3SLdgNR+aD1S6
 SmJehFYCaRYRVDw2wAulnS1y6Fxyl/4LpozIeUXzLThQ2UdG3Li8XlejVFYtvRL+vL
 2dFoZedKeCHigpzmKnBrQ3Np2dbspRdXcEs5dHgl6QL3ECRO1jELBgYqQWf+jVfCsS
 FRO050UwMzvGWg2WaT6z+6898bli1aiZOo8m5LKDmWc9EFRiVxicJ7VY5Q904ID3z8
 msZeTBvnX7DLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 71078E6D402; Wed, 23 Mar 2022 23:36:16 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YjokKxSLtqMwyLyB@ls3530>
References: <YjokKxSLtqMwyLyB@ls3530>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <YjokKxSLtqMwyLyB@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/for-5.18/fbdev-1
X-PR-Tracked-Commit-Id: e445c8b2aa2df0e49f6037886c32d54a5e3960b1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c4b86ebf5bfdaceba4bedbaf76e4ff745db17ef
Message-Id: <164807857645.14397.13955122823620181053.pr-tracker-bot@kernel.org>
Date: Wed, 23 Mar 2022 23:36:16 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Tue, 22 Mar 2022 20:31:55 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.18/fbdev-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c4b86ebf5bfdaceba4bedbaf76e4ff745db17ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
