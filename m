Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33764D03BB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403F66E8AE;
	Tue,  8 Oct 2019 23:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D871C6E8AE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 23:01:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id C0F9D28D5F1
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] ARM: dts: rockchip: Add RK3288 VOP gamma LUT address
Date: Tue,  8 Oct 2019 20:00:38 -0300
Message-Id: <20191008230038.24037-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191008230038.24037-1-ezequiel@collabora.com>
References: <20191008230038.24037-1-ezequiel@collabora.com>
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
bS5vcmc+Ci0tLQpDaGFuZ2VzIGZyb20gdjM6CiogTm9uZS4KQ2hhbmdlcyBmcm9tIHYyOgoqIE5v
bmUuCkNoYW5nZXMgZnJvbSB2MToKKiBEcm9wIHJlZy1uYW1lcywgYXMgc3VnZ2VzdGVkIGJ5IERv
dWcuCi0tLQogYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRz
aQppbmRleCBjYzg5M2UxNTRmZTUuLmM2ZmM2MzNhY2U4MCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvcmszMjg4LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kK
QEAgLTEwMjMsNyArMTAyMyw3IEBACiAKIAl2b3BiOiB2b3BAZmY5MzAwMDAgewogCQljb21wYXRp
YmxlID0gInJvY2tjaGlwLHJrMzI4OC12b3AiOwotCQlyZWcgPSA8MHgwIDB4ZmY5MzAwMDAgMHgw
IDB4MTljPjsKKwkJcmVnID0gPDB4MCAweGZmOTMwMDAwIDB4MCAweDE5Yz4sIDwweDAgMHhmZjkz
MTAwMCAweDAgMHgxMDAwPjsKIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE1IElSUV9UWVBFX0xF
VkVMX0hJR0g+OwogCQljbG9ja3MgPSA8JmNydSBBQ0xLX1ZPUDA+LCA8JmNydSBEQ0xLX1ZPUDA+
LCA8JmNydSBIQ0xLX1ZPUDA+OwogCQljbG9jay1uYW1lcyA9ICJhY2xrX3ZvcCIsICJkY2xrX3Zv
cCIsICJoY2xrX3ZvcCI7CkBAIC0xMDczLDcgKzEwNzMsNyBAQAogCiAJdm9wbDogdm9wQGZmOTQw
MDAwIHsKIAkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMyODgtdm9wIjsKLQkJcmVnID0gPDB4
MCAweGZmOTQwMDAwIDB4MCAweDE5Yz47CisJCXJlZyA9IDwweDAgMHhmZjk0MDAwMCAweDAgMHgx
OWM+LCA8MHgwIDB4ZmY5NDEwMDAgMHgwIDB4MTAwMD47CiAJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSAxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJY2xvY2tzID0gPCZjcnUgQUNMS19WT1AxPiwg
PCZjcnUgRENMS19WT1AxPiwgPCZjcnUgSENMS19WT1AxPjsKIAkJY2xvY2stbmFtZXMgPSAiYWNs
a192b3AiLCAiZGNsa192b3AiLCAiaGNsa192b3AiOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
