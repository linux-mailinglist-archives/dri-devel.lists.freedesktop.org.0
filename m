Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA92DA6A4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 09:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD956E45E;
	Thu, 17 Oct 2019 07:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5EC6E46B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:47:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1CB2CB591;
 Thu, 17 Oct 2019 07:47:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch
Subject: [PATCH v3 1/1] drm: Add TODO item for fbdev driver conversion
Date: Thu, 17 Oct 2019 09:47:05 +0200
Message-Id: <20191017074705.9140-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017074705.9140-1-tzimmermann@suse.de>
References: <20191017074705.9140-1-tzimmermann@suse.de>
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
Cc: linux-doc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, corbet@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTSBUT0RPIGxpc3Qgbm93IGNvbnRhaW5zIGFuIGVudHJ5IGZvciBjb252ZXJ0aW5nIGZi
ZGV2CmRyaXZlcnMgb3ZlciB0byBEUk0uCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8
IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3Vt
ZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4IDc5Nzg1NTU5ZDcxMS4uMjNiM2E2Nzc5NGJhIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9u
L2dwdS90b2RvLnJzdApAQCAtNDYyLDMgKzQ2MiwzMCBAQCBDb250YWN0OiBTYW0gUmF2bmJvcmcK
IAogT3V0c2lkZSBEUk0KID09PT09PT09PT09CisKK0NvbnZlcnQgZmJkZXYgZHJpdmVycyB0byBE
Uk0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworVGhlcmUgYXJlIHBsZW50eSBvZiBm
YmRldiBkcml2ZXJzIGZvciBvbGRlciBoYXJkd2FyZS4gU29tZSBod2FyZHdhcmUgaGFzCitiZWNv
bWUgb2Jzb2xldGUsIGJ1dCBzb21lIHN0aWxsIHByb3ZpZGVzIGdvb2QoLWVub3VnaCkgZnJhbWVi
dWZmZXJzLiBUaGUKK2RyaXZlcnMgdGhhdCBhcmUgc3RpbGwgdXNlZnVsIHNob3VsZCBiZSBjb252
ZXJ0ZWQgdG8gRFJNIGFuZCBhZnRlcndhcmRzCityZW1vdmVkIGZyb20gZmJkZXYuCisKK1Zlcnkg
c2ltcGxlIGZiZGV2IGRyaXZlcnMgY2FuIGJlc3QgYmUgY29udmVydGVkIGJ5IHN0YXJ0aW5nIHdp
dGggYSBuZXcKK0RSTSBkcml2ZXIuIFNpbXBsZSBLTVMgaGVscGVycyBhbmQgU0hNRU0gc2hvdWxk
IGJlIGFibGUgdG8gaGFuZGxlIGFueQorZXhpc3RpbmcgaGFyZHdhcmUuIFRoZSBuZXcgZHJpdmVy
J3MgY2FsbC1iYWNrIGZ1bmN0aW9ucyBhcmUgZmlsbGVkIGZyb20KK2V4aXN0aW5nIGZiZGV2IGNv
ZGUuCisKK01vcmUgY29tcGxleCBmYmRldiBkcml2ZXJzIGNhbiBiZSByZWZhY3RvcmVkIHN0ZXAt
Ynktc3RlcCBpbnRvIGEgRFJNCitkcml2ZXIgd2l0aCB0aGUgaGVscCBvZiB0aGUgRFJNIGZiY29u
diBoZWxwZXJzLiBbMV0gVGhlc2UgaGVscGVycyBwcm92aWRlCit0aGUgdHJhbnNpdGlvbiBsYXll
ciBiZXR3ZWVuIHRoZSBEUk0gY29yZSBpbmZyYXN0cnVjdHVyZSBhbmQgdGhlIGZiZGV2Citkcml2
ZXIgaW50ZXJmYWNlLiBDcmVhdGUgYSBuZXcgRFJNIGRyaXZlciBvbiB0b3Agb2YgdGhlIGZiY29u
diBoZWxwZXJzLAorY29weSBvdmVyIHRoZSBmYmRldiBkcml2ZXIsIGFuZCBob29rIGl0IHVwIHRv
IHRoZSBEUk0gY29kZS4gRXhhbXBsZXMgZm9yCitzZXZlcmFsIGZiZGV2IGRyaXZlcnMgYXJlIGF2
YWlsYWJsZSBhdCBbMV0gYW5kIGEgdHV0b3JpYWwgb2YgdGhpcyBwcm9jZXNzCithdmFpbGFibGUg
YXQgWzJdLiBUaGUgcmVzdWx0IGlzIGEgcHJpbWl0aXZlIERSTSBkcml2ZXIgdGhhdCBjYW4gcnVu
IFgxMQorYW5kIFdlc3Rvbi4KKworIC0gWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy90emltbWVybWFubi9saW51eC90cmVlL2ZiY29udgorIC0gWzJdIGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy90emltbWVybWFubi9saW51eC9ibG9iL2ZiY29udi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiY29udl9oZWxwZXIuYworCitDb250YWN0OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
