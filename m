Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270338BF33
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 08:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB726F5BA;
	Fri, 21 May 2021 06:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33A16F5BA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 06:22:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 64CF2613B6;
 Fri, 21 May 2021 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621578165;
 bh=j32Fr6T+MmMXcheT4XMEXRjvwY2kAnZ0pgTlhrxSqnQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Ora9y2gbL4DPDrAj+J4Ud1ijs79htl3ix3+pHhoGjEpOe0jA7teLESTMC4G705Ti0
 rvxl3enqX3yIiOTou1CpYIPzPqsVBxr3u1aVRfoId1UG7p7JiQTMYkC6XIfmOGiJBB
 v9ZWaTDj+LQuCjUkWOnwWXLRpHGw79N2Sh65Jq6zKlocXbVxyPnbfkzlB0TdCt7Pkr
 3mcL+l3QCrb6kCS3lzgqBESVccYcst37k/EO3g/96+tddho7jOXQbYW5qZuw2g+bQM
 9OBhHlB0tjVyNBTo/CR/wP41d8c1lJCobx1niWdECSp9ZKywjuqxifU4Gf+cCG+Bc3
 Fj5b9bL0PEs3Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5166860967;
 Fri, 21 May 2021 06:22:45 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzqfc9Xx9bpbp2fKKij=+YYGYG=pSzeVQG=H1pmZf0tBA@mail.gmail.com>
References: <CAPM=9tzqfc9Xx9bpbp2fKKij=+YYGYG=pSzeVQG=H1pmZf0tBA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzqfc9Xx9bpbp2fKKij=+YYGYG=pSzeVQG=H1pmZf0tBA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-05-21-1
X-PR-Tracked-Commit-Id: dd6ad0516ee38112321e99ce368fddd49ee3b9db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79a106fc6585979022012e65a1e45e3d2d28b77b
Message-Id: <162157816526.23556.3348095363542917867.pr-tracker-bot@kernel.org>
Date: Fri, 21 May 2021 06:22:45 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 21 May 2021 14:31:53 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-21-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79a106fc6585979022012e65a1e45e3d2d28b77b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
