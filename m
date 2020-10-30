Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC42A0F0B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 21:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F15B6E090;
	Fri, 30 Oct 2020 20:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777DC6E090
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 20:05:49 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.10-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604088349;
 bh=18GkA6iRo2BzVyR0d6ewM6Nt8BeX5/+XG0fMOzXKNGo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=g6TwEtkgqZtqP7nhTt1th3PkwIEccFb82BvemeskW2/lYBTwX23/ltgs8Inj/iJxC
 UF7NiQJpctFudhSZdUljU7P//Lvn7tJsfhPsXBsdwarC60caGD6r7/JfAFhEoJ0+lK
 GxmAJkH9+35a3GTjO77Cq749jOOQpwnWEiLlWt/E=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw8m2318cixWC-_BvLTpO7usf6wiYiNbdT3W9NaVa5qpg@mail.gmail.com>
References: <CAPM=9tw8m2318cixWC-_BvLTpO7usf6wiYiNbdT3W9NaVa5qpg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw8m2318cixWC-_BvLTpO7usf6wiYiNbdT3W9NaVa5qpg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-10-30-1
X-PR-Tracked-Commit-Id: 7babd126327b8b5a3904d2f8f01c95235801af2a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ba4d8675090480e64388f4669271c03123072b2
Message-Id: <160408834914.13990.10597880144562985068.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2020 20:05:49 +0000
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

The pull request you sent on Fri, 30 Oct 2020 12:01:27 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-30-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ba4d8675090480e64388f4669271c03123072b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
