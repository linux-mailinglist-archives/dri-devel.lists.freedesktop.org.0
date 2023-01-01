Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0565AB2B
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 20:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4478710E07B;
	Sun,  1 Jan 2023 19:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB5210E07B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 19:30:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5620360DF1;
 Sun,  1 Jan 2023 19:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2A53C433D2;
 Sun,  1 Jan 2023 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672601425;
 bh=ohMCezbtIQBRAV5WuTKDDWJnAhLotvcWzSMbDWmFQR8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HNwF/uF5Z/XtHV0AMuONZ3Qx3U1+MW7OMJnZJbBWfQzVTlIxJJZDgw9WCqRQFBNI5
 /uE6h968qfGjuZGvsUMBLP4N+gHLln+QPVKkcG0+hXB8KfQxWfRqCylQmL3GWZWcRi
 SVENnT826r9iujWWfkWH4QywqNonbMzUfWiQNnGsWJvQNvKGqZ95kKFj1PEtvr5WXP
 DQ6kxnb7xyOeEqp/D7qBidu4raBeziO6Jq2mdtc9vNFQTbSFNUTHlPZhbL2tQx/64S
 9sIlVT6qpy3j4beQJVYECQmh9ZYeMPP6OBUExDYLuV9ujUpl76vYBQrHV0ahRTGBen
 tbmyxTxVaFNVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A3131C197B4; Sun,  1 Jan 2023 19:30:25 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for -rc2 if I'm not too late :-)
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y7GDIi18rJ/YgbYn@phenom.ffwll.local>
References: <Y7GDIi18rJ/YgbYn@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y7GDIi18rJ/YgbYn@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-01-01
X-PR-Tracked-Commit-Id: a9f5a752e86f1897c3b377b6b861576a4c1a2ff0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b41948296b76588f5ebaf7cbc5be5c803ece70a
Message-Id: <167260142566.13445.16240168930511041613.pr-tracker-bot@kernel.org>
Date: Sun, 01 Jan 2023 19:30:25 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sun, 1 Jan 2023 13:57:06 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b41948296b76588f5ebaf7cbc5be5c803ece70a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
