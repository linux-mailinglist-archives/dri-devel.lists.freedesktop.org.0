Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24333451D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 13:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B96A8967B;
	Tue,  4 Jun 2019 11:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49478967B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 11:13:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59080AFAF;
 Tue,  4 Jun 2019 11:13:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run
Subject: [PATCH] drm: Ignore drm_gem_vram_mm_funcs in generated documentation
Date: Tue,  4 Jun 2019 13:13:30 +0200
Message-Id: <20190604111330.25324-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRvY3VtZW50YXRpb24gdG9vbHMgaW50ZXJwcmV0IGRybV9nZW1fdnJhbV9tbV9mdW5jcyBh
cyBmdW5jdGlvbiBhbmQKdGhlcmUgYXBwZWFycyB0byBiZSBubyB3YXkgb2YgaW5saW5lLWRvY3Vt
ZW50aW5nIGNvbnN0YW50cy4gVGhpcyByZXN1bHRzCmluIGEgd2FybmluZyBieSAnbWFrZSBodG1s
ZG9jcycuIEZvciBub3csIHJlbW92aW5nIGRybV9nZW1fdnJhbV9tbV9mdW5jcwpmcm9tIGdlbmVy
YXRlZCBkb2N1bWVudGF0aW9uIHdvcmtzIGFyb3VuZCB0aGUgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KRml4ZXM6IDVjOWRjYWNm
ZTU2NjczNTU1NTQwOTMzMDE3YzU0ZThmMzllOTQ3Y2IKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXgg
NzM4MGEwNmE1ODJjLi40MmFkODA4ODhkZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYwpAQCAtNTg1LDcgKzU4NSw3IEBAIGludCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX3Zl
cmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIH0KIEVYUE9SVF9TWU1C
T0woZHJtX2dlbV92cmFtX2JvX2RyaXZlcl92ZXJpZnlfYWNjZXNzKTsKIAotLyoqCisvKgogICog
ZHJtX2dlbV92cmFtX21tX2Z1bmNzIC0gRnVuY3Rpb25zIGZvciAmc3RydWN0IGRybV92cmFtX21t
CiAgKgogICogTW9zdCB1c2VycyBvZiBAc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3Qgd2lsbCBh
bHNvIHVzZQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
