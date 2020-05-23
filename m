Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2553B1DF4E5
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 07:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BCF6E0BA;
	Sat, 23 May 2020 05:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FB16E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 05:05:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for v5.7-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590210302;
 bh=nEpj/nOOCViKWPVZbXZFnL/xS/rRAxHHWdkrAzWw4zk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=HiEp3FfbFeBDgO4/tPfUL0O8xdlItjqSxFg9XPI7QH1kCtYvTtlWghuhoMpXqljVP
 8TJhOi74hhmhgTZToCBda6igkckTr92Vio0lLZ5AadQomX+1OGLgHg6VZqrKZi1BQe
 qDdnPmLRtCpt5+aCpE6TmgofwmOUeMJz9YQh/OTE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzdB+BSVLCDwpCBLvKOmamqcwUoSUk4izUzBLK-nY2RRg@mail.gmail.com>
References: <CAPM=9tzdB+BSVLCDwpCBLvKOmamqcwUoSUk4izUzBLK-nY2RRg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzdB+BSVLCDwpCBLvKOmamqcwUoSUk4izUzBLK-nY2RRg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-05-23
X-PR-Tracked-Commit-Id: 7d9ff5eed4146bf026c69e766ff630bc0bd555bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a24deb9d68b423f3e5e190b9836d192ee3e0ff9d
Message-Id: <159021030287.8790.17032610237010684826.pr-tracker-bot@kernel.org>
Date: Sat, 23 May 2020 05:05:02 +0000
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

The pull request you sent on Sat, 23 May 2020 06:38:11 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a24deb9d68b423f3e5e190b9836d192ee3e0ff9d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
