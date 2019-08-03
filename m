Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273038077B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 19:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8036E13A;
	Sat,  3 Aug 2019 17:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816566E13A
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 17:45:10 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for -rc3, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190802190552.GA12933@phenom.ffwll.local>
References: <20190802190552.GA12933@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190802190552.GA12933@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-08-02-1
X-PR-Tracked-Commit-Id: 9c8c9c7cdb4c8fb48a2bc70f41a07920f761d2cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e31225f99e077d0b8c7f8577aab39e766e2477b
Message-Id: <156485431027.24028.1979613810090047552.pr-tracker-bot@kernel.org>
Date: Sat, 03 Aug 2019 17:45:10 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564854310;
 bh=TSln650bzcYkiEDOaL2OkTJxbFUiba8WgboEBSnDfuc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=VVa6YbtM8BccBMQq/SkhkaGq9V1hnWF9jetDOPgmyP2aaUIUJIH2t3cMSvCmzmyjJ
 0bS2lmHsB3b8PJZHMcWlrksofFaTEBqHJVmKdZlqJ8X4YNLE9tspVUNjhuMfEVBpPt
 UOemlxqzgf+4r9aG2rlAx6RHu1d9WGRkwmq0e9ks=
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDIgQXVnIDIwMTkgMjE6MDU6NTIgKzAy
MDA6Cgo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0tZml4
ZXMtMjAxOS0wOC0wMi0xCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51eC5naXQ6
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy8wZTMxMjI1Zjk5ZTA3N2QwYjhjN2Y4
NTc3YWFiMzllNzY2ZTI0NzdiCgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwgSSBhbSBh
IGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
