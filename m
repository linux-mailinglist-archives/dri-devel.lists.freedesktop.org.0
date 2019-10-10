Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35749D3199
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 21:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D8B6E40B;
	Thu, 10 Oct 2019 19:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2590F6E40B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 19:44:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 2DE062909A7
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/3] ARM: dts: rockchip: Add RK3288 VOP gamma LUT address
Date: Thu, 10 Oct 2019 16:43:51 -0300
Message-Id: <20191010194351.17940-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010194351.17940-1-ezequiel@collabora.com>
References: <20191010194351.17940-1-ezequiel@collabora.com>
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
bS5vcmc+Ci0tLQpDaGFuZ2VzIGZyb20gdjQ6CiogTm9uZS4KQ2hhbmdlcyBmcm9tIHYzOgoqIE5v
bmUuCkNoYW5nZXMgZnJvbSB2MjoKKiBOb25lLgpDaGFuZ2VzIGZyb20gdjE6CiogRHJvcCByZWct
bmFtZXMsIGFzIHN1Z2dlc3RlZCBieSBEb3VnLgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4
OC5kdHNpIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpIGIvYXJj
aC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kKaW5kZXggY2M4OTNlMTU0ZmU1Li5jNmZjNjMzYWNl
ODAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpCisrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpCkBAIC0xMDIzLDcgKzEwMjMsNyBAQAogCiAJdm9wYjog
dm9wQGZmOTMwMDAwIHsKIAkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMyODgtdm9wIjsKLQkJ
cmVnID0gPDB4MCAweGZmOTMwMDAwIDB4MCAweDE5Yz47CisJCXJlZyA9IDwweDAgMHhmZjkzMDAw
MCAweDAgMHgxOWM+LCA8MHgwIDB4ZmY5MzEwMDAgMHgwIDB4MTAwMD47CiAJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJY2xvY2tzID0gPCZjcnUgQUNM
S19WT1AwPiwgPCZjcnUgRENMS19WT1AwPiwgPCZjcnUgSENMS19WT1AwPjsKIAkJY2xvY2stbmFt
ZXMgPSAiYWNsa192b3AiLCAiZGNsa192b3AiLCAiaGNsa192b3AiOwpAQCAtMTA3Myw3ICsxMDcz
LDcgQEAKIAogCXZvcGw6IHZvcEBmZjk0MDAwMCB7CiAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAs
cmszMjg4LXZvcCI7Ci0JCXJlZyA9IDwweDAgMHhmZjk0MDAwMCAweDAgMHgxOWM+OworCQlyZWcg
PSA8MHgwIDB4ZmY5NDAwMDAgMHgwIDB4MTljPiwgPDB4MCAweGZmOTQxMDAwIDB4MCAweDEwMDA+
OwogCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTYgSVJRX1RZUEVfTEVWRUxfSElHSD47CiAJCWNs
b2NrcyA9IDwmY3J1IEFDTEtfVk9QMT4sIDwmY3J1IERDTEtfVk9QMT4sIDwmY3J1IEhDTEtfVk9Q
MT47CiAJCWNsb2NrLW5hbWVzID0gImFjbGtfdm9wIiwgImRjbGtfdm9wIiwgImhjbGtfdm9wIjsK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
