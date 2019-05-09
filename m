Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C71849F
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 06:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB340899DE;
	Thu,  9 May 2019 04:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC5E899DE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 04:45:13 +0000 (UTC)
Subject: Re: [git pull] drm for 5.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyFp5LZ6QO1TaDK5jSb5+2SCe3Rjmk0_juVfr-zfspBLg@mail.gmail.com>
References: <CAPM=9tyFp5LZ6QO1TaDK5jSb5+2SCe3Rjmk0_juVfr-zfspBLg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyFp5LZ6QO1TaDK5jSb5+2SCe3Rjmk0_juVfr-zfspBLg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2019-05-09
X-PR-Tracked-Commit-Id: eb85d03e01c3e9f3b0ba7282b2e3515a635decb2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2d635decbfa9c1e4ae15cb05b68b2559f7f827c
Message-Id: <155737711300.32092.9819424468781227220.pr-tracker-bot@kernel.org>
Date: Thu, 09 May 2019 04:45:13 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557377113;
 bh=qFNfncg8u5sBR6k52K3TKWvyrUti3njqXLIsrDVj0rg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=FXSh1GORX1GiRAl5f13QsGioVBY57KHHAycHjOPZ2m3vSPGmwzXqZTisn/PfZyuq3
 RWK+bIaeBbx5FBuWFO8mC8Jq6AeXEcPe0nxqigRTitp+E0Ziw/EeXQNk6dZ+0Ag+d9
 ss+9VuTVKHBpHqnMDDo8Wzft9JJScrwY3HYhhCjM=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUaHUsIDkgTWF5IDIwMTkgMTM6Mjg6MDcgKzEw
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tbmV4
dC0yMDE5LTA1LTA5CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6Cmh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9hMmQ2MzVkZWNiZmE5YzFlNGFlMTVjYjA1
YjY4YjI1NTlmN2Y4MjdjCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJv
dC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
