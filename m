Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CA344DA9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 18:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC816E0C2;
	Mon, 22 Mar 2021 17:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC9C89B55
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 17:45:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 0238C80330;
 Mon, 22 Mar 2021 18:45:09 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/gud: Remove unneeded semicolon
Date: Mon, 22 Mar 2021 18:44:34 +0100
Message-Id: <20210322174434.58849-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210322174434.58849-1-noralf@tronnes.org>
References: <20210322174434.58849-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=QyXUC8HyAAAA:8 a=SJz97ENfAAAA:8
 a=DmnpHc4pua4SWowHEBAA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cgpkcml2ZXJzL2dwdS9kcm0v
Z3VkL2d1ZF9jb25uZWN0b3IuYzo2NTg6Mi0zOiBVbm5lZWRlZCBzZW1pY29sb24KZHJpdmVycy9n
cHUvZHJtL2d1ZC9ndWRfY29ubmVjdG9yLmM6MTg2OjItMzogVW5uZWVkZWQgc2VtaWNvbG9uCmRy
aXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Rydi5jOjUxMTozLTQ6IFVubmVlZGVkIHNlbWljb2xvbgpk
cml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmM6MTI3OjQtNTogVW5uZWVkZWQgc2VtaWNvbG9u
CgogUmVtb3ZlIHVubmVlZGVkIHNlbWljb2xvbi4KCkdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2Nj
aW5lbGxlL21pc2Mvc2VtaWNvbG9uLmNvY2NpCgpGaXhlczogNDBlMWE3MGI0YWVkICgiZHJtOiBB
ZGQgR1VEIFVTQiBEaXNwbGF5IGRyaXZlciIpClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+CltmaXggc3ViamVjdCBhbmQgc3F1YXNoIDMgcGVyIGZpbGUgcGF0Y2hlc10KU2ln
bmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2d1ZC9ndWRfY29ubmVjdG9yLmMgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9ndWQvZ3VkX2Rydi5jICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlw
ZS5jICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25uZWN0b3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Nvbm5lY3Rvci5jCmluZGV4IDlhZTVhMDAyMDQ0
OS4uYWUwNTExMzNlMDUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25u
ZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25uZWN0b3IuYwpAQCAtMTgz
LDcgKzE4Myw3IEBAIHN0YXRpYyBpbnQgZ3VkX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwKIAlkZWZhdWx0OgogCQlyZXQgPSBjb25uZWN0b3Jfc3RhdHVz
X3Vua25vd247CiAJCWJyZWFrOwotCX07CisJfQogCiAJaWYgKHN0YXR1cyAmIEdVRF9DT05ORUNU
T1JfU1RBVFVTX0NIQU5HRUQpCiAJCWNvbm5lY3Rvci0+ZXBvY2hfY291bnRlciArPSAxOwpAQCAt
NjU1LDcgKzY1NSw3IEBAIHN0YXRpYyBpbnQgZ3VkX2Nvbm5lY3Rvcl9jcmVhdGUoc3RydWN0IGd1
ZF9kZXZpY2UgKmdkcm0sIHVuc2lnbmVkIGludCBpbmRleCwKIAlkZWZhdWx0OiAvKiBmdXR1cmUg
dHlwZXMgKi8KIAkJY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfVVNCOwogCQli
cmVhazsKLQl9OworCX0KIAogCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZn
dWRfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRy
bSwgY29ubmVjdG9yLCAmZ3VkX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
Z3VkL2d1ZF9kcnYuYwppbmRleCA3Mjc2MTIxMjRkZDAuLmU4YjY3MmRjOTgzMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2d1
ZC9ndWRfZHJ2LmMKQEAgLTUwOCw3ICs1MDgsNyBAQCBzdGF0aWMgaW50IGd1ZF9wcm9iZShzdHJ1
Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgKmlkKQog
CQljYXNlIERSTV9GT1JNQVRfWFJHQjg4ODg6CiAJCQl4cmdiODg4OF9zdXBwb3J0ZWQgPSB0cnVl
OwogCQkJYnJlYWs7Ci0JCX07CisJCX0KIAogCQlmbXRfYnVmX3NpemUgPSBkcm1fZm9ybWF0X2lu
Zm9fbWluX3BpdGNoKGluZm8sIDAsIGRybS0+bW9kZV9jb25maWcubWF4X3dpZHRoKSAqCiAJCQkg
ICAgICAgZHJtLT5tb2RlX2NvbmZpZy5tYXhfaGVpZ2h0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2d1ZC9ndWRfcGlwZS5jIGIvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jCmlu
ZGV4IGFiOTZhZmI5NDI0MS4uMmY4M2FiNmI4ZTYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZ3VkL2d1ZF9waXBlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jCkBA
IC0xMjQsNyArMTI0LDcgQEAgc3RhdGljIHNpemVfdCBndWRfeHJnYjg4ODhfdG9fY29sb3IodTgg
KmRzdCwgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWEKIAkJCWRlZmF1bHQ6CiAJ
CQkJV0FSTl9PTl9PTkNFKDEpOwogCQkJCXJldHVybiBsZW47Ci0JCQl9OworCQkJfQogCiAJCQkq
YmxvY2sgfD0gcGl4IDw8IHBpeHNoaWZ0OwogCQl9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
