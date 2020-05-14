Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3451D331C
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4906EB55;
	Thu, 14 May 2020 14:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12436EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:36:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 2E8ED2A2EE6
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 2/4] ARM: dts: ims53: Group port definitions for the
 dvi-converter
Date: Thu, 14 May 2020 16:36:10 +0200
Message-Id: <20200514143612.2094-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R3JvdXAgdGhlIHBvcnQgZGVmaW5pdGlvbnMgb2YgdGhlIGR2aS1jb252ZXJ0ZXIgaW4gYSAncG9y
dHMnIG5vZGUgdG8KbWFrZSBpdCBjb21wbGlhbnQgd2l0aCB0aGUgdGksdGZwNDEwIGJpbmRpbmcu
CgpTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIENhw7F1ZWxvIDxyaWNhcmRvLmNhbnVlbG9AY29sbGFi
b3JhLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXg1My1jeDkwMjAuZHRzIHwgMjUgKysr
KysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLWN4
OTAyMC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9pbXg1My1jeDkwMjAuZHRzCmluZGV4IDBhNDc1
YzIzNDA1NC4uY2ZiMTg4NDlhOTJiIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg1
My1jeDkwMjAuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLWN4OTAyMC5kdHMKQEAg
LTU5LDIzICs1OSwyNiBAQAogCX07CiAKIAlkdmktY29udmVydGVyIHsKLQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Ci0JCSNzaXplLWNlbGxzID0gPDA+OwogCQljb21wYXRpYmxlID0gInRpLHRmcDQx
MCI7CiAKLQkJcG9ydEAwIHsKLQkJCXJlZyA9IDwwPjsKKwkJcG9ydHMgeworCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQly
ZWcgPSA8MD47CiAKLQkJCXRmcDQxMF9pbjogZW5kcG9pbnQgewotCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmZGlzcGxheTBfb3V0PjsKKwkJCQl0ZnA0MTBfaW46IGVuZHBvaW50IHsKKwkJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZkaXNwbGF5MF9vdXQ+OworCQkJCX07CiAJCQl9OwotCQl9OwogCi0J
CXBvcnRAMSB7Ci0JCQlyZWcgPSA8MT47CisJCQlwb3J0QDEgeworCQkJCXJlZyA9IDwxPjsKIAot
CQkJdGZwNDEwX291dDogZW5kcG9pbnQgewotCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHZpX2Nv
bm5lY3Rvcl9pbj47CisJCQkJdGZwNDEwX291dDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5k
cG9pbnQgPSA8JmR2aV9jb25uZWN0b3JfaW4+OworCQkJCX07CiAJCQl9OwogCQl9OwogCX07Ci0t
IAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
