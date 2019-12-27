Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BC12BB39
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 22:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6EF8984E;
	Fri, 27 Dec 2019 21:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B278984E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 21:25:07 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.5-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577481906;
 bh=cli8s/s8DVhJmfEmsGDUlvnBRpKpzvMzh9Mvnhbwt00=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=AQ6a8yFOLwqnxYS3H8LaH9O6MicsB85yDTsnwn/es+P5nahEcOi2WTivq9mSjGh0E
 ks2h90MZzzgxusmE1QzS9BTrW1jSeidjMOIzpvxCmtv/UVuYxXUh+oGQ4GIb44gFdV
 GTjCZjVoI3CWSoe11FTKxRiFv/5UgfaTQhaPHBqA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzSB+6b0KuXaKfTP_GLpMyBUQheC_L4Nyo4zhygDvixUw@mail.gmail.com>
References: <CAPM=9tzSB+6b0KuXaKfTP_GLpMyBUQheC_L4Nyo4zhygDvixUw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzSB+6b0KuXaKfTP_GLpMyBUQheC_L4Nyo4zhygDvixUw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-12-28
X-PR-Tracked-Commit-Id: e31d941c7dd797df37ea94958638a88723325c30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 48a8dd171993569cb77dee0882a47abad47d2837
Message-Id: <157748190690.18926.9135544284124087750.pr-tracker-bot@kernel.org>
Date: Fri, 27 Dec 2019 21:25:06 +0000
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

The pull request you sent on Sat, 28 Dec 2019 06:08:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2019-12-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/48a8dd171993569cb77dee0882a47abad47d2837

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
