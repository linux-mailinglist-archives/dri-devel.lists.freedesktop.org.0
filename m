Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C6E2ECB6F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7361D6E3F7;
	Thu,  7 Jan 2021 08:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C222F89CA8;
 Thu,  7 Jan 2021 08:07:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22245AE57;
 Thu,  7 Jan 2021 08:07:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v3 1/8] drm/amdgpu: Fix trailing whitespaces
Date: Thu,  7 Jan 2021 09:07:41 +0100
Message-Id: <20210107080748.4768-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107080748.4768-1-tzimmermann@suse.de>
References: <20210107080748.4768-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gvt-dev@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRoZXJlIHRvIGtlcm5lbCBjb2Rpbmcgc3R5bGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggOGY0NTFlODA5MTI3Li43ZDE2Mzk1ZWRl
MGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTQ5
NTAsOCArNDk1MCw4IEBAIHBjaV9lcnNfcmVzdWx0X3QgYW1kZ3B1X3BjaV9lcnJvcl9kZXRlY3Rl
ZChzdHJ1Y3QgcGNpX2RldiAqcGRldiwgcGNpX2NoYW5uZWxfc3RhCiAJY2FzZSBwY2lfY2hhbm5l
bF9pb19ub3JtYWw6CiAJCXJldHVybiBQQ0lfRVJTX1JFU1VMVF9DQU5fUkVDT1ZFUjsKIAkvKiBG
YXRhbCBlcnJvciwgcHJlcGFyZSBmb3Igc2xvdCByZXNldCAqLwotCWNhc2UgcGNpX2NoYW5uZWxf
aW9fZnJvemVuOgkJCi0JCS8qCQkKKwljYXNlIHBjaV9jaGFubmVsX2lvX2Zyb3plbjoKKwkJLyoK
IAkJICogQ2FuY2VsIGFuZCB3YWl0IGZvciBhbGwgVERScyBpbiBwcm9ncmVzcyBpZiBmYWlsaW5n
IHRvCiAJCSAqIHNldCAgYWRldi0+aW5fZ3B1X3Jlc2V0IGluIGFtZGdwdV9kZXZpY2VfbG9ja19h
ZGV2CiAJCSAqCkBAIC01MDQyLDcgKzUwNDIsNyBAQCBwY2lfZXJzX3Jlc3VsdF90IGFtZGdwdV9w
Y2lfc2xvdF9yZXNldChzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAkJZ290byBvdXQ7CiAJfQogCi0J
YWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSA9IHRydWU7CQorCWFkZXYtPmluX3BjaV9lcnJfcmVj
b3ZlcnkgPSB0cnVlOwogCXIgPSBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KGFkZXYsIE5V
TEwsICZuZWVkX2Z1bGxfcmVzZXQpOwogCWFkZXYtPmluX3BjaV9lcnJfcmVjb3ZlcnkgPSBmYWxz
ZTsKIAlpZiAocikKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
