Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D3F21AC89
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 03:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0408C6EB58;
	Fri, 10 Jul 2020 01:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5186EB58
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 01:40:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.8-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594345203;
 bh=i4HIRRheC66Dla3cyYkRyLg0MIuXZImCZW/QuJUVC00=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=fKk+mEuG6gNtiLsL3N0AVSDu5xFhBbFlKjlPdUJR1jiRspEtqMBvmKqbimBUdHL4H
 JDPE61YxX/tEHZpZcdcLOw7JebFguH4mUInraQ19Fm+mmNORH06ecWYIxjHFI1qHV0
 4/0y/wNreclsFXyIwO+1sMiGnt0REGd0BcVbMZYo=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzAJTvCx4_2o1RyK78n-Sr6MCByLTF=_P8mhDntxf4v4g@mail.gmail.com>
References: <CAPM=9tzAJTvCx4_2o1RyK78n-Sr6MCByLTF=_P8mhDntxf4v4g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzAJTvCx4_2o1RyK78n-Sr6MCByLTF=_P8mhDntxf4v4g@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-07-10
X-PR-Tracked-Commit-Id: 38794a5465b752118098e36cf95c59083f9f1f88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42f82040ee66db13525dc6f14b8559890b2f4c1c
Message-Id: <159434520350.26610.12870276466678802161.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jul 2020 01:40:03 +0000
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

The pull request you sent on Fri, 10 Jul 2020 11:13:41 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42f82040ee66db13525dc6f14b8559890b2f4c1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
