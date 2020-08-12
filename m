Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1964C242FC2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 21:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A0C6E182;
	Wed, 12 Aug 2020 19:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F3F6E182
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 19:58:31 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.9-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597262310;
 bh=iEXmtOuLXVlpUs4nJl5bKlU1K/kVL0eMtVAJhVfJfUs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=z1jgqAqoq0r8FfWBCn1U/iduGeMhjVbr3RrG4PwBJ9AAsCxY296QHB99uhj4kI5TW
 BpRJv/z19D3ei/gPwVpDMlZm2tLrO1XFPs778wsZMNFZ5lPLIaNlvlasM6V3237KdE
 G1eyJEgcfhu/5lyOCUFosxEdZin//Vi8Rr+z7l2A=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyXhxOGiH9yRsQf5bQ22bib1m_wmJBaVDFxFkEh4Y+dtQ@mail.gmail.com>
References: <CAPM=9tyXhxOGiH9yRsQf5bQ22bib1m_wmJBaVDFxFkEh4Y+dtQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyXhxOGiH9yRsQf5bQ22bib1m_wmJBaVDFxFkEh4Y+dtQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-08-12
X-PR-Tracked-Commit-Id: 62975d27d647a40c58d3b96c29b911fc4f33c310
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea6ec774372740b024a6c27caac0d0af8960ea15
Message-Id: <159726231090.30367.18007245410426476262.pr-tracker-bot@kernel.org>
Date: Wed, 12 Aug 2020 19:58:30 +0000
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

The pull request you sent on Wed, 12 Aug 2020 14:53:17 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-08-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea6ec774372740b024a6c27caac0d0af8960ea15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
