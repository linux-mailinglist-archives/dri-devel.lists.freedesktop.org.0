Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FE7E863A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECD810E2A8;
	Fri, 10 Nov 2023 23:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBAF10E2A8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:09:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9725561B04;
 Fri, 10 Nov 2023 23:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6DE6C433C7;
 Fri, 10 Nov 2023 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699657755;
 bh=A3dPl7sC2yMREeU0TjeOfJHa7WpR5SD38E5IBjbzRqg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Xr6OikodRoSzX04XeqkZqMomqosSjPL1zO88PB2g87haNN+Z1m3JoqwYfInsO69O6
 /hq+s6u0sM7Gm3gO0ut84/gwkutQ5+d9n6e0o9s1rveUbWzNvzsx9dYTHdPVXltq/O
 2RoyA/bo7JckNmEyTKfPGheCkSbvKEWwGiRFYKGDA4iJaZYwjGWQx/Sv6aO/4RUkVD
 Zlz0Wqc6HtJDfHZk9Lsf/TFtxjH5N21rfPVX/g0Ve6d0S5kwE+VwzVayHz8s4k0WEy
 d2/5EDj8/yXwAEUGibt3hojPCEWUt1boWDPZfG2Kd6/7jOEOPgwEA6HVFd7wavTWgo
 tM1G1NnfQo1WQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D6097C4166E; Fri, 10 Nov 2023 23:09:15 +0000 (UTC)
Subject: Re: [PULL] drm fixes for 6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZU6XKgI7FZsIJWoq@phenom.ffwll.local>
References: <ZU6XKgI7FZsIJWoq@phenom.ffwll.local>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ZU6XKgI7FZsIJWoq@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-11-10
X-PR-Tracked-Commit-Id: 03df0fc007ca4713fa1e716329af556f981807e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c0d12d769299e1e08338988c7745009e0db2a4a0
Message-Id: <169965775586.1420.12718189167614144876.pr-tracker-bot@kernel.org>
Date: Fri, 10 Nov 2023 23:09:15 +0000
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
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 10 Nov 2023 21:48:42 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-11-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c0d12d769299e1e08338988c7745009e0db2a4a0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
