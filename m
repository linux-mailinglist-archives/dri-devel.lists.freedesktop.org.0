Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ACD285241
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 21:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AAD6E4FB;
	Tue,  6 Oct 2020 19:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917B46E4FB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 19:18:32 +0000 (UTC)
Subject: Re: [git pull] drm fbdev fixes for 5.9 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602011912;
 bh=ZIzEc9VE4fhrfyPrrqZAaIOMdajyG2L9BHNzJHZDfSQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=vBu3z5Ex+kvcPzJ3X/nhG6pqIqvmTtC3ffgmvI52ijRJAoRjJH5uUVWkKzcCQObrj
 Dz04dnNcS8S2EG6BbQtYe0g7wQTrtd6jTSFMQa/0OBtRRG4E+rwWa1ExytPzUWcEd7
 QLEFNVBgH+G3hblcPm5RCjoL1rgddZQRomRmOlfE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyLDWM8c6L0fTG6SeouqXRixTTS2MHX8FKeEGekGinp8w@mail.gmail.com>
References: <CAPM=9tyLDWM8c6L0fTG6SeouqXRixTTS2MHX8FKeEGekGinp8w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyLDWM8c6L0fTG6SeouqXRixTTS2MHX8FKeEGekGinp8w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-10-06-1
X-PR-Tracked-Commit-Id: 86fdf61e71046618f6f499542cee12f2348c523c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1e141e9db6b89d124ec09ca162f378a29119481
Message-Id: <160201191206.29733.6854172821291251615.pr-tracker-bot@kernel.org>
Date: Tue, 06 Oct 2020 19:18:32 +0000
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

The pull request you sent on Tue, 6 Oct 2020 16:37:22 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-06-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1e141e9db6b89d124ec09ca162f378a29119481

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
