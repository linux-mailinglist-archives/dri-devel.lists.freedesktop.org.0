Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CE51285DD
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 01:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4426F6E181;
	Sat, 21 Dec 2019 00:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FB86E181
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 00:05:09 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.5-rc3 (resend with cc)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576886709;
 bh=PZyNHVK+yRMHqNLRU1yFyaio8UXCppcBI6FfX2M31bc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=xG4H0p4YQ+CKBRI7+VzdfjOgQitk2JdSOf5gqzOY9vX+4l0J547ViqQ1R2G+cwXIN
 cPone07fVHNXy2UZyynfXVDkGT/AVnFN6Lyl9J+xFwx5h5TgThqcbXHh0xdNeNqRcv
 pww9Xq8Do0gdbQPhh+0uBpCJFqptLEJtEoNbcgyI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzUbs3a7_QYgR5X_vsY8uvaMwLExcO_v2s=xDECd2rxWw@mail.gmail.com>
References: <CAPM=9tzUbs3a7_QYgR5X_vsY8uvaMwLExcO_v2s=xDECd2rxWw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzUbs3a7_QYgR5X_vsY8uvaMwLExcO_v2s=xDECd2rxWw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-12-21
X-PR-Tracked-Commit-Id: 0c517e6ced039b389bbe2d6be757525e52442f64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7c88728da3bc68c5b3815332d084244303fd254
Message-Id: <157688670909.7475.15525387561245055910.pr-tracker-bot@kernel.org>
Date: Sat, 21 Dec 2019 00:05:09 +0000
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

The pull request you sent on Sat, 21 Dec 2019 09:58:23 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2019-12-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7c88728da3bc68c5b3815332d084244303fd254

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
