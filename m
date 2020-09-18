Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4626EA4F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 03:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C78E6E0C2;
	Fri, 18 Sep 2020 01:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915626E0C2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 01:10:15 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600391415;
 bh=r1ms76b5s05xnohRny6LhBmnMvwVPTcZ9pEz5yL8no4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=kSXgxMUi+J3rI8mrPOsFydmV5LEN88W0kc3tJVeg6T9PfdnetQTuKbv45igzi+B2n
 TYLsELRdeNMeVlDRT5vcSDouiXcxgVobhKCgTe/BWRm8AizoByXIkoEPlXYwEb4iT2
 dgGKALX4st3qhqs24XVe6GYD+0Dsprxi/UE1IgT8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txcHEa3-tZK3N+SAznbfHU_61UcQ01gq99m6riHzU5OOw@mail.gmail.com>
References: <CAPM=9txcHEa3-tZK3N+SAznbfHU_61UcQ01gq99m6riHzU5OOw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txcHEa3-tZK3N+SAznbfHU_61UcQ01gq99m6riHzU5OOw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-09-18
X-PR-Tracked-Commit-Id: 1f08fde70075784d28d1687d0e75871e81cc1173
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c0449c906fe4d9631025bc11993009071094a9a
Message-Id: <160039141518.8261.4924567172091494025.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2020 01:10:15 +0000
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

The pull request you sent on Fri, 18 Sep 2020 09:05:58 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4c0449c906fe4d9631025bc11993009071094a9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
