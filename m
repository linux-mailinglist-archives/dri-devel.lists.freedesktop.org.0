Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F73223DF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 02:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0BF6E58E;
	Tue, 23 Feb 2021 01:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9916E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 01:53:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F1146148E;
 Tue, 23 Feb 2021 01:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614045192;
 bh=pRmEpLjajmmHuaju5BIP93Di3WDshUvnOMolUZnC7/A=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hv2DxIyPPLEg0P+U3j5vzxdG+4cLdgo/+35RZqASuCGDbajoD5ttb7TiK89lYioiv
 ty8qP1t9458iD1h6TO7Gs/+4m7oKgpnGwv90KX2nAQTuvZ0pDVYd0IIZM76B8C6Rya
 qyeTjzsdNYBNu1BlsaFup8I7tJvU8FphlC2deOlZorlvc6kJ2jkGCdNkouM1iSFHLV
 N6tgTZqTvpNMv3sISOl7X3SjvyEKc+MXvvcJv/JZiVACsXdYqhBVIdSJ7eEweTbH4f
 ANJdOU2605oxES+ykOAu4XzFRwfPBKmpefx9eS8Rei1BoA1sV8KLkCO7f4uRVY/SrU
 6Qd3pMgnoD6Ag==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1A1DE609D1;
 Tue, 23 Feb 2021 01:53:12 +0000 (UTC)
Subject: Re: [PULL] topic/kcmp-kconfig
From: pr-tracker-bot@kernel.org
In-Reply-To: <YDNrq+mpwta0f0vt@phenom.ffwll.local>
References: <YDNrq+mpwta0f0vt@phenom.ffwll.local>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <YDNrq+mpwta0f0vt@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/topic/kcmp-kconfig-2021-02-22
X-PR-Tracked-Commit-Id: bfe3911a91047557eb0e620f95a370aee6a248c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b5f9254e4f4375ac845cb17f1732037dd8adeeb
Message-Id: <161404519204.2827.13463630697238081806.pr-tracker-bot@kernel.org>
Date: Tue, 23 Feb 2021 01:53:12 +0000
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
Cc: Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Mon, 22 Feb 2021 10:37:27 +0100:

> git://anongit.freedesktop.org/drm/drm tags/topic/kcmp-kconfig-2021-02-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b5f9254e4f4375ac845cb17f1732037dd8adeeb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
