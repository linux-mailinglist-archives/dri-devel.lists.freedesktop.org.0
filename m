Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF46183E91
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 02:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B686EB67;
	Fri, 13 Mar 2020 01:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECB76EB67
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 01:15:07 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.6-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584062106;
 bh=ADs1Pl9RGMgBCI1Y2QeWJJbKKwQwvnYHsaE2qxf+Xt0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bLuVseidKmDXn1phfsPI3jDFVKtD9CwqeJvzHlIKuR7S7mFGlH+1/mhY9h7GAyDIx
 3VcWNJO5wBi4K5LSnKsUZ3dwuWyGqKhXXws9IuxzMOCG2wpzABBAMMfkGcrPEid5MG
 YlKfdUewqOr7npEZ1HTZfemvHb291Z2bej/w/FMc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyX3+Qk05feqP=5SbePrg7kWvZu1O0J1pxZk+8Yj=Xjew@mail.gmail.com>
References: <CAPM=9tyX3+Qk05feqP=5SbePrg7kWvZu1O0J1pxZk+8Yj=Xjew@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyX3+Qk05feqP=5SbePrg7kWvZu1O0J1pxZk+8Yj=Xjew@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-03-13
X-PR-Tracked-Commit-Id: 16b78f052d0129cd2998305480da6c4e3ac220a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d81a3f29c0afb18ba2b1275dcccf21e0dd4da38
Message-Id: <158406210686.26569.9801341237425132776.pr-tracker-bot@kernel.org>
Date: Fri, 13 Mar 2020 01:15:06 +0000
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

The pull request you sent on Fri, 13 Mar 2020 10:58:51 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d81a3f29c0afb18ba2b1275dcccf21e0dd4da38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
