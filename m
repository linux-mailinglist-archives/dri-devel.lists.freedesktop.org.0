Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A602561AD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 21:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DF46E0CF;
	Fri, 28 Aug 2020 19:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CCB6E0CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 19:58:25 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598644705;
 bh=p74W8ZZ9DCJfjTLqxpRxY4uYT4TEx1/MQFoGaihqzTg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=fUGHD13Kaxw6C4PYR8X4O+Cz/r1tZese8PwaPIG64t9HsuD4zkMtaqF6H9vn1vWXE
 GCPsHInmLhgrmPRWlkgdMzgNf4kpDZXh1cH9QB7v4LpDd2NaNdqiM+Mhmo9VhwEMSq
 9uCDdaHkSd6118FgLPzh2A4GNaNSjRF91TgSJnJQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz1s-Mt7ba-82zMPP8hAmenxBj51QzRAq_=TkD0VLJRKw@mail.gmail.com>
References: <CAPM=9tz1s-Mt7ba-82zMPP8hAmenxBj51QzRAq_=TkD0VLJRKw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz1s-Mt7ba-82zMPP8hAmenxBj51QzRAq_=TkD0VLJRKw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-08-28
X-PR-Tracked-Commit-Id: 2a3f9da32de4616f0104209194e9bd3dfae092c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ec06b5c0d259a8c7c4376b121b2f62dfbfe57ef
Message-Id: <159864470520.31636.5027759301107575227.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2020 19:58:25 +0000
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

The pull request you sent on Fri, 28 Aug 2020 12:35:20 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-08-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ec06b5c0d259a8c7c4376b121b2f62dfbfe57ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
