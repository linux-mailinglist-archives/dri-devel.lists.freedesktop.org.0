Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFB761B17
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A23D89B51;
	Mon,  8 Jul 2019 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A5989D4B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:10 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5DA04C000C;
 Sat,  6 Jul 2019 14:07:07 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 11/19] arm64: dts: renesas: r8a77965: Add CMM units
Date: Sat,  6 Jul 2019 16:07:38 +0200
Message-Id: <20190706140746.29132-12-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIE0zLU4gZGV2aWNlIHRyZWUgYW5kIHJlZmVy
ZW5jZSB0aGVtIGZyb20KdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCgpT
aWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0t
LQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kgfCAyNSArKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpCmluZGV4IGI3MDFhZWI0ZjQzOC4u
YWFkOWVhNjdjMzc5IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5NjUuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRz
aQpAQCAtMjMwNyw2ICsyMzA3LDMwIEBACiAJCQlyZXNldHMgPSA8JmNwZyA2MDI+OwogCQl9Owog
CisJCWNtbTA6IGNtbUBmZWE0MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1n
ZW4zLWNtbSI7CisJCQlyZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9
IDwmY3BnIENQR19NT0QgNzExPjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NjVf
UERfQUxXQVlTX09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47CisJCX07CisKKwkJY21tMTog
Y21tQGZlYTUwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLWdlbjMtY21tIjsK
KwkJCXJlZyA9IDwwIDB4ZmVhNTAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcgQ1BH
X01PRCA3MTA+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2NV9QRF9BTFdBWVNf
T04+OworCQkJcmVzZXRzID0gPCZjcGcgNzEwPjsKKwkJfTsKKworCQljbW0zOiBjbW1AZmVhNzAw
MDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJjYXItZ2VuMy1jbW0iOworCQkJcmVnID0g
PDAgMHhmZWE3MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcwOD47
CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTY1X1BEX0FMV0FZU19PTj47CisJCQly
ZXNldHMgPSA8JmNwZyA3MDg+OworCQl9OworCiAJCWNzaTIwOiBjc2kyQGZlYTgwMDAwIHsKIAkJ
CWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2NS1jc2kyIjsKIAkJCXJlZyA9IDwwIDB4ZmVh
ODAwMDAgMCAweDEwMDAwPjsKQEAgLTI0NTcsNiArMjQ4MSw3IEBACiAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwogCiAJCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMCAxPjsK
KwkJCWNtbXMgPSA8JmNtbTAgJmNtbTEgJmNtbTM+OwogCiAJCQlwb3J0cyB7CiAJCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
