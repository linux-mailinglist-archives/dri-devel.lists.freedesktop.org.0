Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D464E0C5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6033E10E123;
	Thu, 15 Dec 2022 18:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AFA10E123
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 18:28:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1E1A61EB6;
 Thu, 15 Dec 2022 18:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0E08C433F1;
 Thu, 15 Dec 2022 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671128932;
 bh=o/lJVVfYF1CQM7Pc7X6zwQ/oI0nMuE4BjxkyMqQje6M=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=bh6bzz96YF9hink1RfAqNHvhjrksrSuBMsZ1a0aetLyzOrkwknbFyl5cpfimPJB0T
 fDI4vfI8gmSrynVmmOUjfRr0id9xhhGXgWNwQpQTcvOsV7aOAbajITL3IfEGNigfbR
 4UtN8pl1I4KJuq2ESaI/wWPrBw0hJMYaBRNYknsDiAhyrBdHff3EQZATnCxDvif+xA
 OeboNAAbAkM2p5lsuvAT2QtqgzyDs9LLxV8eEoeFj6RJ5AnwQ+mP7GmySaG6iLLQ59
 06FV15lDlbH+g0g1aGStd1Izg3fIRrVUxuyz7dZ+MzKv3dl2zB+oR3LFpOdYg1ZMvG
 6GHJXWiGOMJJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AF75FE4D00F; Thu, 15 Dec 2022 18:28:52 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5rN6CT8genL6wQc@ls3530>
References: <Y5rN6CT8genL6wQc@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y5rN6CT8genL6wQc@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.2-rc1
X-PR-Tracked-Commit-Id: 3c3bfb8586f848317ceba5d777e11204ba3e5758
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9fa4abc9ad2a18410a7087e6cea15ad1ffb172c6
Message-Id: <167112893271.20649.4028018170717789009.pr-tracker-bot@kernel.org>
Date: Thu, 15 Dec 2022 18:28:52 +0000
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
Cc: linux-fbdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Thu, 15 Dec 2022 08:34:00 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9fa4abc9ad2a18410a7087e6cea15ad1ffb172c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
