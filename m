Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C111E7CD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837A46EB02;
	Fri, 13 Dec 2019 16:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AA46EB02;
 Fri, 13 Dec 2019 16:10:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 3FFAC292DE9
Subject: Re: [PATCH] drm/i915: Provide ddc symlink in hdmi connector sysfs
 directory
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
References: <878so0m7dd.fsf@intel.com>
 <20191128150130.26266-1-andrzej.p@collabora.com>
Message-ID: <48e69dff-84c2-8bb9-5568-6acc32110ff0@collabora.com>
Date: Fri, 13 Dec 2019 17:10:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191128150130.26266-1-andrzej.p@collabora.com>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDI4LjExLjIwMTkgb8KgMTY6MDEsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiBwaXN6ZToK
PiBVc2UgdGhlIGRkYyBwb2ludGVyIHByb3ZpZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4K
PiAKCkEgZ2VudGxlIHBpbmcuCgpBbmRyemVqCgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGll
dHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gQWNrZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWls
LnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiAtLS0KPiBSZWJhc2VkIG9udG8gZHJtLWludGVsLW5l
eHQtcXVldWVkLgo+IAo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1p
LmMgfCAxMiArKysrKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9o
ZG1pLmMKPiBpbmRleCAyOWExNzRhZjUzMTQuLjZlYzhkMTRiY2NkNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4gQEAgLTMxMzQsNiArMzEzNCw3IEBA
IHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0
ICppbnRlbF9kaWdfcG9ydCwKPiAgIAlzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2Rl
ciA9ICZpbnRlbF9kaWdfcG9ydC0+YmFzZTsKPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
aW50ZWxfZW5jb2Rlci0+YmFzZS5kZXY7Cj4gICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRl
dl9wcml2ID0gdG9faTkxNShkZXYpOwo+ICsJc3RydWN0IGkyY19hZGFwdGVyICpkZGM7Cj4gICAJ
ZW51bSBwb3J0IHBvcnQgPSBpbnRlbF9lbmNvZGVyLT5wb3J0Owo+ICAgCXN0cnVjdCBjZWNfY29u
bmVjdG9yX2luZm8gY29ubl9pbmZvOwo+ICAgCj4gQEAgLTMxNDksOCArMzE1MCwxMyBAQCB2b2lk
IGludGVsX2hkbWlfaW5pdF9jb25uZWN0b3Ioc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50
ZWxfZGlnX3BvcnQsCj4gICAJCSBpbnRlbF9lbmNvZGVyLT5iYXNlLm5hbWUpKQo+ICAgCQlyZXR1
cm47Cj4gICAKPiAtCWRybV9jb25uZWN0b3JfaW5pdChkZXYsIGNvbm5lY3RvciwgJmludGVsX2hk
bWlfY29ubmVjdG9yX2Z1bmNzLAo+IC0JCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOwo+
ICsJaW50ZWxfaGRtaS0+ZGRjX2J1cyA9IGludGVsX2hkbWlfZGRjX3BpbihkZXZfcHJpdiwgcG9y
dCk7Cj4gKwlkZGMgPSBpbnRlbF9nbWJ1c19nZXRfYWRhcHRlcihkZXZfcHJpdiwgaW50ZWxfaGRt
aS0+ZGRjX2J1cyk7Cj4gKwo+ICsJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgY29u
bmVjdG9yLAo+ICsJCQkJICAgICZpbnRlbF9oZG1pX2Nvbm5lY3Rvcl9mdW5jcywKPiArCQkJCSAg
ICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCj4gKwkJCQkgICAgZGRjKTsKPiAgIAlkcm1fY29u
bmVjdG9yX2hlbHBlcl9hZGQoY29ubmVjdG9yLCAmaW50ZWxfaGRtaV9jb25uZWN0b3JfaGVscGVy
X2Z1bmNzKTsKPiAgIAo+ICAgCWNvbm5lY3Rvci0+aW50ZXJsYWNlX2FsbG93ZWQgPSAxOwo+IEBA
IC0zMTYwLDggKzMxNjYsNiBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0b3Ioc3RydWN0
IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCj4gICAJaWYgKElOVEVMX0dFTihk
ZXZfcHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpCj4gICAJCWNvbm5lY3Rv
ci0+eWNiY3JfNDIwX2FsbG93ZWQgPSB0cnVlOwo+ICAgCj4gLQlpbnRlbF9oZG1pLT5kZGNfYnVz
ID0gaW50ZWxfaGRtaV9kZGNfcGluKGRldl9wcml2LCBwb3J0KTsKPiAtCj4gICAJaW50ZWxfZW5j
b2Rlci0+aHBkX3BpbiA9IGludGVsX2hwZF9waW5fZGVmYXVsdChkZXZfcHJpdiwgcG9ydCk7Cj4g
ICAKPiAgIAlpZiAoSEFTX0RESShkZXZfcHJpdikpCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
