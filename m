Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38621D57E5
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 19:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167406ED0F;
	Fri, 15 May 2020 17:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B76D6ED11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 17:30:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589563803;
 bh=Pf1tsLcBs/Y3BpVvvfGVzXifg+Z9+bcZxpw4QrJ9LyI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JbSmKtd/XmQ5AIi8ZbPBH6mMyyc8kxq/LWls+ufPaaBY5ruQ1qzcoIEwyCi2yrUDb
 54DXtf7F7gAEbWFh8CMdNmSX/DUKxfbJMENJeWCsqxD30x0JEjmyS35WQ6CuQL38fd
 3hm99ihusV1sCq6mVo6m2SKhYqYWISqXCYIwctv0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx=si98hr3_MvAviRZ6LZMUFnFOJBFBk+Lpj3aLQz5M6A@mail.gmail.com>
References: <CAPM=9tx=si98hr3_MvAviRZ6LZMUFnFOJBFBk+Lpj3aLQz5M6A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx=si98hr3_MvAviRZ6LZMUFnFOJBFBk+Lpj3aLQz5M6A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-05-15
X-PR-Tracked-Commit-Id: 1d2a1eb13610a9c8ec95f6f1e02cef55000f28e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e7cea7905815ac938e6e90b0cb6b91bcd22f6a15
Message-Id: <158956380317.31776.9034439701885701502.pr-tracker-bot@kernel.org>
Date: Fri, 15 May 2020 17:30:03 +0000
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

The pull request you sent on Fri, 15 May 2020 16:12:52 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e7cea7905815ac938e6e90b0cb6b91bcd22f6a15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
