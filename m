Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38160214FB
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7394889951;
	Fri, 17 May 2019 07:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5CA89780
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:01:21 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id E6EE568C65; Thu, 16 May 2019 17:51:39 +0200 (CEST)
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
Subject: [PATCH v2 3/4] arm64: DTS: allwinner: a64: Enable audio on Teres-I
References: <20190516154943.239E668B05@newverein.lst.de>
Message-Id: <20190516155139.E6EE568C65@newverein.lst.de>
Date: Thu, 16 May 2019 17:51:39 +0200 (CEST)
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

RnJvbTogSGFyYWxkIEdleWVyIDxoYXJhbGRAY2NiaWIub3JnPgoKVGhlIFRFUkVTLUkgaGFzIGlu
dGVybmFsIHNwZWFrZXJzIChsZWZ0LCByaWdodCksIGludGVybmFsIG1pY3JvcGhvbmUKYW5kIGEg
aGVhZHNldCBjb21ibyBqYWNrIChoZWFkcGhvbmVzICsgbWljKSwgIkNUSUEiIChhbmRyb2lkKSBw
aW5vdXQuCgpUaGUgaGVhZHBob25lIGFuZCBtaWMgZGV0ZWN0IGxpbmVzIG9mIHRoZSBBNjQgYXJl
IGNvbm5lY3RlZCBwcm9wZXJseSwKYnV0IEFGQUlLIGN1cnJlbnRseSB1bnN1cHBvcnRlZCBieSB0
aGUgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogSGFyYWxkIEdleWVyIDxoYXJhbGRAY2NiaWIub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBUb3JzdGVuIER1d2UgPGR1d2VAc3VzZS5kZT4KLS0tCiAuLi4vYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMgfCA1MyArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzCmluZGV4IGY5
ZWVkZTBhOGJkMy4uZDU3MDQ5ZmJkYWNhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKQEAgLTcwLDYgKzcwLDI1IEBACiAJ
CWNvbXBhdGlibGUgPSAibW1jLXB3cnNlcS1zaW1wbGUiOwogCQlyZXNldC1ncGlvcyA9IDwmcl9w
aW8gMCAyIEdQSU9fQUNUSVZFX0xPVz47IC8qIFBMMiAqLwogCX07CisKKwlzcGVha2VyX2FtcDog
YXVkaW8tYW1wbGlmaWVyIHsKKwkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYXVkaW8tYW1wbGlmaWVy
IjsKKwkJZW5hYmxlLWdwaW9zID0gPCZyX3BpbyAwIDEyIEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBQ
TDEyICovCisJCXNvdW5kLW5hbWUtcHJlZml4ID0gIlNwZWFrZXIgQW1wIjsKKwl9OworfTsKKwor
JmNvZGVjIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismY29kZWNfYW5hbG9nIHsKKwljcHZk
ZC1zdXBwbHkgPSA8JnJlZ19lbGRvMT47CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmRhaSB7
CisJc3RhdHVzID0gIm9rYXkiOwogfTsKIAogJmVoY2kxIHsKQEAgLTI1OCw2ICsyODYsMjkgQEAK
IAl2Y2MtaGRtaS1zdXBwbHkgPSA8JnJlZ19kbGRvMT47CiB9OwogCismc291bmQgeworCXNpbXBs
ZS1hdWRpby1jYXJkLGF1eC1kZXZzID0gPCZjb2RlY19hbmFsb2c+LCA8JnNwZWFrZXJfYW1wPjsK
KwlzaW1wbGUtYXVkaW8tY2FyZCx3aWRnZXRzID0gIkhlYWRwaG9uZSIsICJIZWFkcGhvbmUgSmFj
ayIsCisJCQkJICAgICJNaWNyb3Bob25lIiwgIkhlYWRzZXQgTWljcm9waG9uZSIsCisJCQkJICAg
ICJNaWNyb3Bob25lIiwgIkludGVybmFsIE1pY3JvcGhvbmUiLAorCQkJCSAgICAiU3BlYWtlciIs
ICJJbnRlcm5hbCBTcGVha2VyIjsKKwlzaW1wbGUtYXVkaW8tY2FyZCxyb3V0aW5nID0KKwkJCSJM
ZWZ0IERBQyIsICJBSUYxIFNsb3QgMCBMZWZ0IiwKKwkJCSJSaWdodCBEQUMiLCAiQUlGMSBTbG90
IDAgUmlnaHQiLAorCQkJIkFJRjEgU2xvdCAwIExlZnQgQURDIiwgIkxlZnQgQURDIiwKKwkJCSJB
SUYxIFNsb3QgMCBSaWdodCBBREMiLCAiUmlnaHQgQURDIiwKKwkJCSJIZWFkcGhvbmUgSmFjayIs
ICJIUCIsCisJCQkiU3BlYWtlciBBbXAgSU5MIiwgIkxJTkVPVVQiLAorCQkJIlNwZWFrZXIgQW1w
IElOUiIsICJMSU5FT1VUIiwKKwkJCSJJbnRlcm5hbCBTcGVha2VyIiwgIlNwZWFrZXIgQW1wIE9V
VEwiLAorCQkJIkludGVybmFsIFNwZWFrZXIiLCAiU3BlYWtlciBBbXAgT1VUUiIsCisJCQkiSW50
ZXJuYWwgTWljcm9waG9uZSIsICJNQklBUyIsCisJCQkiTUlDMSIsICJJbnRlcm5hbCBNaWNyb3Bo
b25lIiwKKwkJCSJIZWFkc2V0IE1pY3JvcGhvbmUiLCAiSEJJQVMiLAorCQkJIk1JQzIiLCAiSGVh
ZHNldCBNaWNyb3Bob25lIjsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmdWFydDAgewogCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3RybC0wID0gPCZ1YXJ0MF9wYl9waW5zPjsK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
