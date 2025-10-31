Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A2C2713B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 22:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF8510E0FE;
	Fri, 31 Oct 2025 21:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fJmHXK7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C5A10E0FE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 21:53:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 12B36407E7;
 Fri, 31 Oct 2025 21:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DF7C4CEE7;
 Fri, 31 Oct 2025 21:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761947589;
 bh=JvoRvfCxZUYt2g8uVJ6bHPnNedciMmKoytiyMwtSl8E=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=fJmHXK7vKX5QoXLJNCmqCG7Zn9w4VolIDRn9MzyEh5m6wa4LU5P0pTzVkN67b3WwC
 ycJMAAgV9Wl07Ktbcqc4GTHpXnex3YSG2XjebLeum0wXOctzAvjUilNT4q/1KpUZIP
 LYg719DkMaEtOxBxC+eHVN0vBw0DEm3K25Co4juft1dcNZHkfiWG6rXR093D6ZsSnf
 ZibJMS7g0JH+38tso7oSMAuxdArP0eQUwkYuJpBcqaqPIqzAYx0dRZwBfQlGpGm5Ze
 fPmif3IlMoYCMJm2xJmXDpPB8FlDFccFJfhwiHuuZsWJc3S5yScfvkZTslvP3yFD2A
 HHBq0bLlVz9WA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F353809A00; Fri, 31 Oct 2025 21:52:47 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for 6.18-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aQUs9m_M8NbteVhR@phenom.ffwll.local>
References: <aQUs9m_M8NbteVhR@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aQUs9m_M8NbteVhR@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-10-31
X-PR-Tracked-Commit-Id: 41dacb39fe79cd2fce42d31fa6658d926489a548
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec0b62ccc986c06552c57f54116171cfd186ef92
Message-Id: <176194756579.649199.7609217927268762355.pr-tracker-bot@kernel.org>
Date: Fri, 31 Oct 2025 21:52:45 +0000
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

The pull request you sent on Fri, 31 Oct 2025 22:41:10 +0100:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-10-31

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec0b62ccc986c06552c57f54116171cfd186ef92

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
