Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8A1E8E6
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6167B89581;
	Wed, 15 May 2019 07:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39698892BB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:11:17 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 9EAC768C7B; Tue, 14 May 2019 18:02:41 +0200 (CEST)
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
Subject: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on
 Teres-I
References: <20190514155911.6C0AC68B05@newverein.lst.de>
Message-Id: <20190514160241.9EAC768C7B@newverein.lst.de>
Date: Tue, 14 May 2019 18:02:41 +0200 (CEST)
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKVEVSRVMtSSBoYXMgYW4gQU5Y
NjM0NSBicmlkZ2UgY29ubmVjdGVkIHRvIHRoZSBSR0I2NjYgTENEIG91dHB1dCwgYW5kCnRoZSBJ
MkMgY29udHJvbGxpbmcgc2lnbmFscyBhcmUgY29ubmVjdGVkIHRvIEkyQzAgYnVzLgoKRW5hYmxl
IGl0IGluIHRoZSBkZXZpY2UgdHJlZS4KClNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGlj
ZW5vd3lAYW9zYy5pbz4KU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+
Ci0tLQoKb3JpZ2luYWxseTogcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA2NDY4NjcKCkNo
YW5nZWQgdGhlIHJlc2V0IHBvbGFyaXR5LCB3aGljaCBpcyBhY3RpdmUgbG93LAphY2NvcmRpbmcg
dG8gdGhlICh0ZXJzZSkgZGF0YXNoZWV0LCBUZXJlcy1JIGFuZCBwaW5lYm9vayBzY2hlbWF0aWNz
LAphbmQgdGhlIGNvbmZ1c2luZyBwYXJ0cyBvZiB0aGUgbGludXggZHJpdmVyIGNvZGUgKG5vdCB5
ZXQgaW5jbHVkZWQgaGVyZSkuCkFjdGl2ZSBsb3cgLT4gbm8gbW9yZSBjb25mdXNpb24uCgotLS0K
IC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cyB8IDQwICsrKysr
KysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1hNjQtdGVyZXMtaS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGkt
YTY0LXRlcmVzLWkuZHRzCmluZGV4IGM0NTViMjRkZDA3OS4uYmMxZDBkNmMwNjcyIDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRz
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5k
dHMKQEAgLTcyLDIwICs3MiwzOCBAQAogCX07CiB9OwogCismZGUgeworCXN0YXR1cyA9ICJva2F5
IjsKK307CisKICZlaGNpMSB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAogCi0vKiBUaGUgQU5Y
NjM0NSBlRFAtYnJpZGdlIGlzIG9uIGkyYzAuIFRoZXJlIGlzIG5vIGxpbnV4IChtYWlubGluZSkK
LSAqIGRyaXZlciBmb3IgdGhpcyBjaGlwIGF0IHRoZSBtb21lbnQsIHRoZSBib290bG9hZGVyIGlu
aXRpYWxpemVzIGl0LgotICogSG93ZXZlciBpdCBjYW4gYmUgYWNjZXNzZWQgd2l0aCB0aGUgaTJj
LWRldiBkcml2ZXIgZnJvbSB1c2VyIHNwYWNlLgotICovCiAmaTJjMCB7CiAJY2xvY2stZnJlcXVl
bmN5ID0gPDEwMDAwMD47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAg
PSA8JmkyYzBfcGlucz47CiAJc3RhdHVzID0gIm9rYXkiOworCisJYW54NjM0NTogYW54NjM0NUAz
OCB7CisJCWNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NjM0NSI7CisJCXJlZyA9IDwweDM4PjsK
KwkJcmVzZXQtZ3Bpb3MgPSA8JnBpbyAzIDI0IEdQSU9fQUNUSVZFX0xPVz47IC8qIFBEMjQgKi8K
KwkJZHZkZDI1LXN1cHBseSA9IDwmcmVnX2RsZG8yPjsKKwkJZHZkZDEyLXN1cHBseSA9IDwmcmVn
X2RsZG8zPjsKKworCQlwb3J0IHsKKwkJCWFueDYzNDVfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JnRjb24wX291dF9hbng2MzQ1PjsKKwkJCX07CisJCX07CisJfTsKK307
CisKKyZtaXhlcjAgeworCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKICZtbWMwIHsKQEAgLTI1OCw2
ICsyNzYsMjAgQEAKIAl2Y2MtaGRtaS1zdXBwbHkgPSA8JnJlZ19kbGRvMT47CiB9OwogCismdGNv
bjAgeworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZsY2Rfcmdi
NjY2X3BpbnM+OworCisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJnRjb24wX291dCB7CisJdGNv
bjBfb3V0X2FueDYzNDU6IGVuZHBvaW50QDAgeworCQlyZWcgPSA8MD47CisJCXJlbW90ZS1lbmRw
b2ludCA9IDwmYW54NjM0NV9pbj47CisJfTsKK307CisKICZ1YXJ0MCB7CiAJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8JnVhcnQwX3BiX3BpbnM+OwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
