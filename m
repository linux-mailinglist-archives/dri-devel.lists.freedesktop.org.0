Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD91CB46E
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 18:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F4F6EB32;
	Fri,  8 May 2020 16:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ECE6EB32
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 16:15:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588954504;
 bh=d46ujfpGRWTnHTboSWH9jDVt53w/tc7Sract1IxbE8w=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=faXGL+0oOb+y5q28u/WXmvgT28QIwxfUWOLsmJ9Ho66p3lRMAlzXKOLEgaZkt5j86
 IX8w/cAyODuwRQ20QzMxrtOtkn5QqLzpW6ez49LYb4GKfE/OdDkr2jGhzwTajjH0tO
 fzG5cHkxIYJTGy9OI1TwpWkyTN+3P6VSgMaU4nlQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx_hR6GYxb6zSm4Z0XMExZ0BA1NJqR8bDy5k4Nzd4xwtg@mail.gmail.com>
References: <CAPM=9tx_hR6GYxb6zSm4Z0XMExZ0BA1NJqR8bDy5k4Nzd4xwtg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx_hR6GYxb6zSm4Z0XMExZ0BA1NJqR8bDy5k4Nzd4xwtg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-05-08
X-PR-Tracked-Commit-Id: a9fe6f18cde03c20facbf75dc910a372c1c1025b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 775a8e0316bd5443a0f3faf771b1bdfb8f8e8342
Message-Id: <158895450479.20886.12327739213066146506.pr-tracker-bot@kernel.org>
Date: Fri, 08 May 2020 16:15:04 +0000
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

The pull request you sent on Fri, 8 May 2020 15:23:50 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/775a8e0316bd5443a0f3faf771b1bdfb8f8e8342

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
