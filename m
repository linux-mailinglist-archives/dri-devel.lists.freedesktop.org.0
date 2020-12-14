Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269482DA0DA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 20:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBBE6E0F7;
	Mon, 14 Dec 2020 19:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ED56E0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 19:51:27 +0000 (UTC)
Subject: Re: [git pull] drm for 5.11-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607975486;
 bh=cvCK1zaCLrUynKDt3lpIT052KJV5cXh7x5aTW82+QCw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=OqDvYLLpTItmaDBBHCY497UkXybsxAdW0fsS2ty61R7mr9jcTln40X9ZSCkXLsRUw
 QGzS29EFhCIDy1gjPgdkT/hJBTEJLd4ShhfPDqEDsrli0hfZFB78lX4j7cOZkmDamn
 cic5QPzdeHXogWfwNCAQGMpsuXK0ZA88TMHPBi5MRgnrGQ2C0uppMivm/J3EBQgiZ2
 SMuCqaHiJTTGN27tCgW7mt/HxgaUCxCb2nVXPzlnvToUIJTG/Vz9lVHHuTCMOE38yz
 c6sXpvji9FHBm4U2DKSd6NIcDc/u4UBxodt1IeGHdT4XwNpwXgitsp/JxNjaoaCAfb
 zKUHpF9u80nNQ==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
References: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-12-11
X-PR-Tracked-Commit-Id: b10733527bfd864605c33ab2e9a886eec317ec39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1d36dffa5d887715dacca0f717f4519b7be5e498
Message-Id: <160797548655.21325.12381698437384627490.pr-tracker-bot@kernel.org>
Date: Mon, 14 Dec 2020 19:51:26 +0000
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

The pull request you sent on Fri, 11 Dec 2020 13:52:21 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-12-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1d36dffa5d887715dacca0f717f4519b7be5e498

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
