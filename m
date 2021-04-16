Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74A0362395
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56EF6EC1A;
	Fri, 16 Apr 2021 15:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EC96EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:15:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3BAFD61184;
 Fri, 16 Apr 2021 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618586101;
 bh=eSQcljIYl3Hgl1jZuA/KozNWi0lcW6fQwaXzi1gJR5c=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=OK9E8v0LHCVVLrBWXqwPVeA+bfLKSjCkxMwmRlC5YejJTi8/QaUE67o9Wisb7U3zX
 oD4uhrBAzBtcpyQJUeO4Fv4BICnQj4VSVELiDTGyOMn941ROQggGMKc04CbhkuAMjR
 LBbhHN6hMucI1GAgtZiOGTWlFNFlVB8ao06vOMoQWEopPhTbC4Xq2rr7I8Z2kOyWoY
 e/JXDyeaUoptDnWXaYO7x3lGABTW+bdoEU8hoG6rWo1uHBZmVQxL1g3Ffk9y9HN7VL
 CSn68WWPLnSxMPmzhUTq27b4SdBIpHcUFBOt/aIWSDKQWSxTftLnl2RDTM4HeS5RFV
 RhsmULcPd9cPg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2968E609AF;
 Fri, 16 Apr 2021 15:15:01 +0000 (UTC)
Subject: Re: [PULL] drm-fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <YHmR+Gyh/s2sHT2D@phenom.ffwll.local>
References: <YHmR+Gyh/s2sHT2D@phenom.ffwll.local>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <YHmR+Gyh/s2sHT2D@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-04-16
X-PR-Tracked-Commit-Id: 4d2e1288372ccc5ac60290bc10cace49c9bfa6d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f7b98d1e55ccd34e4998bf5f321ec7b9d6b451b
Message-Id: <161858610111.23465.8316457944463841403.pr-tracker-bot@kernel.org>
Date: Fri, 16 Apr 2021 15:15:01 +0000
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

The pull request you sent on Fri, 16 Apr 2021 15:32:40 +0200:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-04-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f7b98d1e55ccd34e4998bf5f321ec7b9d6b451b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
