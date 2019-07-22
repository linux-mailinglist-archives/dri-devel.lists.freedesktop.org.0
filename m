Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB97129A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9DC6E113;
	Tue, 23 Jul 2019 07:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2BC89C9A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:12:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 9595968B20; Mon, 22 Jul 2019 17:12:08 +0200 (CEST)
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
References: <<20190722150414.9F97668B20@verein.lst.de>>
Subject: [PATCH v3 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge on
 Teres-I
Message-Id: <20190722151208.9595968B20@verein.lst.de>
Date: Mon, 22 Jul 2019 17:12:08 +0200 (CEST)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
IEkyQzAgYnVzLgoKRW5hYmxlIGl0IGluIHRoZSBkZXZpY2UgdHJlZSwgYW5kIHRoZSBkaXNwbGF5
IGVuZ2luZSwgdmlkZW8gbWl4ZXIKYW5kIHRjb24wIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBJ
Y2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+ClNpZ25lZC1vZmYtYnk6IFRvcnN0ZW4gRHV3
ZSA8ZHV3ZUBzdXNlLmRlPgotLS0KIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10
ZXJlcy1pLmR0cyAgICAgIHwgNDUgKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDQxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgotLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKQEAgLTEwMCwxOCArMTAw
LDQxIEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJmRlIHsKKwlzdGF0dXMgPSAib2theSI7
Cit9OworCiAmZWhjaTEgewogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKIAotLyogVGhlIEFOWDYz
NDUgZURQLWJyaWRnZSBpcyBvbiBpMmMwLiBUaGVyZSBpcyBubyBsaW51eCAobWFpbmxpbmUpCi0g
KiBkcml2ZXIgZm9yIHRoaXMgY2hpcCBhdCB0aGUgbW9tZW50LCB0aGUgYm9vdGxvYWRlciBpbml0
aWFsaXplcyBpdC4KLSAqIEhvd2V2ZXIgaXQgY2FuIGJlIGFjY2Vzc2VkIHdpdGggdGhlIGkyYy1k
ZXYgZHJpdmVyIGZyb20gdXNlciBzcGFjZS4KLSAqLwogJmkyYzAgewogCWNsb2NrLWZyZXF1ZW5j
eSA9IDwxMDAwMDA+OwogCXN0YXR1cyA9ICJva2F5IjsKKworCWFueDYzNDU6IGFueDYzNDVAMzgg
eworCQljb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDYzNDUiOworCQlyZWcgPSA8MHgzOD47CisJ
CXJlc2V0LWdwaW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9MT1c+OyAvKiBQRDI0ICovCisJ
CWR2ZGQyNS1zdXBwbHkgPSA8JnJlZ19kbGRvMj47CisJCWR2ZGQxMi1zdXBwbHkgPSA8JnJlZ19k
bGRvMz47CisKKwkJcG9ydHMgeworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1j
ZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlhbng2MzQ1X2luOiBlbmRwb2ludCB7CisJ
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbjBfb3V0X2FueDYzNDU+OworCQkJCX07CisJCQl9
OworCQl9OworCX07Cit9OworCismbWl4ZXIwIHsKKwlzdGF0dXMgPSAib2theSI7CiB9OwogCiAm
bW1jMCB7CkBAIC0zMTksNiArMzQyLDIwIEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJnRj
b24wIHsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmbGNkX3Jn
YjY2Nl9waW5zPjsKKworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZ0Y29uMF9vdXQgeworCXRj
b24wX291dF9hbng2MzQ1OiBlbmRwb2ludEAwIHsKKwkJcmVnID0gPDA+OworCQlyZW1vdGUtZW5k
cG9pbnQgPSA8JmFueDYzNDVfaW4+OworCX07Cit9OworCiAmdWFydDAgewogCXBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7CiAJcGluY3RybC0wID0gPCZ1YXJ0MF9wYl9waW5zPjsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
