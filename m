Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88270265CEB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336A16E9E2;
	Fri, 11 Sep 2020 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D50D6E934
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:07:21 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3991877720EC491B196A;
 Thu, 10 Sep 2020 22:07:17 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 22:07:08 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <hyun.kwon@xilinx.com>, <laurent.pinchart@ideasonboard.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <michal.simek@xilinx.com>,
 <yanaijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: xlnx: remove defined but not used 'scaling_factors_666'
Date: Thu, 10 Sep 2020 22:06:30 +0800
Message-ID: <20200910140630.1191782-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZyB3aXRoICJtYWtlIFc9MSI6
Cgpkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jOjI0NToxODogd2FybmluZzoK4oCY
c2NhbGluZ19mYWN0b3JzXzY2NuKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29u
c3QtdmFyaWFibGU9XQogIDI0NSB8IHN0YXRpYyBjb25zdCB1MzIgc2NhbGluZ19mYWN0b3JzXzY2
NltdID0gewogICAgICB8ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgoKUmVw
b3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3hsbngv
enlucW1wX2Rpc3AuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYwppbmRleCBhNDU1Y2ZjMWJlZTUuLjk4YmQ0OGYx
M2ZkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jCkBAIC0yNDIsMTIgKzI0Miw2IEBA
IHN0YXRpYyBjb25zdCB1MzIgc2NhbGluZ19mYWN0b3JzXzU2NVtdID0gewogCVpZTlFNUF9ESVNQ
X0FWX0JVRl81QklUX1NGLAogfTsKIAotc3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2ZhY3RvcnNf
NjY2W10gPSB7Ci0JWllOUU1QX0RJU1BfQVZfQlVGXzZCSVRfU0YsCi0JWllOUU1QX0RJU1BfQVZf
QlVGXzZCSVRfU0YsCi0JWllOUU1QX0RJU1BfQVZfQlVGXzZCSVRfU0YsCi19OwotCiBzdGF0aWMg
Y29uc3QgdTMyIHNjYWxpbmdfZmFjdG9yc184ODhbXSA9IHsKIAlaWU5RTVBfRElTUF9BVl9CVUZf
OEJJVF9TRiwKIAlaWU5RTVBfRElTUF9BVl9CVUZfOEJJVF9TRiwKLS0gCjIuMjUuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
