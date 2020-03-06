Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C744417BD95
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 14:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD43D6ED16;
	Fri,  6 Mar 2020 13:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2C6ED0C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 13:05:04 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.6-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583499904;
 bh=84v6BZy0RWfqoW2l869ZZcrMZHtChI8eyri9daZ1tMU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=lM/615oopMhfDwhOkWQ3Y4JNTZJjbemHbPF7jbW0udOwIP/BpFze+Ea2Jn28eHYy3
 mUyad1TLW+eZOeqFvRaFEov1zG6lsFIv9QND7f0YjMRX8MfpPa/PlDTYSla3tTGnbd
 rpGDbF2u2Y6NCON1Jm/U3m7XeYk1zWLy+l0gZrQI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzi8ZaowmegAgeHSO3cLB5VRid9h=TMX=v+YcHEb5Cx_A@mail.gmail.com>
References: <CAPM=9tzi8ZaowmegAgeHSO3cLB5VRid9h=TMX=v+YcHEb5Cx_A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzi8ZaowmegAgeHSO3cLB5VRid9h=TMX=v+YcHEb5Cx_A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-03-06
X-PR-Tracked-Commit-Id: 2ac4853e295bba53209917e14af701c45c99ce04
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba0ae9ac46078c53adbb4485adbb3df779228287
Message-Id: <158349990430.8760.10214214684051769960.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2020 13:05:04 +0000
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

The pull request you sent on Fri, 6 Mar 2020 12:35:37 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba0ae9ac46078c53adbb4485adbb3df779228287

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
