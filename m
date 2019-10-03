Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F67C9938
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 09:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56A76E291;
	Thu,  3 Oct 2019 07:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEA26E282
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 07:51:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id DC5D228A7E6
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix comment doc for format_modifiers
Date: Thu,  3 Oct 2019 09:51:18 +0200
Message-Id: <20191003075118.6257-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002183011.GA29177@ravnborg.org>
References: <20191002183011.GA29177@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gaHVtYW4gcmVhZGVycwoKImFycmF5IG9mIHN0cnVjdCBkcm1fZm9ybWF0IG1vZGlmaWVycyIg
aXMgYWxtb3N0IGluZGlzdGluZ3Vpc2hhYmxlIGZyb20KImFycmF5IG9mIHN0cnVjdCBkcm1fZm9y
bWF0X21vZGlmaWVycyIsIGVzcGVjaWFsbHkgZ2l2ZW4gdGhhdApzdHJ1Y3QgZHJtX2Zvcm1hdF9t
b2RpZmllciBkb2VzIGV4aXN0LgoKQW5kIGluZGVlZCB0aGUgcGFyYW1ldGVyIHBhc3NlcyBhbiBh
cnJheSBvZiB1aW50NjRfdCByYXRoZXIgdGhhbiBhbiBhcnJheQpvZiBzdHJ1Y3RzLCBidXQgdGhl
IGZpcnN0IHdvcmRzIG9mIHRoZSBjb21tZW50IHN1Z2dlc3QgdGhhdCBpdCBwYXNzZXMKYW4gYXJy
YXkgb2Ygc3RydWN0cy4KClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5k
cnplai5wQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wbGFuZS5jCmluZGV4IGQ2YWQ2MGFiMGQzOC4uMGQ0ZjkxNzJjMGRkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZS5jCkBAIC0xNjAsNyArMTYwLDcgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Io
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUKICAqIEBmdW5j
czogY2FsbGJhY2tzIGZvciB0aGUgbmV3IHBsYW5lCiAgKiBAZm9ybWF0czogYXJyYXkgb2Ygc3Vw
cG9ydGVkIGZvcm1hdHMgKERSTV9GT1JNQVRcX1wqKQogICogQGZvcm1hdF9jb3VudDogbnVtYmVy
IG9mIGVsZW1lbnRzIGluIEBmb3JtYXRzCi0gKiBAZm9ybWF0X21vZGlmaWVyczogYXJyYXkgb2Yg
c3RydWN0IGRybV9mb3JtYXQgbW9kaWZpZXJzIHRlcm1pbmF0ZWQgYnkKKyAqIEBmb3JtYXRfbW9k
aWZpZXJzOiBhcnJheSBvZiBmb3JtYXQgbW9kaWZpZXJzIHRlcm1pbmF0ZWQgYnkKICAqICAgICAg
ICAgICAgICAgICAgICBEUk1fRk9STUFUX01PRF9JTlZBTElECiAgKiBAdHlwZTogdHlwZSBvZiBw
bGFuZSAob3ZlcmxheSwgcHJpbWFyeSwgY3Vyc29yKQogICogQG5hbWU6IHByaW50ZiBzdHlsZSBm
b3JtYXQgc3RyaW5nIGZvciB0aGUgcGxhbmUgbmFtZSwgb3IgTlVMTCBmb3IgZGVmYXVsdCBuYW1l
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
