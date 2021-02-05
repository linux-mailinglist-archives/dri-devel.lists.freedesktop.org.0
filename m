Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C70310FA0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 19:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB036E093;
	Fri,  5 Feb 2021 18:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A381C6E093
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 18:13:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E7A264E50;
 Fri,  5 Feb 2021 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612548784;
 bh=5FjHkHYOt9eZtavVQC5cbPIy3lXBb60Zbdm+IZTyxTM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZQl6+OwmcKSOGk6voDdm9lfqG21+1AtKoOKdrjgCnzB7+aDAy2/WGEFASSVcyATvN
 O+4QQgU/D5qWNh02e9SaD4a8kWwo3OAjzSVefPH8xpufHxT+mJoTmTXShJ+QYhGr2l
 sKbONdWh3SXfM2/66zbKO1iVxiynGlloS7vOU02oEKayImytkIwBOzU3wAmTC4dGmI
 jt88T7l/k8CwxyIjSYFJgI4Fl17mM/TSGdEWbVJzC+Etplx2SfH83kljahDb71hHkx
 pXACcg9rUROFYXMSJ9YsOMJJEiZy/tanwIQ7U4UMgiZ9RUPF48xLqqXvvEZm9XLcMz
 xocCiYII8mviQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 69C4860978;
 Fri,  5 Feb 2021 18:13:04 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.11-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twvv9LRSTW4t_Q=OLfei1DsXn-fsjO8ad3cSsZ3KeDNhQ@mail.gmail.com>
References: <CAPM=9twvv9LRSTW4t_Q=OLfei1DsXn-fsjO8ad3cSsZ3KeDNhQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twvv9LRSTW4t_Q=OLfei1DsXn-fsjO8ad3cSsZ3KeDNhQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-02-05-1
X-PR-Tracked-Commit-Id: 59854811c08cfbdf52d79231666e7c07c46ff338
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e91dd934be6131143df5db05fb06635581addf9
Message-Id: <161254878442.14736.6188187964418855985.pr-tracker-bot@kernel.org>
Date: Fri, 05 Feb 2021 18:13:04 +0000
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

The pull request you sent on Fri, 5 Feb 2021 11:43:49 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-02-05-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e91dd934be6131143df5db05fb06635581addf9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
