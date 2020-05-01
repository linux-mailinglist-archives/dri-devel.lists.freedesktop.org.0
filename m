Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719E1C1D41
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 20:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BC66ED29;
	Fri,  1 May 2020 18:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424976ED29
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 18:35:11 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588358110;
 bh=SmqomhasQEC9HdiALeRepmCi5R5rtei+s/Y4faNmvAU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Zk7B2PXBj2yMo4d2E1Lshy1ImbsGsE+Lw93tKpRsWM4ryCpgKPaqie/JLtwf/axLP
 nBRCGKWPX2neBDL8w/ehTj58lzr3X1dltGl3CMzNzJ7fxSeRIrBiFMDsr81yLxELG0
 HmRQZjJzc0L6MrLty/bplFUHOIlkQYOXMzC4wNpY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzf-buFu3YY69tzLw=bwwYVD_37RiGazpFXz+OgayWfFw@mail.gmail.com>
References: <CAPM=9tzf-buFu3YY69tzLw=bwwYVD_37RiGazpFXz+OgayWfFw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzf-buFu3YY69tzLw=bwwYVD_37RiGazpFXz+OgayWfFw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-05-01
X-PR-Tracked-Commit-Id: e3dcd86b3b4c045a4db17c02340138a4c514fe20
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 477bfeb9a3d712b6e1aeb4e37607faebf4b7f6d4
Message-Id: <158835811093.18489.16145116338627649076.pr-tracker-bot@kernel.org>
Date: Fri, 01 May 2020 18:35:10 +0000
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

The pull request you sent on Fri, 1 May 2020 12:59:10 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/477bfeb9a3d712b6e1aeb4e37607faebf4b7f6d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
