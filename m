Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190C819A8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA09B6E451;
	Mon,  5 Aug 2019 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFF76E444;
 Mon,  5 Aug 2019 12:43:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 887BD3C937;
 Mon,  5 Aug 2019 12:43:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29376194BE;
 Mon,  5 Aug 2019 12:43:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 88D7E9D42; Mon,  5 Aug 2019 14:43:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/18] [fixup] ttm
Date: Mon,  5 Aug 2019 14:43:03 +0200
Message-Id: <20190805124310.3275-12-kraxel@redhat.com>
In-Reply-To: <20190805124310.3275-1-kraxel@redhat.com>
References: <20190805124310.3275-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 05 Aug 2019 12:43:16 +0000 (UTC)
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
Cc: thomas@shipmail.org, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 bskeggs@redhat.com, Christian Koenig <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggYjNk
NjI4YjNmMDM4Li43M2Q0MDc0OTQ1ODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtOTYxLDcgKzk2
MSw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX21lbV9mb3JjZV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvLAogCXN0cnVjdCB3d19hY3F1aXJlX2N0eCAqdGlja2V0OwogCWludCByZXQ7
CiAKLQl0aWNrZXQgPSByZXNlcnZhdGlvbl9vYmplY3RfbG9ja2luZ19jdHgoYm8tPnJlc3YpOwor
CXRpY2tldCA9IHJlc2VydmF0aW9uX29iamVjdF9sb2NraW5nX2N0eChiby0+YmFzZS5yZXN2KTsK
IAlkbyB7CiAJCXJldCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywgcGxhY2UsIG1l
bSk7CiAJCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
