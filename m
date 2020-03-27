Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F655195BA9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 17:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D48E6EA60;
	Fri, 27 Mar 2020 16:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDC86EA60
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 16:55:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.6-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585328106;
 bh=5GmCGse5ThixCBJK4fRqQmxGOVFWWuHQS36UiFoeoVo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=uB0Jk3P1+bSNUw36JsbT47ruqLtLLSB3qiQ8lI8wGvIa0MpX2+4++vikOX3ru9vBt
 NRRMjKkPswYrynt+rpISVFymsCFBwWkPRKD8t41PAoi0WQ3ApH9CVgjPP8wz+PnXWO
 Yn9Csi/5tZF/JjDdq+HSOlW1sYgoP/g1yNNhNZBM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx=PisdA7qzEBz+n9Sqc4YfSpaSV-ja3tf7MjBnZ=_NXg@mail.gmail.com>
References: <CAPM=9tx=PisdA7qzEBz+n9Sqc4YfSpaSV-ja3tf7MjBnZ=_NXg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx=PisdA7qzEBz+n9Sqc4YfSpaSV-ja3tf7MjBnZ=_NXg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-03-27
X-PR-Tracked-Commit-Id: c4b979ebcafe978338cad1df4c77cdc8f84bd51c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7bf8df68cba0536479aead32297e47908922582c
Message-Id: <158532810616.31172.8807001450688549024.pr-tracker-bot@kernel.org>
Date: Fri, 27 Mar 2020 16:55:06 +0000
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

The pull request you sent on Fri, 27 Mar 2020 16:58:46 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7bf8df68cba0536479aead32297e47908922582c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
