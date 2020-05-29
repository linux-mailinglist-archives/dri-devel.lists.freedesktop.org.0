Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19D1E898D
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 23:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C206E970;
	Fri, 29 May 2020 21:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C5B6E970
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 21:10:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7 final (apologies release)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590786603;
 bh=pv0QUgVsa/cVUs1TSJTybLNskmmH0dvwlOUliJ/c8rc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=2DCd4Bmy3AjBbxoE2uB5qQDd4uRSW8W8DZRYrhM2SnW39Xbi70kJeyAri25MuBJbD
 ctlX+vcWbBscRVAbdOKDcq/Ugj5Hsg7Vuc8Hw3JhJwit3zGOnXpaM0DFYxzEXJZRQS
 tAZIR1jkHNSycFH/koz7f6d6la1W+vF51bnEfX1c=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tznwDT9GEhbAHD1dkUVY_OF5bQNzxX7sBjXPkSH6VFjcw@mail.gmail.com>
References: <CAPM=9tznwDT9GEhbAHD1dkUVY_OF5bQNzxX7sBjXPkSH6VFjcw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tznwDT9GEhbAHD1dkUVY_OF5bQNzxX7sBjXPkSH6VFjcw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-05-29-1
X-PR-Tracked-Commit-Id: ed9244bd0b265c4c0866a9246c6e7cca1cca3acf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86e43b8bf0e6b3897e504cdb9230fd063ecd4452
Message-Id: <159078660320.32003.16753683449130964815.pr-tracker-bot@kernel.org>
Date: Fri, 29 May 2020 21:10:03 +0000
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

The pull request you sent on Fri, 29 May 2020 12:37:51 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-29-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86e43b8bf0e6b3897e504cdb9230fd063ecd4452

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
