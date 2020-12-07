Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BE2D262E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220F6E9A4;
	Tue,  8 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13E989CB2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:04:56 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqHS71QtZzhnjX;
 Mon,  7 Dec 2020 17:04:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 17:04:52 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v2 2/2] drm/hisilicon: Delete unused local
 parameters
Date: Mon, 7 Dec 2020 17:05:06 +0800
Message-ID: <1607331906-19005-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
References: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGVsZXRlIHVudXNlZCB2YXJpYWJsZSDigJhwcml24oCZIHRvIGF2b2lkIHdhcm5pbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KUmV2aWV3ZWQtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIHwgNSArLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKaW5kZXggN2YwMTIxMy4uN2U5MWVm
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1f
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2
LmMKQEAgLTI1MCwxMiArMjUwLDkgQEAgc3RhdGljIGludCBoaWJtY19od19pbml0KHN0cnVjdCBo
aWJtY19kcm1fcHJpdmF0ZSAqcHJpdikKIAogc3RhdGljIGludCBoaWJtY191bmxvYWQoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKIHsKLQlzdHJ1Y3QgaGlibWNfZHJtX3ByaXZhdGUgKnByaXYgPSB0
b19oaWJtY19kcm1fcHJpdmF0ZShkZXYpOwotCiAJZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24o
ZGV2KTsKLQogCXBjaV9kaXNhYmxlX21zaShkZXYtPnBkZXYpOwotCWRldi0+ZGV2X3ByaXZhdGUg
PSBOVUxMOworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
