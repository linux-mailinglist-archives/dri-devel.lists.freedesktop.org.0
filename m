Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316FD3DB29E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 07:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9606F3C9;
	Fri, 30 Jul 2021 05:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B622E6F3C9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 05:13:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E70E60C40;
 Fri, 30 Jul 2021 05:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627621992;
 bh=in0glC0/qJx3indA2Z7BJ09AIHm1buh7ievguXEF9Wk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qcB5noO7w76gKlSnjP3+DEjo82FfkD1MkAy3do7HyIxH96gbhtr1/WS49RSf8p/VP
 Qrf6fy4JH0LlhCOyk42Hv2na1t+a6634jC8uqE4k797e8O+alFiVziW1/uET3SvyWS
 OtX+/16r7eXiHfPOQENsKo8y9S1eI9K8OzWNy2l66t5Iy/aCDYzXPmT4FpMrSnVqc+
 2t362nv6EHPqlMYRl4UA5WeCeM7rB0mztqokMb45ZRN1gdc/koiQyJ7KHu9C6g2xT3
 0663h5lqnKwdjZ0unp+6ThOoQqoUyPZ+9a54UR7yCGCuuU74UcruhjEtMB2GD18be4
 6XBH54a1xSqwQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5EFDA609E4;
 Fri, 30 Jul 2021 05:13:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.14-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twko1gCNTB3CPf7CAQqWFayMj=1fa3ZoEwwviDFhF48kQ@mail.gmail.com>
References: <CAPM=9twko1gCNTB3CPf7CAQqWFayMj=1fa3ZoEwwviDFhF48kQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twko1gCNTB3CPf7CAQqWFayMj=1fa3ZoEwwviDFhF48kQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-07-30
X-PR-Tracked-Commit-Id: d28e2568ac26fff351c846bf74ba6ca5dded733e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 764a5bc89b12b82c18ce7ca5d7c1b10dd748a440
Message-Id: <162762199233.22958.3909758694757785317.pr-tracker-bot@kernel.org>
Date: Fri, 30 Jul 2021 05:13:12 +0000
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

The pull request you sent on Fri, 30 Jul 2021 11:11:27 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-07-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/764a5bc89b12b82c18ce7ca5d7c1b10dd748a440

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
