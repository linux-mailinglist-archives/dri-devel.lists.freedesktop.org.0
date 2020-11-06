Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97EC2A9EE5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F896E0DB;
	Fri,  6 Nov 2020 21:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4711F6E0DB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:13:25 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.10-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604697204;
 bh=3JW8BUUMj0/pK5x52Z3RcLQoRDCmKGOLLujoJui7hog=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=hWrCbnPqMnupU62cIXRUAmgbWRP0nD8IOA3Nr/8GxEsSIauNbV7nQR8fbxHULIG0H
 VU3bElkbovnwKNrGbhW/TVZhZXBj+J6gyhoa3CNl3gSmkZgjG1oEhbNT5bRIXuOy5Y
 3QO+1eShJnGGgp/sJcWqbNrhdJrPm0YD0Zl9f/hc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twEfV=TerAqTaQAo+3wUUewUxeij48bCph9XC1tdX3Pew@mail.gmail.com>
References: <CAPM=9twEfV=TerAqTaQAo+3wUUewUxeij48bCph9XC1tdX3Pew@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twEfV=TerAqTaQAo+3wUUewUxeij48bCph9XC1tdX3Pew@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-11-06-1
X-PR-Tracked-Commit-Id: 356583b956e620a7ef8086f14bfe971986a320b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc7b66ef076644dd646eb9f11563684edc479649
Message-Id: <160469720466.14190.5466261149845499580.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2020 21:13:24 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 6 Nov 2020 14:21:13 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-06-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc7b66ef076644dd646eb9f11563684edc479649

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
