Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C68248B2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 20:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FE210E542;
	Thu,  4 Jan 2024 19:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC0210E539
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 19:10:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B001618F3;
 Thu,  4 Jan 2024 19:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25311C433C9;
 Thu,  4 Jan 2024 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704395412;
 bh=OFT0cYdQcfcAjLV7qTEtGLasNg7g19VpAt4z0BUMlXs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=k1upHSDFyOkpqixG78GgFMIvKlrYI2xfghY8EnDyEZhrwBjSBy47fyP8jDVycGLGx
 m+B/+Ltbt4hMfEUMCvPhGdmmX4n/ZeggZnlqYtlev+W8e+wwej9Y9uvkUnWrCHCSWW
 9JY9yhpAM150JqGXYNMQzDbr/zaiN72Os6jl1Zj5O2WF5TSZa3bFcIwN3KwynoKeA2
 SRb5JtEDAg/XbLO6sdxoDGGBnNgIJW7x0QlhT2CN4XKy1ZzyNMTaO62o+i6fvOIzjU
 cqp+1Otejdds+vG4BQLDBDFUZA4x+DJl7GTqGjU7zYUb+gN8MdcQ9j2IqTg1CuYJBN
 livTetexZE07Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 11E26C43168; Thu,  4 Jan 2024 19:10:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txBXQR8YsaU2fO1frcGBP6HKTF473Rqae_hwT_yY-dRrg@mail.gmail.com>
References: <CAPM=9txBXQR8YsaU2fO1frcGBP6HKTF473Rqae_hwT_yY-dRrg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txBXQR8YsaU2fO1frcGBP6HKTF473Rqae_hwT_yY-dRrg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2024-01-04
X-PR-Tracked-Commit-Id: faa21f4c20960fee268bdb0fe977ed0edb6685fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5939a693dc6e6d6f293681017c70ff60c3723d43
Message-Id: <170439541204.3148.17028465187686419462.pr-tracker-bot@kernel.org>
Date: Thu, 04 Jan 2024 19:10:12 +0000
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

The pull request you sent on Thu, 4 Jan 2024 12:29:55 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-01-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5939a693dc6e6d6f293681017c70ff60c3723d43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
