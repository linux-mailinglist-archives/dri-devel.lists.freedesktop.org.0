Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2F32575E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 21:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B026E0F3;
	Thu, 25 Feb 2021 20:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92636E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 20:14:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AB70E64F2C;
 Thu, 25 Feb 2021 20:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614284085;
 bh=+kyHhMSELA7u0ljOd/RrnjS0EEam6Tj7onyzl/Iok6Q=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=XPlRHEU2b7PqaDxbMLHtBDGTFMXpTLWJg+jvm1hLHFNJjStSV/FE+iMGtvgX3WU7i
 PzSgqNx2HhGuFxky74p3/NU8YoIlN1XI72PJjs8wpzwSJMcD+Lb/SkEu4VkHf5WCUZ
 UgutSHhKiX4njzQb+ozMkvAibKC5Sb3H2Wy2E5gMg7nTv/jHxDjfPY3RL4UU6Lke5G
 wA7dH3TR2myMutqHKn6mgbR1FyuUwcDQSntvrtafEixVA17zaSS0Qm2ByopA43CHn2
 +wbdWtQABwPe1+67MQUhjbGU4otmqKUQbDUxPY8dip9VyPuhJUtcoDB+22qq3GBl6p
 tJdRwkcNN5HoA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7BA1560A0E;
 Thu, 25 Feb 2021 20:14:45 +0000 (UTC)
Subject: Re: [git pull] drm fixes + msm-next for 5.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyht2VHck6c0oh21+H=b_M=h1dvm4BNqe6AkPYZ+Ph_Uw@mail.gmail.com>
References: <CAPM=9tyht2VHck6c0oh21+H=b_M=h1dvm4BNqe6AkPYZ+Ph_Uw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyht2VHck6c0oh21+H=b_M=h1dvm4BNqe6AkPYZ+Ph_Uw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-02-26
X-PR-Tracked-Commit-Id: d153e8c156dafeb847fd655f416cf81c007e8706
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fdce29602f865b016012eadeaec99800da916d3d
Message-Id: <161428408544.10391.12019334825346782312.pr-tracker-bot@kernel.org>
Date: Thu, 25 Feb 2021 20:14:45 +0000
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

The pull request you sent on Fri, 26 Feb 2021 05:23:53 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-02-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fdce29602f865b016012eadeaec99800da916d3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
