Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752B25E302
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 22:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DFD6ECD5;
	Fri,  4 Sep 2020 20:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF516ECD5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 20:49:29 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599252569;
 bh=PvB4DkPOxFuGOgSWUOxsQjmURrkgJbD47BnL0h1Yo1Q=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=dQgtwbhlhAOqt+rla2zTnqRD85WBxkOzVZhsgeEg7Gcl3oIN6sqna/Y7K0v/E1tCd
 GPxD7R5uXm4r9Jm8wctWnnyObiFBCDmrNw1qqqmYCTvKCoNrez3ERV4lMFJgqfwKXB
 hHBHb0Y01pk/Eb2z9rGeqtHHAv7YjWY75yAk0l4Q=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
References: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-09-04
X-PR-Tracked-Commit-Id: d37d56920004cae612fa32d1f92aaacca5e145f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf85f5de83b19361c3d575fa0ea05d8194bb0d05
Message-Id: <159925256932.25529.13873694892912208460.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2020 20:49:29 +0000
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

The pull request you sent on Fri, 4 Sep 2020 13:52:56 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf85f5de83b19361c3d575fa0ea05d8194bb0d05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
