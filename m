Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF069C6D2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768AA6E160;
	Mon, 26 Aug 2019 00:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACED6E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:50:59 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A88EDC0003;
 Sun, 25 Aug 2019 13:50:55 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 07/14] arm64: dts: renesas: r8a77995: Add CMM units
Date: Sun, 25 Aug 2019 15:51:47 +0200
Message-Id: <20190825135154.11488-8-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIEQzIGRldmljZSB0cmVlIGFuZCByZWZlcmVu
Y2UgdGhlbSBmcm9tCnRoZSBEaXNwbGF5IFVuaXQgdGhleSBhcmUgY29ubmVjdGVkIHRvLgoKV2hp
bGUgYXQgaXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2gg
dGhlIG9yZGVyaW5nCmZvdW5kIGluIG90aGVyIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kgfCAyMCArKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpCmluZGV4IDE4M2ZlZjg2Y2Y3Yy4uYjkxYTIwZmJi
YmM2IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaQpAQCAtOTkz
LDYgKzk5MywyMiBAQAogCQkJaW9tbXVzID0gPCZpcG1tdV92aTAgOT47CiAJCX07CiAKKwkJY21t
MDogY21tQGZlYTQwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5OTUi
OworCQkJcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNwZyBD
UEdfTU9EIDcxMT47CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTk1X1BEX0FMV0FZ
U19PTj47CisJCQlyZXNldHMgPSA8JmNwZyA3MTE+OworCQl9OworCisJCWNtbTE6IGNtbUBmZWE1
MDAwMCB7CisJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4YTc3OTk1IjsKKwkJCXJlZyA9
IDwwIDB4ZmVhNTAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTA+
OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk5NV9QRF9BTFdBWVNfT04+OworCQkJ
cmVzZXRzID0gPCZjcGcgNzEwPjsKKwkJfTsKKwogCQlkdTogZGlzcGxheUBmZWIwMDAwMCB7CiAJ
CQljb21wYXRpYmxlID0gInJlbmVzYXMsZHUtcjhhNzc5OTUiOwogCQkJcmVnID0gPDAgMHhmZWIw
MDAwMCAwIDB4NDAwMDA+OwpAQCAtMTAwMyw5ICsxMDE5LDExIEBACiAJCQljbG9jay1uYW1lcyA9
ICJkdS4wIiwgImR1LjEiOwogCQkJcmVzZXRzID0gPCZjcGcgNzI0PjsKIAkJCXJlc2V0LW5hbWVz
ID0gImR1LjAiOwotCQkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD47CiAJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwogCisJCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPjsKKwkJCWNt
bXMgPSA8JmNtbTAgJmNtbTE+OworCiAJCQlwb3J0cyB7CiAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CiAJCQkJI3NpemUtY2VsbHMgPSA8MD47Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
