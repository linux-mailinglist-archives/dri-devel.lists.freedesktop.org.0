Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB0E29789D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 23:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979116E81D;
	Fri, 23 Oct 2020 21:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F27B6E81D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 21:01:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes part 2 for 5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603486875;
 bh=5XXCXqomEwfsyLPJ81nX8fxCoXr5mmLAy12dSvAM/eg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=gd8NEb+9xL3Wb5wLU5sNxJZQIRnNfJTWV+19iP2kgFkjEhlLh701c4LytZCanXrk9
 p1GcSp38Sjbc2ePYfRB1MQDU+GQZImXFojBcQ8a9vE4N6iqF9mAHz0VhomPpjXaB3l
 gIS8/c1HdI7+S0fX3vTSy1jQnL/9++qyloapT0FA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw08JOodzP4F_K9gMpQb7MiLr5-uc0vg=kSwdmDxr=Ziw@mail.gmail.com>
References: <CAPM=9tw08JOodzP4F_K9gMpQb7MiLr5-uc0vg=kSwdmDxr=Ziw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw08JOodzP4F_K9gMpQb7MiLr5-uc0vg=kSwdmDxr=Ziw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-10-23
X-PR-Tracked-Commit-Id: b45b6fbc671c60f56fd119c443e5570f83175928
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc03b2d6a9d1398dc855318d6ddfa3be57bdcf2c
Message-Id: <160348687574.3049.18082894878208155785.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2020 21:01:15 +0000
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

The pull request you sent on Fri, 23 Oct 2020 10:03:10 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-10-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc03b2d6a9d1398dc855318d6ddfa3be57bdcf2c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
