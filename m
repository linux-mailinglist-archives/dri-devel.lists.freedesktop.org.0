Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18F278FE0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 19:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8536E0CA;
	Fri, 25 Sep 2020 17:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFFA6E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 17:48:46 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601056126;
 bh=W4d0UPdguLawi1svN5PWS6vBQmvJCl6MLCfwRP649D0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Zu1PDNCz2afyRlzR3jkGhg3fHHPhJP5OZYp3JigoO3LkVlDCuvfriR0Ho8d9MhjMJ
 sSp0tY03Ghac0cSLACDEC3p5RQwE2HjqZ+D5s6K5sjVbUzk1oUW41QMDvMmQGRMuTx
 fDqE2UbUGj7LAwgLsGhRmmiv3LBUGT6JF/6uBqpY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzV6xvuqq9wnzhUY+qQPj9Q5K0BMpJX+7YUKX_a-EJTLA@mail.gmail.com>
References: <CAPM=9tzV6xvuqq9wnzhUY+qQPj9Q5K0BMpJX+7YUKX_a-EJTLA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzV6xvuqq9wnzhUY+qQPj9Q5K0BMpJX+7YUKX_a-EJTLA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-09-25
X-PR-Tracked-Commit-Id: ba78755e0c25dec4151880a14f523e929b2052c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 574ec42e1a9c4bfb8b2eef8d801a77e92bcea76a
Message-Id: <160105612634.19145.17530884405418842469.pr-tracker-bot@kernel.org>
Date: Fri, 25 Sep 2020 17:48:46 +0000
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

The pull request you sent on Fri, 25 Sep 2020 11:45:04 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/574ec42e1a9c4bfb8b2eef8d801a77e92bcea76a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
