Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C1C1A743B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382A58987A;
	Tue, 14 Apr 2020 07:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD9A89C1C;
 Mon, 13 Apr 2020 14:06:42 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 11DA4C60BE33694BA829;
 Mon, 13 Apr 2020 22:06:39 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Apr 2020
 22:06:31 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/radeon: remove defined but not used variables in ci_dpm.c
Date: Mon, 13 Apr 2020 22:33:00 +0800
Message-ID: <20200413143300.23244-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Np
X2RwbS5jOjgyOjM2OiB3YXJuaW5nOiDigJhkZWZhdWx0c19zYXR1cm5fcHJv4oCZCmRlZmluZWQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNpX3B0X2RlZmF1bHRzIGRlZmF1bHRzX3NhdHVybl9wcm8gPQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CmRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vY2lfZHBtLmM6Njg6MzY6IHdhcm5pbmc6IOKAmGRlZmF1bHRzX2JvbmFpcmVfcHJv4oCZ
CmRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IGNpX3B0X2RlZmF1bHRzIGRlZmF1bHRzX2JvbmFpcmVfcHJvID0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KClJlcG9y
dGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFz
b24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
Y2lfZHBtLmMgfCAxNCAtLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2NpX2RwbS5jCmluZGV4IGE5MjU3YmVkMzQ4NC4uMTM0YWEyYjAx
ZjkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NpX2RwbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMKQEAgLTY1LDEzICs2NSw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgY2lfcHRfZGVmYXVsdHMgZGVmYXVsdHNfYm9uYWlyZV94dCA9CiAJeyAweDE3
QywgMHgxNzIsIDB4MTgwLCAweDFCQywgMHgxQjMsIDB4MUJELCAweDIwNiwgMHgyMDAsIDB4MjAz
LCAweDI1RCwgMHgyNUEsIDB4MjU1LCAweDJDMywgMHgyQzUsIDB4MkI0IH0KIH07CiAKLXN0YXRp
YyBjb25zdCBzdHJ1Y3QgY2lfcHRfZGVmYXVsdHMgZGVmYXVsdHNfYm9uYWlyZV9wcm8gPQotewot
CTEsIDB4RiwgMHhGRCwgMHgxOSwgNSwgNDUsIDAsIDB4NjUwNjIsCi0JeyAweDhDLCAgMHgyM0Ys
IDB4MjQ0LCAweEE2LCAgMHg4MywgIDB4ODUsICAweDg2LCAgMHg4NiwgIDB4ODMsICAweERCLCAg
MHhEQiwgIDB4REEsICAweDY3LCAgMHg2MCwgIDB4NUYgIH0sCi0JeyAweDE4NywgMHgxOTMsIDB4
MTkzLCAweDFDNywgMHgxRDEsIDB4MUQxLCAweDIxMCwgMHgyMTksIDB4MjE5LCAweDI2NiwgMHgy
NkMsIDB4MjZDLCAweDJDOSwgMHgyQ0IsIDB4MkNCIH0KLX07Ci0KIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY2lfcHRfZGVmYXVsdHMgZGVmYXVsdHNfc2F0dXJuX3h0ID0KIHsKIAkxLCAweEYsIDB4RkQs
IDB4MTksIDUsIDU1LCAwLCAweDcwMDAwLApAQCAtNzksMTMgKzcyLDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBjaV9wdF9kZWZhdWx0cyBkZWZhdWx0c19zYXR1cm5feHQgPQogCXsgMHgxODcsIDB4
MTg3LCAweDE4NywgMHgxQzcsIDB4MUM3LCAweDFDNywgMHgyMTAsIDB4MjEwLCAweDIxMCwgMHgy
NjYsIDB4MjY2LCAweDI2NiwgMHgyQzksIDB4MkM5LCAweDJDOSB9CiB9OwogCi1zdGF0aWMgY29u
c3Qgc3RydWN0IGNpX3B0X2RlZmF1bHRzIGRlZmF1bHRzX3NhdHVybl9wcm8gPQotewotCTEsIDB4
RiwgMHhGRCwgMHgxOSwgNSwgNTUsIDAsIDB4MzAwMDAsCi0JeyAweDk2LCAgMHgyMUQsIDB4MjNC
LCAweEExLCAgMHg4NSwgIDB4ODcsICAweDgzLCAgMHg4NCwgIDB4ODEsICAweEU2LCAgMHhFNiwg
IDB4RTYsICAweDcxLCAgMHg2QSwgIDB4NkEgIH0sCi0JeyAweDE5MywgMHgxOUUsIDB4MTlFLCAw
eDFEMiwgMHgxREMsIDB4MURDLCAweDIxQSwgMHgyMjMsIDB4MjIzLCAweDI2RSwgMHgyN0UsIDB4
Mjc0LCAweDJDRiwgMHgyRDIsIDB4MkQyIH0KLX07Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2lf
cHRfY29uZmlnX3JlZyBkaWR0X2NvbmZpZ19jaVtdID0KIHsKIAl7IDB4MTAsIDB4MDAwMDAwZmYs
IDAsIDB4MCwgQ0lTTEFORFNfQ09ORklHUkVHX0RJRFRfSU5EIH0sCi0tIAoyLjIxLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
