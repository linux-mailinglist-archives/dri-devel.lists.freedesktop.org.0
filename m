Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7751088F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE8D10E468;
	Tue, 26 Apr 2022 19:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3F910E468
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 19:07:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 463D4619A9;
 Tue, 26 Apr 2022 19:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC0C4C385AA;
 Tue, 26 Apr 2022 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651000019;
 bh=oB0PfXfFNyYYN59yI+8k+hxgU+ymNaYK85FvevEPleU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=c8+hQmuDBqba9roo9nMVxo1NRDvaMZRSuO5pgX33I1+QQBnB0eK/gulCpV0AOWeFH
 XapDFiJa8ErKUjurLspATxV3WBJ/udblaWkLaXdFjevkfIsRNOMQG5t2lv5FRUiLr5
 KsokaWPbIvct/yj6sYiGatpshUd4O50BdTXkT0APXFoaoBAec2uRiXqPlRZXLFkPsd
 HJ0gp4Fo1ZSipUKj6wonapEaZG8ajj3dDecq1H+QguZRt1ZLaKnqm4dM2vqS2JFOu1
 vRXtyhtO6Jt/ojZADq5vy31uE+ga3neJF9tRoOYSKLneMIxXerBzveJN/ZYCHAt89g
 lXOlnKbVHS2lA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 97714E8DD85; Tue, 26 Apr 2022 19:06:59 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <YmgNUgK/FeNcX0MG@ls3530>
References: <YmgNUgK/FeNcX0MG@ls3530>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <YmgNUgK/FeNcX0MG@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/for-5.18/fbdev-2
X-PR-Tracked-Commit-Id: 6fbe0cc53a1b5f7abe2c44399c18e943adbebe2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf424ef014ac30b0da27125dd1fbdf10b0d3a520
Message-Id: <165100001961.21339.1776716463797926143.pr-tracker-bot@kernel.org>
Date: Tue, 26 Apr 2022 19:06:59 +0000
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

The pull request you sent on Tue, 26 Apr 2022 17:18:42 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.18/fbdev-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf424ef014ac30b0da27125dd1fbdf10b0d3a520

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
