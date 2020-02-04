Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC91516B4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113AC6E58B;
	Tue,  4 Feb 2020 08:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141606E58B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 08:05:17 +0000 (UTC)
Subject: Re: [git pull] drm ttm/mm for 5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580803516;
 bh=bF7S5Qk5YtCZxYuh0RNSvKo2BsmU5gTJqXGn2yvrQ0Y=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Xe0zHDYuGx5Tz2QfuCL8MiRlC7Kj8kv7pfP88tJrjzUZp/HqicOfNDvLfab1dZ0bq
 ALhYS0vNkC46WWofO181DOxIfKBNViGzC8Xb0rdBxzqDWm+DYyeqPO5e5E4rMg7OKW
 6WFQR0L0QPP2r1x8bZiVS9U1xl6ruIucooBRmVmA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyPRUfbZZtVWWxs95aLkuaXkenwGU+QfR3N6NLRn+PsHg@mail.gmail.com>
References: <CAPM=9tyPRUfbZZtVWWxs95aLkuaXkenwGU+QfR3N6NLRn+PsHg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyPRUfbZZtVWWxs95aLkuaXkenwGU+QfR3N6NLRn+PsHg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-02-04
X-PR-Tracked-Commit-Id: b45f1b3b585e195a7daead16d914e164310b1df6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9717c1cea16e3eae81ca226f4c3670bb799b61ad
Message-Id: <158080351683.18289.3506574281830623003.pr-tracker-bot@kernel.org>
Date: Tue, 04 Feb 2020 08:05:16 +0000
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
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Tue, 4 Feb 2020 09:26:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-02-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9717c1cea16e3eae81ca226f4c3670bb799b61ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
