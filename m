Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C6570AFAC
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 20:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE7210E07B;
	Sun, 21 May 2023 18:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA1010E07B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 18:58:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6669A61761;
 Sun, 21 May 2023 18:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEE28C433EF;
 Sun, 21 May 2023 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684695521;
 bh=K7ZK4zHn4uirKvLOevRh5+9Q/FRdGxhkhisJHm8IzWE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=MbQ0QozEK4JQiNITiDxrKayETe7O5t9WbsdPaJb+iVB+eHQKDCG4X/W0Yu/S2r/uJ
 4tB/6p6FQbZ9gWlOpQb9A/m3igfO4sqAKDaoG0yFsGYO9dUjUsZPXrK8Boiofc1J3V
 EfsedEOPb8IBko4nxRRWdrIgYO/ZXne537AcVeWSXSfjwSCbvxDY+reZ0Zeckjoyyv
 HiEtNi8XJFIk5DPDyQ1a3VB5AlPwlaO7OS1ZkE9LN5dJzCn4+zvmxDknjXq92xopfZ
 G8w6uwRRlFpxT5YLnk5jfldMN6KlOXwY02tuIOD4jt+yGs8kvodZAdBKJ2Ili/w069
 qrFdfD/dGYjGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A794EC73FE2; Sun, 21 May 2023 18:58:41 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes for v6.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZGntkmg6v2G8Fnfn@ls3530>
References: <ZGntkmg6v2G8Fnfn@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZGntkmg6v2G8Fnfn@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.4-rc3
X-PR-Tracked-Commit-Id: d9a45969abeb641c5fb8cf3591f63f827f9932b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70e137e3840e1bc2deab32492316653c956a5c6b
Message-Id: <168469552168.22409.11989432771083785902.pr-tracker-bot@kernel.org>
Date: Sun, 21 May 2023 18:58:41 +0000
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

The pull request you sent on Sun, 21 May 2023 12:08:18 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70e137e3840e1bc2deab32492316653c956a5c6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
