Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621C3AD2D5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 21:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F466E83F;
	Fri, 18 Jun 2021 19:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BD76E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 19:30:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C6F8361284;
 Fri, 18 Jun 2021 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624044625;
 bh=KBzGWo6J/OliBZhQ5ocO7PzW9WHFOej243ChCyB0DHQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=rGr+qnlnKQmjssbj2r3olxIzolMrwQ+lpiDzQkbWoSRE8OF9tcf2oZ1FM1JEVs6Wo
 SCO3eOYKASSvjPrvy96WxSEO8ddPNx3dM+I1svm4r1gIULK8lW9bC0PZztHhiSDnMJ
 zPFVx/+9Lbh3afh098+0YUNl+CKpzQ8OKHzxxefbtJQnvNWCVd0V3mDWhoTHkArdDh
 Y1k91aHM8Cw+wBP+mcZsSP/SG1ahDi/GIaYNwqbjOQB+r6gHEHZqfARmR2KBqorzly
 PWoFS+gWCrZIOn2yjZrdr8GxfhAfjPsZ7MYe/rKVkamG3bHdd7ebiRE1cc2zyy4EYq
 F9yp+n3TRLdvA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C049A609EA;
 Fri, 18 Jun 2021 19:30:25 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txDgvo3Gu7bX_C9A4hAQJf+pGk+pMUR1bKg4EapEeqazQ@mail.gmail.com>
References: <CAPM=9txDgvo3Gu7bX_C9A4hAQJf+pGk+pMUR1bKg4EapEeqazQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txDgvo3Gu7bX_C9A4hAQJf+pGk+pMUR1bKg4EapEeqazQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-06-18
X-PR-Tracked-Commit-Id: c55338d34cc2434d4ff9de89498f91171bd1f120
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3bf96eaa4c4e701fee04665bea70867cf5e8388
Message-Id: <162404462578.17995.1187558521235311268.pr-tracker-bot@kernel.org>
Date: Fri, 18 Jun 2021 19:30:25 +0000
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

The pull request you sent on Fri, 18 Jun 2021 17:14:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-06-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3bf96eaa4c4e701fee04665bea70867cf5e8388

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
