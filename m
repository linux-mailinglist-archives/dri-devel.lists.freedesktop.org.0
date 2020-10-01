Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EDF280532
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 19:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730D76E0F6;
	Thu,  1 Oct 2020 17:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FA36E0F6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 17:30:17 +0000 (UTC)
Subject: Re: [git pull] drm amdgpu + vmwgfx fixes for 5.9-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601573417;
 bh=bESyP7iI8I8oWmwo0p/daUKYw1SW96HYUdogfnRhIq8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Aw7xPD+gz5I+F/cSVtYC5F9GFV6eOMS3Dg7x2PuWTHt3ZubPAOnfHlIfCB+Rih5nc
 sgOjxBHaRFeoMviWySkoNbAICDee6DB4l6SLuiiPm7JLFSVQYm6CatpLy4ycIUeMxg
 eTjcz+8p579QSqxBdcylwWVoS0XKVGaVY4/8AuMc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txPMxjzQTiZiWeMCs_LDoYGid_d3F6W5HdBr8UB=tjvug@mail.gmail.com>
References: <CAPM=9txPMxjzQTiZiWeMCs_LDoYGid_d3F6W5HdBr8UB=tjvug@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txPMxjzQTiZiWeMCs_LDoYGid_d3F6W5HdBr8UB=tjvug@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-10-01-1
X-PR-Tracked-Commit-Id: 132d7c8abeaa6b10ed5f47330b0f06c6dd220a43
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fcadab740480e0e0e9fa9bd272acd409884d431a
Message-Id: <160157341766.4684.6393544746214094272.pr-tracker-bot@kernel.org>
Date: Thu, 01 Oct 2020 17:30:17 +0000
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

The pull request you sent on Thu, 1 Oct 2020 16:10:22 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-01-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fcadab740480e0e0e9fa9bd272acd409884d431a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
