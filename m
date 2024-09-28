Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65573989088
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 18:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861910E23A;
	Sat, 28 Sep 2024 16:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZRONPYY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF7A10E23A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 16:45:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 698615C5678;
 Sat, 28 Sep 2024 16:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B944C4CEC7;
 Sat, 28 Sep 2024 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727541912;
 bh=KeVe+PMFx3Hc/WeSruzNM5szsYAxL/6EfsQiRJE5kfA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZRONPYY2K3LZxq5N5MzxRudoGl2cmqfU9NM1G2DRpu4XXMHsiA8q7CVdy2l//3H8V
 SYAG1lyefSN6Y5RObZTMv08IMGpXray2bzAMWiKe/FhnYs8sGM42Awcpl8Bpf8FOKn
 5EbzDT1Q/971XPn/Gk6xMB62JVT1KUxEVIa/RUcSEfQjOAZUyb9yjTWWZSixibXs++
 kclzByGRw/QJikiUfY6kCRN8bj33edJvmaWqRnejHXmOCKYlLM6pwTt1dqHlq8KKnD
 tchQ03DIdrokFRgWY5lXtQRFXIVarludCA5XWbIXN0/W4Hd+0RaKrwW3SG0C50b8Rq
 Pob0p+44Qkwmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33EBC3809A80; Sat, 28 Sep 2024 16:45:16 +0000 (UTC)
Subject: Re: [GIT PULL] additional fbdev fixes for v6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZvfoRGNbTUOzLL9X@carbonx1>
References: <ZvfoRGNbTUOzLL9X@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZvfoRGNbTUOzLL9X@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.12-rc1-2
X-PR-Tracked-Commit-Id: 9cf14f5a2746c19455ce9cb44341b5527b5e19c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f95c139099f8dad235191caec9e9268ca717beb9
Message-Id: <172754191479.2302262.4145148096064377606.pr-tracker-bot@kernel.org>
Date: Sat, 28 Sep 2024 16:45:14 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

The pull request you sent on Sat, 28 Sep 2024 13:28:04 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.12-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f95c139099f8dad235191caec9e9268ca717beb9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
