Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F66D1087
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C34610E21C;
	Thu, 30 Mar 2023 21:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243B910E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:11:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 673DDB82A42;
 Thu, 30 Mar 2023 21:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B212C4339E;
 Thu, 30 Mar 2023 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680210663;
 bh=yLUm+SD15hQAp8b/G6sbW5kSY7OOZIAufqQ88dBu5kU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=U4OMe2XGSbVI+qvYqHFyyt6WSTHEKFc+QQ/QTgd82X1/Whu4imSKPQa4ImIM4VHK/
 RJduBlwf67rYJvUZCIFSQ+fYJkaEYkUo7rTZte6FqWzAVIiqyJlmw9azMkHNPIIuKg
 bKPfwsoJBaqLYoAFY8E6evkZH8JtuQiVTWRmDu9LQlMRmH7hj+I0q809AZrLu9tURU
 6TD1sgvm3oR9eT5m/8+fHAcGQNHtgJojH6jb0vPHupgccgO/vJf9oNmuT3M6Kxwzjt
 2y4/9NoCoYjU5SEjtJEZx4jWRY+yLzzmVprRF7njgTo0bQJQtEGBsJPhH4YdlW2L6M
 nYEaK3HjMyMvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 18BCAE49FA7; Thu, 30 Mar 2023 21:11:03 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for 6.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZCXnVLzzdzt4xX7E@phenom.ffwll.local>
References: <ZCXnVLzzdzt4xX7E@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZCXnVLzzdzt4xX7E@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-03-30
X-PR-Tracked-Commit-Id: 7af63e079a7d6d45a3796a7ba625e2ec131f62be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d3ff8087b2c12ee012c547f3bde46a3f60d6f6f
Message-Id: <168021066309.12065.2646138721732559028.pr-tracker-bot@kernel.org>
Date: Thu, 30 Mar 2023 21:11:03 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Thu, 30 Mar 2023 21:47:32 +0200:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-03-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d3ff8087b2c12ee012c547f3bde46a3f60d6f6f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
