Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412110C9F3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 14:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F006E81D;
	Thu, 28 Nov 2019 13:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873D86E81D;
 Thu, 28 Nov 2019 13:57:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 05:57:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="199533671"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 05:57:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Provide ddc symlink in hdmi connector sysfs
 directory
In-Reply-To: <20191128135106.21985-1-andrzej.p@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <874kyonvpd.fsf@intel.com>
 <20191128135106.21985-1-andrzej.p@collabora.com>
Date: Thu, 28 Nov 2019 15:57:02 +0200
Message-ID: <878so0m7dd.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOCBOb3YgMjAxOSwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29s
bGFib3JhLmNvbT4gd3JvdGU6Cj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUg
Z2VuZXJpYyBjb25uZWN0b3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdp
Y3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292
QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gUmViYXNlZCBvbnRvIGRybS1taXNjLW5leHQgYXMgb2Yg
MjggTm92IDIwMTkKClRoZSBjb25mbGljdCBpcyBpbiBkcm0taW50ZWwtbmV4dC1xdWV1ZWQgd2hl
cmUgdGhpcyB3b3VsZCBiZQphcHBsaWVkLiBQbGVhc2UgcmViYXNlIG9uIGRybS10aXAgb3IgZHJt
LWludGVsLW5leHQtcXVldWVkLgoKQlIsCkphbmkuCgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgMTIgKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hkbWkuYwo+IGluZGV4IGI1NGNjYmI1YWFkNS4uNDBmMzJmMmQ4YWYx
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKPiBAQCAt
MzEyOCw2ICszMTI4LDcgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVjdG9yKHN0cnVjdCBp
bnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAo+ICAJc3RydWN0IGludGVsX2VuY29k
ZXIgKmludGVsX2VuY29kZXIgPSAmaW50ZWxfZGlnX3BvcnQtPmJhc2U7Cj4gIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2ID0gaW50ZWxfZW5jb2Rlci0+YmFzZS5kZXY7Cj4gIAlzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7Cj4gKwlzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmRkYzsKPiAgCWVudW0gcG9ydCBwb3J0ID0gaW50ZWxfZW5jb2Rlci0+cG9ydDsKPiAgCXN0
cnVjdCBjZWNfY29ubmVjdG9yX2luZm8gY29ubl9pbmZvOwo+ICAKPiBAQCAtMzE0MCw4ICszMTQx
LDEzIEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRh
bF9wb3J0ICppbnRlbF9kaWdfcG9ydCwKPiAgCQkgaW50ZWxfZW5jb2Rlci0+YmFzZS5uYW1lKSkK
PiAgCQlyZXR1cm47Cj4gIAo+IC0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAm
aW50ZWxfaGRtaV9jb25uZWN0b3JfZnVuY3MsCj4gLQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9I
RE1JQSk7Cj4gKwlpbnRlbF9oZG1pLT5kZGNfYnVzID0gaW50ZWxfaGRtaV9kZGNfcGluKGRldl9w
cml2LCBwb3J0KTsKPiArCWRkYyA9IGludGVsX2dtYnVzX2dldF9hZGFwdGVyKGRldl9wcml2LCBp
bnRlbF9oZG1pLT5kZGNfYnVzKTsKPiArCj4gKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMo
ZGV2LCBjb25uZWN0b3IsCj4gKwkJCQkgICAgJmludGVsX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAo+
ICsJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKPiArCQkJCSAgICBkZGMpOwo+ICAJ
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJmludGVsX2hkbWlfY29ubmVjdG9y
X2hlbHBlcl9mdW5jcyk7Cj4gIAo+ICAJY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCA9IDE7
Cj4gQEAgLTMxNTEsOCArMzE1Nyw2IEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3Rvcihz
dHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCwKPiAgCWlmIChJTlRFTF9H
RU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpKQo+ICAJCWNvbm5l
Y3Rvci0+eWNiY3JfNDIwX2FsbG93ZWQgPSB0cnVlOwo+ICAKPiAtCWludGVsX2hkbWktPmRkY19i
dXMgPSBpbnRlbF9oZG1pX2RkY19waW4oZGV2X3ByaXYsIHBvcnQpOwo+IC0KPiAgCWlmIChXQVJO
X09OKHBvcnQgPT0gUE9SVF9BKSkKPiAgCQlyZXR1cm47Cj4gIAlpbnRlbF9lbmNvZGVyLT5ocGRf
cGluID0gaW50ZWxfaHBkX3Bpbl9kZWZhdWx0KGRldl9wcml2LCBwb3J0KTsKCi0tIApKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
