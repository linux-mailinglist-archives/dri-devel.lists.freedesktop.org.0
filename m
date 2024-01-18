Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A910D831054
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 01:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070210E0DB;
	Thu, 18 Jan 2024 00:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135A410E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 00:05:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1C12EB81600;
 Thu, 18 Jan 2024 00:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71B40C43390;
 Thu, 18 Jan 2024 00:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705536309;
 bh=nS6mr+7hJrrmsamX7BzZtPzjONB/yIBaa2JaZcL7Zmw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=c676TbJZIIy5aau4jc+Oq4qLHAinns+DWnoPCuH4UvXDVIMoknCD74S2BHKvEECV1
 4ihHGOIokXxiErY7nEe2v+Wf+h+o+1MKk6vD9ZFH1LYAr9PubilC2kUrzL+M9Iw90y
 JrW+UbmOOiLvGGvHMOk3eZEAVDeLCzke7+JBdqYeytyBIUtCgdzPwOqhri+0++9uvy
 sxvmPwk+fawb97e7K1eyTqVjmTSkxWmGYAAaIolRy2PNAJyKnyVhw23YD0ISK+fyRL
 EWvenijB8MtE7KqPRrv2cBe9jVTbxPyeCU8NQHAuwaTwiSmkYzLpAerIJc90lqATvC
 SExVIdCpihuGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5E961D8C97F; Thu, 18 Jan 2024 00:05:09 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx+5WuM8CjN5ACN1e4Wrr+qNhMSWQe1_g-QDiPbEpPbbg@mail.gmail.com>
References: <CAPM=9tx+5WuM8CjN5ACN1e4Wrr+qNhMSWQe1_g-QDiPbEpPbbg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx+5WuM8CjN5ACN1e4Wrr+qNhMSWQe1_g-QDiPbEpPbbg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2024-01-15-1
X-PR-Tracked-Commit-Id: 205e18c13545ab43cc4fe4930732b4feef551198
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8893a6bfff312ea6fee89bfaa8761f0b9456199b
Message-Id: <170553630938.10877.4890122680633334583.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jan 2024 00:05:09 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Mon, 15 Jan 2024 16:18:01 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2024-01-15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8893a6bfff312ea6fee89bfaa8761f0b9456199b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
