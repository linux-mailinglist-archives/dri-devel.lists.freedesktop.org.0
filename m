Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B422FF9DD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 02:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C5C6E980;
	Fri, 22 Jan 2021 01:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941736E980
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 01:18:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0AD52239D4;
 Fri, 22 Jan 2021 01:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611278312;
 bh=Ab/7UB3+CkjTq/GN0XW1zRbgIy6+ugyLv/KLYCTmRa8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=T3B3eq6FoE2jghja2wucAXxJJCuA0ESmBsjJ6SudIqTjKN75kDk4AHbFXe2WY3EzK
 ZRLvATADkIHpjrR4gUHn80L158ZE/kv64AcxUA8As2CiuJAa+nIrCz1plkvhowLiis
 qY89Ka3B/Fza6WSdPsc3bv1kwafcWdxrg38bvt8QiRTal0VhfWCtWphYRznpjbQYOx
 4fevTiA7XZ8IP0/MErJM86BLGzccQfSAjUMJqHXyTqximC4SC8PP0T5mBQayrWsivB
 d5ppvXSz0VPdoR3oyvqmHXTfT9VwTYWgNMKA7xAgtyb79v3bLEHIhU28LQlqItDqyf
 JqOu9o4pUhvLA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E430760641;
 Fri, 22 Jan 2021 01:18:31 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.11-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txc42qTPjmjChm3Z9itOp7-O=YivoG0oa8DsRMFriF4bA@mail.gmail.com>
References: <CAPM=9txc42qTPjmjChm3Z9itOp7-O=YivoG0oa8DsRMFriF4bA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txc42qTPjmjChm3Z9itOp7-O=YivoG0oa8DsRMFriF4bA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-01-22
X-PR-Tracked-Commit-Id: 06ee38dc2aab3b5a09feb74128cf7326a490b788
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36ada25026357c855d5839166f78017509824b77
Message-Id: <161127831186.8007.4452745686230068305.pr-tracker-bot@kernel.org>
Date: Fri, 22 Jan 2021 01:18:31 +0000
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

The pull request you sent on Fri, 22 Jan 2021 10:00:50 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-01-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36ada25026357c855d5839166f78017509824b77

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
