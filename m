Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB793A497E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 21:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D56F3C6;
	Fri, 11 Jun 2021 19:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5490C6F3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 19:37:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 11474613B8;
 Fri, 11 Jun 2021 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623440268;
 bh=mNw0UGqNwkbKkK4I4bl7/s0QB5RuimeMBTD/y05t6z8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GNAoSk178jXaZqDwYZDynOuSglFxy6AmRtsC+pvv9W8lTUJus7RLRq3EE8ogf2nSe
 7MNhzJBd/D11rEz8QiKUcXrzObs4aXnx+eTNk4hmCM3PHqKY92w1UYvI6ewy7G50ju
 7aDEEsMEwhQQBnlwTwsInya3AfXBWNcyjf3PYHA+kFS7n2qI5v0aPDhqKwKyKlqUaS
 F44cTCnO6KMEskk2Tv44t+uUF5IMys++Kn+jDozygkA9w0J7o3Z+RqIDT+e7hsDugV
 LG8HvC4cHTh9A+siqUEjdr3l+DHi20nmotN3SFZODVxRAd3jFy9dEnKZdb+JL7rZnX
 QgZ4pm0Fu0gwg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F353460A0C;
 Fri, 11 Jun 2021 19:37:47 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.13-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyyyQ-0QkKquLX4q=7=pjGeRxhhP=z7rfLjEbX7mSrh5A@mail.gmail.com>
References: <CAPM=9tyyyQ-0QkKquLX4q=7=pjGeRxhhP=z7rfLjEbX7mSrh5A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyyyQ-0QkKquLX4q=7=pjGeRxhhP=z7rfLjEbX7mSrh5A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-06-11
X-PR-Tracked-Commit-Id: 7de5c0d70c779454785dd2431707df5b841eaeaf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f21b807c3cf8cd7c5ca9e406b27bf1cd2f1c1238
Message-Id: <162344026793.23951.1047701304187344651.pr-tracker-bot@kernel.org>
Date: Fri, 11 Jun 2021 19:37:47 +0000
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

The pull request you sent on Fri, 11 Jun 2021 13:41:34 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-06-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f21b807c3cf8cd7c5ca9e406b27bf1cd2f1c1238

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
