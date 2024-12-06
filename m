Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D959E7B20
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 22:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DC910E169;
	Fri,  6 Dec 2024 21:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l00u+leM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19010E169
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 21:39:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4291A44525;
 Fri,  6 Dec 2024 21:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BF3C4CED1;
 Fri,  6 Dec 2024 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733521150;
 bh=vZP4vM2AM8D0g/lVrkfB4MhuFwblDSY7KwP63Gv/D8E=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=l00u+leM5BDLoSPmGyuLQ0Ljoy+R21QZYF7G5YPm4fN9jf/lYhkYeLjuR/XQLx8yC
 FjhAS1x9bXNHFWKoUBk8qBe+hQ9HbsOXK/q2KKeDWtDB570U4l6vph35fYPQMapB/s
 2+7ANU/q3kM8Jj4SRzb0kKbs42NipjnBT7rx25UgjelGo8s+mRb5lhNksyziCtChTy
 54Ad0zy2MYFr1HUMnSEBB5Fcj+5q+pNyZf9Bc7us/P5BisGKZSBG6FSFyKO3NbzpHo
 80PL/ZrIoncZKp4eMU9hjc8Rg4wZlvBXGRiC8ygVKCZAMXJYLKWJOsjQU28O+GOmFj
 /iPu+6XyaYUHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE18D380A95C; Fri,  6 Dec 2024 21:39:26 +0000 (UTC)
Subject: Re: [PULL] drm-fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z1No0B2ZRO5kq7Yx@phenom.ffwll.local>
References: <Z1No0B2ZRO5kq7Yx@phenom.ffwll.local>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <Z1No0B2ZRO5kq7Yx@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-12-06
X-PR-Tracked-Commit-Id: 1995e7d05062097109ea1807778ff8654c2de7f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c7cde621b2acfd6bc7d5f002b19b60ad2ed25df8
Message-Id: <173352116553.2804777.13986947259395633354.pr-tracker-bot@kernel.org>
Date: Fri, 06 Dec 2024 21:39:25 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
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

The pull request you sent on Fri, 6 Dec 2024 22:12:48 +0100:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c7cde621b2acfd6bc7d5f002b19b60ad2ed25df8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
