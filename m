Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3BC12FCF5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 20:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0A3899E8;
	Fri,  3 Jan 2020 19:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FBA896C7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 19:25:05 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.5-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578079505;
 bh=RQg7ogAA5Z0uDirCP6aCQrHzBY1G8SgTCsaK+SsMbbc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=iigZ+xXUFpDfssdL1tURaS6B9inH4xI2r/8DADwZ8IHLRT0Kg+wF7AaPq6rkesTRB
 JxjDhOIzsKkXrvKDM3KZUT+Q72Aw78xdwRWyMQS0c92d2A1hZlfFPbHjVP31/is4HY
 g09K7Wivf0UTphvOAczLVdbBbUgjoFDTGMjvRQXY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twLL0KL7zS4hwH=TgcuwVqJCpvUB276+GzkhQaa_B2vHg@mail.gmail.com>
References: <CAPM=9twLL0KL7zS4hwH=TgcuwVqJCpvUB276+GzkhQaa_B2vHg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twLL0KL7zS4hwH=TgcuwVqJCpvUB276+GzkhQaa_B2vHg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-01-03
X-PR-Tracked-Commit-Id: a6204fc7b83cbe3398f61cf1742b09f66f0ae220
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca78fdeb00fa656f09afee977750e85da929d259
Message-Id: <157807950558.16643.5078290428003486265.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jan 2020 19:25:05 +0000
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

The pull request you sent on Fri, 3 Jan 2020 16:57:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-01-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca78fdeb00fa656f09afee977750e85da929d259

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
