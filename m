Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5261B06
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E6189A4A;
	Mon,  8 Jul 2019 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FF989AFF
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:09 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 68E9BC0005;
 Sat,  6 Jul 2019 14:07:02 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 09/19] arm64: dts: renesas: r8a7796: Add CMM units
Date: Sat,  6 Jul 2019 16:07:36 +0200
Message-Id: <20190706140746.29132-10-jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, Geert Uytterhoeven <geert+renesas@glider.be>,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIE0zLVcgZGV2aWNlIHRyZWUgYW5kIHJlZmVy
ZW5jZSB0aGVtIGZyb20KdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCgpS
ZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9u
ZGkub3JnPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2LmR0c2kgfCAy
NSArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2LmR0c2kKaW5kZXggZDVlMmY0
YWY4M2E0Li4zZjdmZTM3ZGI1ZTUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3Nzk2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OTYuZHRzaQpAQCAtMjU5OSw2ICsyNTk5LDMwIEBACiAJCQlyZW5lc2FzLGZjcCA9IDwmZmNwdmkw
PjsKIAkJfTsKIAorCQljbW0wOiBjbW1AZmVhNDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHJjYXItZ2VuMy1jbW0iOworCQkJcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47CisJ
CQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNj
IFI4QTc3OTZfUERfQUxXQVlTX09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47CisJCX07CisK
KwkJY21tMTogY21tQGZlYTUwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLWdl
bjMtY21tIjsKKwkJCXJlZyA9IDwwIDB4ZmVhNTAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0g
PCZjcGcgQ1BHX01PRCA3MTA+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BE
X0FMV0FZU19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MTA+OworCQl9OworCisJCWNtbTI6IGNt
bUBmZWE2MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW4zLWNtbSI7CisJ
CQlyZWcgPSA8MCAweGZlYTYwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNzA5PjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9BTFdBWVNfT04+
OworCQkJcmVzZXRzID0gPCZjcGcgNzA5PjsKKwkJfTsKKwogCQljc2kyMDogY3NpMkBmZWE4MDAw
MCB7CiAJCQljb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc5Ni1jc2kyIjsKIAkJCXJlZyA9IDww
IDB4ZmVhODAwMDAgMCAweDEwMDAwPjsKQEAgLTI3NTIsNiArMjc3Niw3IEBACiAJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwogCiAJCQl2c3BzID0gPCZ2c3BkMCAmdnNwZDEgJnZzcGQyPjsKKwkJCWNt
bXMgPSA8JmNtbTAgJmNtbTEgJmNtbTI+OwogCiAJCQlwb3J0cyB7CiAJCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
