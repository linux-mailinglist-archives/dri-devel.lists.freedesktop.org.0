Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DF3856D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5089B29;
	Fri,  7 Jun 2019 07:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD8589354
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:11 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1F96E20019;
 Thu,  6 Jun 2019 14:22:06 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 13/20] arm64: dts: renesas: r8a77995: Add CMM units
Date: Thu,  6 Jun 2019 16:22:13 +0200
Message-Id: <20190606142220.1392-14-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB1bml0cyB0byBSZW5lc2FzIFItQ2FyIEQzIGRldmljZSB0cmVlIGFuZCByZWZlcmVu
Y2UgdGhlbSBmcm9tCnRoZSBEaXNwbGF5IFVuaXQgdGhleSBhcmUgY29ubmVjdGVkIHRvLgoKV2hp
bGUgYXQgaXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2gg
dGhlIG9yZGVyaW5nCmZvdW5kIGluIG90aGVyIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kgfCAyMCArKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpCmluZGV4IDViZjNhZjI0NmUxNC4uYzUyZDczMDY4
MzA0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaQpAQCAtOTkz
LDYgKzk5MywyMiBAQAogCQkJaW9tbXVzID0gPCZpcG1tdV92aTAgOT47CiAJCX07CiAKKwkJY21t
MDogY21tQGZlYTQwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tZ2VuMyI7CisJ
CQlyZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNzExPjsKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5OTVfUERfQUxXQVlTX09O
PjsKKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47CisJCX07CisKKwkJY21tMTogY21tQGZlYTUwMDAw
IHsKKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tZ2VuMyI7CisJCQlyZWcgPSA8MCAweGZl
YTUwMDAwIDAgMHgxMDAwPjsKKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzEwPjsKKwkJCXBv
d2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5OTVfUERfQUxXQVlTX09OPjsKKwkJCXJlc2V0cyA9
IDwmY3BnIDcxMD47CisJCX07CisKIAkJZHU6IGRpc3BsYXlAZmViMDAwMDAgewogCQkJY29tcGF0
aWJsZSA9ICJyZW5lc2FzLGR1LXI4YTc3OTk1IjsKIAkJCXJlZyA9IDwwIDB4ZmViMDAwMDAgMCAw
eDgwMDAwPjsKQEAgLTEwMDEsOSArMTAxNywxMSBAQAogCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01P
RCA3MjQ+LAogCQkJCSA8JmNwZyBDUEdfTU9EIDcyMz47CiAJCQljbG9jay1uYW1lcyA9ICJkdS4w
IiwgImR1LjEiOwotCQkJdnNwcyA9IDwmdnNwZDAgMCAmdnNwZDEgMD47CiAJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwogCisJCQl2c3BzID0gPCZ2c3BkMCAwICZ2c3BkMSAwPjsKKwkJCWNtbXMgPSA8
JmNtbTAgJmNtbTE+OworCiAJCQlwb3J0cyB7CiAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJ
CQkJI3NpemUtY2VsbHMgPSA8MD47Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
