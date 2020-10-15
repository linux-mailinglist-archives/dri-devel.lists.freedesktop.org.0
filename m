Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B183C28F7E5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 19:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBF26ED9B;
	Thu, 15 Oct 2020 17:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3D96ED9C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 17:56:14 +0000 (UTC)
Subject: Re: [git pull] drm next pull for 5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602784574;
 bh=zpYP0y+N0AmWkcDFA4cNMNIMCTnvhZfotWi7K9kXgYM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=uVMRmc4kTCYIZtNUbdPq33bcU0no/fB8I1JWfS1PIcLbBnq/iKkVajHTtpjdsIrha
 fEalTXPGbHYluzDaSoztoDmaCc4oTTqS/TSrNa+uoJvS/GN9OkpFTKl5ObP3Nb+546
 GJh5ntZDBjXHPby5BmmCj59xxr853c240mKlU/N4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-10-15
X-PR-Tracked-Commit-Id: 640eee067d9aae0bb98d8706001976ff1affaf00
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 93b694d096cc10994c817730d4d50288f9ae3d66
Message-Id: <160278457423.2336.16076988857270497801.pr-tracker-bot@kernel.org>
Date: Thu, 15 Oct 2020 17:56:14 +0000
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

The pull request you sent on Thu, 15 Oct 2020 11:33:08 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-10-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/93b694d096cc10994c817730d4d50288f9ae3d66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
