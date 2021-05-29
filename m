Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F373949AC
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5006E213;
	Sat, 29 May 2021 00:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A63C6E213
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:51:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BBBD1613F6;
 Sat, 29 May 2021 00:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622249461;
 bh=RJGO4ySFS5ik0AyOe7U96615KYMPdVZ7aXlA7T0q3eI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Mbc0KIHuyEGmSD+64ALHE1/RiFml9wXiTxGDByJ3MbCUURxlkTpDd52cZkLaxlwXy
 N5Md1ouuYLwNidRWSi3exQJLGg6rm+gYuWwbNyuG4hjjwrYhiQNRc5eKTSX+90gcvI
 MANi7+a1tgqF8BxlU/fWNOOByBFqtq6aGUhokCX6CRH9J4j2oTlrR9wRGpw3NboJNB
 OMOsxeKBamL9SXdxAy4ICq8nuKatpE0lB9MjXH7DU1czaOEUc3mBm+9lUE3wF9cTOJ
 gcJ39UhQmQIMh5ZLS+rKnFKtjsEb/EVK31XnRzltY9ML243D/rKcVrZ0mst/JwiCqo
 0itiEq3+ujafA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B0883609D9;
 Sat, 29 May 2021 00:51:01 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.13-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twKOn4j8-_gDfm_DsQv-96MA6Wv+76bURR6Tb34jkVMcQ@mail.gmail.com>
References: <CAPM=9twKOn4j8-_gDfm_DsQv-96MA6Wv+76bURR6Tb34jkVMcQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twKOn4j8-_gDfm_DsQv-96MA6Wv+76bURR6Tb34jkVMcQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-05-29
X-PR-Tracked-Commit-Id: aeeb517368822e2b24231f5bd43a98ecdbe65d59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 567d1fd853b8786f93ba399c8ff7c8106bed5fe5
Message-Id: <162224946171.17808.6606271609905792324.pr-tracker-bot@kernel.org>
Date: Sat, 29 May 2021 00:51:01 +0000
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

The pull request you sent on Sat, 29 May 2021 06:00:49 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/567d1fd853b8786f93ba399c8ff7c8106bed5fe5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
