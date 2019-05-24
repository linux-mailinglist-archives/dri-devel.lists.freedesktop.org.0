Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B675029D0F
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 19:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579F86E12F;
	Fri, 24 May 2019 17:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801526E12F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 17:35:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.2-rc2 (try two)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyyEcLOqXFMsrdkZa8WQ1aNJjvz9bGyFjnv-QzOZkfZ=w@mail.gmail.com>
References: <CAPM=9tyyEcLOqXFMsrdkZa8WQ1aNJjvz9bGyFjnv-QzOZkfZ=w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyyEcLOqXFMsrdkZa8WQ1aNJjvz9bGyFjnv-QzOZkfZ=w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-05-24-1
X-PR-Tracked-Commit-Id: c074989171801171af6c5f53dd16b27f36b31deb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3b25d157d5a52ef3f9296a739ee28f5d36e8968
Message-Id: <155871931739.20356.3933846924787456811.pr-tracker-bot@kernel.org>
Date: Fri, 24 May 2019 17:35:17 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558719317;
 bh=vFO247cLIzhgUSVcNu2+0wfzMiTpHuPl011fsa3J93g=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nS64xNPrgh6tFmEK47Ej+qe5v8SgrU3cHcKvQsaegQN9gibKwBxQn8pS7El63hAXF
 W1s2H1+qEaX6u6B1liYAJf6CiZnLZIzjXCiFbrYE98Dik0PqXS7ZIMShjWmN0WqYwH
 gEY2CEugNKmlYHEpEU020+P5XEbj1639S70ec3wQ=
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDI0IE1heSAyMDE5IDIwOjAxOjM1ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMDUtMjQtMQoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0
OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvYTNiMjVkMTU3ZDVhNTJlZjNmOTI5
NmE3MzllZTI4ZjVkMzZlODk2OAoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0g
YSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
