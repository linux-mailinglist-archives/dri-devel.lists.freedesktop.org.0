Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F19C6BA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912B9898FA;
	Mon, 26 Aug 2019 00:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE50B6E102
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:50:56 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6F51AC0007;
 Sun, 25 Aug 2019 13:50:52 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 06/14] arm64: dts: renesas: r8a77990: Add CMM units
Date: Sun, 25 Aug 2019 15:51:46 +0200
Message-Id: <20190825135154.11488-7-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIEUzIGRldmljZSB0cmVlIGFuZCByZWZlcmVu
Y2UgdGhlbSBmcm9tCnRoZSBEaXNwbGF5IFVuaXQgdGhleSBhcmUgY29ubmVjdGVkIHRvLgoKV2hp
bGUgYXQgaXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2gg
dGhlIG9yZGVyaW5nCmZvdW5kIGluIG90aGVyIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kgfCAyMCArKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpCmluZGV4IDQ1NTk1NGMzZDk4ZS4uODllYmU2ZjU2
NWFmIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQpAQCAtMTcy
Nyw2ICsxNzI3LDIyIEBACiAJCQlpb21tdXMgPSA8JmlwbW11X3ZpMCA5PjsKIAkJfTsKIAorCQlj
bW0wOiBjbW1AZmVhNDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk5
MCI7CisJCQlyZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3Bn
IENQR19NT0QgNzExPjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5OTBfUERfQUxX
QVlTX09OPjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47CisJCX07CisKKwkJY21tMTogY21tQGZl
YTUwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5OTAiOworCQkJcmVn
ID0gPDAgMHhmZWE1MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcx
MD47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTkwX1BEX0FMV0FZU19PTj47CisJ
CQlyZXNldHMgPSA8JmNwZyA3MTA+OworCQl9OworCiAJCWNzaTQwOiBjc2kyQGZlYWEwMDAwIHsK
IAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk5MC1jc2kyIjsKIAkJCXJlZyA9IDwwIDB4
ZmVhYTAwMDAgMCAweDEwMDAwPjsKQEAgLTE3NjgsOSArMTc4NCwxMSBAQAogCQkJY2xvY2stbmFt
ZXMgPSAiZHUuMCIsICJkdS4xIjsKIAkJCXJlc2V0cyA9IDwmY3BnIDcyND47CiAJCQlyZXNldC1u
YW1lcyA9ICJkdS4wIjsKLQkJCXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+OwogCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKIAorCQkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD47CisJ
CQljbW1zID0gPCZjbW0wICZjbW0xPjsKKwogCQkJcG9ydHMgewogCQkJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+OwogCQkJCSNzaXplLWNlbGxzID0gPDA+OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
