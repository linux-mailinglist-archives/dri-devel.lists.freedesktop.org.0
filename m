Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39077EC1E2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 12:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ED16F7C8;
	Fri,  1 Nov 2019 11:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D866E1E2;
 Fri,  1 Nov 2019 11:31:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 04:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,254,1569308400"; d="scan'208";a="203827264"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 01 Nov 2019 04:31:05 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iQV8y-0009vt-KL; Fri, 01 Nov 2019 19:31:04 +0800
Date: Fri, 1 Nov 2019 19:30:44 +0800
From: kbuild test robot <lkp@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [drm-intel:drm-intel-next-queued 2/2]
 drivers/gpu/drm/i915/i915_perf.c:2442:85: sparse: sparse: dubious: x | !y
Message-ID: <201911011942.8nISPnhk%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHJlZTogICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0taW50ZWwgZHJtLWludGVs
LW5leHQtcXVldWVkCmhlYWQ6ICAgMDBhN2YwZDcxNTVjMjhhYjE4NjAwYmNmM2Y2MmQ3Y2FkZTJh
ODcwZApjb21taXQ6IDAwYTdmMGQ3MTU1YzI4YWIxODYwMGJjZjNmNjJkN2NhZGUyYTg3MGQgWzIv
Ml0gZHJtL2k5MTUvdGdsOiBBZGQgcGVyZiBzdXBwb3J0IG9uIFRHTApyZXByb2R1Y2U6CiAgICAg
ICAgIyBhcHQtZ2V0IGluc3RhbGwgc3BhcnNlCiAgICAgICAgIyBzcGFyc2UgdmVyc2lvbjogdjAu
Ni4xLWRpcnR5CiAgICAgICAgZ2l0IGNoZWNrb3V0IDAwYTdmMGQ3MTU1YzI4YWIxODYwMGJjZjNm
NjJkN2NhZGUyYTg3MGQKICAgICAgICBtYWtlIEFSQ0g9eDg2XzY0IGFsbG1vZGNvbmZpZwogICAg
ICAgIG1ha2UgQz0xIENGPSctZmRpYWdub3N0aWMtcHJlZml4IC1EX19DSEVDS19FTkRJQU5fXycK
CklmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKUmVwb3J0ZWQt
Ynk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgoKCnNwYXJzZSB3YXJuaW5nczog
KG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KQoKPj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9w
ZXJmLmM6MjQ0Mjo4NTogc3BhcnNlOiBzcGFyc2U6IGR1YmlvdXM6IHggfCAheQoKdmltICsyNDQy
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGVyZi5jCgogIDI0MzAJCiAgMjQzMQlzdGF0aWMg
aW50IGdlbjEyX2VuYWJsZV9tZXRyaWNfc2V0KHN0cnVjdCBpOTE1X3BlcmZfc3RyZWFtICpzdHJl
YW0pCiAgMjQzMgl7CiAgMjQzMwkJc3RydWN0IGludGVsX3VuY29yZSAqdW5jb3JlID0gc3RyZWFt
LT51bmNvcmU7CiAgMjQzNAkJc3RydWN0IGk5MTVfb2FfY29uZmlnICpvYV9jb25maWcgPSBzdHJl
YW0tPm9hX2NvbmZpZzsKICAyNDM1CQlib29sIHBlcmlvZGljID0gc3RyZWFtLT5wZXJpb2RpYzsK
ICAyNDM2CQl1MzIgcGVyaW9kX2V4cG9uZW50ID0gc3RyZWFtLT5wZXJpb2RfZXhwb25lbnQ7CiAg
MjQzNwkJaW50IHJldDsKICAyNDM4CQogIDI0MzkJCWludGVsX3VuY29yZV93cml0ZSh1bmNvcmUs
IEdFTjEyX09BR19PQV9ERUJVRywKICAyNDQwCQkJCSAgIC8qIERpc2FibGUgY2xrIHJhdGlvIHJl
cG9ydHMsIGxpa2UgcHJldmlvdXMgR2Vucy4gKi8KICAyNDQxCQkJCSAgIF9NQVNLRURfQklUX0VO
QUJMRShHRU4xMl9PQUdfT0FfREVCVUdfRElTQUJMRV9DTEtfUkFUSU9fUkVQT1JUUyB8Cj4gMjQ0
MgkJCQkJCSAgICAgIEdFTjEyX09BR19PQV9ERUJVR19JTkNMVURFX0NMS19SQVRJTykgfAogIDI0
NDMJCQkJICAgLyoKICAyNDQ0CQkJCSAgICAqIElmIHRoZSB1c2VyIGRpZG4ndCByZXF1aXJlIE9B
IHJlcG9ydHMsIGluc3RydWN0IHRoZQogIDI0NDUJCQkJICAgICogaGFyZHdhcmUgbm90IHRvIGVt
aXQgY3R4IHN3aXRjaCByZXBvcnRzLgogIDI0NDYJCQkJICAgICovCiAgMjQ0NwkJCQkgICAhKHN0
cmVhbS0+c2FtcGxlX2ZsYWdzICYgU0FNUExFX09BX1JFUE9SVCkgPwogIDI0NDgJCQkJICAgX01B
U0tFRF9CSVRfRU5BQkxFKEdFTjEyX09BR19PQV9ERUJVR19ESVNBQkxFX0NUWF9TV0lUQ0hfUkVQ
T1JUUykgOgogIDI0NDkJCQkJICAgX01BU0tFRF9CSVRfRElTQUJMRShHRU4xMl9PQUdfT0FfREVC
VUdfRElTQUJMRV9DVFhfU1dJVENIX1JFUE9SVFMpKTsKICAyNDUwCQogIDI0NTEJCWludGVsX3Vu
Y29yZV93cml0ZSh1bmNvcmUsIEdFTjEyX09BR19PQUdMQkNUWENUUkwsIHBlcmlvZGljID8KICAy
NDUyCQkJCSAgIChHRU4xMl9PQUdfT0FHTEJDVFhDVFJMX0NPVU5URVJfUkVTVU1FIHwKICAyNDUz
CQkJCSAgICBHRU4xMl9PQUdfT0FHTEJDVFhDVFJMX1RJTUVSX0VOQUJMRSB8CiAgMjQ1NAkJCQkg
ICAgKHBlcmlvZF9leHBvbmVudCA8PCBHRU4xMl9PQUdfT0FHTEJDVFhDVFJMX1RJTUVSX1BFUklP
RF9TSElGVCkpCiAgMjQ1NQkJCQkgICAgOiAwKTsKICAyNDU2CQogIDI0NTcJCS8qCiAgMjQ1OAkJ
ICogVXBkYXRlIGFsbCBjb250ZXh0cyBwcmlvciB3cml0aW5nIHRoZSBtdXggY29uZmlndXJhdGlv
bnMgYXMgd2UgbmVlZAogIDI0NTkJCSAqIHRvIG1ha2Ugc3VyZSBhbGwgc2xpY2VzL3N1YnNsaWNl
cyBhcmUgT04gYmVmb3JlIHdyaXRpbmcgdG8gTk9BCiAgMjQ2MAkJICogcmVnaXN0ZXJzLgogIDI0
NjEJCSAqLwogIDI0NjIJCXJldCA9IGxyY19jb25maWd1cmVfYWxsX2NvbnRleHRzKHN0cmVhbSwg
b2FfY29uZmlnKTsKICAyNDYzCQlpZiAocmV0KQogIDI0NjQJCQlyZXR1cm4gcmV0OwogIDI0NjUJ
CiAgMjQ2NgkJLyoKICAyNDY3CQkgKiBGb3IgR2VuMTIsIHBlcmZvcm1hbmNlIGNvdW50ZXJzIGFy
ZSBjb250ZXh0CiAgMjQ2OAkJICogc2F2ZWQvcmVzdG9yZWQuIE9ubHkgZW5hYmxlIGl0IGZvciB0
aGUgY29udGV4dCB0aGF0CiAgMjQ2OQkJICogcmVxdWVzdGVkIHRoaXMuCiAgMjQ3MAkJICovCiAg
MjQ3MQkJaWYgKHN0cmVhbS0+Y3R4KSB7CiAgMjQ3MgkJCXJldCA9IGdlbjEyX2VtaXRfb2FyX2Nv
bmZpZyhzdHJlYW0tPnBpbm5lZF9jdHgsCiAgMjQ3MwkJCQkJCSAgICBvYV9jb25maWcgIT0gTlVM
TCk7CiAgMjQ3NAkJCWlmIChyZXQpCiAgMjQ3NQkJCQlyZXR1cm4gcmV0OwogIDI0NzYJCX0KICAy
NDc3CQogIDI0NzgJCXJldHVybiBlbWl0X29hX2NvbmZpZyhzdHJlYW0sIG9hX2NvbmZpZywgb2Ff
Y29udGV4dChzdHJlYW0pKTsKICAyNDc5CX0KICAyNDgwCQoKLS0tCjAtREFZIGtlcm5lbCB0ZXN0
IGluZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2Vu
dGVyCmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9rYnVpbGQtYWxsICAgICAgICAgICAg
ICAgICAgIEludGVsIENvcnBvcmF0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
