Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DA2E55E
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 21:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961846E0B8;
	Wed, 29 May 2019 19:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989456E0C1;
 Wed, 29 May 2019 19:31:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 12:31:42 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga008.fm.intel.com with ESMTP; 29 May 2019 12:31:39 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] video/hdmi: Dropped static functions from kernel doc
Date: Thu, 30 May 2019 01:29:04 +0530
Message-Id: <1559159944-21103-5-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
References: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcHBlZCBzdGF0aWMgZnVuY3Rpb25zIGZyb20ga2VybmVsIGRvY3VtZW50YXRpb24uCgpTdWdn
ZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTog
VW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2hk
bWkuYyB8IDMyICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9oZG1pLmMgYi9kcml2ZXJzL3ZpZGVvL2hkbWkuYwppbmRleCBiOTliYTAxLi43MmM2
NTRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2hkbWkuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2hkbWkuYwpAQCAtMTE5MSwxMSArMTE5MSwxMSBAQCBzdGF0aWMgY29uc3QgY2hhciAqaGRtaV9u
dXBzX2dldF9uYW1lKGVudW0gaGRtaV9udXBzIG51cHMpCiAJcmV0dXJuICJJbnZhbGlkIjsKIH0K
IAotLyoqCisvKgogICogaGRtaV9hdmlfaW5mb2ZyYW1lX2xvZygpIC0gbG9nIGluZm8gb2YgSERN
SSBBVkkgaW5mb2ZyYW1lCi0gKiBAbGV2ZWw6IGxvZ2dpbmcgbGV2ZWwKLSAqIEBkZXY6IGRldmlj
ZQotICogQGZyYW1lOiBIRE1JIEFWSSBpbmZvZnJhbWUKKyAqIGxldmVsOiBsb2dnaW5nIGxldmVs
CisgKiBkZXY6IGRldmljZQorICogZnJhbWU6IEhETUkgQVZJIGluZm9mcmFtZQogICovCiBzdGF0
aWMgdm9pZCBoZG1pX2F2aV9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAogCQkJCSAg
IHN0cnVjdCBkZXZpY2UgKmRldiwKQEAgLTEyNjgsMTEgKzEyNjgsMTEgQEAgc3RhdGljIGNvbnN0
IGNoYXIgKmhkbWlfc3BkX3NkaV9nZXRfbmFtZShlbnVtIGhkbWlfc3BkX3NkaSBzZGkpCiAJcmV0
dXJuICJSZXNlcnZlZCI7CiB9CiAKLS8qKgorLyoKICAqIGhkbWlfc3BkX2luZm9mcmFtZV9sb2co
KSAtIGxvZyBpbmZvIG9mIEhETUkgU1BEIGluZm9mcmFtZQotICogQGxldmVsOiBsb2dnaW5nIGxl
dmVsCi0gKiBAZGV2OiBkZXZpY2UKLSAqIEBmcmFtZTogSERNSSBTUEQgaW5mb2ZyYW1lCisgKiBs
ZXZlbDogbG9nZ2luZyBsZXZlbAorICogZGV2OiBkZXZpY2UKKyAqIGZyYW1lOiBIRE1JIFNQRCBp
bmZvZnJhbWUKICAqLwogc3RhdGljIHZvaWQgaGRtaV9zcGRfaW5mb2ZyYW1lX2xvZyhjb25zdCBj
aGFyICpsZXZlbCwKIAkJCQkgICBzdHJ1Y3QgZGV2aWNlICpkZXYsCkBAIC0xNDA0LDExICsxNDA0
LDExIEBAIHN0YXRpYyB2b2lkIGhkbWlfc3BkX2luZm9mcmFtZV9sb2coY29uc3QgY2hhciAqbGV2
ZWwsCiAJcmV0dXJuICJSZXNlcnZlZCI7CiB9CiAKLS8qKgorLyoKICAqIGhkbWlfYXVkaW9faW5m
b2ZyYW1lX2xvZygpIC0gbG9nIGluZm8gb2YgSERNSSBBVURJTyBpbmZvZnJhbWUKLSAqIEBsZXZl
bDogbG9nZ2luZyBsZXZlbAotICogQGRldjogZGV2aWNlCi0gKiBAZnJhbWU6IEhETUkgQVVESU8g
aW5mb2ZyYW1lCisgKiBsZXZlbDogbG9nZ2luZyBsZXZlbAorICogZGV2OiBkZXZpY2UKKyAqIGZy
YW1lOiBIRE1JIEFVRElPIGluZm9mcmFtZQogICovCiBzdGF0aWMgdm9pZCBoZG1pX2F1ZGlvX2lu
Zm9mcmFtZV9sb2coY29uc3QgY2hhciAqbGV2ZWwsCiAJCQkJICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYsCkBAIC0xNDM3LDExICsxNDM3LDExIEBAIHN0YXRpYyB2b2lkIGhkbWlfYXVkaW9faW5mb2Zy
YW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKIAkJCWZyYW1lLT5kb3dubWl4X2luaGliaXQgPyAi
WWVzIiA6ICJObyIpOwogfQogCi0vKioKKy8qCiAgKiBoZG1pX2RybV9pbmZvZnJhbWVfbG9nKCkg
LSBsb2cgaW5mbyBvZiBIRE1JIERSTSBpbmZvZnJhbWUKLSAqIEBsZXZlbDogbG9nZ2luZyBsZXZl
bAotICogQGRldjogZGV2aWNlCi0gKiBAZnJhbWU6IEhETUkgRFJNIGluZm9mcmFtZQorICogbGV2
ZWw6IGxvZ2dpbmcgbGV2ZWwKKyAqIGRldjogZGV2aWNlCisgKiBmcmFtZTogSERNSSBEUk0gaW5m
b2ZyYW1lCiAgKi8KIHN0YXRpYyB2b2lkIGhkbWlfZHJtX2luZm9mcmFtZV9sb2coY29uc3QgY2hh
ciAqbGV2ZWwsCiAJCQkJICAgc3RydWN0IGRldmljZSAqZGV2LAotLSAKMS45LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
