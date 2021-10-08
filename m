Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B75426F74
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13A6E0F4;
	Fri,  8 Oct 2021 17:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442856E0F4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 17:20:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C505360F6B;
 Fri,  8 Oct 2021 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633713625;
 bh=jopKWbw7A8/2UPsH+ng1ZLMcJpnvl4Z/WQzHrR8gk6Y=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=eVz4PyUZPk4kQtHrPQR09pmj1wDkS98ivlVsfIQPJGB5YV/ZLfoP0w3Hztg9b+y2o
 e87+7mD+mfXYjwnHAUAuXHi31TJuOfNd6iWJaQbHoUt1bmfrE13PhVOVmHT3nGqMiF
 Nr1Ujq1h7hbbFPsetuUVRR5ypzvSBzp7nhXfrYxGA1zfN+19WwxaNrYAuo6jQcXRaG
 8a1e3vFPynWr7NnpqWm1/R+Qrl2KSrHBPwNLDRglzfOdH8B098wI7oGtr2js5l2f0u
 ibOfXIS7gcwIWPbXTUFSOanDY+I4mWgTTWIX7jG7zt0g1XcFMKxyX9emThdW4WtiBi
 sM2v92iSivPdQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B17E860985;
 Fri,  8 Oct 2021 17:20:25 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txCVSSAQF8f_wR41sEBh_NjT-VSkbod6Pxcwb4dHu=WBw@mail.gmail.com>
References: <CAPM=9txCVSSAQF8f_wR41sEBh_NjT-VSkbod6Pxcwb4dHu=WBw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txCVSSAQF8f_wR41sEBh_NjT-VSkbod6Pxcwb4dHu=WBw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-10-08
X-PR-Tracked-Commit-Id: bf79045e0ef5f0fb2a0619f9d0782665d07b2d66
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0068dc8c96688b72cc99470530b384429129950c
Message-Id: <163371362566.20952.16722002714497226730.pr-tracker-bot@kernel.org>
Date: Fri, 08 Oct 2021 17:20:25 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 8 Oct 2021 13:42:41 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0068dc8c96688b72cc99470530b384429129950c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
