Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F137017C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 21:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F306F5A9;
	Fri, 30 Apr 2021 19:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C80B6F5A9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 19:55:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0198A61474;
 Fri, 30 Apr 2021 19:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619812538;
 bh=afDzap70NX5wQQf5vKgFgTVTR/ix84Zojc6/ysFEZTw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=t6CniZCzHX+TCPoWKDxlqGZdVzQbzYX3rhdz+yeNehTzyOnZrLru443PDOc93N/aq
 WuJXAxYXK66uX9IOrOCYRG2CU7o9Gg6hBREXi2DNgw9EPsyfND9j1n69y4k6IT929E
 xJ4j28FIZNgW6jB3U99cOwWj4Jf3tgw0ymYXSgmQSQWO8xztr4BcWTi2iWW3gdcxyv
 vmcRWRkvncTD/eO+qFTjhalJBggq2Jf4sSn9nlI00ohEF0Fh3eFwZE/TFrlf3uqeWr
 /LAmlFjqie8SEk+eT9ACTuxmFZIfTjdMV1ia0rfEF6YMEJlMa1VTxun34c6OT3YTOz
 0IoRCTspOjedA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EFDD760A3A;
 Fri, 30 Apr 2021 19:55:37 +0000 (UTC)
Subject: Re: [git pull] drm tegra-next + fixes for 5.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyW43hM-K18AP+eTEVKnrnoAWR_yqqmNDs9SVgG+MxX0g@mail.gmail.com>
References: <CAPM=9tyW43hM-K18AP+eTEVKnrnoAWR_yqqmNDs9SVgG+MxX0g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyW43hM-K18AP+eTEVKnrnoAWR_yqqmNDs9SVgG+MxX0g@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-04-30
X-PR-Tracked-Commit-Id: 1cd6b4a04f038eb24fd18c8010e763d1140a9c7a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95275402f66e88c56144a2d859c13594b651b29b
Message-Id: <161981253797.15988.11103815384605308819.pr-tracker-bot@kernel.org>
Date: Fri, 30 Apr 2021 19:55:37 +0000
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

The pull request you sent on Fri, 30 Apr 2021 13:50:25 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-04-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95275402f66e88c56144a2d859c13594b651b29b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
