Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4431F6E43
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 21:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895FF6E931;
	Thu, 11 Jun 2020 19:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFC06E936
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 19:50:25 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc1 (updated pull)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591905025;
 bh=JrXRH57fM4fvpHWV3D4gx5E1DHXUOmzoTatnMaljVTo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=2PKr1KM7fcVbfG+Xfx+3anXDlaHV9eAGlwfKR/o4akbHOGsWCU1shVhMXfHwp99W8
 /EUz2DVmuXA2vTSdCe9i213cDifMgoGFIOAicUcpAE+UGr50/QdknvraetF65xL/ZI
 VZlxqwGwZ95o0tnVO7qQtYayHxg1IrXUJZvdXSjM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyM72CtJbA4Q9wKnft6oQoMLGEt=xCYBcPn9wK9F=+Uwg@mail.gmail.com>
References: <CAPM=9tyM72CtJbA4Q9wKnft6oQoMLGEt=xCYBcPn9wK9F=+Uwg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyM72CtJbA4Q9wKnft6oQoMLGEt=xCYBcPn9wK9F=+Uwg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-06-11-1
X-PR-Tracked-Commit-Id: 66057dd1d1cf2149e0f5fdaee58d6ea69bc98048
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d4e181f204dd0491da6c1d09b7208a0b990ec887
Message-Id: <159190502577.20905.15451629338604498776.pr-tracker-bot@kernel.org>
Date: Thu, 11 Jun 2020 19:50:25 +0000
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

The pull request you sent on Thu, 11 Jun 2020 18:38:54 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-06-11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d4e181f204dd0491da6c1d09b7208a0b990ec887

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
