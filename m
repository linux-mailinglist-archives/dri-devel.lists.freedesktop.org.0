Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E136369845
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ADF6E15C;
	Fri, 23 Apr 2021 17:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8306E15C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:26:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BA175613DB;
 Fri, 23 Apr 2021 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619198763;
 bh=wfz6N5xeBn+UX47MzlcTSUCbXmUZo0AJF7GcXr9pukc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=J4ITZHEUYv7gtJTfoBG/+mdqnEHYKQXrB1V8Tg/kMx+cEvdiZRuGIdiI15sNAtl/D
 3KS70OPFloHejFqkdbIU3Z2wVCWXZEB58c8c97Ba4liF7+NJP52WUwnVEgsp/GACQX
 GTo4y8k2J7YWI4L8ZzifqvY3jNWsvBd3yTxwR4n/FcOV2i+bOUD17djD+YFpoxsYvJ
 6lknmDbkkUDM3zs3CyrIstjiXlM9NkLLjuthB4Np+k0ekBwDsL2D+AEjzi6NLOc8c1
 ScE0zQfGxTbuFwlVly6p/GthPIEsrhN+k+Mjc6LJ7Oc/0nrw7ri1LQbaZXJgjeaQZC
 Zlge5HhABZGwg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B0AE8608FB;
 Fri, 23 Apr 2021 17:26:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.12 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
References: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-04-23
X-PR-Tracked-Commit-Id: aca38735ae624b93c71c055b68d5802b8f356ea5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5bfc75d92efd494db37f5c4c173d3639d4772966
Message-Id: <161919876366.26356.3681344564819322556.pr-tracker-bot@kernel.org>
Date: Fri, 23 Apr 2021 17:26:03 +0000
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

The pull request you sent on Fri, 23 Apr 2021 13:52:29 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-04-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5bfc75d92efd494db37f5c4c173d3639d4772966

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
