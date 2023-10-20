Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC417D1490
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 19:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0510E02B;
	Fri, 20 Oct 2023 17:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7861910E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 17:06:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 60D3EB82F56;
 Fri, 20 Oct 2023 17:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B88C5C433C8;
 Fri, 20 Oct 2023 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697821563;
 bh=ROpFDlqb+H86fYtgnkBm7h/Hut75+rRwKJfzKjrgUew=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BHZVxtBS9L9Xrhg56PBoeNHrh1P5RbSzdOnamprmvQMNQSc3ONJ9jST7/OCQSAp9m
 KqY7I+E50KYdKup1iXfVlosQj2BuSoXXpRegC0hk14snV3QhDkfLH+1+UNnD3yfQK8
 zN4vRGMwklYK90+k9soJSp2DCnrbJp1Iv11qgj5Wxk8sg2G9XQOXzHWpWT0AT0ivbC
 hHtorTLgqiI/k+KH5hxe334kIsX6PLzbwfvt+ivefINKFNHkhMi+FX60M69obcfdKt
 8FdOIuRyJrtp93mzP40ahXc49fbyVgS9U/5wievKUB2fQyBq6h0WqgEGBRsrBQBNAq
 COPonplcK6ocg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A5B05C595CB; Fri, 20 Oct 2023 17:06:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twE+5tjNxbr1FkiXBqeEzv9k4LZMo4ETmchaNioNT6quQ@mail.gmail.com>
References: <CAPM=9twE+5tjNxbr1FkiXBqeEzv9k4LZMo4ETmchaNioNT6quQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twE+5tjNxbr1FkiXBqeEzv9k4LZMo4ETmchaNioNT6quQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-10-20
X-PR-Tracked-Commit-Id: 8b35ce3f7a9699e7580527fe4510d77f2a35f02d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8045b4a33a511ff1feaeb806e819572b90b6625
Message-Id: <169782156367.26317.10341186241193996664.pr-tracker-bot@kernel.org>
Date: Fri, 20 Oct 2023 17:06:03 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 20 Oct 2023 15:01:24 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-10-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8045b4a33a511ff1feaeb806e819572b90b6625

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
