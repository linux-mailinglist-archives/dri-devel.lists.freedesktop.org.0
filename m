Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B1E9C6C0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF67989A08;
	Mon, 26 Aug 2019 00:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8986E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:50:50 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EC819C0005;
 Sun, 25 Aug 2019 13:50:45 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 04/14] arm64: dts: renesas: r8a7795: Add CMM units
Date: Sun, 25 Aug 2019 15:51:44 +0200
Message-Id: <20190825135154.11488-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
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
b290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRzaQppbmRleCA5NWRlZmY2NmVlYjYuLjIxYjQwNjlm
MDdlNyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NS5kdHNpCkBAIC0yOTA5
LDYgKzI5MDksMzggQEAKIAkJCWlvbW11cyA9IDwmaXBtbXVfdmkxIDEwPjsKIAkJfTsKIAorCQlj
bW0wOiBjbW1AZmVhNDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk1
IjsKKwkJCXJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcg
Q1BHX01PRCA3MTE+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk1X1BEX0FMV0FZ
U19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MTE+OworCQl9OworCisJCWNtbTE6IGNtbUBmZWE1
MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4YTc3OTUiOworCQkJcmVnID0g
PDAgMHhmZWE1MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMD47
CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTVfUERfQUxXQVlTX09OPjsKKwkJCXJl
c2V0cyA9IDwmY3BnIDcxMD47CisJCX07CisKKwkJY21tMjogY21tQGZlYTYwMDAwIHsKKwkJCWNv
bXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5NSI7CisJCQlyZWcgPSA8MCAweGZlYTYwMDAw
IDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzA5PjsKKwkJCXBvd2VyLWRv
bWFpbnMgPSA8JnN5c2MgUjhBNzc5NV9QRF9BTFdBWVNfT04+OworCQkJcmVzZXRzID0gPCZjcGcg
NzA5PjsKKwkJfTsKKworCQljbW0zOiBjbW1AZmVhNzAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJy
ZW5lc2FzLGNtbS1yOGE3Nzk1IjsKKwkJCXJlZyA9IDwwIDB4ZmVhNzAwMDAgMCAweDEwMDA+Owor
CQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDg+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lz
YyBSOEE3Nzk1X1BEX0FMV0FZU19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MDg+OworCQl9Owor
CiAJCWNzaTIwOiBjc2kyQGZlYTgwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3
Nzk1LWNzaTIiOwogCQkJcmVnID0gPDAgMHhmZWE4MDAwMCAwIDB4MTAwMDA+OwpAQCAtMzExMiw5
ICszMTQ0LDExIEBACiAJCQkJIDwmY3BnIENQR19NT0QgNzIyPiwKIAkJCQkgPCZjcGcgQ1BHX01P
RCA3MjE+OwogCQkJY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIiwgImR1LjIiLCAiZHUuMyI7
Ci0JCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAx
PjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAKKwkJCXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZz
cGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+OworCQkJY21tcyA9IDwmY21tMCAmY21tMSAm
Y21tMiAmY21tMz47CisKIAkJCXBvcnRzIHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJ
CQkjc2l6ZS1jZWxscyA9IDwwPjsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
