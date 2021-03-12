Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC8533834A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 02:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699726E52A;
	Fri, 12 Mar 2021 01:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB0F6E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 01:50:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8DDEE64F8C;
 Fri, 12 Mar 2021 01:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615513828;
 bh=oml+FXJoCPr8T2agyc2DhTYrzrR7Bn0VoJWb9fyW6yg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hrOBfTkUP680uSJDxL7QQ1n43KfPvDN0+Th9kkhD1jn66rgmt74Bw03dWPzcH6IVp
 dTQY67D+YqCxD0GxKOu75Ib5CBTtgCXVGCt2njJpy2ofZwDrONjmrRTzmyevpLML6F
 OC7L70ZRwMHmx2UkgCwMnMSwAEbESlTSdWnjHYcnJPMwgQY8iSM8JvLpqxHacntAa6
 8EJNqtQHidFMkV32viLw8/77a7WskHQzAbYcWLlEGVOnXTXouY/XeAcRhIXUsvm3eC
 SqJl5cEOlaV5RUUS2wEdJ06/ZT4tm6iqWzs+4Y6TecFhwMXKADwOaIis2m50vV9+Kh
 w2nSPfQl7pscQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7AAB0609CD;
 Fri, 12 Mar 2021 01:50:28 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txMJH051Yr3pgYaq-vOjCj18DuUKQivSxVZoAB=z3w5Jg@mail.gmail.com>
References: <CAPM=9txMJH051Yr3pgYaq-vOjCj18DuUKQivSxVZoAB=z3w5Jg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txMJH051Yr3pgYaq-vOjCj18DuUKQivSxVZoAB=z3w5Jg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-03-12-1
X-PR-Tracked-Commit-Id: 4042160c2e5433e0759782c402292a90b5bf458d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f78d76e72a4671ea52d12752d92077788b4f5d50
Message-Id: <161551382843.16991.8376269158867862084.pr-tracker-bot@kernel.org>
Date: Fri, 12 Mar 2021 01:50:28 +0000
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

The pull request you sent on Fri, 12 Mar 2021 11:35:33 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-03-12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f78d76e72a4671ea52d12752d92077788b4f5d50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
