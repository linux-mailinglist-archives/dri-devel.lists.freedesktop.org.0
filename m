Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A267E61B00
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E98C89A16;
	Mon,  8 Jul 2019 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D146E375
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:12 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A3159C0004;
 Sat,  6 Jul 2019 14:07:09 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 12/19] arm64: dts: renesas: r8a77990: Add CMM units
Date: Sat,  6 Jul 2019 16:07:39 +0200
Message-Id: <20190706140746.29132-13-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIEUzIGRldmljZSB0cmVlIGFuZCByZWZlcmVu
Y2UgdGhlbSBmcm9tCnRoZSBEaXNwbGF5IFVuaXQgdGhleSBhcmUgY29ubmVjdGVkIHRvLgoKV2hp
bGUgYXQgaXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2gg
dGhlIG9yZGVyaW5nCmZvdW5kIGluIG90aGVyIFNvQ3MuCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kgfCAyMCArKysrKysrKysrKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpCmluZGV4IDc5ZGI1NDQxYjdlNy4u
Njc0M2QxYmQyNDcwIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5OTAuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRz
aQpAQCAtMTcyNSw2ICsxNzI1LDIyIEBACiAJCQlpb21tdXMgPSA8JmlwbW11X3ZpMCA5PjsKIAkJ
fTsKIAorCQljbW0wOiBjbW1AZmVhNDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJj
YXItZ2VuMy1jbW0iOworCQkJcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47CisJCQljbG9j
a3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3
OTkwX1BEX0FMV0FZU19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MTE+OworCQl9OworCisJCWNt
bTE6IGNtbUBmZWE1MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW4zLWNt
bSI7CisJCQlyZWcgPSA8MCAweGZlYTUwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3Bn
IENQR19NT0QgNzEwPjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5OTBfUERfQUxX
QVlTX09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMD47CisJCX07CisKIAkJY3NpNDA6IGNzaTJA
ZmVhYTAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OTkwLWNzaTIiOwogCQkJ
cmVnID0gPDAgMHhmZWFhMDAwMCAwIDB4MTAwMDA+OwpAQCAtMTc2NCw5ICsxNzgwLDExIEBACiAJ
CQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcyND4sCiAJCQkJIDwmY3BnIENQR19NT0QgNzIzPjsK
IAkJCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSI7Ci0JCQl2c3BzID0gPCZ2c3BkMCAwPiwg
PCZ2c3BkMSAwPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAKKwkJCXZzcHMgPSA8JnZzcGQw
IDA+LCA8JnZzcGQxIDA+OworCQkJY21tcyA9IDwmY21tMCAmY21tMT47CisKIAkJCXBvcnRzIHsK
IAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
