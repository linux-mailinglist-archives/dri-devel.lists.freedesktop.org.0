Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63036F6141
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 20:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522F96E3F2;
	Sat,  9 Nov 2019 19:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B0D6E3F5;
 Sat,  9 Nov 2019 19:49:27 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iTWjb-00082x-Pg; Sat, 09 Nov 2019 19:49:23 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix spelling mistake "exeuction" ->
 "execution"
Date: Sat,  9 Nov 2019 19:49:23 +0000
Message-Id: <20191109194923.231655-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGFy
ZSBzcGVsbGluZyBtaXN0YWtlcyBpbiBhIERDX0VSUk9SIG1lc3NhZ2UgYW5kIGEgY29tbWVudC4K
Rml4IHRoZXNlLgoKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZG11Yl9z
cnYuYyAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kbXViL2luYy9kbXVi
X3Nydi5oIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2Rt
dWJfc3J2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZG11Yl9zcnYuYwpp
bmRleCA2MWNlZmUwYTM3OTAuLmI2NWI2NjAyNTI2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2LmMKQEAgLTkyLDcgKzkyLDcgQEAgdm9pZCBkY19kbXVi
X3Nydl9jbWRfZXhlY3V0ZShzdHJ1Y3QgZGNfZG11Yl9zcnYgKmRjX2RtdWJfc3J2KQogCiAJc3Rh
dHVzID0gZG11Yl9zcnZfY21kX2V4ZWN1dGUoZG11Yik7CiAJaWYgKHN0YXR1cyAhPSBETVVCX1NU
QVRVU19PSykKLQkJRENfRVJST1IoIkVycm9yIHN0YXJ0aW5nIERNVUIgZXhldWN0aW9uOiBzdGF0
dXM9JWRcbiIsIHN0YXR1cyk7CisJCURDX0VSUk9SKCJFcnJvciBzdGFydGluZyBETVVCIGV4ZWN1
dGlvbjogc3RhdHVzPSVkXG4iLCBzdGF0dXMpOwogfQogCiB2b2lkIGRjX2RtdWJfc3J2X3dhaXRf
aWRsZShzdHJ1Y3QgZGNfZG11Yl9zcnYgKmRjX2RtdWJfc3J2KQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RtdWIvaW5jL2RtdWJfc3J2LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZG11Yi9pbmMvZG11Yl9zcnYuaAppbmRleCBhYThmMDM5NjYxNmQuLjQ1
ZTQyN2QxOTUyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RtdWIv
aW5jL2RtdWJfc3J2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RtdWIvaW5j
L2RtdWJfc3J2LmgKQEAgLTQxNiw3ICs0MTYsNyBAQCBlbnVtIGRtdWJfc3RhdHVzIGRtdWJfc3J2
X2NtZF9xdWV1ZShzdHJ1Y3QgZG11Yl9zcnYgKmRtdWIsCiAgKiBkbXViX3Nydl9jbWRfZXhlY3V0
ZSgpIC0gRXhlY3V0ZXMgYSBxdWV1ZWQgc2VxdWVuY2UgdG8gdGhlIGRtdWIKICAqIEBkbXViOiB0
aGUgZG11YiBzZXJ2aWNlCiAgKgotICogQmVnaW5zIGV4ZXVjdGlvbiBvZiBxdWV1ZWQgY29tbWFu
ZHMgb24gdGhlIGRtdWIuCisgKiBCZWdpbnMgZXhlY3V0aW9uIG9mIHF1ZXVlZCBjb21tYW5kcyBv
biB0aGUgZG11Yi4KICAqCiAgKiBSZXR1cm46CiAgKiAgIERNVUJfU1RBVFVTX09LIC0gc3VjY2Vz
cwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
