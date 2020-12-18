Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF472DEA8C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 21:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AF18921A;
	Fri, 18 Dec 2020 20:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A30891C7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 20:54:43 +0000 (UTC)
Subject: Re: [PULL] drm-next, part 2 + fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608324883;
 bh=rFgjNHcOzIJuLv9eomZVjZNNrmvZ0Y/cDPu3XzoiFD0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=mZB/tZmFESEE1ap18MJlACsqeGAcGnJeL9Utwwbs+6RJCI/qpk/auYIWIk6qbJ+15
 0kN5MIMNZPOB/vRH0Yv9C6vG+QdLbV3RNzWz/b1Xaob1we2frMgN+7ijhk1n/cqi4R
 mltx74+q0Tpw558jB/yhO3IdP9qBN8CFePYaDlKySTHuJ/PFYJCTKhA1zgY58yUlKS
 L0TbFN+87Zc7LZ3zSxmK1JAp1pxAavSbjL1lPi8ZHnURyU4Qc6qHspII+AGzhaGiBC
 m5b35bYW8/a3AZuegS+I9FwW9FvrDz+6pBNyAvbS029oQcp0n1Eh0Rkva1epmKLjNb
 VZp8TyVgZt2vw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <X9zdOXnqo6hzR5wu@phenom.ffwll.local>
References: <X9zdOXnqo6hzR5wu@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <X9zdOXnqo6hzR5wu@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2020-12-18
X-PR-Tracked-Commit-Id: 4efd7faba5e0687ae9143b7e6a19547ede20a7dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c59c7588fc922e27c378a7e2a920b889bd6bf872
Message-Id: <160832488371.19372.4100865497261367725.pr-tracker-bot@kernel.org>
Date: Fri, 18 Dec 2020 20:54:43 +0000
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 18 Dec 2020 17:47:53 +0100:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-12-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c59c7588fc922e27c378a7e2a920b889bd6bf872

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
