Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F53D3240
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 05:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F936F981;
	Fri, 23 Jul 2021 03:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B3A6F981
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 03:35:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A0D960E9C;
 Fri, 23 Jul 2021 03:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627011324;
 bh=ET2Tk5p+JY6wGFFSou0Rht5borxfxJ4df4ED2ntoI+U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=JWgqeuIdfEpR9AcQx8xQCr8ckXeK9NIXglbN9z5BvkVGKdL6k4clzLIP31f8VqOKh
 uSVE0tL2OScLEBsDbihm7PvdOO9E2ZlSIhvjS9J59tiDHjaJ7r6fudOjyivSIRzNAK
 bhA2OFJ+rJzP9l4i4OSfgGqVQO6bNtaZvwwOXssDbk+maNooVOZ/daoCQBlP0g4s5r
 Hf+0U5GOr5L6sakb27X/R9SMNsyu4mEfjB6HJbwSANXw//BS3oXopEFyMGvBoud1hw
 Jx9ZKCqbx0rvfimVdEMXid4/fmeiGwxhOiU/IyYdwlJ4CZCCR6eN993FRhJbQD4/l4
 8vhRd/ypscbDw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 87F0860721;
 Fri, 23 Jul 2021 03:35:24 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.14-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty45KQnKE_02R3jE5fJMhz26T9zU6LgDV92WUTd=0U1FA@mail.gmail.com>
References: <CAPM=9ty45KQnKE_02R3jE5fJMhz26T9zU6LgDV92WUTd=0U1FA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty45KQnKE_02R3jE5fJMhz26T9zU6LgDV92WUTd=0U1FA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-07-23
X-PR-Tracked-Commit-Id: 2e41a6696bf828a7b06f520d147f6911c947a7af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8baef6386baaefb776bdd09b5c7630cf057c51c6
Message-Id: <162701132450.13968.6864094523303505149.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jul 2021 03:35:24 +0000
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

The pull request you sent on Fri, 23 Jul 2021 13:07:14 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-07-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8baef6386baaefb776bdd09b5c7630cf057c51c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
