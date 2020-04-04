Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B819E747
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 21:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A7D6E14B;
	Sat,  4 Apr 2020 19:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC826E14B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 19:20:21 +0000 (UTC)
Subject: Re: [git pull] drm ttm hugepages feature pull for 5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586028021;
 bh=rV8KssR0St+GoknFBtwtJMOFpMVA49djJuAhS71d65s=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=pg0sTwVaDKrqZGpDFgIxIn0wi3bozAjnJvIUPxZyUdFHReRdNgELx4wsVie4U3I3r
 +lXKx6GqbYSXlLTM4PXOdL7DHpu+qKrJOmkZ4JkchvVh6/d4lyuR0++02sZTQ8WG/M
 VPrOmXN9P4amQzhzsx92jzefB+8/rNOdAQo8k3No=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz_FMuxj+RH3VqzVyN2yQC9xy8vePAz14HPKtVfEXs2iA@mail.gmail.com>
References: <CAPM=9tz_FMuxj+RH3VqzVyN2yQC9xy8vePAz14HPKtVfEXs2iA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz_FMuxj+RH3VqzVyN2yQC9xy8vePAz14HPKtVfEXs2iA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-04-03-1
X-PR-Tracked-Commit-Id: 0e7e6198af28c1573267aba1be33dd0b7fb35691
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea9448b254e253e4d95afaab071b341d86c11795
Message-Id: <158602802105.32303.6851263343004440989.pr-tracker-bot@kernel.org>
Date: Sat, 04 Apr 2020 19:20:21 +0000
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
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 3 Apr 2020 09:35:43 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-04-03-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea9448b254e253e4d95afaab071b341d86c11795

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
