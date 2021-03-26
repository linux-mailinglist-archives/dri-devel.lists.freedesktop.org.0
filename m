Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E805C34AEBB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 19:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609326E220;
	Fri, 26 Mar 2021 18:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BD86E220
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 18:48:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2AD6461A21;
 Fri, 26 Mar 2021 18:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616784506;
 bh=aZxBOKUsHqL3lGH0KC2toVv+7HygHF69Rr19gkemfDI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=YDGJCW3zVi/YKFDxxZzA2kDtZIaNUR95exWdx/aQwsvDSkkR0QmqzL0UQr/G9SihI
 8JaAsId9mF8r3pKDxLKq39GdCS7hwPGQMYlPruFg+8rTb5uhNbsN1HAUISg5C6Jsuy
 OrufHWP9cAMk/JSvemloKK7dm3pwCxiYz+O85gZJhSTA7TJ2t0TDsBOlVApaE1OJCA
 Qlh0AfdFRXOXLNW3+iF6NlgDpowHY4uAvFgAO0Rg1X9AlgUHn4b6mfYquu93Ht/JZk
 TZoQ1AP95+ExMJxxUobQkMCD+nzUin2XdOXW2PZKH3I+v+uSMmXiIrxvjGwSuodZzz
 sRL59OJQYi0zA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 10C0060952;
 Fri, 26 Mar 2021 18:48:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.12-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twkAXygrutCExSdhRh69Vvnr0X7HagQw8WQGZgC_UdTGA@mail.gmail.com>
References: <CAPM=9twkAXygrutCExSdhRh69Vvnr0X7HagQw8WQGZgC_UdTGA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twkAXygrutCExSdhRh69Vvnr0X7HagQw8WQGZgC_UdTGA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-03-26
X-PR-Tracked-Commit-Id: 09d78dde88ef95a27b54a6e450ee700ccabdf39d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f944d061f847b0ccf0ebc095b5a6ba9ea9caec4e
Message-Id: <161678450606.8437.2284982485967975024.pr-tracker-bot@kernel.org>
Date: Fri, 26 Mar 2021 18:48:26 +0000
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

The pull request you sent on Fri, 26 Mar 2021 13:34:03 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-03-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f944d061f847b0ccf0ebc095b5a6ba9ea9caec4e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
