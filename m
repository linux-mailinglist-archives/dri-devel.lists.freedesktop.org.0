Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148D3819D4
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 18:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E466E417;
	Sat, 15 May 2021 16:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721A86E417
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 16:29:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 51AB8613C3;
 Sat, 15 May 2021 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621096142;
 bh=0kWbhIzou/K1V6tvaJurAgMxCJs9oEXS3QfpYfLpJVk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hWsXGG8XGNf6QabVrcBto6KbHKRlZoRObXWkTBiRjFfgFEgVuKx/WgXyf6DOvS3u4
 TFaeTSctkbFqn3jLVpXXt65AupLpHppYMeQTDoz7dNz/D+W92YThvLnviIldb0myVo
 bhIzdps8o16CoiQKB0VwBWoVMPI1HHboZAx4T17IhKLZCP/TQtrvjzJCvDXQnOS/zz
 kk8b0ktLmCcnrz+dEGkq+SmeSx0PTrAwxeoRfka+aGQRBMs4GvN52ZAAZZgwUnIVu9
 fgIXqCvgvvylAYIodGkjQTTibbQLGWN0EQFHleFAvapK2FBnSWp7ZMCLCZKjZNtCrM
 /xzMS4VOqVBOw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4C47A60727;
 Sat, 15 May 2021 16:29:02 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.13-rc2 (part two)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyEzE01K43mAfz3Wv+M0Q7n+3rHriNboSWcjEERy1Hxig@mail.gmail.com>
References: <CAPM=9tyEzE01K43mAfz3Wv+M0Q7n+3rHriNboSWcjEERy1Hxig@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyEzE01K43mAfz3Wv+M0Q7n+3rHriNboSWcjEERy1Hxig@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-05-15
X-PR-Tracked-Commit-Id: 5dce58de4be8a4c9f2af3beed3ee9813933a0583
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 33f85ca44eec7f1ad4be3f3b8d575845b789f1b3
Message-Id: <162109614230.13678.16024789612812255461.pr-tracker-bot@kernel.org>
Date: Sat, 15 May 2021 16:29:02 +0000
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

The pull request you sent on Sat, 15 May 2021 07:02:44 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/33f85ca44eec7f1ad4be3f3b8d575845b789f1b3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
