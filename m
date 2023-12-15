Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1B81503F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 20:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C173910EAA3;
	Fri, 15 Dec 2023 19:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD4210EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 19:39:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A98DD62766;
 Fri, 15 Dec 2023 19:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 579C8C433C8;
 Fri, 15 Dec 2023 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702669148;
 bh=Pmc34ctQsXa6VXl3dwQb65VAAPy1a/s7K9nk2683PJI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=V1DXM5OAvM/9gPoftNUkaWi8lxF6vthziPCXjmtEZBsdaVHNFnljNKwKi22wWZ3Md
 OOyw1BUF4n2rMa0I/EkwAVB5Ge9cv+O1NfMnZHaTROq5vt7VwGJW79v8d8tCl0p4lZ
 a95Ul4xt/sqDiqmZWiLL7NfkaMXiS/oSpKzUKtfv9e/3lEcvprJ+4wzYWB5xc97KcK
 6z6N/u1tf8LTwHLNb+EpXIRZyEZmxS6ero0awkfig28BnNV/2O/Fbx0WxB5Mox+CVA
 kvgdpqFe3I+xSkIHxthqWthTn97dNnln+/aRbXRE3gyjwMelUKV1wX1KeVjLehjxND
 CUalVWTqese6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 46802C4314C; Fri, 15 Dec 2023 19:39:08 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.7-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txCv2m6AKVoBPbAL4jpJL2aJy_T_vvH4Tj0rdtY004Hgw@mail.gmail.com>
References: <CAPM=9txCv2m6AKVoBPbAL4jpJL2aJy_T_vvH4Tj0rdtY004Hgw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txCv2m6AKVoBPbAL4jpJL2aJy_T_vvH4Tj0rdtY004Hgw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-12-15
X-PR-Tracked-Commit-Id: 7ba84cbf18c7a53107c64880d9c90f18fa68b481
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 595609b2ad023088dfd0ae74abb4602ea267e739
Message-Id: <170266914827.22768.3697492589292240317.pr-tracker-bot@kernel.org>
Date: Fri, 15 Dec 2023 19:39:08 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 15 Dec 2023 16:42:01 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/595609b2ad023088dfd0ae74abb4602ea267e739

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
