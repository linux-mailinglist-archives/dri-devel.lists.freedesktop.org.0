Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F614AD7B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 23:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94FF6E25A;
	Tue, 18 Jun 2019 21:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E7F6E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:43:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 5B2E8285674
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] ARM: dts: rockchip: Add RK3288 VOP gamma LUT address
Date: Tue, 18 Jun 2019 18:34:06 -0300
Message-Id: <20190618213406.7667-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618213406.7667-1-ezequiel@collabora.com>
References: <20190618213406.7667-1-ezequiel@collabora.com>
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
Ym9yYS5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgfCA2ICsrKystLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Jr
MzI4OC5kdHNpCmluZGV4IGFhMDE3YWJmNGY0Mi4uZGQ0MGMxODliMWYwIDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9yazMyODguZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9yazMy
ODguZHRzaQpAQCAtMTAyNSw3ICsxMDI1LDggQEAKIAogCXZvcGI6IHZvcEBmZjkzMDAwMCB7CiAJ
CWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMjg4LXZvcCI7Ci0JCXJlZyA9IDwweDAgMHhmZjkz
MDAwMCAweDAgMHgxOWM+OworCQlyZWcgPSA8MHgwIDB4ZmY5MzAwMDAgMHgwIDB4MTljPiwgPDB4
MCAweGZmOTMxMDAwIDB4MCAweDEwMDA+OworCQlyZWctbmFtZXMgPSAiYmFzZSIsICJsdXQiOwog
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTUgSVJRX1RZUEVfTEVWRUxfSElHSD47CiAJCWNsb2Nr
cyA9IDwmY3J1IEFDTEtfVk9QMD4sIDwmY3J1IERDTEtfVk9QMD4sIDwmY3J1IEhDTEtfVk9QMD47
CiAJCWNsb2NrLW5hbWVzID0gImFjbGtfdm9wIiwgImRjbGtfdm9wIiwgImhjbGtfdm9wIjsKQEAg
LTEwNzUsNyArMTA3Niw4IEBACiAKIAl2b3BsOiB2b3BAZmY5NDAwMDAgewogCQljb21wYXRpYmxl
ID0gInJvY2tjaGlwLHJrMzI4OC12b3AiOwotCQlyZWcgPSA8MHgwIDB4ZmY5NDAwMDAgMHgwIDB4
MTljPjsKKwkJcmVnID0gPDB4MCAweGZmOTQwMDAwIDB4MCAweDE5Yz4sIDwweDAgMHhmZjk0MTAw
MCAweDAgMHgxMDAwPjsKKwkJcmVnLW5hbWVzID0gImJhc2UiLCAibHV0IjsKIAkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+OwogCQljbG9ja3MgPSA8JmNydSBB
Q0xLX1ZPUDE+LCA8JmNydSBEQ0xLX1ZPUDE+LCA8JmNydSBIQ0xLX1ZPUDE+OwogCQljbG9jay1u
YW1lcyA9ICJhY2xrX3ZvcCIsICJkY2xrX3ZvcCIsICJoY2xrX3ZvcCI7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
