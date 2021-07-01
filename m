Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0A3B972F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F0F6EB8C;
	Thu,  1 Jul 2021 20:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978846EB8C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 20:24:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FC166121E;
 Thu,  1 Jul 2021 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625171068;
 bh=a76v+NUxptBZUCs5HBKTFuLEp++kMzDF7XMzhcbzj/Y=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=YfCb9HenM+EBVmcVa2FA+Hvv2y1tubzm5+fnk+vECAdQNnMKgiK4SPm6AhaAvI0UH
 dwpcg9jQmoo8vKLqCFoRw0qgEi7uWc+PFM+2qmJE4C88RDjDBqVTVa3x5Fp3rq3pse
 4Ftw3ZxsnVN642STdf3QiTFqpm3BnjnvlALhGQ0mocnpbVU3bWjfCHPPNit3CJJ7hg
 AXOTVEvG/8U0QHF48Kl6rK90WekROTk+7CGetbU4AMjk7mNvCY82XEs7RBwmsduQNt
 8FtHuwExCGpnrrySJGbw7HHQX2tDbd5l/iCqv6M9Jfo+9ytTCVuvTPzVO1JbAkM5lI
 PB+BLN3oBTRaQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 272AC609F7;
 Thu,  1 Jul 2021 20:24:28 +0000 (UTC)
Subject: Re: [git pull] drm for 5.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-07-01
X-PR-Tracked-Commit-Id: 8a02ea42bc1d4c448caf1bab0e05899dad503f74
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e058a84bfddc42ba356a2316f2cf1141974625c9
Message-Id: <162517106809.12571.5261424530459297254.pr-tracker-bot@kernel.org>
Date: Thu, 01 Jul 2021 20:24:28 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Thu, 1 Jul 2021 14:34:15 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-07-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e058a84bfddc42ba356a2316f2cf1141974625c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
