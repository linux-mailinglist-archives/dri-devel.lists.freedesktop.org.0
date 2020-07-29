Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75906232716
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 23:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED476E2F8;
	Wed, 29 Jul 2020 21:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC936E2F8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 21:45:04 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.8-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596059104;
 bh=IvltQxPcmxATCkw4biU9TkRTnUWnbuoEgY6PwQ0dIjE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=n+G9T9PAQfCTJezhqXG2b+6pFMgNP8jY39uNhA/pkOVjWGxi8PyuwlNes7xfFSOFO
 Sq1p2NNJWCR+u5SnpE/iDKZCelQVe/9OaympGpCsAKGmtEc4eJXg+TPwp8bqTYPZ8z
 ZlAjJvoQlxEDjVjlCCGu5lTXhE4YwWkhPUTRz1Lw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzCWbg3CUSeywiHxQ-fCE1FAGGdOt5Qm+sjsLQLBSExyw@mail.gmail.com>
References: <CAPM=9tzCWbg3CUSeywiHxQ-fCE1FAGGdOt5Qm+sjsLQLBSExyw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzCWbg3CUSeywiHxQ-fCE1FAGGdOt5Qm+sjsLQLBSExyw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-07-29
X-PR-Tracked-Commit-Id: a4a2739beb8933a19281bca077fdb852598803ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2f3850df7f95537e79c561f7be49df2e4ad8060
Message-Id: <159605910453.4880.16477590993967546458.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jul 2020 21:45:04 +0000
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

The pull request you sent on Wed, 29 Jul 2020 14:44:16 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2f3850df7f95537e79c561f7be49df2e4ad8060

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
