Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64411F1F66
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 21:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AF96E512;
	Mon,  8 Jun 2020 19:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5656E1CD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 19:00:24 +0000 (UTC)
Subject: Re: [git pull] drm next fixes for 5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591642824;
 bh=wFvxGuNZ+8D8d7Fg07XNVR4lrWufWgqoZIfgmL0C6vs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=TtDv/YXrz54z9YRMI5UESm88fqOqYOhm37nTlo76GZV+f5fTv0zYQz4WGyumR+s42
 CJNT22BwEYcCP27XVqDksZZdZM6qBto67lvB+TtpAvTlSFHO+jJ9VyuDdBUEeTHfR0
 IhxvpjOtVSfyPN0cKaafPtf+K24JSHopTQjyumCY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzk9DL+Smnc6wdDpGvex8_2qi4TtmCfi-cevBE8-jLGTA@mail.gmail.com>
References: <CAPM=9tzk9DL+Smnc6wdDpGvex8_2qi4TtmCfi-cevBE8-jLGTA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzk9DL+Smnc6wdDpGvex8_2qi4TtmCfi-cevBE8-jLGTA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-06-08
X-PR-Tracked-Commit-Id: 8d286e2ff4400d313955b4203fc640ca6fd9228b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 107821669a9cbf234f260d576039983b64c7cb6d
Message-Id: <159164282425.16000.6015107631632578742.pr-tracker-bot@kernel.org>
Date: Mon, 08 Jun 2020 19:00:24 +0000
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

The pull request you sent on Mon, 8 Jun 2020 13:15:58 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-06-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/107821669a9cbf234f260d576039983b64c7cb6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
