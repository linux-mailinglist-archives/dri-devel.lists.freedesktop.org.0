Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7A5387EE
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 21:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6D210FEE3;
	Mon, 30 May 2022 19:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A33810FEE2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 19:58:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6BFEB80EFA;
 Mon, 30 May 2022 19:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E59CC385B8;
 Mon, 30 May 2022 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653940694;
 bh=72ctE/axp9RcbHHLlGgyhmbJt+bmzqtwO8lqspA2+84=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BYFHvvipimpr4mqudNK9IU6t9ZMpw5ybT42WzRy6WRiX6Oa82A5gxCNvAFt2lOw7s
 z3xzK2AIQP87BuMpV1jhWVCrIQq2P2HVI2Xcsu8TNsYu/76WOg/oFEA0I2UI6aA+LJ
 Uafz2sLCAnS065uGq5fbmwUAzwBecSTbUfDQPOt59yTN2SAMjOcAJ7xp8a6cwIcY2y
 15I42WBYQs4EXT8ysBPKc7AqBE5fylfxD5cB/hQDTwUj1uIii7iEawToRmvkBRyLcL
 3lKQQsFItJrXgvA/BbiHvD6T2jxEu6qzxhMBndEuUneVdYv8yCuZfGgmO6U0prY2vL
 sSH/T4STrW4FA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6A1BAEAC09C; Mon, 30 May 2022 19:58:14 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YpUeiCcb0ntt7wct@ls3530>
References: <YpUeiCcb0ntt7wct@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YpUeiCcb0ntt7wct@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/for-5.19/fbdev-1
X-PR-Tracked-Commit-Id: 79b66128f13f5c22dea03a2197495c4b96ab31f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ab2afa23bd197df47819a87f0265c0ac95c5b6a
Message-Id: <165394069442.15519.7261068952610423736.pr-tracker-bot@kernel.org>
Date: Mon, 30 May 2022 19:58:14 +0000
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Mon, 30 May 2022 21:44:08 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.19/fbdev-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ab2afa23bd197df47819a87f0265c0ac95c5b6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
