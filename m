Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8C11EE38
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13586EE0D;
	Fri, 13 Dec 2019 23:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4B66EE0D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:10:11 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.5-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576278611;
 bh=pspnKMIlXdhQZxbYs6m+K1waGcUhbbyoUHB0cwr6S5A=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=F2xKFAGc2VQwggfbn1pCnWkoZ99BK15Wi+/PD+5Dhebj0nR4kf30/tD+EoNDCtZ1p
 jddWCl8GlEK4j7CpqCu8Y0WPkMwFsS8qrHyCpw72qh5qjkAKAA62DqIHuYxRLzigiC
 oKnTYcWtwrrVTMZQTrKP4jUW7na6DIm6rPNhG1S0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty-Cn1SRGkXWkYN9L8F2oe-mwA77cvpSz3iJUutQQcrwA@mail.gmail.com>
References: <CAPM=9ty-Cn1SRGkXWkYN9L8F2oe-mwA77cvpSz3iJUutQQcrwA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty-Cn1SRGkXWkYN9L8F2oe-mwA77cvpSz3iJUutQQcrwA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-12-13
X-PR-Tracked-Commit-Id: d16f0f61400074dbc75797ca5ef5c3d50f6c0ddf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2cb931d724b08def6e833541a37b08ebd59ab43
Message-Id: <157627861136.1837.10096094016374191745.pr-tracker-bot@kernel.org>
Date: Fri, 13 Dec 2019 23:10:11 +0000
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

The pull request you sent on Fri, 13 Dec 2019 17:04:44 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2019-12-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2cb931d724b08def6e833541a37b08ebd59ab43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
