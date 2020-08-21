Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC024DD56
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 19:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24AD6E34B;
	Fri, 21 Aug 2020 17:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC906EB5A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 17:16:19 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598030179;
 bh=cNoYfjKrtJSQm8jTogKaryiMVq/0p/K2zYAGKiXnugk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=u6NMUj12rlNC/dENNgDFZa0GNKkuXi11Hfce0yrDmeBep0Hs5dwuYXK+Bi0iJuq1y
 +5zllTWnqUqzMem86uRwswLbsC5OjR8tfZlViy1Baw1YE2VsynTDAphSteGxWX+t4G
 xdyrq+TdprPX5iqNV8O1mTSuZEYJAuRY2QpwXSLk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzpqLjG31xd0nPmGaYs7NXiWEQTtYaZ=vQZedyWU+yjfQ@mail.gmail.com>
References: <CAPM=9tzpqLjG31xd0nPmGaYs7NXiWEQTtYaZ=vQZedyWU+yjfQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzpqLjG31xd0nPmGaYs7NXiWEQTtYaZ=vQZedyWU+yjfQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-08-21
X-PR-Tracked-Commit-Id: 0790e63f58f22a68696667102be03efb92a4da5f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 43d387a4adc48e1fe68bf467cbfd67a11d65eb45
Message-Id: <159803017933.29562.97618442697473059.pr-tracker-bot@kernel.org>
Date: Fri, 21 Aug 2020 17:16:19 +0000
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

The pull request you sent on Fri, 21 Aug 2020 11:55:16 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-08-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/43d387a4adc48e1fe68bf467cbfd67a11d65eb45

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
