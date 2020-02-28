Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5D1730B5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 07:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E176EDEC;
	Fri, 28 Feb 2020 06:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBFD6EDEC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 06:00:08 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.6-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582869607;
 bh=O0lItgxGsadBxEBFcdX7qF0516IN24GExKcYpPLQ50o=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Jz4tyufQn4566NNmpUnuwFoyUBYsNW385azRjBLysyRZ1kMYLVE1eGKsLZgfazb0J
 wjTgItrCKVekXrX3NdE1gn4V+szyj0giED/ye37WVZ0NGHvdqFWhqWQ6poeiODH5+P
 CVxU1lgzsQCZ2U2Nzp/k80+0yu179G4WUrs2Kzl0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tya9tFH13gF8AyOyP8SLMB-wyUNxBen=NY2ik9hr1Brjw@mail.gmail.com>
References: <CAPM=9tya9tFH13gF8AyOyP8SLMB-wyUNxBen=NY2ik9hr1Brjw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tya9tFH13gF8AyOyP8SLMB-wyUNxBen=NY2ik9hr1Brjw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-02-28
X-PR-Tracked-Commit-Id: f091bf39700dd086ab244c823f389556fed0c513
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45d0b75b98bf1de4b3a5b09188c75f3bfa3152b0
Message-Id: <158286960784.11613.5194916749172956851.pr-tracker-bot@kernel.org>
Date: Fri, 28 Feb 2020 06:00:07 +0000
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

The pull request you sent on Fri, 28 Feb 2020 15:22:04 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-02-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45d0b75b98bf1de4b3a5b09188c75f3bfa3152b0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
