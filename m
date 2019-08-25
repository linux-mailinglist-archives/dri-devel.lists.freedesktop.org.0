Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF69C6AE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA14E6E152;
	Mon, 26 Aug 2019 00:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859ED6E0FE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:50:53 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 268F8C0006;
 Sun, 25 Aug 2019 13:50:48 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 05/14] arm64: dts: renesas: r8a77965: Add CMM units
Date: Sun, 25 Aug 2019 15:51:45 +0200
Message-Id: <20190825135154.11488-6-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIE0zLU4gZGV2aWNlIHRyZWUgYW5kIHJlZmVy
ZW5jZSB0aGVtIGZyb20KdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCgpT
aWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0t
LQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kgfCAyNSArKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpCmluZGV4IDRhZTE2MzIyMGY2MC4u
OGNmMGQwNDkyMDNkIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5NjUuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRz
aQpAQCAtMjMyMCw2ICsyMzIwLDMwIEBACiAJCQlyZXNldHMgPSA8JmNwZyA2MTE+OwogCQl9Owog
CisJCWNtbTA6IGNtbUBmZWE0MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4
YTc3OTY1IjsKKwkJCXJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0g
PCZjcGcgQ1BHX01PRCA3MTE+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2NV9Q
RF9BTFdBWVNfT04+OworCQkJcmVzZXRzID0gPCZjcGcgNzExPjsKKwkJfTsKKworCQljbW0xOiBj
bW1AZmVhNTAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk2NSI7CisJ
CQlyZWcgPSA8MCAweGZlYTUwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNzEwPjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NjVfUERfQUxXQVlTX09O
PjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMD47CisJCX07CisKKwkJY21tMzogY21tQGZlYTcwMDAw
IHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5NjUiOworCQkJcmVnID0gPDAg
MHhmZWE3MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcwOD47CisJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTY1X1BEX0FMV0FZU19PTj47CisJCQlyZXNl
dHMgPSA8JmNwZyA3MDg+OworCQl9OworCiAJCWNzaTIwOiBjc2kyQGZlYTgwMDAwIHsKIAkJCWNv
bXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2NS1jc2kyIjsKIAkJCXJlZyA9IDwwIDB4ZmVhODAw
MDAgMCAweDEwMDAwPjsKQEAgLTI0NzAsNiArMjQ5NCw3IEBACiAJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOwogCiAJCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMCAxPjsKKwkJ
CWNtbXMgPSA8JmNtbTAgJmNtbTEgJmNtbTM+OwogCiAJCQlwb3J0cyB7CiAJCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
