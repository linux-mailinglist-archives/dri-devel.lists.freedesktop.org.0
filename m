Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B061B0D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B3389A67;
	Mon,  8 Jul 2019 07:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D7D6E56D
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:15 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EFB4DC0002;
 Sat,  6 Jul 2019 14:07:11 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 13/19] arm64: dts: renesas: r8a77995: Add CMM units
Date: Sat,  6 Jul 2019 16:07:40 +0200
Message-Id: <20190706140746.29132-14-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIEQzIGRldmljZSB0cmVlIGFuZCByZWZlcmVu
Y2UgdGhlbSBmcm9tCnRoZSBEaXNwbGF5IFVuaXQgdGhleSBhcmUgY29ubmVjdGVkIHRvLgoKV2hp
bGUgYXQgaXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2gg
dGhlIG9yZGVyaW5nCmZvdW5kIGluIG90aGVyIFNvQ3MuCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kgfCAyMCArKysrKysrKysrKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpCmluZGV4IDQ5YTExYjRmNTViZC4u
MTY2OTc0MGJmYTI4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5OTUuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRz
aQpAQCAtOTkzLDYgKzk5MywyMiBAQAogCQkJaW9tbXVzID0gPCZpcG1tdV92aTAgOT47CiAJCX07
CiAKKwkJY21tMDogY21tQGZlYTQwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2Fy
LWdlbjMtY21tIjsKKwkJCXJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tz
ID0gPCZjcGcgQ1BHX01PRCA3MTE+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk5
NV9QRF9BTFdBWVNfT04+OworCQkJcmVzZXRzID0gPCZjcGcgNzExPjsKKwkJfTsKKworCQljbW0x
OiBjbW1AZmVhNTAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJjYXItZ2VuMy1jbW0i
OworCQkJcmVnID0gPDAgMHhmZWE1MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBD
UEdfTU9EIDcxMD47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTk1X1BEX0FMV0FZ
U19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MTA+OworCQl9OworCiAJCWR1OiBkaXNwbGF5QGZl
YjAwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxkdS1yOGE3Nzk5NSI7CiAJCQlyZWcg
PSA8MCAweGZlYjAwMDAwIDAgMHg4MDAwMD47CkBAIC0xMDAxLDkgKzEwMTcsMTEgQEAKIAkJCWNs
b2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwKIAkJCQkgPCZjcGcgQ1BHX01PRCA3MjM+OwogCQkJ
Y2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIjsKLQkJCXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZz
cGQxIDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAorCQkJdnNwcyA9IDwmdnNwZDAgMD4s
IDwmdnNwZDEgMD47CisJCQljbW1zID0gPCZjbW0wICZjbW0xPjsKKwogCQkJcG9ydHMgewogCQkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJCSNzaXplLWNlbGxzID0gPDA+OwotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
