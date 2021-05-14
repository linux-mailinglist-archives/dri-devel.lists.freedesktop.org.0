Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7CC380F5C
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48AF6F3D8;
	Fri, 14 May 2021 18:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8767B6F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:00:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1124261415;
 Fri, 14 May 2021 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621015255;
 bh=kvbz3KTg9xADA+gxQXhWUv0X8OTVl3Z5XTp4gfvba3A=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GOy7qUXAHIOg2s2oXjocBGm0nZ4ZQmfxrtuGLDtspelOfVjSur1odDdBQOCnOw/0h
 pMHHC2NQ5rxvzm7ASGDOfwEkKtmNJXP+Y0fRVLOFCgTe99TZ1JGd+vm8HksE+8ZbXP
 c/CvuWZaG+iVjGSERdvURkaokbzQ005OfIJk2sYIOCXpC7lLRY6BwLpbTc9R46scNx
 N8qDnTPn5wWrAtc86VlDOV+qrhZRYXSrUV60931T3WwmoRNDYCbqL+OgFaiEd+hdk9
 aR9hEd/V5tGmlnrJmzVfM8Fuzy56Ls/9Dp7nwHy1Zn4Rda2owmLJ0CsAFDhkJGt9eG
 Yx/TekrxVQhgg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0B58960A2C;
 Fri, 14 May 2021 18:00:55 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyXjogjugi55XdAQd-ucMCk=ohDXS+vqdiaMk_aCL6aHQ@mail.gmail.com>
References: <CAPM=9tyXjogjugi55XdAQd-ucMCk=ohDXS+vqdiaMk_aCL6aHQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyXjogjugi55XdAQd-ucMCk=ohDXS+vqdiaMk_aCL6aHQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-05-14
X-PR-Tracked-Commit-Id: 08f0cfbf739a5086995f0779bbcb607163128a9a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5304a4f9ad88a712c26c63691a99c0b9b1b5dc6
Message-Id: <162101525504.30508.5454143123535563046.pr-tracker-bot@kernel.org>
Date: Fri, 14 May 2021 18:00:55 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 14 May 2021 12:34:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b5304a4f9ad88a712c26c63691a99c0b9b1b5dc6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
