Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA02F717D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 05:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DF889AB9;
	Fri, 15 Jan 2021 04:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F85C89A5C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 04:14:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0689023B19;
 Fri, 15 Jan 2021 04:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610684097;
 bh=f9mjjGapbjOZDGKHxOCU2ViiYITOoxqAhsm6v8QiPZQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lH8+EFtmtPjKVB5iR3Ib4t7cEY+AayYzc0jIVsU8mpDYeO8Ly2Hzo4KX/22uJdw9p
 0gHBy32M5/oucxDB1+sqSjBwUinEvDETXJgLzOiYcE4B5j6T+MhYZ22M3vBXE866Nh
 bT0F/bJRkZreCRH6VoW52/OmNNGmsr0/NuLbY1vo9Q1iY0X1+uaLBzB222Fs8jeuZG
 So63eXi/wrbsCYZmjsRcj29XvVIuO6htOc9flv6h1fTULBbucYsZwxSugmH2yuFWB4
 FlFSTuLuGMHVgdovF6nlCmXqduD3AtrqQEkcVpCau5LdQUlsIf6eOn5REdxVpXmvk2
 2zW7m6in2Yt1A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id EAEA160144;
 Fri, 15 Jan 2021 04:14:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyyT70W1pkQj3tLWSmQWQpT6V3mSZzOg2n1j+VGa4V-fQ@mail.gmail.com>
References: <CAPM=9tyyT70W1pkQj3tLWSmQWQpT6V3mSZzOg2n1j+VGa4V-fQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyyT70W1pkQj3tLWSmQWQpT6V3mSZzOg2n1j+VGa4V-fQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-01-15
X-PR-Tracked-Commit-Id: c8f6364f35f32786dd40336cfa35b9166d91b8ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ee88057889bbca5f5bb96031b62b3756b33e164
Message-Id: <161068409695.21086.3812348385158193594.pr-tracker-bot@kernel.org>
Date: Fri, 15 Jan 2021 04:14:56 +0000
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

The pull request you sent on Fri, 15 Jan 2021 14:01:12 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-01-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ee88057889bbca5f5bb96031b62b3756b33e164

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
