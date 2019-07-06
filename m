Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415A061B1E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1813E89C07;
	Mon,  8 Jul 2019 07:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8785189AFF
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:08 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0535CC0002;
 Sat,  6 Jul 2019 14:07:04 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 10/19] arm64: dts: renesas: r8a7795: Add CMM units
Date: Sat,  6 Jul 2019 16:07:37 +0200
Message-Id: <20190706140746.29132-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIEgzIGRldmljZSB0cmVlIGFuZCByZWZlcmVu
Y2UgdGhlbSBmcm9tCnRoZSBEaXNwbGF5IFVuaXQgdGhleSBhcmUgY29ubmVjdGVkIHRvLgoKV2hp
bGUgYXQgaXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2gg
dGhlIG9yZGVyaW5nCmZvdW5kIGluIG90aGVyIFNvQ3MuCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaSB8IDM2ICsrKysrKysrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQppbmRleCA0MzJmNDAzNmE4YTgu
LmFhZTc5NzZmMzczOCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4
YTc3OTUuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNp
CkBAIC0yODk1LDYgKzI4OTUsMzggQEAKIAkJCXJlbmVzYXMsZmNwID0gPCZmY3B2aTE+OwogCQl9
OwogCisJCWNtbTA6IGNtbUBmZWE0MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMscmNh
ci1nZW4zLWNtbSI7CisJCQlyZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2Nr
cyA9IDwmY3BnIENQR19NT0QgNzExPjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5
NV9QRF9BTFdBWVNfT04+OworCQkJcmVzZXRzID0gPCZjcGcgNzExPjsKKwkJfTsKKworCQljbW0x
OiBjbW1AZmVhNTAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJjYXItZ2VuMy1jbW0i
OworCQkJcmVnID0gPDAgMHhmZWE1MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBD
UEdfTU9EIDcxMD47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlT
X09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMD47CisJCX07CisKKwkJY21tMjogY21tQGZlYTYw
MDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLWdlbjMtY21tIjsKKwkJCXJlZyA9
IDwwIDB4ZmVhNjAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDk+
OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk1X1BEX0FMV0FZU19PTj47CisJCQly
ZXNldHMgPSA8JmNwZyA3MDk+OworCQl9OworCisJCWNtbTM6IGNtbUBmZWE3MDAwMCB7CisJCQlj
b21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW4zLWNtbSI7CisJCQlyZWcgPSA8MCAweGZlYTcw
MDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzA4PjsKKwkJCXBvd2Vy
LWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NV9QRF9BTFdBWVNfT04+OworCQkJcmVzZXRzID0gPCZj
cGcgNzA4PjsKKwkJfTsKKwogCQljc2kyMDogY3NpMkBmZWE4MDAwMCB7CiAJCQljb21wYXRpYmxl
ID0gInJlbmVzYXMscjhhNzc5NS1jc2kyIjsKIAkJCXJlZyA9IDwwIDB4ZmVhODAwMDAgMCAweDEw
MDAwPjsKQEAgLTMwOTgsOSArMzEzMCwxMSBAQAogCQkJCSA8JmNwZyBDUEdfTU9EIDcyMj4sCiAJ
CQkJIDwmY3BnIENQR19NT0QgNzIxPjsKIAkJCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIs
ICJkdS4yIiwgImR1LjMiOwotCQkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD4sIDwmdnNw
ZDIgMD4sIDwmdnNwZDAgMT47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCisJCQl2c3BzID0g
PCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsKKwkJCWNtbXMg
PSA8JmNtbTAgJmNtbTEgJmNtbTIgJmNtbTM+OworCiAJCQlwb3J0cyB7CiAJCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CiAJCQkJI3NpemUtY2VsbHMgPSA8MD47Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
