Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0929B29415B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 19:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3956F6ED8F;
	Tue, 20 Oct 2020 17:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C226ED8F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:24:01 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603214640;
 bh=jEy+A3kgsLLSan8ch002OuIdcyn8Qfx1jlsqgFQi+Mw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Qf3XLdHEYCee0SzG5D7lVmK0JTuRpkKcR6F7TqsBBB9KmRn7ECai3SVEY3iZxWUtM
 ailUqO/3BwfuNKfTyenlfyXwVGvFSNBcdkgMraPtlezg7xmYsqxR8YmMmLH1f18LUv
 KfggCq97l9RS5fwxTdcyPINYLt8dQEbsDRKPQTro=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyGF24NcUraYx7shazjkZ=c2sukykcxZE-u6L-qekCvbw@mail.gmail.com>
References: <CAPM=9tyGF24NcUraYx7shazjkZ=c2sukykcxZE-u6L-qekCvbw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyGF24NcUraYx7shazjkZ=c2sukykcxZE-u6L-qekCvbw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-10-19
X-PR-Tracked-Commit-Id: 40b99050455b9a6cb8faf15dcd41888312184720
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9915b964c25193a6be1aed744c946d6ff177149
Message-Id: <160321464091.32514.18204076146042610602.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2020 17:24:00 +0000
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

The pull request you sent on Mon, 19 Oct 2020 15:21:40 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-10-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9915b964c25193a6be1aed744c946d6ff177149

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
