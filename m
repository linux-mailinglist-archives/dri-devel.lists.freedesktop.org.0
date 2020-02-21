Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D4C168905
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730BD6F564;
	Fri, 21 Feb 2020 21:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC656F564
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:10:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.6-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582319417;
 bh=A1EkMtqwTaYtxY6J1eO4CDA52gGDeiVUuY2B73zelp8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=kxoTn7sJOka7K5WnnpHLm8OPMajvyTF0gHd1Ol3VIeyW4YlW86JRhlP25/4u59A7I
 H5JyspKp6c3gzHTBvO5jnAP4pV72o5aAcNNsZBBeKfqD/U7UoUIgmzCc/N1Uzk+g7D
 qIJRJCONJWF/wgOK9uDi5rJmKwoXjmTmspjci/Gw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyKU17ntxT9JEbWf+ZhiQ3pMOQtjLVGmDViR43Boj7zdA@mail.gmail.com>
References: <CAPM=9tyKU17ntxT9JEbWf+ZhiQ3pMOQtjLVGmDViR43Boj7zdA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyKU17ntxT9JEbWf+ZhiQ3pMOQtjLVGmDViR43Boj7zdA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-02-21
X-PR-Tracked-Commit-Id: 97d9a4e9619a822c5baf6a63e6f5b80fee4d4213
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88f8bbfa94ce18eff7b322256ec4b5f885dea969
Message-Id: <158231941769.18249.16730626184494486901.pr-tracker-bot@kernel.org>
Date: Fri, 21 Feb 2020 21:10:17 +0000
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

The pull request you sent on Fri, 21 Feb 2020 15:52:10 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-02-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88f8bbfa94ce18eff7b322256ec4b5f885dea969

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
