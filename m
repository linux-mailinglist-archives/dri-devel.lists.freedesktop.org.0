Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4821AF336
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 20:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79CE6E0C2;
	Sat, 18 Apr 2020 18:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15326E0C2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 18:35:20 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587234920;
 bh=X1skhu5YxlhbdiDMFtNhK3bRkj4zF1TrrY2iamgPY18=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=vRorZyyiTUL8QgROpjzCm2HjmZYDLLSWEeiup6vOQKyUV6wdh4jojlVFgCYh6IL+2
 JU90YW0cZgQtWetBREsTECDRJw4yxpM/+D1BfnYhfNa0M3phOH1Wzl/3XDvC2o5GFH
 QiOQQiMnfWLCyuhTLvjdQirLpjj/915vFVeQ7SRA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyt1N=QTmsyBKYzMqYJLbNzrgrnNoqQrzn3735ePSCODQ@mail.gmail.com>
References: <CAPM=9tyt1N=QTmsyBKYzMqYJLbNzrgrnNoqQrzn3735ePSCODQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyt1N=QTmsyBKYzMqYJLbNzrgrnNoqQrzn3735ePSCODQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-04-18
X-PR-Tracked-Commit-Id: 4da858c086433cd012c0bb16b5921f6fafe3f803
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fecca68997833ef75f338fbbb76dd12fae7ca3b5
Message-Id: <158723492054.13159.8229764495094735943.pr-tracker-bot@kernel.org>
Date: Sat, 18 Apr 2020 18:35:20 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 18 Apr 2020 14:24:32 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-04-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fecca68997833ef75f338fbbb76dd12fae7ca3b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
