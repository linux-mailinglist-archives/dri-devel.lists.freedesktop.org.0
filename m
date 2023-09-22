Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6BB7AB63B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 18:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022F010E69E;
	Fri, 22 Sep 2023 16:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4110E69E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 16:43:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B07761B33;
 Fri, 22 Sep 2023 16:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D063C433C7;
 Fri, 22 Sep 2023 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695400989;
 bh=gP4jHA6fma1xECP4iWL9xD5eKJ/7U+K9IACgxCV1sw4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=n1ntaBpeJaCU5ukCgF9oqFCxwrfX+OqdpjuQ0i17miYqa+Tp1WPVlK/pbN9Hk1Gf4
 1wYNleY0Ir7VLADXS4VOaOWB6ASfdM9SLpVxUR6hWV6T2T5uRLAXkAJcQ7wZmO4qzV
 JypTEZ8mp0EAAqytzEWUTuVHmRlmAGvg2us7OUSQY8aRGZ5tgs0Bd2lgTmR1xezC4U
 7H3888hbrlUuy3DQkjTQXGnds16C5muqgbW+tqhWdan2PWMkVEWvfJGEva97bV7eLE
 3XzzcqwyAKXR+NXwQRzgNyfObz34n1BCBSC8AUcKzqKSUZR/0sU6HhRZVkssmzl2Tw
 jTROpjvVPw/Kw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0B676C561EE; Fri, 22 Sep 2023 16:43:09 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txiBx_jsniqp-F5jGaLafEd1i=ike6kZ7G=ti7e2y-saw@mail.gmail.com>
References: <CAPM=9txiBx_jsniqp-F5jGaLafEd1i=ike6kZ7G=ti7e2y-saw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txiBx_jsniqp-F5jGaLafEd1i=ike6kZ7G=ti7e2y-saw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-09-22
X-PR-Tracked-Commit-Id: 54928f2f8458160e6c7217de78b48064b301e255
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b41b28366d3b176c8297961de4f095f2e392402d
Message-Id: <169540098903.17578.2312216446450585203.pr-tracker-bot@kernel.org>
Date: Fri, 22 Sep 2023 16:43:09 +0000
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

The pull request you sent on Fri, 22 Sep 2023 16:14:46 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b41b28366d3b176c8297961de4f095f2e392402d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
