Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F82B396A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 22:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316386E9E5;
	Sun, 15 Nov 2020 21:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2376E9E5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:14:11 +0000 (UTC)
Subject: Re: [git pull] drm nouveau urgent fixes for 5.10-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605474851;
 bh=jUTZyS4AZsV6JujZiwD1FdfFlpGqhQw/bCn0u0jwn40=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=K6XJoKIjMJC4W/goDyVxDecBpksqQVdlavZ3NQ1y3qeGFr5cMXzRHRndZUHxqknpy
 Tw6XHBGfkXPVL/yW/hFjUhYP1WlrPliq5yQhESVWvuvOC3j8XHVdJFArrtskz6kqsk
 jdEFE6oqKw9EzOlWc/RRoX/UT2kToDmFkE2p5dxM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty9cBzR5tr8g2B7LE9+Hcf4NViHcyDcEHJMVgYmSoub1A@mail.gmail.com>
References: <CAPM=9ty9cBzR5tr8g2B7LE9+Hcf4NViHcyDcEHJMVgYmSoub1A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9ty9cBzR5tr8g2B7LE9+Hcf4NViHcyDcEHJMVgYmSoub1A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-11-16
X-PR-Tracked-Commit-Id: 8f598d15ee6577a56d6617d9e4151591db34d8fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a6af8718b98e1cd37a9ea9a02269c79577fc9138
Message-Id: <160547485149.22165.6645793392727628504.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2020 21:14:11 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <skeggsb@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Mon, 16 Nov 2020 06:41:34 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-11-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a6af8718b98e1cd37a9ea9a02269c79577fc9138

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
