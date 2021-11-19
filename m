Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF45457745
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 20:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4016E457;
	Fri, 19 Nov 2021 19:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AC36E457
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 19:46:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB31061AF0;
 Fri, 19 Nov 2021 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637351177;
 bh=Fatu20UiZI42qmAY4VHyZ1WqXnoMvkmyBB3M6LR47Kk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ByM8/ZE1GpjCrb/8W7+TVjvLKdk4r5g7mY2mTInhj7IUbWTuCIoIN+DOrmNI0LlFl
 ME6E2dYacNewvvRnSTRJ1eHdvDLfP/F6Fy/lZelH3AXedz2EWyFseOyQXlsVJSwE4E
 te00DMliVX+22QeaD4/Cb0iB22qKil8lA0daEvVFIqXTmGuWuIND0HYfOf7Hm0Uo08
 rmMv+NQOSTDtPJTun7cA8B1kkLa/zxAeFSynq4W2x1oAGyAPr4eU8ZsTVgY9lozOcy
 LQsdHvtJzp+YOQIfR0Z018uZ6nMDxp65W4AXuTJ93kn9Cl9kfeLxYHMREu9JGITq8o
 ZrPUlSvKwJ7cg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E50E060977;
 Fri, 19 Nov 2021 19:46:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.16-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twL3jV37TWqwTUDfCdqMEeQDO6Zrgx+rkWNir8Q8eOqWw@mail.gmail.com>
References: <CAPM=9twL3jV37TWqwTUDfCdqMEeQDO6Zrgx+rkWNir8Q8eOqWw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twL3jV37TWqwTUDfCdqMEeQDO6Zrgx+rkWNir8Q8eOqWw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-11-19
X-PR-Tracked-Commit-Id: 7d51040a695b53d4060349c7a895ef4a763887ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ad44518affc66611644654cec9c165eb4e848030
Message-Id: <163735117693.2946.13384275708664260252.pr-tracker-bot@kernel.org>
Date: Fri, 19 Nov 2021 19:46:16 +0000
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

The pull request you sent on Fri, 19 Nov 2021 15:32:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-11-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ad44518affc66611644654cec9c165eb4e848030

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
