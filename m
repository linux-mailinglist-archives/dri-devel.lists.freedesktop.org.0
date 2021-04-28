Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A936DE5A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F9E6E11A;
	Wed, 28 Apr 2021 17:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875CE6E11A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:33:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2CA796143A;
 Wed, 28 Apr 2021 17:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619631236;
 bh=0Si3F/7AQsY27gb25npKxX+YjDcEKtnnK2Wq89glGQk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=PiF8YqnO46DWh3EDfhekTdfiNh3wedKbC3EJVAEVALnVMh53exy/LeiuoMvO2QDz6
 CtPjd5WOjoj6UQl/He1Bkg7GfAG3KSTmyTuZdMx+zHS7RYIdAAK3pDUUDYBFAYYQjj
 4+bL1Zo5XCMIJboTyBp9sDUSixu7M+S2EcACb+rdnR+ZMQbhtsJb90RUzBDo9LsnOd
 clSJDm4XXmD/A5bl6Y9gh3GWyXhsWP2LvBKaythLKFaSg+ILg2pgg6VrAY1knrvZAj
 SznAWmuBgeSsa9aKCPbkJNLBrnjmZ6THgmoeNRnlo/vhXdaAKCL7/hcId56KYFJQgc
 IXvJM/P2tClRg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 265EB60A36;
 Wed, 28 Apr 2021 17:33:56 +0000 (UTC)
Subject: Re: [git pull] drm for 5.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
References: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-04-28
X-PR-Tracked-Commit-Id: a1a1ca70deb3ec600eeabb21de7f3f48aaae5695
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
Message-Id: <161963123615.29190.4484357306581976086.pr-tracker-bot@kernel.org>
Date: Wed, 28 Apr 2021 17:33:56 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Wed, 28 Apr 2021 13:31:59 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-04-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68a32ba14177d4a21c4a9a941cf1d7aea86d436f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
