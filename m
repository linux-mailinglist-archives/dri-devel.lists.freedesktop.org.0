Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EB437116
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 07:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161456E51B;
	Fri, 22 Oct 2021 05:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451586E51B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 05:10:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0EBEC6120D;
 Fri, 22 Oct 2021 05:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634879413;
 bh=hAUsbK095GhU9u03l79kWnzchsQorHpB0MDHbzvNxkw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Z1WauhgmbEJmYAbkIlC54FYXSUiXQHK7PBkQDRjjnjk/zosxZ28p16rGebclvKNlC
 IJahHif4dBJlO1NMJKzIrzrfyuJrXwgkWoZ1fVCuQxeZq3CWmSUHWiJ2SDFcx6Wwdy
 82mXZsFhAGUcS9xzSAPt96ttwXEiyKZ3wAcbZjFAVvNKeHDh5F0iBeLoIhCydI988O
 PulMYRnP3YQtPxcxgBi8xHc3MjEGl9IM4UkxDtUkKt9HCklKCNqVO1LA5Fx3iOTdhS
 77Ug7r0/QEFpQrvWPj4eksibF6xy2tz5zTmlfAnRsClHOic9r+gpqvWUK/ZkabPiKL
 V78KIrac67QtQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EE2E3609E7;
 Fri, 22 Oct 2021 05:10:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzoEc2rNg9tObnmTnqhg_BEcKQiqgAgqAQOphJa1M760g@mail.gmail.com>
References: <CAPM=9tzoEc2rNg9tObnmTnqhg_BEcKQiqgAgqAQOphJa1M760g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzoEc2rNg9tObnmTnqhg_BEcKQiqgAgqAQOphJa1M760g@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-10-22
X-PR-Tracked-Commit-Id: 595cb5e0b832a3e100cbbdefef797b0c27bf725a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 64222515138e43da1fcf288f0289ef1020427b87
Message-Id: <163487941291.3037.7507080835979258699.pr-tracker-bot@kernel.org>
Date: Fri, 22 Oct 2021 05:10:12 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 22 Oct 2021 06:08:20 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/64222515138e43da1fcf288f0289ef1020427b87

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
