Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF56DA032
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 20:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAB310EC81;
	Thu,  6 Apr 2023 18:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5712610ECB7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 18:46:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2296564B21;
 Thu,  6 Apr 2023 18:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87E11C433A8;
 Thu,  6 Apr 2023 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680806773;
 bh=NOHkbcmChU0EoECgkxk50BPdN3RseIXsqov+K9V64NM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=oSMzD/kjnvnc/hIhAce85nkdWF7kUPUpfqeu/52giUWMuDBfKu2atPCmGVxI9BIRB
 QIyPYqrtxvh/KtnvihECMmVkewg+WtY6WJN2OB1U460BxSHV1pFuHF0cuZTyUBMIds
 dHtu6RTYaaGHFLC//OScLsPjq482je4Zj1W9qlksKIemMb60U1Ji8tg7MYcJVLjPWy
 KB4Qggo7nBjxvixj+NvHmP1XOPft5mvcBAo19T7u8brsbOi2ZBXRgQSKU1HWt5wUQ9
 UxauagE5U4fvfzSP7I/19FuAaS6MVoHJC64KaYw0QtHR3zZRGBMMhZLxlyLX7kKOhI
 T/M1c9ENqhZVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 760F8C4167B; Thu,  6 Apr 2023 18:46:13 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for -rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZC76YY3s8vi/3hgl@phenom.ffwll.local>
References: <ZC76YY3s8vi/3hgl@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZC76YY3s8vi/3hgl@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-04-06
X-PR-Tracked-Commit-Id: 3dfa8926efa910d423844bfc0132f70cd07f76e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac6c043391b266a360a53f933638003365bd10c9
Message-Id: <168080677347.24406.17212363319212610713.pr-tracker-bot@kernel.org>
Date: Thu, 06 Apr 2023 18:46:13 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Thu, 6 Apr 2023 18:59:13 +0200:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-04-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac6c043391b266a360a53f933638003365bd10c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
