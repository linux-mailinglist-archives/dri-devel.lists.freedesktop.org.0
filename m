Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82F1B7DF8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 20:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3F66E09C;
	Fri, 24 Apr 2020 18:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20AA6E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 18:40:19 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.7-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587753619;
 bh=LTVMrqntJetdGTIRO58rT+vA5NdI+WDIRPTXVcp1uoE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=FK0J9dooN0ZzQKlvTG/vLPCQSh70tTywweUgHHbNPpLrTUNxZ167kNXtJdia8lm81
 VT+kjXbrlRUv+lCEAb5ZtpZiIKt3NWSm60I/fxmX/9MAWWC8xjfDEBmgtfdz/NqAn7
 YxtPS1bpHUYzi+l81xdHH0pxOqEw5O25/DPDmOEQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txZkNiAoVMyoBwDaew+WDBQu3rcTYOTs9+Vn1unoq9m1A@mail.gmail.com>
References: <CAPM=9txZkNiAoVMyoBwDaew+WDBQu3rcTYOTs9+Vn1unoq9m1A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txZkNiAoVMyoBwDaew+WDBQu3rcTYOTs9+Vn1unoq9m1A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2020-04-24
X-PR-Tracked-Commit-Id: e32b2484b3e00170b6cf57d99a18972e174e10ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88412a4e00f6baab2752e99ffdbdb0ee661cac30
Message-Id: <158775361897.26557.6691641549281826414.pr-tracker-bot@kernel.org>
Date: Fri, 24 Apr 2020 18:40:18 +0000
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

The pull request you sent on Fri, 24 Apr 2020 13:22:30 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-04-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88412a4e00f6baab2752e99ffdbdb0ee661cac30

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
