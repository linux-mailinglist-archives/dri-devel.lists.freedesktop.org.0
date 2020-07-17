Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93622232A1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 06:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3DB6ECDA;
	Fri, 17 Jul 2020 04:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83F36ECDA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 04:50:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.8-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594961403;
 bh=CEV5+HvUM+LJKJaEOLF10YSjYvEU7QkhIiBxygFcz/8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=a5sNoLbBcOuJ7SOQPLPzaPrHJarkgWYV2FbpO7JfcUreRVCJ0e0nppYHuyzG5jdh2
 XVM9WTywhcrZghEFEHz/p++4FcI+f6YKq24v6dR9lSfVs861lmd7MOKU5oFGHO86Hs
 pDaQ+bdIXR1hzO+pqnG2/G/KCxX5mL85hP/nEL8w=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txCq=97pFiCoOGLz7-Ght-spbVFKURx_b0kVw9sO1+=zw@mail.gmail.com>
References: <CAPM=9txCq=97pFiCoOGLz7-Ght-spbVFKURx_b0kVw9sO1+=zw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txCq=97pFiCoOGLz7-Ght-spbVFKURx_b0kVw9sO1+=zw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-07-17-1
X-PR-Tracked-Commit-Id: adbe8a3cae94a63e9f416795c750237a9b789124
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8882572675c1bb1cc544f4e229a11661f1fc52e4
Message-Id: <159496140350.7072.5113413721616431155.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jul 2020 04:50:03 +0000
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

The pull request you sent on Fri, 17 Jul 2020 13:42:02 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8882572675c1bb1cc544f4e229a11661f1fc52e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
