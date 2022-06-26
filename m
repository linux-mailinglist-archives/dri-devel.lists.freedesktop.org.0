Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B855B324
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 19:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1B010E633;
	Sun, 26 Jun 2022 17:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECB610E633
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 17:36:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41D3D60EFA;
 Sun, 26 Jun 2022 17:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EF34C34114;
 Sun, 26 Jun 2022 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656264971;
 bh=yx99ackj0pQLC4Nym5Oo0tq83cwIvG6gKcgapTCUPHk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=PrzgrZPBJ4SUO1tDqH7drU+XOdY4LTXncul7XXCicBPLP/rjWOLb1azVRGVVS8TZH
 ucw4qXwD8UZTG1bUqphb8O+rZEFQc1JePsm5ynYw9UqenEaHnUrtG+dRoCRrxioIop
 TRJoO1zyEo9HRPsI9ZliV+EgDujSr/CiskVg0MOv6/a+vzYJnCGIY3166lSQeWYtkK
 7SSKDCFyOLwrnLAu7AKiujvtwCS4s2otT59gwc1cKYlc37pcrArDWFkrVv1ur7cs76
 B5KHXSluthZQK9UGTYl4RemLy+7IdPfjU9zmG8rExbrrjCpxgYjO8WN1sadMXb//Kj
 H2YRxmq7GQxKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 89D0EFD99FF; Sun, 26 Jun 2022 17:36:11 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <Yrh0xOWBC1+kohed@ls3530>
References: <Yrh0xOWBC1+kohed@ls3530>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yrh0xOWBC1+kohed@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/for-5.19/fbdev-2
X-PR-Tracked-Commit-Id: cb5177336ecb07fe1c6804306fe8efc827643c64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be129fab66f284c239251ec5b6e30c6e903d8881
Message-Id: <165626497155.22456.4165121966565453510.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jun 2022 17:36:11 +0000
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

The pull request you sent on Sun, 26 Jun 2022 17:01:24 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.19/fbdev-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be129fab66f284c239251ec5b6e30c6e903d8881

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
