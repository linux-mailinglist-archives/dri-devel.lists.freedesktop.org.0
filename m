Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FBBD4511
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 18:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EA76EC5F;
	Fri, 11 Oct 2019 16:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE186EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 16:10:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty05BvFP8P0UB+uNupSbe7XTwO8My7XnXQC0iucBxw=rQ@mail.gmail.com>
References: <CAPM=9ty05BvFP8P0UB+uNupSbe7XTwO8My7XnXQC0iucBxw=rQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty05BvFP8P0UB+uNupSbe7XTwO8My7XnXQC0iucBxw=rQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-10-11
X-PR-Tracked-Commit-Id: 4adbcff22e676d28de185dfd391a6fe56b3e6284
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9892f9f6cf83e8ecaacc5ec7847cf5ba033119d2
Message-Id: <157081020565.21776.7490614053068406440.pr-tracker-bot@kernel.org>
Date: Fri, 11 Oct 2019 16:10:05 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570810205;
 bh=EHe1DVQKdCmISqd9rDP9OzdB7C6HqG58pl0sFURpOG0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=QXLyhwokECuevFtWeqxSlwtK7/L+8IUw8HyZJpzSbBGU45h4JAwGiVoao7NMJIcSo
 t/lYsQZGE72SHLlw1la8SLJoRP4ufcxCX9maSoAJmqaedp8/WKC7Sxw9B7Z0etrTy5
 3M10DxV8DUymP0rsfbUH8+k6ZTZmEdW++udFTOnw=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDExIE9jdCAyMDE5IDE0OjM2OjAzICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMTAtMTEKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzk4OTJmOWY2Y2Y4M2U4ZWNhYWNjNWVj
Nzg0N2NmNWJhMDMzMTE5ZDIKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
