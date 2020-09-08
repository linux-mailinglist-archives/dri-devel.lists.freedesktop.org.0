Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C9261984
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7796E899;
	Tue,  8 Sep 2020 18:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471566E899
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:19:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc5 (special edition)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599589157;
 bh=EA56Y2PAWEn0I+v7dzXzED2ZEgWwWS9lgmkRcjziNUk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=t3dp4ASZT5RXvDNrTn/L0tCilu+KANvKSJxIdpCQUoo38yV3di5aDqCzfUf5m5q+O
 5BhJ+7APv1AdkpgBnxwYzvPfxgx5IICLmpByfffZy9Jd2ELUha1cYVY+UQhosJuU7g
 uXCHr123quIDwgMJA4UA2UIM/6/7wfpHDDV6m72c=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw2tebfrjMEiB5fUy8USZrjq4b_siciDecFfMu8H794gA@mail.gmail.com>
References: <CAPM=9tw2tebfrjMEiB5fUy8USZrjq4b_siciDecFfMu8H794gA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw2tebfrjMEiB5fUy8USZrjq4b_siciDecFfMu8H794gA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-09-08
X-PR-Tracked-Commit-Id: 20561da3a2e1e0e827ef5510cb0f74bcfd377e41
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f6a73c8b715d595977774d48450a734297ab21f
Message-Id: <159958915704.19003.18086198109433271774.pr-tracker-bot@kernel.org>
Date: Tue, 08 Sep 2020 18:19:17 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Tue, 8 Sep 2020 16:22:25 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f6a73c8b715d595977774d48450a734297ab21f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
