Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44123AC9D96
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 04:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4752B10E34D;
	Sun,  1 Jun 2025 02:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DTUP+Xsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED7610E35E
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 02:46:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D45E644A4C;
 Sun,  1 Jun 2025 02:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0D3C4CEE3;
 Sun,  1 Jun 2025 02:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748745959;
 bh=zBiuqhh/LJZyz4fb2suDDFeazmxpqx7uWyLWaOTLLE0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DTUP+XslB52kw9ry9gWkkZyFjb8JB9IDNjbLNF66GY+SPxeuNV1BJswHyMfUrlieU
 xr9vCUMRIbJJYLL8l24LZp30y2dDaDZI3I+b9Jvkj97z7Rr62k5NYaxKM8/BOQHC3N
 vKSvX2VASax9bVT+It7oc690tETMs35bUSsI3WhoSf2s+oSF+3k8rHYoQWONdvDHbp
 aaGj7QE/epHPnbC5OSaeni1HzRnLYampd5Op/42azSq/1g2/zCN5eIL4TN7oHVfUvs
 hSSre37UXtAScBV1niqiV1TXn0CTa+42jrQd/pXU5tQrmJvnQ9Ml8ZQUrT1Bq3gyZa
 b3p/Rd6fUGtZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB38F380AAD0; Sun,  1 Jun 2025 02:46:33 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDs4uwcxU_M4mpVE@carbonx1>
References: <aDs4uwcxU_M4mpVE@carbonx1>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <aDs4uwcxU_M4mpVE@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.16-rc1
X-PR-Tracked-Commit-Id: 05f6e183879d9785a3cdf2f08a498bc31b7a20aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b42966552bb8d3027b66782fc1b53ce570e4d356
Message-Id: <174874599246.296823.858848517798857863.pr-tracker-bot@kernel.org>
Date: Sun, 01 Jun 2025 02:46:32 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

The pull request you sent on Sat, 31 May 2025 19:13:31 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b42966552bb8d3027b66782fc1b53ce570e4d356

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
