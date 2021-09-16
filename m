Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 303FA40EBD7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 22:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19466E8B3;
	Thu, 16 Sep 2021 20:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88196E8B3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:46:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0E9E26105A;
 Thu, 16 Sep 2021 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631825179;
 bh=hGRAFb6mFt9BFUKqdReSzfcflDrfVETbD9gztqKhu0A=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=N/PQTo5FHdCVVdqzqRUITBENe74TnTElwsMHONAFR4h8E43BRljzJ8kl7odlhZbjV
 kx7xgUTDxVk8opoTp65ViyNJppzbrfhkfqBw7+hYKCb7p1gCAF7dt8Pb/kft1UvA9L
 vANZfxOA+1rYn9j4WNnDo/QAQE4AEVORpbtdPfvC2lOYqJ273bDLPZNnsJehZu7xns
 Nq08hTGuOe5iSuZzm5G1z7ZcLlp7uJ+60ym1ULm9MRReV0uGdmgqrxQauzz/ZGSmty
 IVC6K/RcKVcZ/Cv8DjrNPsl4/jE48ZsaGtfihsq1UUbblP/KQ6ZkTFF6bVRXKMqfKi
 sty7xjvyEhq/w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F2D8B60A7D;
 Thu, 16 Sep 2021 20:46:18 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyrmDa4qCvu0pf0JHU1DmDnq5H=1uE1JaGjLs6E6dPZNQ@mail.gmail.com>
References: <CAPM=9tyrmDa4qCvu0pf0JHU1DmDnq5H=1uE1JaGjLs6E6dPZNQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyrmDa4qCvu0pf0JHU1DmDnq5H=1uE1JaGjLs6E6dPZNQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-09-17
X-PR-Tracked-Commit-Id: 109f7ea9aedce437b4b7737ab60bfea65d9dbdd3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdb575f872175ed0ecf2638369da1cb7a6e86a14
Message-Id: <163182517893.9786.17583244550626963421.pr-tracker-bot@kernel.org>
Date: Thu, 16 Sep 2021 20:46:18 +0000
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

The pull request you sent on Fri, 17 Sep 2021 06:15:42 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-09-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdb575f872175ed0ecf2638369da1cb7a6e86a14

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
