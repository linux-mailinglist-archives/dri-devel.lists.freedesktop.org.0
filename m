Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0758F18D577
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 18:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206CB6E1A7;
	Fri, 20 Mar 2020 17:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883076E1A7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 17:15:07 +0000 (UTC)
Subject: Re: [git pull drm fixes for 5.6-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584724507;
 bh=G5yoDx1A9wxFe1FITEE9mipC9mYOKfihV2JJP7Q0iho=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=YxE4UumjtW0hygEqHQodDfIyAaoesPbgtxvj/6uJL0G1bY+eJy4iaWuUeU48DYqXf
 twQnnMLIAfV4ttIr1h1zhegaV3X2xXOaogKWx8G1wKpm4XX4A5zi/jdHe0Jqs0pAsC
 8rKNA2hEaYuXJGKz5qc3TtUmjEc2otCnXIV+Huog=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tziNvC7VozK1C3yd+wqspVGF7d0eToOANwV4Euwy4LMkQ@mail.gmail.com>
References: <CAPM=9tziNvC7VozK1C3yd+wqspVGF7d0eToOANwV4Euwy4LMkQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tziNvC7VozK1C3yd+wqspVGF7d0eToOANwV4Euwy4LMkQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-03-20
X-PR-Tracked-Commit-Id: 5366b96b1997745d903c697a32e0ed27b66fd158
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69d3e5a5a66bb59c39f36dcb9cf4e9a4239aa8cd
Message-Id: <158472450732.23492.59820200078010578.pr-tracker-bot@kernel.org>
Date: Fri, 20 Mar 2020 17:15:07 +0000
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

The pull request you sent on Fri, 20 Mar 2020 13:01:44 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69d3e5a5a66bb59c39f36dcb9cf4e9a4239aa8cd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
