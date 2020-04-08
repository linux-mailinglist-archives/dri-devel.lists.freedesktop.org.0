Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6451A1A57
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 05:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D28C6E1A8;
	Wed,  8 Apr 2020 03:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDCE6E1A8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 03:40:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586317226;
 bh=R0FPu+moxhWt8pZumzMJx9MRf6efiK+/hdISliL9aIE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=X6baiEe2uIcfaCOf+ITNhkiDNdWLmsPzzm5iocngBZVPDUO/N9s2JTXe5RaFetY+b
 xB/6419wf6rSqT3RJTq0XQD6Fc7kp0/plBieOlpJ8MHvJitnshjSRIEv3KEGyyVr+e
 XGIEzTIwfwWMlAfaQOm/bE4NlY/eYwaF1e3jCie0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzqR6HkM_XyijcKozqfh-WXKRWhe+Ay7mwA0o3kSooOEw@mail.gmail.com>
References: <CAPM=9tzqR6HkM_XyijcKozqfh-WXKRWhe+Ay7mwA0o3kSooOEw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzqR6HkM_XyijcKozqfh-WXKRWhe+Ay7mwA0o3kSooOEw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-04-08
X-PR-Tracked-Commit-Id: 12ab316ced2c5f32ced0e6300a054db644b5444a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5e94d10e4c468357019e5c28d48499f677b284f
Message-Id: <158631722630.10073.13307037756719527646.pr-tracker-bot@kernel.org>
Date: Wed, 08 Apr 2020 03:40:26 +0000
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

The pull request you sent on Wed, 8 Apr 2020 10:49:06 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-04-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5e94d10e4c468357019e5c28d48499f677b284f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
