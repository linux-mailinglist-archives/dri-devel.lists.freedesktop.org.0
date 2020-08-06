Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5845723D5AF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 05:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F726E86F;
	Thu,  6 Aug 2020 03:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506CB6E86F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 03:08:30 +0000 (UTC)
Subject: Re: [git pull] drm next for 5.9-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596683310;
 bh=QKZSJR9S/ZG1/AuOXr/WI3fdzKadEtEIvfdT7uQC5XY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=w1zDQLGM4cLfye5kC5id0i2fjOZAulUUagxJqPjN0RyBYFrWG+kWVb+bag7oueFHP
 0hwbm9Hn0d6s1DbqWXjsZa0xy/b5ZfV6RKI5HI69gUiG+de3RSItpMTULd/E9SM/DI
 /nqO9pBur/sMgHduqevT6ANvlJ2j+AIWKf5cZKOg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty8hOY0m2+RJdRiRADY5Li-hs3ZaDEK-DTf6rgFewar7g@mail.gmail.com>
References: <CAPM=9ty8hOY0m2+RJdRiRADY5Li-hs3ZaDEK-DTf6rgFewar7g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty8hOY0m2+RJdRiRADY5Li-hs3ZaDEK-DTf6rgFewar7g@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-08-06
X-PR-Tracked-Commit-Id: dc100bc8fae59aafd2ea2e1a1a43ef1f65f8a8bc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8186749621ed6b8fc42644c399e8c755a2b6f630
Message-Id: <159668331010.23142.13676170826531297261.pr-tracker-bot@kernel.org>
Date: Thu, 06 Aug 2020 03:08:30 +0000
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

The pull request you sent on Thu, 6 Aug 2020 11:07:02 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-08-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8186749621ed6b8fc42644c399e8c755a2b6f630

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
