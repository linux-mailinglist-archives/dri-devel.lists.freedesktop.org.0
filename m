Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2282C6C67
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6EC6F3F1;
	Fri, 27 Nov 2020 20:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AA36F3F1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:05:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.10-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606507556;
 bh=Qd9CqSF8eXexGud6PiR4dlfq12llG814HMZe3+s5jkI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=NYZUKAPom5QJ1rdIStKIAylNnl90AHMCGxLeQoNc+UNQ/qqNgzAapQWZImFR4sI9o
 YTshHDbOaujhDtHIU/lhVhpMeMySs+oSdWOvBCkBHrGXZQYVFP2QtMCvtLPMa+K9l+
 NBtu/G4yGVKQZSL3J43L3DOSsTQkvTTzmpsTeRic=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twQYg5nf=wGOMm=i=++dZswSvpkV2txDnBYFmj=SRDx9A@mail.gmail.com>
References: <CAPM=9twQYg5nf=wGOMm=i=++dZswSvpkV2txDnBYFmj=SRDx9A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twQYg5nf=wGOMm=i=++dZswSvpkV2txDnBYFmj=SRDx9A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-11-27-1
X-PR-Tracked-Commit-Id: 9595930db4bb91433607441a5f26d90e9c6e34eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6910b676898934c2abe9f3ff3d60f4d4bc8afda8
Message-Id: <160650755608.29509.16650003010743047178.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2020 20:05:56 +0000
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

The pull request you sent on Fri, 27 Nov 2020 18:37:15 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-27-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6910b676898934c2abe9f3ff3d60f4d4bc8afda8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
