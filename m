Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81E490222
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 07:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549FD10E29D;
	Mon, 17 Jan 2022 06:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC61510E277
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 06:54:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B99960F35;
 Mon, 17 Jan 2022 06:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E413EC36AE7;
 Mon, 17 Jan 2022 06:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642402495;
 bh=SCGecgdafApCwzupB08iiGrxCgoSuhJhzGGkAGfTXvs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=XR0vWe9E4glcfNvf9gmrUUrhYAENUnRDgK3ZBCDFY+zzenMrl5/SPnXBDwx1ud6ar
 1WBQrbJBL6pfC9eW7BUoaXz2kGUUfY7V/CC4i3P63PO3EI4Vp/RolurldWPSRrX7Tg
 w4MbNEvGbkuQIvhnZXN0N9vOiETlS1TPqibgSHp9fIHk9bg3d6QhpHjc2GNf2WXxAB
 WIlCuMWF8j7EEmXQ+1KcwCOHLAUTDQVGex/vSXfpRROqZ2sABGunhXZW2OQBvFvMXO
 Kgnc+WEhC7pvufb/j2nPzzCkAphc+bLYVPz8c3kblUtk+eKBmpYmqPhqB7Ve9qCgcZ
 qSYO+M0Vd2WuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D221AF60798; Mon, 17 Jan 2022 06:54:55 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates for v5.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YeRyfaesC2kxkgZC@ls3530>
References: <YeRyfaesC2kxkgZC@ls3530>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <YeRyfaesC2kxkgZC@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-5.17-1
X-PR-Tracked-Commit-Id: f346f32701ebacf6fe397f6f1d254256f73da321
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c750c7b614322a4ab50be0d57a76addb598d51d
Message-Id: <164240249585.26213.5504565734773316084.pr-tracker-bot@kernel.org>
Date: Mon, 17 Jan 2022 06:54:55 +0000
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sun, 16 Jan 2022 20:31:09 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-5.17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c750c7b614322a4ab50be0d57a76addb598d51d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
