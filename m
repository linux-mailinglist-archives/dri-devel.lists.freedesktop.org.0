Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37A2D7E28
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 19:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DACC6E1F8;
	Fri, 11 Dec 2020 18:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7566E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:35:13 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.10 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607711713;
 bh=U0QJ6P0TY+JNCDSrrr+lo/Fzpsc3kCk9ZaFZTWFCqEk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=o0dnKin6fZiE7cObcpLPZ9z9oBI5AjvGpbDoOU96/BsGtO8eVjQDVYtoQnRixAR5C
 ufhRGOoddKSOQjn7DrOUer4LoNugmrA7cZ4HcgP4iEbzNx/u4V+m3f7UYS51QC3n9L
 4iSazRBvlnXaJla+1MxHdNxW3EfWKOG+/86BO/KZeilOiTH4AA9gwnNMmzMPYuvbYc
 66hWzxvYrCjj+PfKtVIDGDnO9NmRuqcJlNFqfocUEezBVz8CgoG71e0GEw93BXvN90
 HcdC12KY2t1e/6HWW0mZVI/obDrEt5LJAeEswOBZZZQByN/Gwbs95KA/0WB15tnP3H
 CP9YEh8qPaflA==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txOVY0jehFoHQwb=4PCr+a9Bg_x9u_7484uPYg62UsLog@mail.gmail.com>
References: <CAPM=9txOVY0jehFoHQwb=4PCr+a9Bg_x9u_7484uPYg62UsLog@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txOVY0jehFoHQwb=4PCr+a9Bg_x9u_7484uPYg62UsLog@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-12-11
X-PR-Tracked-Commit-Id: b1f195fc49812359296a901e26cc7c0b761d8a70
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 059fe8296e0fb4b89d997ea0aa75996911b8f3aa
Message-Id: <160771171316.31675.11381949430544648232.pr-tracker-bot@kernel.org>
Date: Fri, 11 Dec 2020 18:35:13 +0000
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

The pull request you sent on Fri, 11 Dec 2020 11:03:01 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-12-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/059fe8296e0fb4b89d997ea0aa75996911b8f3aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
