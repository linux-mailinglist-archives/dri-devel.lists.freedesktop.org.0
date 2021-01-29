Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08B308FD1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 23:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00E76EC35;
	Fri, 29 Jan 2021 22:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6AA6EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 22:12:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09A2B64DEB;
 Fri, 29 Jan 2021 22:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611958338;
 bh=SZSXISs3muESCnFA/Q3J9X65eCSOB3ST6ODqz6v6UvA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=WWd0D6V3eKZhfZ98KjQJAljSyKzzP3VwpbsmNOxwiljbUTrmruh/fwYlRXC71OEPe
 SjlSGLAYVXhAICU3XAO11t56LeouralJf5nxGZp2+lZsa2X2RTqjo6QRutFLcL9Ep0
 xxyKnl5bPkz0FVu0lHRu6fvrWE3zOPgD30vtv0p26jj7zy+zaLF4tjZV4iAvs/wWtG
 UsBgXvdoTC7ElgNCbsqI9CZhsCaLSiaO4gZVGsC2QTX7is+aDj7YiMe6sgRX8k5fl8
 yESLVE4QqOtsYTxVUUfRPabrAi6ead7nptGeGqIjThIqL5lO7sV4AkdJHxoPg+V5xs
 gw6SZ7jA4sgdw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1643860176;
 Fri, 29 Jan 2021 22:12:18 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.11-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyS8E3cL0s0jQ7fgV+uRrxPOxsG6n_4MpZEOa6AzXSZnQ@mail.gmail.com>
References: <CAPM=9tyS8E3cL0s0jQ7fgV+uRrxPOxsG6n_4MpZEOa6AzXSZnQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyS8E3cL0s0jQ7fgV+uRrxPOxsG6n_4MpZEOa6AzXSZnQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-01-29
X-PR-Tracked-Commit-Id: e0ecafede87eb1a3d1e708f0365fad0d59489285
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6305d15e013a70a7f1c4ee65d3e035cd705e3517
Message-Id: <161195833808.1476.6158782686954065586.pr-tracker-bot@kernel.org>
Date: Fri, 29 Jan 2021 22:12:18 +0000
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

The pull request you sent on Fri, 29 Jan 2021 13:46:34 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-01-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6305d15e013a70a7f1c4ee65d3e035cd705e3517

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
