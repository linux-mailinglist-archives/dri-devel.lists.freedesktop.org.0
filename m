Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D04541F6E40
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 21:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F09D6E934;
	Thu, 11 Jun 2020 19:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949846E934
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 19:50:23 +0000 (UTC)
Subject: Re: [git pull] drm i915 fixes for rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591905023;
 bh=v9dNkrpA4SFtGcw/Gc6HzQjUtd4V1ARG1lRzTQD7ehw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=YU+fUiX8jsBQHLqmIiVylpFRvCklZwO5MQ26jF+yZny35dYb76HJpgsn5NhpBiZ3i
 x3lHhDmckekUTvL6tpaW9equWwCQwZyorG4x+0uaQlU54WsPy4xJMRtfyzIiVRgBpq
 RypZ4gRwFjng68y6LUknAIyKZ6ElHZTueD2Sm5zE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tySU_oXYv+FF5D3GkkyngdxWfkb_6KDK6nA0uBx6EB=qw@mail.gmail.com>
References: <CAPM=9tySU_oXYv+FF5D3GkkyngdxWfkb_6KDK6nA0uBx6EB=qw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tySU_oXYv+FF5D3GkkyngdxWfkb_6KDK6nA0uBx6EB=qw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-06-11
X-PR-Tracked-Commit-Id: addb1e23bf72c47a3e2eb7cdad6dc8cdffa91384
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 66057dd1d1cf2149e0f5fdaee58d6ea69bc98048
Message-Id: <159190502341.20905.5113407927895881475.pr-tracker-bot@kernel.org>
Date: Thu, 11 Jun 2020 19:50:23 +0000
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

The pull request you sent on Thu, 11 Jun 2020 13:56:23 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-06-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/66057dd1d1cf2149e0f5fdaee58d6ea69bc98048

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
