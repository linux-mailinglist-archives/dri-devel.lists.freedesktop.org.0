Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE506201C5A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 22:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2066EA19;
	Fri, 19 Jun 2020 20:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC246EA19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 20:25:23 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592598323;
 bh=P2SsJqPjthAAmm3aJvqDFeEcXcH3hqQHTcjrBRY981s=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=C0Kn/yvyoHTzuF9949MuGeqiazp9hLBpl8Cdtna9ZDCidtIBGsHJS27j8gV7Osz3j
 x1eoRit0xfS13Eis/SGaNNHvccGhfsJf+vqcim+vLfbeL+1FEjdwEs6tKoJ0A8BJaP
 EnhcQTFdLQp5nQTB2czwwcrT8dxsJIrPtLtUxKzI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzY6Md_x57APC-u0eWTztTmB1g-78XQk-dFS++7W1DtgQ@mail.gmail.com>
References: <CAPM=9tzY6Md_x57APC-u0eWTztTmB1g-78XQk-dFS++7W1DtgQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzY6Md_x57APC-u0eWTztTmB1g-78XQk-dFS++7W1DtgQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-06-19
X-PR-Tracked-Commit-Id: 8a7a3d1d0dcf2bb63dafe7275020420005e13e54
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 62c91ead977a5d5023be3d791cbff8535f7d5433
Message-Id: <159259832312.1498.1663559978022920624.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jun 2020 20:25:23 +0000
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

The pull request you sent on Fri, 19 Jun 2020 13:00:42 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-06-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/62c91ead977a5d5023be3d791cbff8535f7d5433

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
