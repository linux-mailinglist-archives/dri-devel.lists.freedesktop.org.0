Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFC1770FC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5376E9E2;
	Tue,  3 Mar 2020 08:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F134F89D6C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 16:26:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 109CD3B7FA3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:58:45 +0000 (UTC)
X-Originating-IP: 90.89.41.158
Received: from localhost.localdomain
 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 175FB1BF217;
 Mon,  2 Mar 2020 15:58:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH 2/2] arm64: dts: rockchip: Describe PX30 GPU
Date: Mon,  2 Mar 2020 16:58:08 +0100
Message-Id: <20200302155808.11273-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302155808.11273-1-miquel.raynal@bootlin.com>
References: <20200302155808.11273-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UFgzMCBTb0NzIGZlYXR1cmUgYW4gQVJNIEJpZnJvc3QgR1BVLgoKU2lnbmVkLW9mZi1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KLS0tCgpIZWxsbywgdGhpcyBj
aGFuZ2UgaXMganVzdCBhZGRpbmcgYmFzaWMgR1BVIHN1cHBvcnQsIG1vcmUgd29yayBpcwpuZWVk
ZWQgb24gdGhlIGRldmZyZXEvb3BwIHNpZGUgdG8gYmUgc3VyZSBldmVyeXRoaW5nIHdvcmtzIGFu
ZCBpcwpwcm9wZXJseSBkZXNjcmliZWQuIEhlbmNlLCB0aGlzIHByb3Bvc2FsIGFpbXMgYXQgZGVz
Y3JpYmluZyB0aGUgSFcKYmxvY2sgb25seSwgbm90IGl0cyBoYWJpbGl0eSB0byBjaGFuZ2Ugdm9s
dGFnZXMvZnJlcXVlbmNpZXMuCgpUaGFua3MsCk1pcXXDqGwKCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JvY2tjaGlwL3B4MzAuZHRzaSB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hp
cC9weDMwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3B4MzAuZHRzaQppbmRl
eCBmOTk5ODhiMDgyNDQuLjc3ODBlNTMyZDMxYiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC9weDMwLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hp
cC9weDMwLmR0c2kKQEAgLTk5Nyw2ICs5OTcsMTkgQEAKIAkJc3RhdHVzID0gImRpc2FibGVkIjsK
IAl9OwogCisJZ3B1OiBncHVAZmY0MDAwMDAgeworCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHB4
MzAtbWFsaSIsICJhcm0sbWFsaS1iaWZyb3N0IjsKKwkJcmVnID0gPDB4MCAweGZmNDAwMDAwIDB4
MCAweDQwMDA+OworCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDUgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCQkgICAgIDxHSUNfU1BJIDQ2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8
R0lDX1NQSSA0NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJaW50ZXJydXB0LW5hbWVzID0gImdw
dSIsICJtbXUiLCAiam9iIjsKKwkJY2xvY2tzID0gPCZjcnUgU0NMS19HUFU+OworCQljbG9jay1u
YW1lcyA9ICJjbGtfbWFsaSI7CisJCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFBYMzBfUERfR1BV
PjsKKwkJc3RhdHVzID0gImRpc2FibGVkIjsKKwl9OworCiAJdm9wYjogdm9wQGZmNDYwMDAwIHsK
IAkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxweDMwLXZvcC1iaWciOwogCQlyZWcgPSA8MHgwIDB4
ZmY0NjAwMDAgMHgwIDB4ZWZjPjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
