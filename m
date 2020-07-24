Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4FD22D13A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 23:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F896EA23;
	Fri, 24 Jul 2020 21:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3C66EA0D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 21:40:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.8-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595626803;
 bh=DxJA8cVzgvxqbDGC3Uzf8eFJ4JiqoI58bB3qOxHc3nc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=IukPE7mvaDxQtVOYlHR3w4Jos/yos2OPqoPT3wQ85RteWQRZ0nEKufzzJEeUrCaOZ
 Tai3Lv74P55oJfYiqW0Usjq9y4uMwIEB2Z+yrBPHAYsDneu2rl62N245asoCFjpUwn
 DthQP1jo4eudgk4C3zBlw5zeZHB+TkQ1/geSEjmg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twWoMc=xxXnZ7kKYp_fmYEquLE=PgVtjPhcH86Ocv3W7g@mail.gmail.com>
References: <CAPM=9twWoMc=xxXnZ7kKYp_fmYEquLE=PgVtjPhcH86Ocv3W7g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twWoMc=xxXnZ7kKYp_fmYEquLE=PgVtjPhcH86Ocv3W7g@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-07-24
X-PR-Tracked-Commit-Id: d8904ca9d338cdaa67e3bd06d7a7d418e426648c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88fff0b7dcc132c924d710d75d1401264b6d0ef6
Message-Id: <159562680338.3064.493657765815732199.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jul 2020 21:40:03 +0000
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

The pull request you sent on Fri, 24 Jul 2020 14:56:40 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-07-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88fff0b7dcc132c924d710d75d1401264b6d0ef6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
