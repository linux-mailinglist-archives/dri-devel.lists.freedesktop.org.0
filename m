Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B314B3853A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBC689A60;
	Fri,  7 Jun 2019 07:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3A38961E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:08 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 745A42001D;
 Thu,  6 Jun 2019 14:22:03 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 12/20] arm64: dts: renesas: r8a77990: Add CMM units
Date: Thu,  6 Jun 2019 16:22:12 +0200
Message-Id: <20190606142220.1392-13-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
dC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpCmluZGV4IGE2OWZhYTYwZWE0ZC4uODc0NTNkZGJj
N2UzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQpAQCAtMTY1
Niw2ICsxNjU2LDIyIEBACiAJCQlpb21tdXMgPSA8JmlwbW11X3ZpMCA5PjsKIAkJfTsKIAorCQlj
bW0wOiBjbW1AZmVhNDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1nZW4zIjsK
KwkJCXJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcgQ1BH
X01PRCA3MTE+OworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk5MF9QRF9BTFdBWVNf
T04+OworCQkJcmVzZXRzID0gPCZjcGcgNzExPjsKKwkJfTsKKworCQljbW0xOiBjbW1AZmVhNTAw
MDAgeworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1nZW4zIjsKKwkJCXJlZyA9IDwwIDB4
ZmVhNTAwMDAgMCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTA+OworCQkJ
cG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk5MF9QRF9BTFdBWVNfT04+OworCQkJcmVzZXRz
ID0gPCZjcGcgNzEwPjsKKwkJfTsKKwogCQljc2k0MDogY3NpMkBmZWFhMDAwMCB7CiAJCQljb21w
YXRpYmxlID0gInJlbmVzYXMscjhhNzc5OTAtY3NpMiIsICJyZW5lc2FzLHJjYXItZ2VuMy1jc2ky
IjsKIAkJCXJlZyA9IDwwIDB4ZmVhYTAwMDAgMCAweDEwMDAwPjsKQEAgLTE2OTUsOSArMTcxMSwx
MSBAQAogCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MjQ+LAogCQkJCSA8JmNwZyBDUEdfTU9E
IDcyMz47CiAJCQljbG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEiOwotCQkJdnNwcyA9IDwmdnNw
ZDAgMCAmdnNwZDEgMD47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCisJCQl2c3BzID0gPCZ2
c3BkMCAwICZ2c3BkMSAwPjsKKwkJCWNtbXMgPSA8JmNtbTAgJmNtbTE+OworCiAJCQlwb3J0cyB7
CiAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCQkJI3NpemUtY2VsbHMgPSA8MD47Ci0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
