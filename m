Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E7A34A5B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9E899DC;
	Tue,  4 Jun 2019 14:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E72C897E4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 12:23:34 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 98D4868B20; Tue,  4 Jun 2019 14:23:08 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge on
 Teres-I
References: <20190604122150.29D6468B05@newverein.lst.de>
Message-Id: <20190604122308.98D4868B20@newverein.lst.de>
Date: Tue,  4 Jun 2019 14:23:08 +0200 (CEST)
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
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

VGVyZXMtSSBoYXMgYW4gYW54NjM0NSBicmlkZ2UgY29ubmVjdGVkIHRvIHRoZSBSR0I2NjYgTENE
IG91dHB1dCwgYW5kCnRoZSBJMkMgY29udHJvbGxpbmcgc2lnbmFscyBhcmUgY29ubmVjdGVkIHRv
IEkyQzAgYnVzLiBlRFAgb3V0cHV0IGdvZXMKdG8gYW4gSW5ub2x1eCBOMTE2QkdFIHBhbmVsLgoK
RW5hYmxlIGl0IGluIHRoZSBkZXZpY2UgdHJlZS4KClNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhl
bmcgPGljZW5vd3lAYW9zYy5pbz4KU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1
c2UuZGU+Ci0tLQogLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRz
ICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNjEgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cwppbmRleCAwZWM0NmI5NjlhNzUuLmEw
YWQ0MzhiMDM3ZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWE2NC10ZXJlcy1pLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9z
dW41MGktYTY0LXRlcmVzLWkuZHRzCkBAIC02NSw2ICs2NSwyMSBAQAogCQl9OwogCX07CiAKKwlw
YW5lbDogcGFuZWwgeworCQljb21wYXRpYmxlID0iaW5ub2x1eCxuMTE2YmdlIiwgInNpbXBsZS1w
YW5lbCI7CisJCXN0YXR1cyA9ICJva2F5IjsKKwkJcG93ZXItc3VwcGx5ID0gPCZyZWdfZGNkYzE+
OworCQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CisKKwkJcG9ydHMgeworCQkJcGFuZWxfaW46
IHBvcnQgeworCQkJCXBhbmVsX2luX2VkcDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JmFueDYzNDVfb3V0PjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OworCiAJcmVnX3Vz
YjFfdmJ1czogdXNiMS12YnVzIHsKIAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwog
CQlyZWd1bGF0b3ItbmFtZSA9ICJ1c2IxLXZidXMiOwpAQCAtODEsMjAgKzk2LDQ4IEBACiAJfTsK
IH07CiAKKyZkZSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJmVoY2kxIHsKIAlzdGF0dXMg
PSAib2theSI7CiB9OwogCiAKLS8qIFRoZSBBTlg2MzQ1IGVEUC1icmlkZ2UgaXMgb24gaTJjMC4g
VGhlcmUgaXMgbm8gbGludXggKG1haW5saW5lKQotICogZHJpdmVyIGZvciB0aGlzIGNoaXAgYXQg
dGhlIG1vbWVudCwgdGhlIGJvb3Rsb2FkZXIgaW5pdGlhbGl6ZXMgaXQuCi0gKiBIb3dldmVyIGl0
IGNhbiBiZSBhY2Nlc3NlZCB3aXRoIHRoZSBpMmMtZGV2IGRyaXZlciBmcm9tIHVzZXIgc3BhY2Uu
Ci0gKi8KICZpMmMwIHsKIAljbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKIAlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwogCXBpbmN0cmwtMCA9IDwmaTJjMF9waW5zPjsKIAlzdGF0dXMgPSAi
b2theSI7CisKKwlhbng2MzQ1OiBhbng2MzQ1QDM4IHsKKwkJY29tcGF0aWJsZSA9ICJhbmFsb2dp
eCxhbng2MzQ1IjsKKwkJcmVnID0gPDB4Mzg+OworCQlyZXNldC1ncGlvcyA9IDwmcGlvIDMgMjQg
R1BJT19BQ1RJVkVfTE9XPjsgLyogUEQyNCAqLworCQlkdmRkMjUtc3VwcGx5ID0gPCZyZWdfZGxk
bzI+OworCQlkdmRkMTItc3VwcGx5ID0gPCZyZWdfZGxkbzM+OworCisJCXBvcnRzIHsKKwkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJCXBvcnRAMCB7
CisJCQkJYW54NjM0NV9pbjogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRj
b24wX291dF9hbng2MzQ1PjsKKwkJCQl9OworCQkJfTsKKwkJCXBvcnRAMSB7CisJCQkJYW54NjM0
NV9vdXQ6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbl9lZHA+
OworCQkJCX07CisJCQl9OworCQl9OworCX07Cit9OworCismbWl4ZXIwIHsKKwlzdGF0dXMgPSAi
b2theSI7CiB9OwogCiAmbW1jMCB7CkBAIC0yNzksNiArMzIyLDIwIEBACiAJdmNjLWhkbWktc3Vw
cGx5ID0gPCZyZWdfZGxkbzE+OwogfTsKIAorJnRjb24wIHsKKwlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmbGNkX3JnYjY2Nl9waW5zPjsKKworCXN0YXR1cyA9ICJv
a2F5IjsKK307CisKKyZ0Y29uMF9vdXQgeworCXRjb24wX291dF9hbng2MzQ1OiBlbmRwb2ludEAw
IHsKKwkJcmVnID0gPDA+OworCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmFueDYzNDVfaW4+OworCX07
Cit9OworCiAmdWFydDAgewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3RybC0w
ID0gPCZ1YXJ0MF9wYl9waW5zPjsKLS0gCjIuMTYuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
