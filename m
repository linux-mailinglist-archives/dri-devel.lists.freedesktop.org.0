Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4811419F9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 23:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52A16E15D;
	Sat, 18 Jan 2020 22:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29CD6E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 22:05:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.5-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579385103;
 bh=Ki1bVuApY32Y91Oiad9vnAjok3ZarWryih/b+RfdvzY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=FBD8dPWfIZKJI5AWG+/xvRsyqq2wSKf+kZ8K1BtDmY+ggM8byC0/7uko0qTZKVKyc
 8Ls+1r0NOQwTk0ZOs5jDlcVQBL7TDI6cZk4Og6wo77n4Tj21U69sbYZsU4HxW7YTwv
 BAQ81dIxum90q5L6rAfn5Rd4cI0bzgeLQ2olEis8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyCmZM2Nzy397APbb9-EcNyC-Bgz4Q_7hTcjaQpX6E1Pw@mail.gmail.com>
References: <CAPM=9tyCmZM2Nzy397APbb9-EcNyC-Bgz4Q_7hTcjaQpX6E1Pw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyCmZM2Nzy397APbb9-EcNyC-Bgz4Q_7hTcjaQpX6E1Pw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-01-19
X-PR-Tracked-Commit-Id: f66d84c8b4db9a4f77f29e2d8fd521196c879582
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 244dc2689085d7ff478f7b61841e62e59bea4557
Message-Id: <157938510363.7168.18142518179667876755.pr-tracker-bot@kernel.org>
Date: Sat, 18 Jan 2020 22:05:03 +0000
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

The pull request you sent on Sun, 19 Jan 2020 07:21:35 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-01-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/244dc2689085d7ff478f7b61841e62e59bea4557

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
