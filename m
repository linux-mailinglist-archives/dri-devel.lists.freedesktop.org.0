Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A52E28E3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Dec 2020 22:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0159589336;
	Thu, 24 Dec 2020 21:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D0389336
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 21:59:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8FC4423137;
 Thu, 24 Dec 2020 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608847179;
 bh=tUoxCG+Q+xjUaEE1MrQX5Pc3v6fsQDHflL8EYOoleow=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Vx92GdErgTnE6/TRWhybKaZVx0A6SSHuEDQRiIUzeKfXDKWFHbr9t95T7M5QX2pT2
 dncEyPentG6oPf0A9hkH3Iw3gDlfSnQM84bqURLw9GWweC05cobkzVyFmSeDSZe2+m
 o4HnEzyWrnD5rBSRA2yWjE7a0mxS9r/0+1WdA8upse/LuevYioBFI3XBaPj/TQVC3E
 C2S93Up5s0+cnw97SHbwkf4fobP3SF1edarD3EPt03bYp+rmFJZuXWLc67DjAUFLZp
 b/Id92T1e79pAOxBK+Iqs+okJ+YZj/X661UYWXRyMM1qWz6qpxj6MZ/SK/VAU56cPD
 0tgUQR4pSSV0g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8ABF0604E9;
 Thu, 24 Dec 2020 21:59:39 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
References: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twrkJdUqTLXXsNygtzkrc4P2iyw4kwU1T83D4_+-gdpDA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-12-24
X-PR-Tracked-Commit-Id: 5b2fc08c455bbf749489254a81baeffdf4c0a693
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef2c8b81b88868f042579b9dd021cc9edbc2d0c6
Message-Id: <160884717956.31605.15833248834026735567.pr-tracker-bot@kernel.org>
Date: Thu, 24 Dec 2020 21:59:39 +0000
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

The pull request you sent on Thu, 24 Dec 2020 12:29:16 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-12-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef2c8b81b88868f042579b9dd021cc9edbc2d0c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
