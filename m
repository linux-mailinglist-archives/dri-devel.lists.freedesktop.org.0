Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D96A076
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 04:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056006E041;
	Tue, 16 Jul 2019 02:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170386E041
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:10:14 +0000 (UTC)
Subject: Re: [git pull] drm pull for 5.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txxWeKW1VLWNzLEykELmSCqo_kOHBDdJH-cJfAJXZnnuw@mail.gmail.com>
References: <CAPM=9txxWeKW1VLWNzLEykELmSCqo_kOHBDdJH-cJfAJXZnnuw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txxWeKW1VLWNzLEykELmSCqo_kOHBDdJH-cJfAJXZnnuw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 drm-next-5.3-backmerge-conflicts
X-PR-Tracked-Commit-Id: 3729fe2bc2a01f4cc1aa88be8f64af06084c87d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be8454afc50f43016ca8b6130d9673bdd0bd56ec
Message-Id: <156324301374.8427.15937802000299539468.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jul 2019 02:10:13 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563243013;
 bh=J9n5L+Q9IHtkAgIPApZEMaLKERyM/6PXykpKL5+3IR4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=l/P9CG4A4RkaLs1tzSJFDI8ecyOMsaiS511OOZYoMhv2Ut7aimVhTl5QoR1opxR4G
 1Jeo61atge01iugYaRUXtTlQGWbS+/KbNbp/KdOacvcyulXHGgFeXgBz4qc4IH1lkg
 HS7E6/QJnARPqgyVDZbXycsjYQ5dv83yfsA8D35w=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUdWUsIDE2IEp1bCAyMDE5IDA0OjM3OjM4ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIGRybS1uZXh0LTUu
My1iYWNrbWVyZ2UtY29uZmxpY3RzCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51
eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9iZTg0NTRhZmM1MGY0MzAx
NmNhOGI2MTMwZDk2NzNiZGQwYmQ1NmVjCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwg
SSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
