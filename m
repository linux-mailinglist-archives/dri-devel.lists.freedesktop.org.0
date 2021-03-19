Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AAF3411D6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 02:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963BA6E284;
	Fri, 19 Mar 2021 01:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADCB6E284
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB0FF64DDF;
 Fri, 19 Mar 2021 01:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616115613;
 bh=Z075yEXMka7g5dfY5HI7KnN4qxoWDGCT20EY9gdIqMA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=TH0SGVQkTHdEPII7gf/dKNIUr69uIlUdgRtVNN70BCwFD1LX5vUUAue9BddsJel7A
 PiOC3qhdtVpvmTF7JBkrtmUPu/YUmH44H9rn+kpIpA5az03ZG/E7RgNxPgRHeJsM7G
 XELvh4X9M9Xp46rAn3frqomuH4/YvTQqvsXMg3hj5qevmlgonrBOY0fYz9pizLtbgu
 CsF8GX9uQb1C/pehYcdvDWMUl2ia+y/5YwkQZZoS8q3GXIQ+NwlHUAx9Tx65+K0UQN
 pUeNm24nJ5uwn3NVhQmCzaM5coTg0hOq3WY64lRG9HNdhIK/TaIpPe9G25cgt8RwPj
 eakVXbni2RCKw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E54BF60191;
 Fri, 19 Mar 2021 01:00:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.12-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzyh8Qeo4Sc_VHApCKRt8pBT4nW_20VYOv1TJkKmwm8ew@mail.gmail.com>
References: <CAPM=9tzyh8Qeo4Sc_VHApCKRt8pBT4nW_20VYOv1TJkKmwm8ew@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzyh8Qeo4Sc_VHApCKRt8pBT4nW_20VYOv1TJkKmwm8ew@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-03-19
X-PR-Tracked-Commit-Id: e94c55b8e0a0bbe9a026250cf31e2fa45957d776
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b12a62a4e3ed4ae99c715034f557eb391d6b196
Message-Id: <161611561292.26276.11664792522996784717.pr-tracker-bot@kernel.org>
Date: Fri, 19 Mar 2021 01:00:12 +0000
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

The pull request you sent on Fri, 19 Mar 2021 10:53:29 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-03-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b12a62a4e3ed4ae99c715034f557eb391d6b196

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
