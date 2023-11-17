Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA907EFB40
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDA610E784;
	Fri, 17 Nov 2023 22:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89CE10E784
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 22:16:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CE229B81F7B;
 Fri, 17 Nov 2023 22:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8B43C433C7;
 Fri, 17 Nov 2023 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700259363;
 bh=vHQWHkR2s5hvcml5B0eCa2ti7wRd/Ge3XgHQk01EksM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lM3m1fxA/ZMOWetH1nzJHlF4THJkh9XVJrIq24tbyZNrC8wSoAwjIQiHGS8tALWdM
 wR9ZSx83dc/sZBIeoHsCdLRE9zrWQ7nXEn9FrPDCW1lTBdqCetD3c4MXmLBfwV9h36
 nOmTnIqgPUJNYMW1MfPfqbixX2a31Rpt322MyHCcAgG8dJ59lKZuwCSJzBFQzLl5uG
 Wh46A7duClwu2aOProLpwtD4yhhbFMv8A1Bz8WfMBNDgDD1OA6d6JylsgmV15OzvLE
 bRozchRu1yc3M0BxulEHrgGrLwZEaHrYgp9b7d2J/J+MqINrwG5x8pJDmf8S4pv41M
 19h+vpfGVIKag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 97AFBC4316B; Fri, 17 Nov 2023 22:16:03 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for -rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZVecnXhAAVeIMvSv@phenom.ffwll.local>
References: <ZVecnXhAAVeIMvSv@phenom.ffwll.local>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ZVecnXhAAVeIMvSv@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-11-17
X-PR-Tracked-Commit-Id: 86d8f905f24d223e15587365f07849635458c5d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e63fe2d35ee095b483adf936747dbc7d85f3de38
Message-Id: <170025936361.27809.12057052611328562731.pr-tracker-bot@kernel.org>
Date: Fri, 17 Nov 2023 22:16:03 +0000
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

The pull request you sent on Fri, 17 Nov 2023 18:02:21 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-11-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e63fe2d35ee095b483adf936747dbc7d85f3de38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
