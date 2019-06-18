Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFAD4AAAF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F60A6E220;
	Tue, 18 Jun 2019 19:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A056E220
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:06:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0672B214AF;
 Tue, 18 Jun 2019 19:05:54 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFT 03/10] ARM: dts: exynos: Fix language typo and indentation
Date: Tue, 18 Jun 2019 21:05:27 +0200
Message-Id: <20190618190534.4951-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884760;
 bh=eYXtQ/oGmgo79qNHT8e57iHbj8Bqvh6OPJHen49rwPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LoR2BgJI4mpckuhNnepofMTjo6LIUCbE1k79OExnkxys0upkPWlCCX9V6k+9BcS2p
 Uhr2k3D/CAaWoIjwNItMWX/FKKZkhkByPY4mBZZ3CsRkSI8L94xp2G063J1Mt4BFMZ
 5NK9xPGCT9ee8zzjupGBzNo00LT1iamXHP5kr1m4=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29ycmVjdCBsYW5ndWFnZSB0eXBvIGFuZCB3cm9uZyBpbmRlbnRhdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FybS9i
b290L2R0cy9leHlub3M0MjEwLmR0c2kgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczQyMTAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQyMTAuZHRzaQpp
bmRleCBiNDkxYzM0NWIyZTguLmVhMGUwNDNjZDJiNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNDIxMC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQyMTAu
ZHRzaQpAQCAtOCw3ICs4LDcgQEAKICAqCQl3d3cubGluYXJvLm9yZwogICoKICAqIFNhbXN1bmcn
cyBFeHlub3M0MjEwIFNvQyBkZXZpY2Ugbm9kZXMgYXJlIGxpc3RlZCBpbiB0aGlzIGZpbGUuIEV4
eW5vczQyMTAKLSAqIGJhc2VkIGJvYXJkIGZpbGVzIGNhbiBpbmNsdWRlIHRoaXMgZmlsZSBhbmQg
cHJvdmlkZSB2YWx1ZXMgZm9yIGJvYXJkIHNwZWNmaWMKKyAqIGJhc2VkIGJvYXJkIGZpbGVzIGNh
biBpbmNsdWRlIHRoaXMgZmlsZSBhbmQgcHJvdmlkZSB2YWx1ZXMgZm9yIGJvYXJkIHNwZWNpZmlj
CiAgKiBiaW5kaW5ncy4KICAqCiAgKiBOb3RlOiBUaGlzIGZpbGUgZG9lcyBub3QgaW5jbHVkZSBk
ZXZpY2Ugbm9kZXMgZm9yIGFsbCB0aGUgY29udHJvbGxlcnMgaW4KQEAgLTM4MSwxMyArMzgxLDEz
IEBACiAKIAkJCXRyaXBzIHsKIAkJCQljcHVfYWxlcnQwOiBjcHUtYWxlcnQtMCB7Ci0JCQkJdGVt
cGVyYXR1cmUgPSA8ODUwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJdGVtcGVyYXR1cmUg
PSA8ODUwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KIAkJCQl9OwogCQkJCWNwdV9hbGVydDE6IGNw
dS1hbGVydC0xIHsKLQkJCQl0ZW1wZXJhdHVyZSA9IDwxMDAwMDA+OyAvKiBtaWxsaWNlbHNpdXMg
Ki8KKwkJCQkJdGVtcGVyYXR1cmUgPSA8MTAwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCiAJCQkJ
fTsKIAkJCQljcHVfYWxlcnQyOiBjcHUtYWxlcnQtMiB7Ci0JCQkJdGVtcGVyYXR1cmUgPSA8MTEw
MDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXRlbXBlcmF0dXJlID0gPDExMDAwMD47IC8q
IG1pbGxpY2Vsc2l1cyAqLwogCQkJCX07CiAJCQl9OwogCQl9OwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
