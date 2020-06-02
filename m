Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD761EC4DC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 00:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33F6E47B;
	Tue,  2 Jun 2020 22:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3DE6E47B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 22:20:07 +0000 (UTC)
Subject: Re: [git pull] drm for 5.8-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591136407;
 bh=7lHSBvEPz7oxY7O+go1frxwoEWOhwnlJQiDFhhJWsqA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=YUWPOuDHKGVB6/b/178dr9IKDajJeXLmTJziaMnrxLwQIZaux3HjJIHbBkRTCt8SU
 PxZ8xg+e6faFhLWuCu4BUlvmDVf9nT3+e/lo5iMXPx8kuqJNSy75Py9x2YPDa1A7xH
 brMApxVfuSzGvTxlzEglT926iXfkOfCXXyFU4plM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-06-02
X-PR-Tracked-Commit-Id: 9ca1f474cea0edc14a1d7ec933e5472c0ff115d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: faa392181a0bd42c5478175cef601adeecdc91b6
Message-Id: <159113640702.9664.5070448560079355262.pr-tracker-bot@kernel.org>
Date: Tue, 02 Jun 2020 22:20:07 +0000
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

The pull request you sent on Tue, 2 Jun 2020 16:06:32 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-06-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/faa392181a0bd42c5478175cef601adeecdc91b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
