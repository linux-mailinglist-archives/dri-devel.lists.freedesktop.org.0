Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A2B8004
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 19:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559C96F541;
	Thu, 19 Sep 2019 17:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613C96F541
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 17:30:27 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB5892196E;
 Thu, 19 Sep 2019 17:30:26 +0000 (UTC)
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 2/2] =?UTF-8?q?MAINTAINERS:=20Add=20Jernej=20=C5=A0krabec?=
 =?UTF-8?q?=20as=20a=20reviewer=20for=20DE2?=
Date: Thu, 19 Sep 2019 19:30:20 +0200
Message-Id: <20190919173020.11655-2-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919173020.11655-1-mripard@kernel.org>
References: <20190919173020.11655-1-mripard@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568914227;
 bh=+eqMvWZ6CaptmchpOvIdQLFm7GexEydCK2c+BAaWykM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bmJdCY8IQtvVJbEi9wt5Ej8uGskVkHrq1P2U+3C/EL9LYV2Ug9A5NyTABYKlVNyx2
 Q+JrjPQziGRtxcOO/DwY+PsBEQClAebZNN2TaQhjiaptg2goBdoER2BfIaEuVDh7EX
 dhYLm1mVvr99axMBRaBG9PsqYMCruYehXo/czPgU=
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
Cc: jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG5ld2VyIEFsbHdpbm5lciBTb0NzIGhhdmUgYSBkaWZmZXJlbnQgbGF5ZXJzIGNvbnRyb2xs
ZXIgdGhhbiB0aGUgb2xkZXIKb25lcy4gSmVybmVqIHdyb3RlIHRoYXQgc3VwcG9ydCBhbmQgaGFz
IGJlZW4gcmV2aWV3aW5nIHBhdGNoZXMgZm9yIGEgd2hpbGUKbm93LCBzbyBsZXQncyBtYWtlIGhp
bSBhIGZvcm1hbCByZXZpZXdlci4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBh
cmRAa2VybmVsLm9yZz4KLS0tCiBNQUlOVEFJTkVSUyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJ
TkVSUwppbmRleCA1NGUyMjJlMWQwZDYuLmZhZTMyOGYwNmMxNyAxMDA2NDQKLS0tIGEvTUFJTlRB
SU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTUzNjEsNiArNTM2MSwxNSBAQCBGOglkcml2ZXJz
L2dwdS9kcm0vc3VuNGkvCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zdW54aS9zdW40aS1kcm0udHh0CiBUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3Rv
cC5vcmcvZHJtL2RybS1taXNjCiAKK0RSTSBEUklWRVIgRk9SIEFMTFdJTk5FUiBERTIgRU5HSU5F
CitNOglNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CitNOglDaGVuLVl1IFRzYWkg
PHdlbnNAY3NpZS5vcmc+CitSOglKZXJuZWogxaBrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wu
bmV0PgorTDoJZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZworUzoJU3VwcG9ydGVkCitG
Oglkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGkqCitUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCisKIERSTSBEUklWRVJTIEZPUiBBTUxPR0lDIFNPQ1MK
IE06CU5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KIEw6CWRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
