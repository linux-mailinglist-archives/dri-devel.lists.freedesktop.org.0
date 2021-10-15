Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D450A42F583
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 16:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82466E4B7;
	Fri, 15 Oct 2021 14:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A056E4B7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 14:35:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 315816120F;
 Fri, 15 Oct 2021 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634308510;
 bh=IQUxSiX8Rsf0c9tV9pXRUONxsUa+V5F9haD0LweM9dE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GFoZUWCQoClo1urhPN/Z1VT6MwzKybteYWsvlRntxgDfN7LP+pa2MrZ216yYXl4mL
 E2gKwlCMjuaDUPCvN/el6Lx6rI9O/8jm2z7fb9ygn5b9AAIDq9X42pC1q4BagSDxQa
 sjY/Shrr7dsenO8w/LJXtRsoRBcaPeYj3h2QaZODxE5DpphRYzaC6rPkDMI9UQGZwk
 TVxiK4pgxCY6/Gz8aknl1v/TjOsW8Nm0mmw8uXW+jtVFWHEZrJDPC0/UuV3qDSW4Ph
 NUCLZiPuWsZbdvHlxmVHC4Yy7Rpe8QXkPeh0VVxZVLw6M4rmDm9RK9i/MSFlBQ69Kq
 lYg7k6M58a7Sg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2676060A4D;
 Fri, 15 Oct 2021 14:35:10 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyo_PDz3NuSp4N-qidJ55FybBYs6do-f_5gb4iXvct5Zg@mail.gmail.com>
References: <CAPM=9tyo_PDz3NuSp4N-qidJ55FybBYs6do-f_5gb4iXvct5Zg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyo_PDz3NuSp4N-qidJ55FybBYs6do-f_5gb4iXvct5Zg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-10-15-1
X-PR-Tracked-Commit-Id: a14bc107edd0c108bda2245e50daa22f91c95d20
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 591a495d440ff8dd2b51a47eb6053c83f68a7f6b
Message-Id: <163430851015.21069.5237391876475990136.pr-tracker-bot@kernel.org>
Date: Fri, 15 Oct 2021 14:35:10 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

The pull request you sent on Fri, 15 Oct 2021 15:15:31 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/591a495d440ff8dd2b51a47eb6053c83f68a7f6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
