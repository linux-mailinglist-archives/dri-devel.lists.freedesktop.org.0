Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB343E8F6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 21:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2D96E0E4;
	Thu, 28 Oct 2021 19:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFB66E0E4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 19:21:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E132760F58;
 Thu, 28 Oct 2021 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635448881;
 bh=boEPKV+7Ftz3gkNK/jO4Gx0Xi+1CSojLzmdTtYckchI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=uCqkSb8o1h201kCumuWtjinTkRTJRb18e9gWIVE9kNkqbWAn/H34g+Kruh+VO13ol
 mmvrZUzvKfZG/FbnSXfgtiG1otjM3/Br9ZSrY+ro62KBYqDgHcIfWAYxTSgqzwuLLg
 uJo0cLfMvHtAHjHfaZx36ed4x8GELijSAZXlb89UJ7Wsh3gByHI84tEJ5m1yRZJOET
 46+AxTILSO23jv7RgnOFLh1DhG+O3YXPkiijQ4XrEp+syOiwyewjA9ZtgWzclnvHwX
 Ssn9GVAuYT8MoE/JfBKuOiY9LCfXKamRWoyVbTaGTk+jn/phD50WgaZMsX8M6veIs7
 CsWEo2LUOyc+w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D22A1609CC;
 Thu, 28 Oct 2021 19:21:21 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.15 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw2U8mu1H+yCg=eRvoWOJXu7FD81doH+qQhWt-yznRSbQ@mail.gmail.com>
References: <CAPM=9tw2U8mu1H+yCg=eRvoWOJXu7FD81doH+qQhWt-yznRSbQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw2U8mu1H+yCg=eRvoWOJXu7FD81doH+qQhWt-yznRSbQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-10-29
X-PR-Tracked-Commit-Id: b112166a894db446f47a8c31781b037f28ac1721
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f31531e55495ca3746fb895ffdf73586be8259fa
Message-Id: <163544888180.5393.3156294262224416081.pr-tracker-bot@kernel.org>
Date: Thu, 28 Oct 2021 19:21:21 +0000
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

The pull request you sent on Fri, 29 Oct 2021 05:14:19 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f31531e55495ca3746fb895ffdf73586be8259fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
