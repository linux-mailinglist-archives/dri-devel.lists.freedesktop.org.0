Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F093B3800
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9588C6ECCB;
	Thu, 24 Jun 2021 20:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8F06ECCB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:39:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EA767613C0;
 Thu, 24 Jun 2021 20:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624567196;
 bh=DTaOpIVhVoM4wbhvsj7YKsl1LWfgOZIoAHcI3KKXxt0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nHDY1ivA9YUorTOilClr/wS6XniLpxeQxySxMlAzwWKMkDDJT0fKLUU+oKam2SnV0
 6LZQXqZo5pHExSUYs6zlL3QTu7tgUlFtNNCHux/htQqLxUlY9Gc9dhMOnKIxjIaLr/
 i39+V/cn+sFbZsz4P4Vx6d7etJaibQNOAfTxBOvo/Myvuk3m6X0sPOJlf7QP9utrSj
 ywv+UGf1rRFtAYHq9/Pn7ph4zHkNRTBmQkwiLmiHe5CWE1BsFOWirmPuFQTUX77ZLn
 WgaiLi8AyvyVkXRGfG54rpKab0abEi8shQyxcJaNuo0A9TuuLvZhRlQIk0RFhqm6Ze
 SkaW6CVV0Ai+Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D794A60A2F;
 Thu, 24 Jun 2021 20:39:55 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.13-rc8/final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty9+nYh5JC-gw5Pf8u1QaYwr2PFcOKobohQz-RGaCP3mw@mail.gmail.com>
References: <CAPM=9ty9+nYh5JC-gw5Pf8u1QaYwr2PFcOKobohQz-RGaCP3mw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty9+nYh5JC-gw5Pf8u1QaYwr2PFcOKobohQz-RGaCP3mw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-06-25
X-PR-Tracked-Commit-Id: 5e0e7a407675d9f50f1d840214beaec42293b79b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44db63d1ad8d71c6932cbe007eb41f31c434d140
Message-Id: <162456719582.2537.6774197958738573385.pr-tracker-bot@kernel.org>
Date: Thu, 24 Jun 2021 20:39:55 +0000
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

The pull request you sent on Fri, 25 Jun 2021 06:17:22 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-06-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44db63d1ad8d71c6932cbe007eb41f31c434d140

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
