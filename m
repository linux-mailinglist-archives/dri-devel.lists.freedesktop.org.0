Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE15F16A7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 01:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F0710E461;
	Fri, 30 Sep 2022 23:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC86910E461
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 23:29:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50E6262523;
 Fri, 30 Sep 2022 23:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADFFEC433B5;
 Fri, 30 Sep 2022 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664580557;
 bh=VRYbn7R55mSytqdcZwzs+tKwdeBpsQ1usbfu2/4Ni78=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=WIjNG6vrzLG6Ldo8Gigoeqs7NH0FcMt7E7gNR6t3m1nTm390aGWCYswRP+lsw0T+2
 hL6ioDuBNvWKxHwZ0WfkoJie140LJHoLg+obIXtYnt7LhBuDGDyzNBkc47PWsYJnR8
 eZZiAm6H2mZhy1oa8GWWYLDm4HvOe/JPD0wv4BVh3XFi2LZfgakyjmy6rjiNmk5Cv6
 CXH4AnLLS9jUmecbutYgcIcmUMTh0GdOzGcO8xX74XdHFNvCZQICCOWwNLcVyA0817
 TLh3ScfbO107k0JQQ6eY8ZDovVBvg0tXcxI4h5Oyd1MAgUBYsa43xZ08j9UKms14i1
 wKOxmqqa+OKqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 90553E49FA7; Fri, 30 Sep 2022 23:29:17 +0000 (UTC)
Subject: Re: [PULL] drm-fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <YzdrcM2YAK4qyePP@phenom.ffwll.local>
References: <YzdrcM2YAK4qyePP@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YzdrcM2YAK4qyePP@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-10-01
X-PR-Tracked-Commit-Id: 414208e48963fdb136240d7f59c15e627832d288
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ffb4d94b4314655cea60ab7962756e6bab72fc7e
Message-Id: <166458055758.7949.5587471339706789894.pr-tracker-bot@kernel.org>
Date: Fri, 30 Sep 2022 23:29:17 +0000
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

The pull request you sent on Sat, 1 Oct 2022 00:19:28 +0200:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-10-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ffb4d94b4314655cea60ab7962756e6bab72fc7e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
