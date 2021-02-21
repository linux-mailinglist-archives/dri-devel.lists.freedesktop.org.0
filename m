Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6347320E61
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 23:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D296E0F2;
	Sun, 21 Feb 2021 22:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81BF6E0F2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 22:53:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6152164EC3;
 Sun, 21 Feb 2021 22:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613947980;
 bh=beU37vgyLzR0GWf1iv8QDmH77p2/Dnn6d4xXEQsAdmE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=VvHCRIDmsGhFHv79Hs28EphZVutuqzEDKT7Pra7jEzqhlkGXcQ2plKQPyEKcFAF5i
 Vh4DSUg/qVRVjCwTEa0uIAJNlPzYLhIkwSbvz7N55yuLeLJcc87p/aDaHk3CICdtS/
 D/ElJ5gQLvvkvtBtIiwvPeVM65f6DCOIowxO1TAEhHjjxDVGMz0r4zZAorrINhLx1W
 ney2GNQn5EnNSiFd0cNCs9FqXN2bTJeTCJ1MK1e/aLHLbX1EUPVsCDBrutbiUacY99
 wh/M5hdBM3QfGfetMBmYJWTkku0/uZyAIwGjKjh+uXC/zzC40OhBVOLe8CpWVok69Q
 kuSIHTHiYHYcA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5CE3860192;
 Sun, 21 Feb 2021 22:53:00 +0000 (UTC)
Subject: Re: [git pull] drm for 5.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txd-x1NKWK9BBqVTDNOR00zNqcXgs76YJrDfL94eMLYqQ@mail.gmail.com>
References: <CAPM=9txd-x1NKWK9BBqVTDNOR00zNqcXgs76YJrDfL94eMLYqQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txd-x1NKWK9BBqVTDNOR00zNqcXgs76YJrDfL94eMLYqQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-02-19
X-PR-Tracked-Commit-Id: f730f39eb981af249d57336b47cfe3925632a7fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d99676af540c2dc829999928fb81c58c80a1dce4
Message-Id: <161394798037.6686.4750501257597585917.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 22:53:00 +0000
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

The pull request you sent on Fri, 19 Feb 2021 16:06:19 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-02-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d99676af540c2dc829999928fb81c58c80a1dce4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
