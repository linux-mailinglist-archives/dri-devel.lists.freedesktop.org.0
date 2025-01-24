Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D2A1BD1C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 21:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5430810E0C9;
	Fri, 24 Jan 2025 20:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NVTQa6Hb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6962B10E0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:04:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0686A4199D;
 Fri, 24 Jan 2025 20:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADBCC4CED2;
 Fri, 24 Jan 2025 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737749089;
 bh=66DAqseZ2lNKxCLXrNtC9M/P/NwPacWgh830TNY+CdQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=NVTQa6HbfERISaWyU1xrg3q78ynrZZdGXhg2pmWMu09dkggzC4c01soeh8/avpNM5
 vdj1iI1be4UdOuG6n7vg5J24yLY0SITLqLjMtZ/HVe6BfgcPGGfomJUXrimlfpgcaA
 HCGJnFx8yz0W9vhUew5FSPHPeb8aAkR3fahUpZL966dzH0ZASHRKCjUdOAILvNTiyo
 PuW27gLsMr1kEGHDYUAkHwBL1qhkb8i70mqHjy6aBP8MmquWhD2bSxJ9gKoNNxFUj+
 M+cImD+lBP7C+zhllLmEdFOyBTOQY6rM8Qa18+qrPY3pqASywJ9cgRE9bsiGp528MO
 w9U89cU8zt+Uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE535380AA79; Fri, 24 Jan 2025 20:05:15 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5JwASMQjjTjEncJ@carbonx1>
References: <Z5JwASMQjjTjEncJ@carbonx1>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5JwASMQjjTjEncJ@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.14-rc1
X-PR-Tracked-Commit-Id: d08e78362a5f5e156b6a1dae90c28ed48c0a8357
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac0761d8d8315759562a3b85120d482cedf44328
Message-Id: <173774911422.2152159.1279783714348469917.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 20:05:14 +0000
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

The pull request you sent on Thu, 23 Jan 2025 17:36:17 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac0761d8d8315759562a3b85120d482cedf44328

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
