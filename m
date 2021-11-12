Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E710844EE08
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 21:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4686EAB9;
	Fri, 12 Nov 2021 20:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCD46EAB9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 20:42:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 439DD604DC;
 Fri, 12 Nov 2021 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636749749;
 bh=Yf1Hk1FmiaNwOfcCYCvTdFnW8pNj0dZIiXjpDQHCWXs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZI9r+fw4WWgM5VhfvEL+XuMofAcqd6B0W+7i5ac7kpJPLUgT/PNIwEWCP5FrViKuM
 qED0DMryL5OyAOmUudwnuALBB8Fx95yiXZ4UjEPO7NhktsBu4w5H3UrYfWs7Krw4DL
 onrgp5clbk2c7krJQO8CWphj2Ts8sJ5bSSliiuMiMSp+4nrfiBgUQdA1xAyKfU1W8i
 0GT2H8OnwiXJwgtg0XDWT0vEzpUyvwanqzpdgLFwE0HpCcmXwGdcxxjpXk+biUHI2k
 x6JaGnajl9WN9ABEvuDEGhRoh4FVr8KZsOYvxttRq84XriPf/9PmDZ22xwJUeX2+0E
 0AiZFsjGVysMA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3D2AF609F7;
 Fri, 12 Nov 2021 20:42:29 +0000 (UTC)
Subject: Re: [git pull] drm fixes + one missed next for 5.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
References: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-11-12
X-PR-Tracked-Commit-Id: b6c24725249a6c1a889665d720cdff088f686f98
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 304ac8032d3fa2d37750969cd4b8d5736a1829d9
Message-Id: <163674974924.4802.17345412331126397639.pr-tracker-bot@kernel.org>
Date: Fri, 12 Nov 2021 20:42:29 +0000
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

The pull request you sent on Fri, 12 Nov 2021 13:25:30 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-11-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/304ac8032d3fa2d37750969cd4b8d5736a1829d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
