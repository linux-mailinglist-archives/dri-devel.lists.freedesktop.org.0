Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4242AD08F2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 22:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4785310EC83;
	Fri,  6 Jun 2025 20:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i+Gciyf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDA10EC2F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 20:11:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F0C6D43DD1;
 Fri,  6 Jun 2025 20:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA749C4CEEE;
 Fri,  6 Jun 2025 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749240661;
 bh=clOkOoJzn6rZefCGSVHw8GI2BsZpIvBCusr9MlQ3Jr0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=i+Gciyf4wN1uHXvzGTAVypaWj8siMr+5R9pLQ6P4x7kFihf0yrJtY5xUp5+5UOi9H
 uBjcJ5lUMxGvm2q+wlUQK1agtkS8IvHhbdEji3sHJ+k5i51uhGw40bDbMaIyj6mkRM
 yfR3e2F+p7oyjyE20ipkkqS1Aw/rSzI87r4FaeluJpvD4hM6DI3o9ZuA4f0sKKzHYJ
 79MBS8n9DcunC+BV4JOokjUPTUe3z725IOjLDfGROzD21+gJ/ojPc9p3Vzeh2qYlSg
 lb35tJBJHMMEi8vtGWkJeJUJ0sapxdhrRR5zTdbU84CQrsBTn+SrDEOPrsbxUDosuX
 pCyUlQdXKMpwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADF953822E05; Fri,  6 Jun 2025 20:11:34 +0000 (UTC)
Subject: Re: [PULL] drm-fixes, yet another one
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
References: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-06-06
X-PR-Tracked-Commit-Id: 6f7e234f74caf5f8863bbca51b1b135d0736b0b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5fc6c6f258b34fd0d2ff2a63b8a407a4dcbca750
Message-Id: <174924069335.3964077.2712700761982540484.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:11:33 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
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

The pull request you sent on Fri, 6 Jun 2025 17:27:48 +0200:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5fc6c6f258b34fd0d2ff2a63b8a407a4dcbca750

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
