Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D38C2985
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 00:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D846E4E8;
	Mon, 30 Sep 2019 22:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223B6E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 22:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id F04CB283BA6
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/5] ARM: dts: rockchip: Add RK3288 VOP gamma LUT address
Date: Mon, 30 Sep 2019 19:28:01 -0300
Message-Id: <20190930222802.32088-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190930222802.32088-1-ezequiel@collabora.com>
References: <20190930222802.32088-1-ezequiel@collabora.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UkszMjg4IFNvQyBWT1BzIGhhdmUgb3B0aW9uYWwgc3VwcG9ydCBHYW1tYSBMVVQgc2V0dGluZywK
d2hpY2ggcmVxdWlyZXMgc3BlY2lmeWluZyB0aGUgR2FtbWEgTFVUIGFkZHJlc3MgaW4gdGhlIGRl
dmljZXRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxh
Ym9yYS5jb20+ClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1
bS5vcmc+Ci0tLQpDaGFuZ2VzIGZyb20gdjI6CiogTm9uZS4KQ2hhbmdlcyBmcm9tIHYxOgoqIERy
b3AgcmVnLW5hbWVzLCBhcyBzdWdnZXN0ZWQgYnkgRG91Zy4KLS0tCiBhcmNoL2FybS9ib290L2R0
cy9yazMyODguZHRzaSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpCmluZGV4IGNjODkzZTE1NGZlNS4uYzZm
YzYzM2FjZTgwIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRzaQorKysg
Yi9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRzaQpAQCAtMTAyMyw3ICsxMDIzLDcgQEAKIAog
CXZvcGI6IHZvcEBmZjkzMDAwMCB7CiAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMjg4LXZv
cCI7Ci0JCXJlZyA9IDwweDAgMHhmZjkzMDAwMCAweDAgMHgxOWM+OworCQlyZWcgPSA8MHgwIDB4
ZmY5MzAwMDAgMHgwIDB4MTljPiwgPDB4MCAweGZmOTMxMDAwIDB4MCAweDEwMDA+OwogCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMTUgSVJRX1RZUEVfTEVWRUxfSElHSD47CiAJCWNsb2NrcyA9IDwm
Y3J1IEFDTEtfVk9QMD4sIDwmY3J1IERDTEtfVk9QMD4sIDwmY3J1IEhDTEtfVk9QMD47CiAJCWNs
b2NrLW5hbWVzID0gImFjbGtfdm9wIiwgImRjbGtfdm9wIiwgImhjbGtfdm9wIjsKQEAgLTEwNzMs
NyArMTA3Myw3IEBACiAKIAl2b3BsOiB2b3BAZmY5NDAwMDAgewogCQljb21wYXRpYmxlID0gInJv
Y2tjaGlwLHJrMzI4OC12b3AiOwotCQlyZWcgPSA8MHgwIDB4ZmY5NDAwMDAgMHgwIDB4MTljPjsK
KwkJcmVnID0gPDB4MCAweGZmOTQwMDAwIDB4MCAweDE5Yz4sIDwweDAgMHhmZjk0MTAwMCAweDAg
MHgxMDAwPjsKIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+
OwogCQljbG9ja3MgPSA8JmNydSBBQ0xLX1ZPUDE+LCA8JmNydSBEQ0xLX1ZPUDE+LCA8JmNydSBI
Q0xLX1ZPUDE+OwogCQljbG9jay1uYW1lcyA9ICJhY2xrX3ZvcCIsICJkY2xrX3ZvcCIsICJoY2xr
X3ZvcCI7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
