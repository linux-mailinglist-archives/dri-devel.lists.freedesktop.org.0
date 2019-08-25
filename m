Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1B9C6D1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E756E15F;
	Mon, 26 Aug 2019 00:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AF86E101
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:50:46 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C3146C0007;
 Sun, 25 Aug 2019 13:50:42 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
Date: Sun, 25 Aug 2019 15:51:43 +0200
Message-Id: <20190825135154.11488-4-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIE0zLVcgZGV2aWNlIHRyZWUgYW5kIHJlZmVy
ZW5jZSB0aGVtIGZyb20KdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCgpT
aWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0t
LQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaSB8IDI1ICsrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaQppbmRleCAzZGM5ZDczZjU4OWEuLjhk
NzhlMWY5OGEyMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OTYuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpCkBA
IC0yNjEzLDYgKzI2MTMsMzAgQEAKIAkJCXJlbmVzYXMsZmNwID0gPCZmY3B2aTA+OwogCQl9Owog
CisJCWNtbTA6IGNtbUBmZWE0MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4
YTc3OTYiOworCQkJcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8
JmNwZyBDUEdfTU9EIDcxMT47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTZfUERf
QUxXQVlTX09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47CisJCX07CisKKwkJY21tMTogY21t
QGZlYTUwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5NiI7CisJCQly
ZWcgPSA8MCAweGZlYTUwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0Qg
NzEwPjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9BTFdBWVNfT04+Owor
CQkJcmVzZXRzID0gPCZjcGcgNzEwPjsKKwkJfTsKKworCQljbW0yOiBjbW1AZmVhNjAwMDAgewor
CQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk2IjsKKwkJCXJlZyA9IDwwIDB4ZmVh
NjAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDk+OworCQkJcG93
ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47CisJCQlyZXNldHMgPSA8
JmNwZyA3MDk+OworCQl9OworCiAJCWNzaTIwOiBjc2kyQGZlYTgwMDAwIHsKIAkJCWNvbXBhdGli
bGUgPSAicmVuZXNhcyxyOGE3Nzk2LWNzaTIiOwogCQkJcmVnID0gPDAgMHhmZWE4MDAwMCAwIDB4
MTAwMDA+OwpAQCAtMjc2Niw2ICsyNzkwLDcgQEAKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAK
IAkJCXZzcHMgPSA8JnZzcGQwICZ2c3BkMSAmdnNwZDI+OworCQkJY21tcyA9IDwmY21tMCAmY21t
MSAmY21tMj47CiAKIAkJCXBvcnRzIHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
