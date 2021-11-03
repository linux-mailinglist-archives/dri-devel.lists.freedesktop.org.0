Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10CA443A42
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 01:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFC67204C;
	Wed,  3 Nov 2021 00:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB23D7204C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 00:08:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9CB0E610C8;
 Wed,  3 Nov 2021 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635898114;
 bh=l6GesyVZcnCWevVTBw39JnCBZK3qajRza7E4zaSUyQU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=b/TU74lIdAA8EXPGeWs70Ufpql7NtaRRT4HiwsqklnM3iEIg0/HYjFFgsEnPddIg9
 5X4wEXLlFy+Eu4VbR8fij9LBfnka+kQ++FrUDQXwZ6hqBI2M42O3z7015n4kulfF1N
 oN/wFWpCBeoVO+Ff75t7Rkt062zIICxtF1aEGp1tBdzvmHBZhZ07O8SSKuE+t3a8cX
 SSP1ueVJZmpJnHFcdcvV3D8J47zxOCiAA1y3l5dsZUTYmiEVlezIvqf5OD9mHMcWXT
 tDcEfANW6WzczLYE3SUHReZO77H1GKLaL7oymXD2ccJkRp6bKzmNPRDZVp50QaN0/m
 b0JEQ4UWFU3MQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 89D13609B9;
 Wed,  3 Nov 2021 00:08:34 +0000 (UTC)
Subject: Re: [git pull] drm for 5.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyOyz4_-OdjDduFkponSXycO6maBDFsWGTLv+j=_Vp6ww@mail.gmail.com>
References: <CAPM=9tyOyz4_-OdjDduFkponSXycO6maBDFsWGTLv+j=_Vp6ww@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyOyz4_-OdjDduFkponSXycO6maBDFsWGTLv+j=_Vp6ww@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-11-03
X-PR-Tracked-Commit-Id: d9bd054177fbd2c4762546aec40fc3071bfe4cc0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56d33754481fe0dc7436dc4ee4fbd44b3039361d
Message-Id: <163589811450.12904.16056402760651247519.pr-tracker-bot@kernel.org>
Date: Wed, 03 Nov 2021 00:08:34 +0000
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

The pull request you sent on Wed, 3 Nov 2021 09:34:23 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-11-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56d33754481fe0dc7436dc4ee4fbd44b3039361d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
