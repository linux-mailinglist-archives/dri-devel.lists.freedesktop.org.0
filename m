Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC4726684A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 20:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D99E6EAD8;
	Fri, 11 Sep 2020 18:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325E86EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 18:37:13 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599849432;
 bh=To9qZZExMmtVAxS0FChFah7fb/s6Qm9qDZB1FFFO8RY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=jQ+3mqTV/qjxVfYc30M9ApWGWDmsxps/zEUpcqa2zqvDiTA7fNJ+aRLzE0w2EH2xR
 h8qm8qxCzFYAftZzgLGO+iiqsLEbZUmQcV8LOKjthkjqgDkgocq787D1qPalRI/SFR
 gyCNRoutqQTIkMtq3upHVqA93SuOSHNjvyJvVy5k=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txiwAocSprg6zCMF7ajJm-aY7wX=NY47+ZhVdKLfVZi+A@mail.gmail.com>
References: <CAPM=9txiwAocSprg6zCMF7ajJm-aY7wX=NY47+ZhVdKLfVZi+A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txiwAocSprg6zCMF7ajJm-aY7wX=NY47+ZhVdKLfVZi+A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-09-11
X-PR-Tracked-Commit-Id: 7f7a47952c0f981f9c9a6409c8cf8d025d55af64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d67f2ec1f5fed849d9773cd783ea161df842bbae
Message-Id: <159984943290.11596.10839572395961557016.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2020 18:37:12 +0000
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

The pull request you sent on Fri, 11 Sep 2020 17:20:15 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d67f2ec1f5fed849d9773cd783ea161df842bbae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
