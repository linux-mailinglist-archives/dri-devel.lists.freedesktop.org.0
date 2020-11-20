Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBBB2BB3EB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 19:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9323A6E8F7;
	Fri, 20 Nov 2020 18:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B066E8F7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 18:40:10 +0000 (UTC)
Subject: Re: [git pull] drm fixes for v5.10-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897609;
 bh=bgZy/PDcE4WULqfuzRjeJCQSumd3ZCthesACnpnCoqs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ubfLp1S2vMg7saZOf/536s7tHaFGaqAlOOB5aHAkDn+zo6twYmsvr/9fUKYLmRFS9
 qZ4eQp8bpeEMEa/xYHikGzrhsNtsD6WR+gJ5j9lqzVf9WD3QiQhjyBEHZT8OQxjR8B
 Jo7AzUnRLD2hSbkOuM4Q91mHPuvh8yl7FwvxDoXY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twCYAR-+-fYi-HwbhZOtqYkjVO3aVqX2oAPsFA+GgJarw@mail.gmail.com>
References: <CAPM=9twCYAR-+-fYi-HwbhZOtqYkjVO3aVqX2oAPsFA+GgJarw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twCYAR-+-fYi-HwbhZOtqYkjVO3aVqX2oAPsFA+GgJarw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-11-20-2
X-PR-Tracked-Commit-Id: 6600f9d52213b5c3455481b5c9e61cf5e305c0e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46cbc18ed85219d534b4fbb4a39058fe66766e83
Message-Id: <160589760963.4306.15311391865559989087.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2020 18:40:09 +0000
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

The pull request you sent on Fri, 20 Nov 2020 11:55:49 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-20-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46cbc18ed85219d534b4fbb4a39058fe66766e83

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
