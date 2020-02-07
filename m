Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E21560DC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 22:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFAE6E11C;
	Fri,  7 Feb 2020 21:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A590E6E11C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 21:55:18 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581112518;
 bh=eOg7uCNUfLa/+rx8dVAnlqV5Q9xH+G5SaYr0Z0vRbfY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ZmKoPJzqR97Ld84+oP3V0vF7CuJbs8UeLbMf02Fl3kwBqsZTtnycw7OmpXk7fSdLj
 1HHfdDu0drAEEKzDxs2ppxH3Yj4Tzb51aP3X4pOsZrn3W9qSZwJDsPTKmZNjRmKjKr
 fJszRvn5qP6ji4VYHKc2IuMCrL7Jw+KATeDJhaUg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzWZoQ_t-v2p=m4LKFE+Mb9oofL406dLvaXOiappqcNhA@mail.gmail.com>
References: <CAPM=9tzWZoQ_t-v2p=m4LKFE+Mb9oofL406dLvaXOiappqcNhA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzWZoQ_t-v2p=m4LKFE+Mb9oofL406dLvaXOiappqcNhA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-02-07
X-PR-Tracked-Commit-Id: 9f880327160feb695de03caa29604883b0d00087
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c16b99d6c5a3f103ae45e33084055a2440d70544
Message-Id: <158111251847.9631.6641473871149555872.pr-tracker-bot@kernel.org>
Date: Fri, 07 Feb 2020 21:55:18 +0000
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

The pull request you sent on Fri, 7 Feb 2020 13:29:48 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-02-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c16b99d6c5a3f103ae45e33084055a2440d70544

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
