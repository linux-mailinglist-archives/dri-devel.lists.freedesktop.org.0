Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C2287C65
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 21:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58176EAD2;
	Thu,  8 Oct 2020 19:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A3F6EAD2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 19:20:48 +0000 (UTC)
Subject: Re: [git pull] drm nouveau fixes for 5.9 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602184847;
 bh=11avprIQB6UVEvLk8bT4ULpHAzJ/Ft4HqqUb1REgiRw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Cp6aKx+HVvVLf9jmSxls691ERCxOMcdvHLrAzzhF5ijt9HtLFU+9opf97I2ZUOYXB
 3k2mFuYCc5kHmF14jX9OuCWFer0/+Ae4iT4Y8pkUQbjJgKxlEhOm4c7r+odeXhCQio
 4aw+LkaghOLPcjJ+9/YhNgWVLCiXg2bT+XoWTS7Y=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twbVGe96YNPCMMRrXPJhCoLLbhqtN0DjdTJcqo52OoLCA@mail.gmail.com>
References: <CAPM=9twbVGe96YNPCMMRrXPJhCoLLbhqtN0DjdTJcqo52OoLCA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twbVGe96YNPCMMRrXPJhCoLLbhqtN0DjdTJcqo52OoLCA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-10-08
X-PR-Tracked-Commit-Id: d10285a25e29f13353bbf7760be8980048c1ef2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d006ee42dde0b08b7b47697def6f50fd849c996
Message-Id: <160218484794.22350.2341226418196875900.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2020 19:20:47 +0000
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

The pull request you sent on Thu, 8 Oct 2020 13:35:59 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d006ee42dde0b08b7b47697def6f50fd849c996

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
