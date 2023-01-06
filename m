Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510D660A85
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 00:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5D910E2D3;
	Fri,  6 Jan 2023 23:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D4E10E2D3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 23:59:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BABFDCE1E8D;
 Fri,  6 Jan 2023 23:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 021DFC433F0;
 Fri,  6 Jan 2023 23:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673049535;
 bh=lMKFu5xWuSdRIIkmnpI9oHW1WdMDHiHMOnC+rzvj168=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=axmJJlag9IGKwD8ZShDwWKbl8y/HoKYuWoaz5UDqd+6o12m+JfTJJg5j3GTrM8mZo
 0QJmewHxraDRZ6S4RU8C/jMWbXB3IgGFJeU8I0jAGcVCYwuQYfTRa+25xX3ZShyR0R
 oMYJb2NVablQstCdT3T9EHvrGB4WNPm0yjW1mJPwcVpVRzanLAR2JyAcE6v7tWIVrO
 6sNF9td2xPsBVLrgSb4hNaxHPUkbAacKk/uEKD3NPsXTA/G7ulyVeL3dmjBaflz9Qs
 axFAGkeWp+r480FdmzYnLx0PNeWUnpZ4UMh0oZ65Lk6QWrJ4yziTO09tyqCX0P/qAM
 nS1f9yR20XuHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E37A8E57254; Fri,  6 Jan 2023 23:58:54 +0000 (UTC)
Subject: Re: [PULL] drm-fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y7ipHUfN00F3abQf@phenom.ffwll.local>
References: <Y7ipHUfN00F3abQf@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y7ipHUfN00F3abQf@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-01-06
X-PR-Tracked-Commit-Id: 5193326c4c5a656c733b6d2c6537e3f36319bcac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a71553536d270e988580a3daa9fc87535908221
Message-Id: <167304953492.14412.12257948405064175208.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jan 2023 23:58:54 +0000
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

The pull request you sent on Sat, 7 Jan 2023 00:05:01 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a71553536d270e988580a3daa9fc87535908221

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
