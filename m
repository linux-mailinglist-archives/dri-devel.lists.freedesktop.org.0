Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC77B17C83C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 23:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF666E523;
	Fri,  6 Mar 2020 22:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0046E523
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 22:20:05 +0000 (UTC)
Subject: Re: [PULL] drm-fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583533205;
 bh=/OjKbsdDosmkYw5qMfoveQTi2Qaoij2tQEr59zWCVd8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Pbi6qkzAYIIdmfQHODB7Bvo4/1JJfHKiV0N/cJV5TLkz+thR02bdEZ78/me8syiui
 aiAwxIhWH5OIVNHhbL+NXwVrOsdKlN5ImCHd7CFTeiTz60XbS8Ijool4IVT+fGye77
 AqNu159aIPQiwjgAkccWXyVYL0IcPedHai3vlFmY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200306210854.GA638432@phenom.ffwll.local>
References: <20200306210854.GA638432@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200306210854.GA638432@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-03-06-1
X-PR-Tracked-Commit-Id: 513dc792d6060d5ef572e43852683097a8420f56
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f501bb1802dbbf1467e7999954588da31f635ad
Message-Id: <158353320521.11032.15552999513812279872.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2020 22:20:05 +0000
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
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 6 Mar 2020 22:08:54 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-06-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f501bb1802dbbf1467e7999954588da31f635ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
