Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7171A743F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C116E46D;
	Tue, 14 Apr 2020 07:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A608889C1C;
 Mon, 13 Apr 2020 14:06:29 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DAA1B5009B9C567DB427;
 Mon, 13 Apr 2020 22:06:25 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Apr 2020
 22:06:17 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/radeon: remove defined but not used 'dte_data_tahiti_le'
Date: Mon, 13 Apr 2020 22:32:45 +0800
Message-ID: <20200413143245.23107-1-yanaijie@huawei.com>
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

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Np
X2RwbS5jOjI1NTozMzogd2FybmluZzog4oCYZHRlX2RhdGFfdGFoaXRpX2xl4oCZCmRlZmluZWQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNpX2R0ZV9kYXRhIGR0ZV9kYXRhX3RhaGl0aV9sZSA9CgpSZXBvcnRlZC1ieTogSHVsayBS
b2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlq
aWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jIHwgMTgg
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vc2lfZHBtLmMKaW5kZXggMmNiODVkYmU3MjhmLi5hMTY3ZTFjMzZkMjQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9zaV9kcG0uYwpAQCAtMjUyLDI0ICsyNTIsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNpX2R0ZV9kYXRhIGR0ZV9kYXRhX3RhaGl0aSA9CiAJZmFsc2UKIH07CiAKLXN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc2lfZHRlX2RhdGEgZHRlX2RhdGFfdGFoaXRpX2xlID0KLXsKLQl7IDB4MUU4
NDgwLCAweDdBMTIwMCwgMHgyMTYwRUMwLCAweDM5Mzg3MDAsIDAgfSwKLQl7IDB4N0QsIDB4N0Qs
IDB4NEU0LCAweEIwMCwgMCB9LAotCTB4NSwKLQkweEFGQzgsCi0JMHg2NCwKLQkweDMyLAotCTEs
Ci0JMCwKLQkweDEwLAotCXsgMHg3OCwgMHg3QywgMHg4MiwgMHg4OCwgMHg4RSwgMHg5NCwgMHg5
QSwgMHhBMCwgMHhBNiwgMHhBQywgMHhCMCwgMHhCNCwgMHhCOCwgMHhCQywgMHhDMCwgMHhDNCB9
LAotCXsgMHgzOTM4NzAwLCAweDM5Mzg3MDAsIDB4MzkzODcwMCwgMHgzOTM4NzAwLCAweDM5Mzg3
MDAsIDB4MzkzODcwMCwgMHgzOTM4NzAwLCAweDM5Mzg3MDAsIDB4MzkzODcwMCwgMHgzOTM4NzAw
LCAweDM5Mzg3MDAsIDB4MzkzODcwMCwgMHgzOTM4NzAwLCAweDM5Mzg3MDAsIDB4MzkzODcwMCwg
MHgzOTM4NzAwIH0sCi0JeyAweDJBRjgsIDB4MkFGOCwgMHgyOUJCLCAweDI3RjksIDB4MjYzNywg
MHgyNDc1LCAweDIyQjMsIDB4MjBGMSwgMHgxRjJGLCAweDFENkQsIDB4MTczNCwgMHgxNDE0LCAw
eDEwRjQsIDB4REQ0LCAweEFCNCwgMHg3OTQgfSwKLQk4NSwKLQl0cnVlCi19OwotCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNpX2R0ZV9kYXRhIGR0ZV9kYXRhX3RhaGl0aV9wcm8gPQogewogCXsgMHgx
RTg0ODAsIDB4M0QwOTAwLCAweDk4OTY4MCwgMHgyNjI1QTAwLCAweDAgfSwKLS0gCjIuMjEuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
