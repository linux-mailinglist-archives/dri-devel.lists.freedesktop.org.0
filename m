Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CC59BF54
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 20:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0A26E0DF;
	Sat, 24 Aug 2019 18:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD976E0DF
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 18:45:07 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.3-rc6 (the second coming)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twtUmogvabQJD8CcazYfhWUjTUOyRkFomor77LbVDrcKA@mail.gmail.com>
References: <CAPM=9twtUmogvabQJD8CcazYfhWUjTUOyRkFomor77LbVDrcKA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twtUmogvabQJD8CcazYfhWUjTUOyRkFomor77LbVDrcKA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-08-24
X-PR-Tracked-Commit-Id: 7837951a12fdaf88d2c51ff0757980c00072790c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bc67b17eb91ea6a2b6d943bb64cde8d1438a11ec
Message-Id: <156667230692.2337.8881030544847448159.pr-tracker-bot@kernel.org>
Date: Sat, 24 Aug 2019 18:45:06 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566672306;
 bh=+evUtgdH4F4JEXkTzceA7IrJERvRboAHZ2gQOBz6SxA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=QmtYDh52br9As2IMqSKlYWncaECObKBWwTksYvjzKXDy8FAR7MHJcXpOUQnVfLiUx
 41Qk9b5OFj2iMHXgmzXsT+AkbI+NuRSnoWNn47GlgqCNLC+HpLotkWy0/Omt3F8CaH
 Qb7XCE5xSJeYw+IXu02m8psFywPM0ch2WXLtqxP4=
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsIDI0IEF1ZyAyMDE5IDE1OjIyOjU1ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMDgtMjQKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jL2JjNjdiMTdlYjkxZWE2YTJiNmQ5NDNi
YjY0Y2RlOGQxNDM4YTExZWMKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
