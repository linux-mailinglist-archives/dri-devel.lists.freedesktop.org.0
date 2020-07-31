Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBAE233E5D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C866E9BF;
	Fri, 31 Jul 2020 04:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D386E9BF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:40:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.8-rc8 (part 2)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596170403;
 bh=zW3uIvbp2jGeCBbLWJPZ8htaHvyzIa3B5msiTGKNExc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EDid6naRhp1XSSOexs0W+GdjNYaDZBmfxP6AClxeKOngf4FN0k45P8w3VaDMEqc4C
 FnnroWQiTlBwZxs9LqGcJFvwD2u7+8WeY6Rx5QTUrPmamKCQ9QPtjIFnkzKaGSNdqy
 Ut26nlCvkejpHxZ2Kg8hGoiPqeiOCZV/Ue/JKZ4M=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twq8wVE888GW3cQ12Fw=FEwtD-1tXWgMcrrnjdk3NJZfg@mail.gmail.com>
References: <CAPM=9twq8wVE888GW3cQ12Fw=FEwtD-1tXWgMcrrnjdk3NJZfg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twq8wVE888GW3cQ12Fw=FEwtD-1tXWgMcrrnjdk3NJZfg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-07-31
X-PR-Tracked-Commit-Id: 887c909dd5d557c203a233ebbe238c18438a680a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d8b9faec54ae4bc2fff68bcd0befa93ace8256ce
Message-Id: <159617040369.8551.2784979803005371450.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jul 2020 04:40:03 +0000
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

The pull request you sent on Fri, 31 Jul 2020 13:44:54 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-31

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d8b9faec54ae4bc2fff68bcd0befa93ace8256ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
