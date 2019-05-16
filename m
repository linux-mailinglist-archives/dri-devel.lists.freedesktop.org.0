Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C095214F3
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E769898A8;
	Fri, 17 May 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBD089781
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:01:21 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 8A52768B20; Thu, 16 May 2019 17:51:30 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Archit Taneja <architt@codeaurora.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>
Subject: [PATCH v2 1/4] arm64: DTS: allwinner: a64: Add pinmux for RGB666 LCD
References: <20190516154943.239E668B05@newverein.lst.de>
Message-Id: <20190516155130.8A52768B20@newverein.lst.de>
Date: Thu, 16 May 2019 17:51:30 +0200 (CEST)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKQWxsd2lubmVyIEE2NCdzIFRD
T04wIGNhbiBvdXRwdXQgUkdCNjY2IExDRCBzaWduYWwuCgpBZGQgaXRzIHBpbm11eC4KClNpZ25l
ZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KU2lnbmVkLW9mZi1ieTog
VmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogVG9y
c3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5u
ZXIvc3VuNTBpLWE2NC5kdHNpIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41
MGktYTY0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0
c2kKaW5kZXggMmFiYjMzNTE0NWE2Li5hOGJiZWU4NGU3ZGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKQEAgLTU1OSw2ICs1NTksMTYgQEAKIAkJ
CQlmdW5jdGlvbiA9ICJpMmMxIjsKIAkJCX07CgorCQkJL29taXQtaWYtbm8tcmVmLworCQkJbGNk
X3JnYjY2Nl9waW5zOiBsY2QtcmdiNjY2LXBpbnMgeworCQkJCXBpbnMgPSAiUEQwIiwgIlBEMSIs
ICJQRDIiLCAiUEQzIiwgIlBENCIsCisJCQkJICAgICAgICJQRDUiLCAiUEQ2IiwgIlBENyIsICJQ
RDgiLCAiUEQ5IiwKKwkJCQkgICAgICAgIlBEMTAiLCAiUEQxMSIsICJQRDEyIiwgIlBEMTMiLAor
CQkJCSAgICAgICAiUEQxNCIsICJQRDE1IiwgIlBEMTYiLCAiUEQxNyIsCisJCQkJICAgICAgICJQ
RDE4IiwgIlBEMTkiLCAiUEQyMCIsICJQRDIxIjsKKwkJCQlmdW5jdGlvbiA9ICJsY2QwIjsKKwkJ
CX07CisKIAkJCW1tYzBfcGluczogbW1jMC1waW5zIHsKIAkJCQlwaW5zID0gIlBGMCIsICJQRjEi
LCAiUEYyIiwgIlBGMyIsCiAJCQkJICAgICAgICJQRjQiLCAiUEY1IjsKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
