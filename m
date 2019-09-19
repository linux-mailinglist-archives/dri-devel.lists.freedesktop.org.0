Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C26B8BD2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DD56F4E4;
	Fri, 20 Sep 2019 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB5C6F77E;
 Thu, 19 Sep 2019 14:02:40 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 118C5FBD00B0B2AFF39B;
 Thu, 19 Sep 2019 22:02:37 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 19 Sep 2019
 22:02:14 +0800
From: yu kuai <yukuai3@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>
Subject: [PATCH] drm/amdgpu: remove excess function parameter description
Date: Thu, 19 Sep 2019 22:09:09 +0800
Message-ID: <1568902149-70787-1-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:40 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, zhengbin13@huawei.com,
 dri-devel@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5j
OjQzMTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uCnBhcmFtZXRlciAnc3cnIGRlc2NyaXB0aW9u
IGluICd2Y25fdjJfNV9kaXNhYmxlX2Nsb2NrX2dhdGluZycKZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzUuYzo1NTA6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbgpwYXJhbWV0ZXIg
J3N3JyBkZXNjcmlwdGlvbiBpbiAndmNuX3YyXzVfZW5hYmxlX2Nsb2NrX2dhdGluZycKCkZpeGVz
OiBjYmVhZDJiZGZjZjEgKCJkcm0vYW1kZ3B1OiBhZGQgVkNOMi41IFZDUFUgc3RhcnQgYW5kIHN0
b3AiKQpTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml81LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCmluZGV4
IDM5NWMyMjUuLjlkNzc4YTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml81LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYwpA
QCAtNDIzLDcgKzQyMyw2IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml81X21jX3Jlc3VtZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKICAqIHZjbl92Ml81X2Rpc2FibGVfY2xvY2tfZ2F0aW5nIC0g
ZGlzYWJsZSBWQ04gY2xvY2sgZ2F0aW5nCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9p
bnRlcgotICogQHN3OiBlbmFibGUgU1cgY2xvY2sgZ2F0aW5nCiAgKgogICogRGlzYWJsZSBjbG9j
ayBnYXRpbmcgZm9yIFZDTiBibG9jawogICovCkBAIC01NDIsNyArNTQxLDYgQEAgc3RhdGljIHZv
aWQgdmNuX3YyXzVfZGlzYWJsZV9jbG9ja19nYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAgKiB2Y25fdjJfNV9lbmFibGVfY2xvY2tfZ2F0aW5nIC0gZW5hYmxlIFZDTiBjbG9jayBn
YXRpbmcKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCi0gKiBAc3c6IGVuYWJs
ZSBTVyBjbG9jayBnYXRpbmcKICAqCiAgKiBFbmFibGUgY2xvY2sgZ2F0aW5nIGZvciBWQ04gYmxv
Y2sKICAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
