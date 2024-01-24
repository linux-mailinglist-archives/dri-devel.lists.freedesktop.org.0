Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0F83B285
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 20:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DF510E89F;
	Wed, 24 Jan 2024 19:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701B510E89F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 19:50:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2148262005;
 Wed, 24 Jan 2024 19:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E52BEC43399;
 Wed, 24 Jan 2024 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706125783;
 bh=VBDeXV//B1Ygl8IacY4kMW66YLU6vLMeG9D2ddbaCXg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=o4O7gtfezGf/bN44nuF1YJphJTRqA5fVlq7DTfbCJ2MXehbEutu2EooHu+qbn8oh1
 xxlj6oWo9H5jHuMa9667+23LYue2EePSEobhhfdEGPt4gWb4LhRfboJWqzSvxrvUg6
 TFbDc6aF36OZbgut4ny593gpdnoeeKN2DYT7UFQnf637W0cTG1G7dhpwl7CGQR7DIZ
 P7Ym6sG9PxlDwfK/wuGnXKTF25NCOIzB8jahWBApgpLbYqUyLQYvoJYfjcg2jW378Q
 5Cc5uR2z3EwLOKNtJZcue3tbBwycGa6Tmj+KKvUckRfGbFlSagyAD6Bgxw4psUUDN/
 6pQTcn+4ZdD8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CDC3EDFF767; Wed, 24 Jan 2024 19:49:43 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fix for v6.8-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZbE2t9LoFlro7J-H@carbonx1>
References: <ZbE2t9LoFlro7J-H@carbonx1>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ZbE2t9LoFlro7J-H@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.8-rc2
X-PR-Tracked-Commit-Id: 4b088005c897a62fe98f70ab69687706cb2fad3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1110ebe058268b5425c69a23a99456f2331063bf
Message-Id: <170612578383.9426.13921726820598469749.pr-tracker-bot@kernel.org>
Date: Wed, 24 Jan 2024 19:49:43 +0000
To: Helge Deller <deller@kernel.org>
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

The pull request you sent on Wed, 24 Jan 2024 17:11:35 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.8-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1110ebe058268b5425c69a23a99456f2331063bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
