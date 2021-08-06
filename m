Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FE13E2F44
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1066EC02;
	Fri,  6 Aug 2021 18:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4675E6EC02
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 18:27:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D0C461186;
 Fri,  6 Aug 2021 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628274431;
 bh=ZECR41FR5dWOrGhUWzm6gb4ODHj6MexAoySHsTht5Vw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=r9fqZrPHBGB/vooWaXciAB0zDUu84uYq8GDxyJmrwp3SVEv1Khc2swWYSctcRzCAi
 zv1IZUmxHaK9dXM8gwgRg0P3b8prTMq/WJRwofKy7K59bgZNiqBXIKPNM9i3E1c5za
 tEv0wP2/BkDla8XgowslcsKzH2lsrIQZChqAmxC8JBKyA7BZbLEbPUXx+YMbC/facP
 5f/cBSq+JfXb7uXqKK+C6+brk7iguc98xCc2xMXTcoyXZYh2tvVc0gwCe2qfEcK10u
 J2/gUU2NhM7Eb6EbouspTH5bEDdiqSIQbuQlJBt6alv+WnuWIUGdjXzVB4YDWpRa0X
 6xWx7qYYLfUaw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 17722609F1;
 Fri,  6 Aug 2021 18:27:11 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.14-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txE4jnHDV9B2PWfieMJjdFv0C7=Zc=MovOtJ6sKN2AuYg@mail.gmail.com>
References: <CAPM=9txE4jnHDV9B2PWfieMJjdFv0C7=Zc=MovOtJ6sKN2AuYg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txE4jnHDV9B2PWfieMJjdFv0C7=Zc=MovOtJ6sKN2AuYg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-08-06
X-PR-Tracked-Commit-Id: d186f9c28008810d8f984d6bdd1c07757048ed63
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1254f05ce097c9bf2872a8407725346faba59844
Message-Id: <162827443108.9282.9951648100746802903.pr-tracker-bot@kernel.org>
Date: Fri, 06 Aug 2021 18:27:11 +0000
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

The pull request you sent on Fri, 6 Aug 2021 16:03:00 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-08-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1254f05ce097c9bf2872a8407725346faba59844

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
