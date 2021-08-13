Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F053EAEC2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 04:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD9F6E4AD;
	Fri, 13 Aug 2021 02:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EA06E4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 02:59:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B6B586104F;
 Fri, 13 Aug 2021 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628823561;
 bh=2mP6bHER5L8GFr2L6n7KngpM81WlcQyUwKcCxJVWYCs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ksPjyVWC4+hTjX80UtULkcTRqNIVLrex2NAVd4HY5QY/P8QbJSoou4a1+7slCTYaG
 XCWAvcF9cSjDFkPF0cNLeE5S9E5YTe54/puV844qVlyW2mbV03LFhLAdG8TK99Tomy
 wzPRyANr5e0HlADLHcXr4zOli29prik9BzV4Z2q94ikSdou6nEZWqb8CetSfSKGner
 dDcb2CXJrxB/ItjlNMO+9MKaWgsds3VlR6KpHjwsubGamteNHXJyz9nbswB+vGKiAQ
 KP8utD8wmj0UXv/yos3d95JnzmuHYyNyXGBpYWInB3agfYYRxyRoxTp1A0T1gkDzxR
 7i/uhuy+2hMNw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B040960A54;
 Fri, 13 Aug 2021 02:59:21 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txa94qbYbskxeTA=8YvkFE+0AMK8Mow+KYV_xkfCfQSzQ@mail.gmail.com>
References: <CAPM=9txa94qbYbskxeTA=8YvkFE+0AMK8Mow+KYV_xkfCfQSzQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txa94qbYbskxeTA=8YvkFE+0AMK8Mow+KYV_xkfCfQSzQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-08-13
X-PR-Tracked-Commit-Id: a1fa72683166b3c69511d5f2ffb37b9f49f48fea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82cce5f4291e089d44b7b9bc77918cbcd52d429e
Message-Id: <162882356171.1107.16837001218540200538.pr-tracker-bot@kernel.org>
Date: Fri, 13 Aug 2021 02:59:21 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

The pull request you sent on Fri, 13 Aug 2021 07:06:07 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-08-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82cce5f4291e089d44b7b9bc77918cbcd52d429e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
