Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFD41F389
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD956EE77;
	Fri,  1 Oct 2021 17:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FFF6EE77
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:45:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A48F9619F8;
 Fri,  1 Oct 2021 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633110345;
 bh=A0ixqXKF9TR89JixDePM4QYhyS0B3OR9sfVUyNPUABM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jRo97psFmPjf0nEQn2PYUFbFcp5T1qkJTrNBayFvyVVd8iOQU6obLywTYQNmklJQU
 q2VE3PKSa8aLnDTWuhMExB/kQPDT5a8/p5E984R6xrUIRpJj+tDvO7nq6S07jPy2IZ
 NtE1cIRw8u2PnmLOAeFN6iNnIvfnGCiMk0ogH9aJjlr+Y6ZamPPpFgFIfNj4Vn4xDg
 41VQCdP23I8T4NG6u9XJQIdkOdIOP6nsgROCHa8IONsWTiU9gixBXlV3dmcibizE6B
 CvvNnueWzqOlekIdGjkHgkpnc+th2tPmhNY7dGW0arbGfx3ZyTR6Kr8wcnRfjn8vC7
 DHPLyprjjg+3A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9852760A4E;
 Fri,  1 Oct 2021 17:45:45 +0000 (UTC)
Subject: Re: [PULL] drm-fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <YVc94kx7GVHwt+uc@phenom.ffwll.local>
References: <YVc94kx7GVHwt+uc@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YVc94kx7GVHwt+uc@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-10-01
X-PR-Tracked-Commit-Id: 78ea81417944fe03f48648eddeb8e8a8e513c4ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 24f67d82c43c9c594821ee1bc4367a23d89d9f8b
Message-Id: <163311034561.16016.7072504325548357764.pr-tracker-bot@kernel.org>
Date: Fri, 01 Oct 2021 17:45:45 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
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

The pull request you sent on Fri, 1 Oct 2021 18:57:06 +0200:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/24f67d82c43c9c594821ee1bc4367a23d89d9f8b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
