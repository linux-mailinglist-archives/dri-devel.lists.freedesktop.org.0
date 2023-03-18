Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDAA6BFD6A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF0810E49F;
	Sat, 18 Mar 2023 23:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D330C10E49F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:09:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43DDBB80A3A;
 Sat, 18 Mar 2023 23:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C10C433EF;
 Sat, 18 Mar 2023 23:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679180973;
 bh=6gH1CXlaOz1aS2cGHYVDFVLZlj6M6INTH6JluFxWyWI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ld31iLZShGI47o/KyvxpDbCmU1ddT2EnBrrN8UKflzAFON5385QU4Tzh63CGsCcy6
 X1PR5UKYGtT3lbVPSyuwdMPdV92HxTDr+6xGcWtiDcj5DuPWK7T86oAMWuo2EavQH2
 wycNSFh8Kect8iaVTX5RhPMNZN81YMuAzHtTPmVgG1/q5WgfWaQXYYOpLjasPh0uLj
 gx0TYB18k9kpH1W2RcBH58VlwklYvUhl6sFzMeW/pTPAlS40Yt+bIZDe/67Ds6xEMp
 rQY7w8q/Xhm7OdTj+jEVVL6YAxLN9LaZlDIgTRW+d9Mtn0QdPrB0osfbXBzscWx6CK
 GN3aK07sMWzgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D7CCAC395F4; Sat, 18 Mar 2023 23:09:32 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes for v6.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZBYjSkFz/FEobQmk@ls3530>
References: <ZBYjSkFz/FEobQmk@ls3530>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ZBYjSkFz/FEobQmk@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.3-rc3
X-PR-Tracked-Commit-Id: 29413f05fe34e8824551b91f660fde781249417d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3671bd86a9770e34969522d29bb30a1b66fd88a
Message-Id: <167918097287.6305.4633226409323190897.pr-tracker-bot@kernel.org>
Date: Sat, 18 Mar 2023 23:09:32 +0000
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

The pull request you sent on Sat, 18 Mar 2023 21:47:06 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a3671bd86a9770e34969522d29bb30a1b66fd88a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
