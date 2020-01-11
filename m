Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33B138192
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2020 15:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94148957B;
	Sat, 11 Jan 2020 14:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5574C89221
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 14:45:05 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.5-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578753904;
 bh=B5e2FWQy3aMIJYfhP1REi3QWeZ2OLib3kFPKkA77TZw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=VZiaZ6r98dJoqS8I6CSHiilf7FNV+2wbwCMHsR4GkUGas1WzgNvuaYP3gA2/Oa7HZ
 T0MF7tskAYYYSX7maoH1IZ4t57r19YNw+1TXQbcmTVkQLdcrC9bfbojv4jfsDeNbRO
 Tyq7N5ZtFltDaN+EOOkwBZk+IK9f1Ajo8CdOOyR0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txLfwePjpy4euR+VX+g44=YN=uq4OX6zEix6FWaO05PLA@mail.gmail.com>
References: <CAPM=9txLfwePjpy4euR+VX+g44=YN=uq4OX6zEix6FWaO05PLA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txLfwePjpy4euR+VX+g44=YN=uq4OX6zEix6FWaO05PLA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-01-10
X-PR-Tracked-Commit-Id: 023b3b0e139f54a680202790ba801f61aa43a5c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d25ef773538c82445ee2ea849acecc0889cc7f6
Message-Id: <157875390477.30634.10659038757747679933.pr-tracker-bot@kernel.org>
Date: Sat, 11 Jan 2020 14:45:04 +0000
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

The pull request you sent on Fri, 10 Jan 2020 13:55:10 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-01-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d25ef773538c82445ee2ea849acecc0889cc7f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
