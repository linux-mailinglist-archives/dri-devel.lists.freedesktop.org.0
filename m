Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCFDCFAD3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 15:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F5E6E129;
	Tue,  8 Oct 2019 13:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563A46E129
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 13:01:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id AE56F28FF5F
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix comment doc for format_modifiers
Date: Tue,  8 Oct 2019 15:01:49 +0200
Message-Id: <20191008130150.11399-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004192801.GJ1208@intel.com>
References: <20191004192801.GJ1208@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhcmFtZXRlciBwYXNzZXMgYW4gYXJyYXkgb2YgdWludDY0X3QgcmF0aGVyIHRoYW4gYW4g
YXJyYXkKb2Ygc3RydWN0cywgYnV0IHRoZSBmaXJzdCB3b3JkcyBvZiB0aGUgY29tbWVudCBzdWdn
ZXN0IHRoYXQgaXQgcGFzc2VzCmFuIGFycmF5IG9mIHN0cnVjdHMgLSBpZiB0aGUgcmVhZGVyIHN0
b3BzIHJlYWRpbmcgYXQgdGhlIHdvcmQgInN0cnVjdCIuCgpJZiB0aGUgY29tbWl0IGlzIHJlYWQg
YmV5b25kIHRoYXQgcG9pbnQgdGhlIHJlYWRlciB3aWxsIGxpa2VseSBjb25mdXNlCiJkcm1fZm9y
bWF0PFNQQUNFPm1vZGlmaWVycyIgd2l0aCAiZHJtX2Zvcm1hdDxVTkRFUlNDT1JFPm1vZGlmaWVy
cyIgYW5kCnVuZGVyc3RhbmQgdGhlIG1lYW5pbmcgYXMgInBhc3NpbmcgYW4gYXJyYXkgb2YgZWxl
bWVudHMgd2hpY2ggYXJlIG9mIHR5cGUKc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIiLiBUaGF0
IGlzIG5vdCBjb3JyZWN0LgoKT25seSBpZiB0aGUgcmVhZGVyIGlzIGFibGUgdG8gcmVhZCB0aGUg
Y29tbWVudCBhcwoiYXJyYXkgb2Ygc3RydWN0IGRybV9mb3JtYXQ8U1BBQ0U+bW9kaWZpZXJzIiB3
aWxsIHRoZXkgYmUgY2xvc2UgdG8gdGhlCmNvcnJlY3QgbWVhbmluZy4gQnV0IHN0aWxsIG5vdCBx
dWl0ZSB0aGVyZSwgYmVjYXVzZSB0aGUgbW9kaWZpZXJzIGRvIG5vdAppbmZsdWVuY2Ugc3RydWN0
IGRybV9mb3JtYXQgaW4gYW55IHdheSAtIGl0IGlzIG5vdCBjbGVhciB3aGF0ICJhIG1vZGlmaWVy
Cm9mIGEgc3RydWN0IiB3b3VsZCBiZS4KClRoZSBjb21tZW50IGlzIGNoYW5nZWQgdG8gc2ltcGx5
IHNheSB0aGF0IHRoZSBwYXJhbWV0ZXIgcGFzc2VzIGFuIGFycmF5IG9mCmZvcm1hdCBtb2RpZmll
cnMsIHdoaWNoIGlzIHRoZSBjb3JyZWN0IG1lYW5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyemVq
IFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX3BsYW5lLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKaW5kZXggZDZhZDYwYWIwZDM4Li4wZDRm
OTE3MmMwZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKQEAgLTE2MCw3ICsxNjAsNyBAQCBzdGF0aWMgaW50
IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJt
X3BsYW5lICpwbGFuZQogICogQGZ1bmNzOiBjYWxsYmFja3MgZm9yIHRoZSBuZXcgcGxhbmUKICAq
IEBmb3JtYXRzOiBhcnJheSBvZiBzdXBwb3J0ZWQgZm9ybWF0cyAoRFJNX0ZPUk1BVFxfXCopCiAg
KiBAZm9ybWF0X2NvdW50OiBudW1iZXIgb2YgZWxlbWVudHMgaW4gQGZvcm1hdHMKLSAqIEBmb3Jt
YXRfbW9kaWZpZXJzOiBhcnJheSBvZiBzdHJ1Y3QgZHJtX2Zvcm1hdCBtb2RpZmllcnMgdGVybWlu
YXRlZCBieQorICogQGZvcm1hdF9tb2RpZmllcnM6IGFycmF5IG9mIGZvcm1hdCBtb2RpZmllcnMg
dGVybWluYXRlZCBieQogICogICAgICAgICAgICAgICAgICAgIERSTV9GT1JNQVRfTU9EX0lOVkFM
SUQKICAqIEB0eXBlOiB0eXBlIG9mIHBsYW5lIChvdmVybGF5LCBwcmltYXJ5LCBjdXJzb3IpCiAg
KiBAbmFtZTogcHJpbnRmIHN0eWxlIGZvcm1hdCBzdHJpbmcgZm9yIHRoZSBwbGFuZSBuYW1lLCBv
ciBOVUxMIGZvciBkZWZhdWx0IG5hbWUKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
