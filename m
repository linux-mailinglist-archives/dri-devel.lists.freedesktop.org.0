Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA538565
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1807389B11;
	Fri,  7 Jun 2019 07:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B65D89354
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:02 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7510520005;
 Thu,  6 Jun 2019 14:21:58 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 10/20] arm64: dts: renesas: r8a7795: Add CMM units
Date: Thu,  6 Jun 2019 16:22:10 +0200
Message-Id: <20190606142220.1392-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
dGhlIG9yZGVyaW5nCmZvdW5kIGluIG90aGVyIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OTUuZHRzaSB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQppbmRleCBhYmVhYzMwNTkzODMuLjgzZWRkOWYx
MmNhYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpCkBAIC0yODI1
LDYgKzI4MjUsMzggQEAKIAkJCXJlbmVzYXMsZmNwID0gPCZmY3B2aTE+OwogCQl9OwogCisJCWNt
bTA6IGNtbUBmZWE0MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwor
CQkJcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBDUEdf
TU9EIDcxMT47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlTX09O
PjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47CisJCX07CisKKwkJY21tMTogY21tQGZlYTUwMDAw
IHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tZ2VuMyI7CisJCQlyZWcgPSA8MCAweGZl
YTUwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzEwPjsKKwkJCXBv
d2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NV9QRF9BTFdBWVNfT04+OworCQkJcmVzZXRzID0g
PCZjcGcgNzEwPjsKKwkJfTsKKworCQljbW0yOiBjbW1AZmVhNjAwMDAgeworCQkJY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLGNtbS1nZW4zIjsKKwkJCXJlZyA9IDwwIDB4ZmVhNjAwMDAgMCAweDEwMDA+
OworCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDk+OworCQkJcG93ZXItZG9tYWlucyA9IDwm
c3lzYyBSOEE3Nzk1X1BEX0FMV0FZU19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MDk+OworCQl9
OworCisJCWNtbTM6IGNtbUBmZWE3MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21t
LWdlbjMiOworCQkJcmVnID0gPDAgMHhmZWE3MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8
JmNwZyBDUEdfTU9EIDcwOD47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERf
QUxXQVlTX09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcwOD47CisJCX07CisKIAkJY3NpMjA6IGNz
aTJAZmVhODAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OTUtY3NpMiI7CiAJ
CQlyZWcgPSA8MCAweGZlYTgwMDAwIDAgMHgxMDAwMD47CkBAIC0zMDI4LDkgKzMwNjAsMTEgQEAK
IAkJCQkgPCZjcGcgQ1BHX01PRCA3MjI+LAogCQkJCSA8JmNwZyBDUEdfTU9EIDcyMT47CiAJCQlj
bG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEiLCAiZHUuMiIsICJkdS4zIjsKLQkJCXZzcHMgPSA8
JnZzcGQwIDAgJnZzcGQxIDAgJnZzcGQyIDAgJnZzcGQwIDE+OwogCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKIAorCQkJdnNwcyA9IDwmdnNwZDAgMCAmdnNwZDEgMCAmdnNwZDIgMCAmdnNwZDAgMT47
CisJCQljbW1zID0gPCZjbW0wICZjbW0xICZjbW0yICZjbW0zPjsKKwogCQkJcG9ydHMgewogCQkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJCSNzaXplLWNlbGxzID0gPDA+OwotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
