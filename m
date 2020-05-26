Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748CF19B87F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 00:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAF76E9AA;
	Wed,  1 Apr 2020 22:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FC26E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 22:35:18 +0000 (UTC)
Subject: Re: [git pull] drm for 5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585780518;
 bh=dZ6g5rEXeTd4/k90kw/APcz445rQxW8LbehiZ2WKYuQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Hx4RHYUK8RvbwI/yxPXHgwF8yqvlQdLtcOsYe5WpxfirftdOffK8O3LIo/XHNfEUn
 HZATuQvoOqMNGBsdAsIvJ06NIP9P0RESdGu98zAGbGhHIHI0EvnDzKFQEG7+uv0UR0
 q6Xy9wDhnFT/pqwy/aFSh8U4OGZk8CcJhTMCxdU0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com>
References: <CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-04-01
X-PR-Tracked-Commit-Id: 59e7a8cc2dcf335116d500d684bfb34d1d97a6fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f365ab31efacb70bed1e821f7435626e0b2528a6
Message-Id: <158578051831.24680.6903465045656664847.pr-tracker-bot@kernel.org>
Date: Wed, 01 Apr 2020 22:35:18 +0000
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

The pull request you sent on Wed, 1 Apr 2020 15:50:42 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-04-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f365ab31efacb70bed1e821f7435626e0b2528a6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
