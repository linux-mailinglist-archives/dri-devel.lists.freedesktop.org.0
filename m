Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42273D38A5D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 00:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8559D10E009;
	Fri, 16 Jan 2026 23:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n23VEfEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C3310E009
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 23:46:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 82E9840A50;
 Fri, 16 Jan 2026 23:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F5EC116C6;
 Fri, 16 Jan 2026 23:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768607169;
 bh=d3TeX1qpHGd9CjswJwmcQSssrRTzvz4VKwnucMPHNe4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=n23VEfEtEyeQpyZaSQojCZ7PfvLa2b4IQQ2yxTz24PRrLFYvRaqF+D31++REIjqMA
 ondw2pU4WxRRwUJ0d0bYFJwo01n7dmlSWx1qDd33hSJwRpZuTclSTUOV39aNQm2Zan
 tufIhR18PtNF9S1TMkYmYp6eXrsYPqHZUwsf2KZpYSp2z1hDY5HIk8NmPPbFiRECum
 1bcjmN/s7AkFjgXPgVBgmLqyxWFmBlu6eqVzCwRaW6ShO2XInoFgvAbIUIl7zQJMFg
 WcesmHrAyuRO2pjD2jjCmjLH7+JHwB44zviZqBXe6+AJ6B60HaO81JuSXfuE8eVQop
 Gne+6myAGrGpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 01ADC380CECB; Fri, 16 Jan 2026 23:42:42 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for 6.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aWql3MQyfEsKAqPT@phenom.ffwll.local>
References: <aWql3MQyfEsKAqPT@phenom.ffwll.local>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <aWql3MQyfEsKAqPT@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-01-16
X-PR-Tracked-Commit-Id: 9dd1f5f3eb8cb175e2f7fd2a685bdb6b1bd2a726
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 39d3389331abd712461f50249722f7ed9d815068
Message-Id: <176860696061.838122.11175294585850239892.pr-tracker-bot@kernel.org>
Date: Fri, 16 Jan 2026 23:42:40 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@gmail.com>
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

The pull request you sent on Fri, 16 Jan 2026 21:55:56 +0100:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/39d3389331abd712461f50249722f7ed9d815068

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
