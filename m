Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC6288FA0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 19:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827FB6ED06;
	Fri,  9 Oct 2020 17:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FFA6ED06
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 17:11:48 +0000 (UTC)
Subject: Re: [git pull] drm amdgpu fixes for 5.9 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602263507;
 bh=F/i6jcEMVheHhV2g/MiFOZs19NUbp70BJescDmB98nc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=L0TTzB4efUgTS92IKG5CimM+r40l6rwZ9qWzehreYOqafIgPHym+jJtM3CuAtnJVF
 frcigvidiTkS8tct3X4pptaDDNVzImNVby+BNgrqq6U1PwxpeKUptr3jIM2bg13vS2
 tdWrd87nuaIaiTmtqUOpL4o4cyeiwVSW8gd+r5zk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tywYP9zfkWJ6ad-+Eg51WgD0efM+CUc_wCmE-jmHEGTYA@mail.gmail.com>
References: <CAPM=9tywYP9zfkWJ6ad-+Eg51WgD0efM+CUc_wCmE-jmHEGTYA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tywYP9zfkWJ6ad-+Eg51WgD0efM+CUc_wCmE-jmHEGTYA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-10-09
X-PR-Tracked-Commit-Id: dded93ffbb8c4a578adf13b54cd62519908a23f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd330b1bc2f5840d68cbfa61c60573b4250bf14f
Message-Id: <160226350788.18917.18285141729643002456.pr-tracker-bot@kernel.org>
Date: Fri, 09 Oct 2020 17:11:47 +0000
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

The pull request you sent on Fri, 9 Oct 2020 14:29:16 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-10-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd330b1bc2f5840d68cbfa61c60573b4250bf14f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
