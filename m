Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCE2B458
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163FA89D66;
	Mon, 27 May 2019 12:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918C89C8D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:54:27 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id BB60F68B20; Thu, 23 May 2019 08:54:04 +0200 (CEST)
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
Subject: [PATCH 6/6] arm64: dts: allwinner: a64: enable ANX6345 bridge on
 Teres-I
References: <20190523065013.2719D68B05@newverein.lst.de>
Message-Id: <20190523065404.BB60F68B20@newverein.lst.de>
Date: Thu, 23 May 2019 08:54:04 +0200 (CEST)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKVGVyZXMtSSBoYXMgYW4gYW54
NjM0NSBicmlkZ2UgY29ubmVjdGVkIHRvIHRoZSBSR0I2NjYgTENEIG91dHB1dCwgYW5kCnRoZSBJ
MkMgY29udHJvbGxpbmcgc2lnbmFscyBhcmUgY29ubmVjdGVkIHRvIEkyQzAgYnVzLiBlRFAgb3V0
cHV0IGdvZXMKdG8gYW4gSW5ub2x1eCBOMTE2QkdFIHBhbmVsLgoKRW5hYmxlIGl0IGluIHRoZSBk
ZXZpY2UgdHJlZS4KClNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5p
bz4KU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Ci0tLQogYXJjaC9h
cm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cyB8ICAgNjUgKysr
KysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0
LXRlcmVzLWkuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1h
NjQtdGVyZXMtaS5kdHMKQEAgLTY1LDYgKzY1LDIxIEBACiAJCX07CiAJfTsKIAorCXBhbmVsOiBw
YW5lbCB7CisJCWNvbXBhdGlibGUgPSJpbm5vbHV4LG4xMTZiZ2UiLCAic2ltcGxlLXBhbmVsIjsK
KwkJc3RhdHVzID0gIm9rYXkiOworCQlwb3dlci1zdXBwbHkgPSA8JnJlZ19kY2RjMT47CisJCWJh
Y2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKKworCQlwb3J0cyB7CisJCQlwYW5lbF9pbjogcG9ydCB7
CisJCQkJcGFuZWxfaW5fZWRwOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
YW54NjM0NV9vdXQ+OworCQkJCX07CisJCQl9OworCQl9OworCX07CisKIAlyZWdfdXNiMV92YnVz
OiB1c2IxLXZidXMgewogCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CiAJCXJlZ3Vs
YXRvci1uYW1lID0gInVzYjEtdmJ1cyI7CkBAIC04MSwyMCArOTYsNDggQEAKIAl9OwogfTsKIAor
JmRlIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmZWhjaTEgewogCXN0YXR1cyA9ICJva2F5
IjsKIH07CiAKIAotLyogVGhlIEFOWDYzNDUgZURQLWJyaWRnZSBpcyBvbiBpMmMwLiBUaGVyZSBp
cyBubyBsaW51eCAobWFpbmxpbmUpCi0gKiBkcml2ZXIgZm9yIHRoaXMgY2hpcCBhdCB0aGUgbW9t
ZW50LCB0aGUgYm9vdGxvYWRlciBpbml0aWFsaXplcyBpdC4KLSAqIEhvd2V2ZXIgaXQgY2FuIGJl
IGFjY2Vzc2VkIHdpdGggdGhlIGkyYy1kZXYgZHJpdmVyIGZyb20gdXNlciBzcGFjZS4KLSAqLwog
JmkyYzAgewogCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDA+OwogCXBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7CiAJcGluY3RybC0wID0gPCZpMmMwX3BpbnM+OwogCXN0YXR1cyA9ICJva2F5IjsK
KworCWFueDYzNDU6IGFueDYzNDVAMzggeworCQljb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDYz
NDUiOworCQlyZWcgPSA8MHgzOD47CisJCXJlc2V0LWdwaW9zID0gPCZwaW8gMyAyNCBHUElPX0FD
VElWRV9MT1c+OyAvKiBQRDI0ICovCisJCWR2ZGQyNS1zdXBwbHkgPSA8JnJlZ19kbGRvMj47CisJ
CWR2ZGQxMi1zdXBwbHkgPSA8JnJlZ19kbGRvMz47CisKKwkJcG9ydHMgeworCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlh
bng2MzQ1X2luOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbjBfb3V0
X2FueDYzNDU+OworCQkJCX07CisJCQl9OworCQkJcG9ydEAxIHsKKwkJCQlhbng2MzQ1X291dDog
ZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luX2VkcD47CisJCQkJ
fTsKKwkJCX07CisJCX07CisJfTsKK307CisKKyZtaXhlcjAgeworCXN0YXR1cyA9ICJva2F5IjsK
IH07CiAKICZtbWMwIHsKQEAgLTI3OSw2ICszMjIsMjAgQEAKIAl2Y2MtaGRtaS1zdXBwbHkgPSA8
JnJlZ19kbGRvMT47CiB9OwogCismdGNvbjAgeworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
CisJcGluY3RybC0wID0gPCZsY2RfcmdiNjY2X3BpbnM+OworCisJc3RhdHVzID0gIm9rYXkiOwor
fTsKKworJnRjb24wX291dCB7CisJdGNvbjBfb3V0X2FueDYzNDU6IGVuZHBvaW50QDAgeworCQly
ZWcgPSA8MD47CisJCXJlbW90ZS1lbmRwb2ludCA9IDwmYW54NjM0NV9pbj47CisJfTsKK307CisK
ICZ1YXJ0MCB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8JnVh
cnQwX3BiX3BpbnM+OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
