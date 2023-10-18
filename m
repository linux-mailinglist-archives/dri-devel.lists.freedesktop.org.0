Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF47CD152
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 02:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5073510E187;
	Wed, 18 Oct 2023 00:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1437210E187
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 00:31:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E596161591;
 Wed, 18 Oct 2023 00:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B594C433C7;
 Wed, 18 Oct 2023 00:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697589089;
 bh=4FoHz9Z8aWCHUm7je8sI/1euzWMFjdMPTTsb8ApHUC0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=cEsAVliye6CP6RpXi1pLqCfZFEHxeaN/7q35bbntzuU3FRRkzAjd9YoMAzHZymQVy
 2z/rw5qa2CY5zHbnCfhrvV57vIrz9fZv1qhQECQ0f9/Yw66hw94HU1MeMWHXcOgmh1
 vYDIagzjEDT9GLvxxcBZfMq8SXY+j9tkBVpA9HlmUyYcKe5mzB5tc6tZ62VCQEdsP/
 lH+nd7+b8gFQ4RAecgPzn48FGbI9hLZnH4xtgKVmhD7X1bBkiecMPcTLaIw27gZNHX
 hHiJ8/XpEDVjupUdcbxaJAyNuj5HbCNt4057Udi/saXKo/EmNOX7m6/bHBgquSUoQq
 d/QuwpW/qohmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 07BE3E4E9BC; Wed, 18 Oct 2023 00:31:29 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.6-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZS7i38pKFD0/Msus@ls3530>
References: <ZS7i38pKFD0/Msus@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZS7i38pKFD0/Msus@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.6-rc7
X-PR-Tracked-Commit-Id: e8e4a470b677511f9d1ad4f3cef32adc1d9a60ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06dc10eae55b5ceabfef287a7e5f16ceea204aa0
Message-Id: <169758908902.4553.16741062330186147068.pr-tracker-bot@kernel.org>
Date: Wed, 18 Oct 2023 00:31:29 +0000
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Tue, 17 Oct 2023 21:39:11 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.6-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06dc10eae55b5ceabfef287a7e5f16ceea204aa0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
