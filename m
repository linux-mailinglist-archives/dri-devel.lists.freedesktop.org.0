Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7E3857C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6D589B12;
	Fri,  7 Jun 2019 07:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4529489354
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:43 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A35DB20016;
 Thu,  6 Jun 2019 14:21:39 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 03/20] dt-bindings: display, renesas,
 du: Update 'vsps' in example
Date: Thu,  6 Jun 2019 16:22:03 +0200
Message-Id: <20190606142220.1392-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
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

VXBkYXRlIHRoZSAndnNwcycgcHJvcGVydHkgc3RydWN0dXJlIGluIHRoZSBkb2N1bWVudGF0aW9u
IGV4YW1wbGUgdG8KcmVmbGVjdCB3aGF0J3MgYWN0dWFsbHkgaW1wbGVtZW50ZWQgaW4gdGhlIGRl
dmljZSB0cmVlIHNvdXJjZXMuCgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbyty
ZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0CmluZGV4IDEwMDExNGVmMTFkNS4u
MjYyMDQ3MDUzZDMxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dApAQCAtOTIsNyArOTIsNyBAQCBFeGFtcGxl
OiBSOEE3Nzk1IChSLUNhciBIMykgRVMyLjAgRFUKIAkJCSA8JmNwZyBDUEdfTU9EIDcyMj4sCiAJ
CQkgPCZjcGcgQ1BHX01PRCA3MjE+OwogCQljbG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEiLCAi
ZHUuMiIsICJkdS4zIjsKLQkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD4sIDwmdnNwZDIg
MD4sIDwmdnNwZDAgMT47CisJCXZzcHMgPSA8JnZzcGQwIDAgJnZzcGQxIDAgJnZzcGQyICAmdnNw
ZDAgMT47CiAJCWNtbXMgPSA8JmNtbTAgJmNtbTEgJmNtbTIgJmNtbTM+OwogCiAJCXBvcnRzIHsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
