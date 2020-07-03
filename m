Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820B2140A2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 23:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBB26EBDB;
	Fri,  3 Jul 2020 21:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190916EBDC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 21:15:09 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.8-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593810907;
 bh=8nOFr5WReM9/ZNRXfKtg3p8+S5tm54BJCGmZ+ZuDb4g=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=tVORYXl2guq75NmaZ5bxlsNzhb5gmyH0pou9gYHKn3Zvp+8BE3u4AWbU4iA8sU/aD
 dLyT9tpfuWLu+URJNvjsLwakdgmwtZiHm0693DJd1cKweejxalEUMFcgXwjc3KdcWL
 Ah4tQ7kYKCWCwRMFx2icyMPZUof0zxfOSj+HK8k8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx-1Z5fRAAENHe-qnpBPvaQfn24-84QR-vnivH5-qQDEg@mail.gmail.com>
References: <CAPM=9tx-1Z5fRAAENHe-qnpBPvaQfn24-84QR-vnivH5-qQDEg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx-1Z5fRAAENHe-qnpBPvaQfn24-84QR-vnivH5-qQDEg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-07-03
X-PR-Tracked-Commit-Id: 1298a549e22abe36c82208406c7069280553c7dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1d42871465291c3f117ea3c9fbce8d4a603c303b
Message-Id: <159381090765.9451.15520818943136259606.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jul 2020 21:15:07 +0000
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

The pull request you sent on Fri, 3 Jul 2020 11:46:34 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1d42871465291c3f117ea3c9fbce8d4a603c303b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
