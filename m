Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DD4071D4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 21:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5094F6EA87;
	Fri, 10 Sep 2021 19:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CB76EA87
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 19:26:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E7E70611CE;
 Fri, 10 Sep 2021 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631301963;
 bh=fLm5GBkLgrqeJRRuvmN7xx6XjlmP5xojAUhe9mYghZo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SeJvGRy4ot77q4IixwmF7zDezZ6yIBpikkgFTvCDim58yb3LBjgcZyU1rmJwuaS2a
 YZmIAUvN1Pgen9/P8217z0/SfDOW/3iH4zDa0hHuklLCLJHB33WDWHkc9kgGgwFZDt
 OazpzUrZIeVhmYKfoVkXnIHo5f0Sz30ThL4ETNuR5X9ImtWYjN3VzBQ7n27bESiNEp
 4F+HTIewEV0WQapLl37Q998U+ubQDGawXe/TCWZSEXGNYrUH6rTcbOrOfoy0tLZeDo
 5QQqYeh+9lNWWyDf4Z5TEprzrIU2+1jqc7fbDRCr/KuBnJNddH3m9M40e+MhhWq+5f
 xp5CPVH0s57DQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E2755609BA;
 Fri, 10 Sep 2021 19:26:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twEpMNJou1DVwpTLAv7sfacBmFgXSef4BmVv2+w8exRVg@mail.gmail.com>
References: <CAPM=9twEpMNJou1DVwpTLAv7sfacBmFgXSef4BmVv2+w8exRVg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twEpMNJou1DVwpTLAv7sfacBmFgXSef4BmVv2+w8exRVg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2021-09-10
X-PR-Tracked-Commit-Id: 70982eef4d7eebb47a3b1ef25ec1bc742f3a21cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a668acb8f01fc0d1e3877cddecbe319ef2ef651c
Message-Id: <163130196392.21375.9662003715554487404.pr-tracker-bot@kernel.org>
Date: Fri, 10 Sep 2021 19:26:03 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 10 Sep 2021 16:35:59 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-09-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a668acb8f01fc0d1e3877cddecbe319ef2ef651c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
