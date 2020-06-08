Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29C1F1F69
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 21:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E8D6E998;
	Mon,  8 Jun 2020 19:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E3A6E1CD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 19:00:25 +0000 (UTC)
Subject: Re: [git pull] drm msm next for 5.8-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591642825;
 bh=20GOHEGnTLHtKSes10YWvIXaEGpIcgRIsG6BC5LEk9w=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=C/lwrc3OZrYGmQVDt/SzfsGuf5HUY7W91Il40py5kURUR4mmzUxmQG6/qK2L/6k2g
 EqsXpm5DUn2339scNmdPwTW0rOS7On59UD21WjWxIgXapm1b+qIBf7tcaaPh1qVwD5
 AZr85DVbJ92YT67o40Y2WZeNLxr6ukiQHW41cEAE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9two=B8nCSP9+9x3oGM9HUm0dDk3aY=ePUuVeh6530v94Q@mail.gmail.com>
References: <CAPM=9two=B8nCSP9+9x3oGM9HUm0dDk3aY=ePUuVeh6530v94Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9two=B8nCSP9+9x3oGM9HUm0dDk3aY=ePUuVeh6530v94Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-msm-5.8-2020-06-08
X-PR-Tracked-Commit-Id: efe792f39ddbc6396b9142afff97855ee357b492
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9413b9a690ec8aeaedea74bb875079d36f295304
Message-Id: <159164282533.16000.2743885630055800944.pr-tracker-bot@kernel.org>
Date: Mon, 08 Jun 2020 19:00:25 +0000
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

The pull request you sent on Mon, 8 Jun 2020 13:33:51 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-msm-5.8-2020-06-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9413b9a690ec8aeaedea74bb875079d36f295304

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
