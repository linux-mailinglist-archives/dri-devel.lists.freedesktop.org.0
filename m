Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC55F35201A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 21:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336696ED08;
	Thu,  1 Apr 2021 19:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7326ED08
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 19:48:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 797256023B;
 Thu,  1 Apr 2021 19:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617306508;
 bh=B7RN2E3cKyohbVXKMKP99pDf91zJMeLid7xwGDyIzLY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jecoxlojdMa7nV4IWBNp6f1FzkCRTbXitl2Zc1WAWlZzcqXLY1Gn06LZYk2toiISj
 AvwGLH72taDLg62mkMoX63IvI2pQy3W6VHJi8ZW1tCJ1f4SYd/aHYW2IVw33HnUaP+
 5ZrM7P+XCmCLPHJvk38ne53PSHci0mmEUoCd9b7HC/M/B6n09soU7A+8+IB5uGOLAw
 cKLhWRfSUQaC6CgBr2XV+F0JUIvbDD0nKwKIGDV6xB1hOtxHL5O/OJYo1+vICh+pF7
 nKBaZhvCa1paSKrUMVf/ZOGXiX3LXtswXF4mmZpnyUGV5gHstmYOtzDCJqlNXyZeB+
 Q+TKkthP29i/g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6D451609CD;
 Thu,  1 Apr 2021 19:48:28 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.12-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzgCsiCMpLy2g3dZCg97PZ-4HKgLWtfj2ZRk8o5LhqLyg@mail.gmail.com>
References: <CAPM=9tzgCsiCMpLy2g3dZCg97PZ-4HKgLWtfj2ZRk8o5LhqLyg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzgCsiCMpLy2g3dZCg97PZ-4HKgLWtfj2ZRk8o5LhqLyg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-04-02
X-PR-Tracked-Commit-Id: 6fdb8e5aba6a33fe5f1a0bd1bcf0cf2884437ead
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a80314c327a937ff1213288adf0d11414c40a898
Message-Id: <161730650844.24871.1138995836045710619.pr-tracker-bot@kernel.org>
Date: Thu, 01 Apr 2021 19:48:28 +0000
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

The pull request you sent on Fri, 2 Apr 2021 05:17:07 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-04-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a80314c327a937ff1213288adf0d11414c40a898

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
