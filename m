Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3082B236E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 19:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DF36E532;
	Fri, 13 Nov 2020 18:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E416E532
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 18:12:07 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.10-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605291127;
 bh=x9R+SPmtE+wZEBEGTxhMT6R63q4htMWcndE7nmRsi5o=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=jHQdxWQpNrvoSL1pnMf3SZ3WLJS/T6kov8ezkKRBH1zkYHoK52TpxXRSxml/bCvAI
 +tDR5wLP4mi/jstfv/2rJlVbzB5mCHw1iEwE59jBPImkRXbVZ419XC0H02oKLBd7Fv
 RKTXkwtAUpZR9WZSEczvEVTo3AYiJ/Tz+WAboQ44=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txkA3-XwKMbxzZT6ZWq5jneJXYWneABHi02AxGnpvrPtA@mail.gmail.com>
References: <CAPM=9txkA3-XwKMbxzZT6ZWq5jneJXYWneABHi02AxGnpvrPtA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txkA3-XwKMbxzZT6ZWq5jneJXYWneABHi02AxGnpvrPtA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-11-13
X-PR-Tracked-Commit-Id: 41f3ed2cac86ba533ce6a334a2e7fae5c7082946
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e627c25544dfec9af56842b07e40ad992731627a
Message-Id: <160529112702.14692.1883293070526598235.pr-tracker-bot@kernel.org>
Date: Fri, 13 Nov 2020 18:12:07 +0000
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

The pull request you sent on Fri, 13 Nov 2020 16:41:04 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e627c25544dfec9af56842b07e40ad992731627a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
