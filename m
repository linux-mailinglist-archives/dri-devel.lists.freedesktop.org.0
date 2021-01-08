Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAF2EFBD4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 00:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE81E6E8D4;
	Fri,  8 Jan 2021 23:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D506E8D4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 23:49:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 47A4A23A74;
 Fri,  8 Jan 2021 23:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610149743;
 bh=uxW3SRVWSh00k6tE6ywyz1JEtZ25EmCJVF1gmrieScQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pt85kHdqcUcsj1+cO9bOoz10wE88YT+GCrKoiN0S4TszemBlLkvXPVFSQ43/twHHA
 KuFwaIOCfRbft+qeRhXyW5dda2T1Lyoc8zBruENrcvJT+r/BqtvVmF5scebJEx071F
 UaE/yRAxxKIynGDPac4I9E20Z/XzqC/NnX7i2uZhKl5pBFW2Bu4n2a5+DRQbgBavcK
 jidCWvWZahyBnHDoIPrWcaVNVLAlJFy9HA+tEBS4B9C5nj5UNIlrsHzFV3WCIDzIAI
 KsWn/7yblGRAo475ikjy49BCsEZqkn2sGK/zxl/bAPYMNtwUCSzwrPb+XJw/Gl5iuv
 5DYEGLBtZC0cw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 42F5A60597;
 Fri,  8 Jan 2021 23:49:03 +0000 (UTC)
Subject: Re: [PULL] drm-fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <X/iA/qwB8X11akLF@phenom.ffwll.local>
References: <X/iA/qwB8X11akLF@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <X/iA/qwB8X11akLF@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-01-08
X-PR-Tracked-Commit-Id: 29f95f20581c4bb4e58c1cc1cb15bff9b931cad9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 43d3d587d22530ae92239b6aba5b0b2d5ba2e088
Message-Id: <161014974326.3246.8133980198722266663.pr-tracker-bot@kernel.org>
Date: Fri, 08 Jan 2021 23:49:03 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 8 Jan 2021 16:57:50 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-01-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/43d3d587d22530ae92239b6aba5b0b2d5ba2e088

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
