Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2EE2CF321
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 18:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C2A6E1A8;
	Fri,  4 Dec 2020 17:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33F96E1A8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 17:31:41 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.10-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607103101;
 bh=kdIV6qg0v0kiZPoBanSMJB+t0VBdncQDDFz02bw9yK8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JSFb9xWqy01RN7dA8kaAN3HFhqAPi3zNGSICcVJ/bifokveYcv6fib3PJDmEsTEv1
 MGilnBByafrBp+o3c/C7tpWsjLqrKhLRdaQoJHy0DRYgQgpOQutMmjDpBURgCQE6WC
 Jare1SBF9wcMctg6hQICGPyX+WWN4+2A/lGPt+yDIIkwb5FPmhTtN5pQbCT3u9y37k
 hQ/HgjYH1gZmIYsw6Y4iyHytwB2wKOSluUZ2fIP0ZzZpDxHn4vjcgO181/dVw+Dttq
 zgODtaACfUADboSpuaS4d+gjzNhj+IZsb8H9onDh0QHKNpAb69f+03RHtlH3oVfiBq
 aYHbsZiO45AMA==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twdEoUbczSb9v0vAFD7w1qfB8-89tP-xjAEq5P=uBezCw@mail.gmail.com>
References: <CAPM=9twdEoUbczSb9v0vAFD7w1qfB8-89tP-xjAEq5P=uBezCw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twdEoUbczSb9v0vAFD7w1qfB8-89tP-xjAEq5P=uBezCw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-12-04
X-PR-Tracked-Commit-Id: de9b485d1dc993f1fb579b5d15a8176284627f4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e87297fa080a7ed6b431873c771b3801cab573f5
Message-Id: <160710310160.1431.7995360012238947510.pr-tracker-bot@kernel.org>
Date: Fri, 04 Dec 2020 17:31:41 +0000
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

The pull request you sent on Fri, 4 Dec 2020 12:25:35 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-12-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e87297fa080a7ed6b431873c771b3801cab573f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
