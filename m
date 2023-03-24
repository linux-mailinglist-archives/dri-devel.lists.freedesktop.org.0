Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65756C892A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 00:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD98110E1B9;
	Fri, 24 Mar 2023 23:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C83110E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 23:17:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9040862CFE;
 Fri, 24 Mar 2023 23:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 058EFC433EF;
 Fri, 24 Mar 2023 23:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679699878;
 bh=YmXZvTX3a9RksjyogmVk3UHGVjX2yueTOTwg7xVEE44=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=f6EZp5XWTJrZfWMVb3zgPAgl/HUI+BUUwa6ekensjT8BGDXe+tfDwrur1Y4xWS3QK
 reD+qYaBoM5JDZJirY9Gw5/uuowkVWgEDDUat+pSBZjBm2djHMs0GT2PhbmG41Tjvv
 SknDq5KubB/9Pui/CIkPcFbn8Cv6+QuZGscOVPm0/BetWDFMo/oSjXpwCzPtXqRTH7
 4IzCPnqD5wBXGvnGO/1F2bHny4xAoqpWvjgYf2NOQSB5JnQElP6U88lT/1mq87gjYm
 4Lrd92UYvndXannMXYsw0X4kJIpOTLhFV/l8E+WgXZD5agD9KrEfQuSynAzrguCnMQ
 gE36jZIRA2KZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E808DC41612; Fri, 24 Mar 2023 23:17:57 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for 6.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZB4QlRqxz93s/Pgp@phenom.ffwll.local>
References: <ZB4QlRqxz93s/Pgp@phenom.ffwll.local>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ZB4QlRqxz93s/Pgp@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-03-24
X-PR-Tracked-Commit-Id: 08570b7c8db6d9185deccf5bcda773bd6f17172f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 37154c19dd79966009befdcf2b499099e3cbbe9c
Message-Id: <167969987794.13977.13493727092643599930.pr-tracker-bot@kernel.org>
Date: Fri, 24 Mar 2023 23:17:57 +0000
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

The pull request you sent on Fri, 24 Mar 2023 22:05:25 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-03-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/37154c19dd79966009befdcf2b499099e3cbbe9c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
