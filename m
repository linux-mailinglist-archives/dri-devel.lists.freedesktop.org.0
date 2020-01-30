Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30E814E059
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 19:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4F36E8B9;
	Thu, 30 Jan 2020 18:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DC76E8B7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 18:00:17 +0000 (UTC)
Subject: Re: [git pull] drm for 5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580407217;
 bh=oRBcw3Bz1XwI0m/XlBKvicUPB3oj6eDbFc2/bvfBXo4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=N6hMS5nsLAQPXo1lPKlleFCVeWMOPkQk0G6KI0ToQggYKQbPV+3iwIQAsvX2U/HYM
 gBWIMosddKJg7wh1k7KE4K6IEv1/zX+tRJ4TNqlNr9jK8sS1+F8XYycXsQjFdwAmrn
 uD3elQwXWme/70bGRyD6qm21lkgjndZb0FF3FQ5M=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twBvYvUoijdzAi2=FGLys0pfaK+PZw-uq2kyxqZipeujA@mail.gmail.com>
References: <CAPM=9twBvYvUoijdzAi2=FGLys0pfaK+PZw-uq2kyxqZipeujA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twBvYvUoijdzAi2=FGLys0pfaK+PZw-uq2kyxqZipeujA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-01-30
X-PR-Tracked-Commit-Id: d47c7f06268082bc0082a15297a07c0da59b0fc4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f68e3655aae6d49d6ba05dd263f99f33c2567af
Message-Id: <158040721766.2766.10487533836164754740.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jan 2020 18:00:17 +0000
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

The pull request you sent on Thu, 30 Jan 2020 15:58:11 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-01-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f68e3655aae6d49d6ba05dd263f99f33c2567af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
