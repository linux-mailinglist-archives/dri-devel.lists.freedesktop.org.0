Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73070CF3D6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E57F6E21F;
	Tue,  8 Oct 2019 07:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2F6E1B6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:09:02 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D7E8280300A7B6FE2098;
 Tue,  8 Oct 2019 15:08:58 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 15:08:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] drm/omap: Remove some set but not used variables
Date: Tue, 8 Oct 2019 15:15:45 +0800
Message-ID: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

emhlbmdiaW4gKDQpOgogIGRybS9vbWFwOiBSZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJs
ZSAncGxhbmUnCiAgZHJtL29tYXA6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICd0
Y2xrX3RyYWlsJwogIGRybS9vbWFwOiBSZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAn
ZXJyJyBpbiBoZG1pNV9hdWRpb19jb25maWcKICBkcm0vb21hcDogUmVtb3ZlIHNldCBidXQgbm90
IHVzZWQgdmFyaWFibGUgJ2VycicgaW4gaGRtaTRfYXVkaW9fY29uZmlnCgogZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL2RzaS5jICAgICAgICB8IDMgKy0tCiBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvaGRtaTRfY29yZS5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
c3MvaGRtaTVfY29yZS5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Zi
LmMgICAgICAgIHwgMyAtLS0KIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQoKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
