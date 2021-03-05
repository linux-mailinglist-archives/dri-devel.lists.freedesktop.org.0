Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A932E051
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 04:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31466EACA;
	Fri,  5 Mar 2021 03:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4406EACA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 03:53:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4DC3564EEC;
 Fri,  5 Mar 2021 03:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614916431;
 bh=Rrd9hsVbmZqX5xa8+XqI0+6AprlRxcT4lb3vQmV2+2E=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=d6oSRZIim6X7DEUWVCjRq6AcErutn0LJ1ZWfFXQ3O9/L6VTVRh3x+agNH0zjhf88C
 XrxTJvVj6kktnatT+On5GtLybmvr7lPMMJinvKwQS4YpUX5D+KV9uP+WZBCXjJqHqE
 SDMp6WgWE7/v3q5Qc01LmlKlc70w4hzhIpr29kfgeTqq+dVRGY0qVssFJtYZX+3XH9
 PADTGP+ACuMkz09naAVJCotQZheeSbQF/Q+pPbSeAC/13JWLCh7HRHXwhaY3jsGybK
 NzQr90UfcDwFD0enItsL98GGXDG4NqfbPYMwIElKw5D/VkLHXgWD9HWVu4H6QmlH/v
 QZsGyyDzsD1Tg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3AED5609E1;
 Fri,  5 Mar 2021 03:53:51 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txjSRSZPBttCM9xnZj5_V5oJ0jAYf2PFuZgVyHaNBMo5Q@mail.gmail.com>
References: <CAPM=9txjSRSZPBttCM9xnZj5_V5oJ0jAYf2PFuZgVyHaNBMo5Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txjSRSZPBttCM9xnZj5_V5oJ0jAYf2PFuZgVyHaNBMo5Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-03-05
X-PR-Tracked-Commit-Id: a1f1054124936c717a64e47862e3d0d820f67a87
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 280d542f6ffac0e6d65dc267f92191d509b13b64
Message-Id: <161491643118.26664.11132900033917030021.pr-tracker-bot@kernel.org>
Date: Fri, 05 Mar 2021 03:53:51 +0000
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

The pull request you sent on Fri, 5 Mar 2021 12:50:16 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-03-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/280d542f6ffac0e6d65dc267f92191d509b13b64

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
