Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780117E863B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5217410E2B2;
	Fri, 10 Nov 2023 23:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE1310E2B2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:09:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 136DDCE12C9;
 Fri, 10 Nov 2023 23:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F5E9C433C8;
 Fri, 10 Nov 2023 23:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699657756;
 bh=/4P4FJ6MXqpWoFg0yfpPFpg+1ZM7nVTX6GEau6tdJSg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Tuk/5UTMMAFnax+S/mTmb4AxoCzN6lzrcYzum3AAiTnaSa+uJZnMwZT4cue8bM3N6
 fuhxN8a71XkF/yOU7uXtZ/7O/5ELClq1ne0T7wrKWeAPaL/0gCV5OUxveC5kSrQYvv
 bZkhzvtA3oevbR5Vlc8oDKI2MCdi/b9Dpvd13ljI0WLh3HQrlKny8mYck6TcGL+dN4
 HQT2xSCOY12MZJHBrC3g1QxYO50p+ZwCg0gU2k+qZPMv5KyQl9+F5zF3aN0BG23kdW
 7jTUusvzGxjm0vTo+kqynxmiruTh4I2Mmz/kl0rPzazpxShTmcx2iedCjFda0shdSw
 aqiHpTz6IBi6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0F407EAB08C; Fri, 10 Nov 2023 23:09:16 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZU6tdJPgt4tin/TU@ls3530>
References: <ZU6tdJPgt4tin/TU@ls3530>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ZU6tdJPgt4tin/TU@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.7-rc1
X-PR-Tracked-Commit-Id: a5035c81847430dfa3482807b07325f29e9e8c09
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18553507f60f4f51f071644621a58836eb59e28c
Message-Id: <169965775605.1420.2530104698439511436.pr-tracker-bot@kernel.org>
Date: Fri, 10 Nov 2023 23:09:16 +0000
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

The pull request you sent on Fri, 10 Nov 2023 23:23:48 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18553507f60f4f51f071644621a58836eb59e28c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
