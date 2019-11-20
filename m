Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB90103D14
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 15:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F5D6E5F5;
	Wed, 20 Nov 2019 14:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291CB6E5F5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:15:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 06:15:42 -0800
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="200728666"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 06:15:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Fix Kconfig indentation
In-Reply-To: <20191120133640.11659-1-krzk@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191120133640.11659-1-krzk@kernel.org>
Date: Wed, 20 Nov 2019 16:15:36 +0200
Message-ID: <874kyyy6pj.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBOb3YgMjAxOSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
PiB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0aW9u
YWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6Cj4g
CSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+Cj4gU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vS2NvbmZpZyB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZp
Zwo+IGluZGV4IDExNjgzNTEyNjdmZC4uYWQxYjZlY2QyZTA4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiBAQCAt
OTQsMTggKzk0LDE4IEBAIGNvbmZpZyBEUk1fS01TX0ZCX0hFTFBFUgo+ICAJICBGQkRFViBoZWxw
ZXJzIGZvciBLTVMgZHJpdmVycy4KPiAgCj4gIGNvbmZpZyBEUk1fREVCVUdfRFBfTVNUX1RPUE9M
T0dZX1JFRlMKPiAtICAgICAgICBib29sICJFbmFibGUgcmVmY291bnQgYmFja3RyYWNlIGhpc3Rv
cnkgaW4gdGhlIERQIE1TVCBoZWxwZXJzIgo+IC0gICAgICAgIHNlbGVjdCBTVEFDS0RFUE9UCj4g
LSAgICAgICAgZGVwZW5kcyBvbiBEUk1fS01TX0hFTFBFUgo+IC0gICAgICAgIGRlcGVuZHMgb24g
REVCVUdfS0VSTkVMCj4gLSAgICAgICAgZGVwZW5kcyBvbiBFWFBFUlQKPiAtICAgICAgICBoZWxw
Cj4gLSAgICAgICAgICBFbmFibGVzIGRlYnVnIHRyYWNpbmcgZm9yIHRvcG9sb2d5IHJlZnMgaW4g
RFJNJ3MgRFAgTVNUIGhlbHBlcnMuIEEKPiAtICAgICAgICAgIGhpc3Rvcnkgb2YgZWFjaCB0b3Bv
bG9neSByZWZlcmVuY2UvZGVyZWZlcmVuY2Ugd2lsbCBiZSBwcmludGVkIHRvIHRoZQo+IC0gICAg
ICAgICAga2VybmVsIGxvZyBvbmNlIGEgcG9ydCBvciBicmFuY2ggZGV2aWNlJ3MgdG9wb2xvZ3kg
cmVmY291bnQgcmVhY2hlcyAwLgo+IC0KPiAtICAgICAgICAgIFRoaXMgaGFzIHRoZSBwb3RlbnRp
YWwgdG8gdXNlIGEgbG90IG9mIG1lbW9yeSBhbmQgcHJpbnQgc29tZSB2ZXJ5Cj4gLSAgICAgICAg
ICBsYXJnZSBrZXJuZWwgbWVzc2FnZXMuIElmIGluIGRvdWJ0LCBzYXkgIk4iLgo+ICsJYm9vbCAi
RW5hYmxlIHJlZmNvdW50IGJhY2t0cmFjZSBoaXN0b3J5IGluIHRoZSBEUCBNU1QgaGVscGVycyIK
PiArCXNlbGVjdCBTVEFDS0RFUE9UCj4gKwlkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSCj4gKwlk
ZXBlbmRzIG9uIERFQlVHX0tFUk5FTAo+ICsJZGVwZW5kcyBvbiBFWFBFUlQKPiArCWhlbHAKPiAr
CSAgRW5hYmxlcyBkZWJ1ZyB0cmFjaW5nIGZvciB0b3BvbG9neSByZWZzIGluIERSTSdzIERQIE1T
VCBoZWxwZXJzLiBBCj4gKwkgIGhpc3Rvcnkgb2YgZWFjaCB0b3BvbG9neSByZWZlcmVuY2UvZGVy
ZWZlcmVuY2Ugd2lsbCBiZSBwcmludGVkIHRvIHRoZQo+ICsJICBrZXJuZWwgbG9nIG9uY2UgYSBw
b3J0IG9yIGJyYW5jaCBkZXZpY2UncyB0b3BvbG9neSByZWZjb3VudCByZWFjaGVzIDAuCj4gKwo+
ICsJICBUaGlzIGhhcyB0aGUgcG90ZW50aWFsIHRvIHVzZSBhIGxvdCBvZiBtZW1vcnkgYW5kIHBy
aW50IHNvbWUgdmVyeQo+ICsJICBsYXJnZSBrZXJuZWwgbWVzc2FnZXMuIElmIGluIGRvdWJ0LCBz
YXkgIk4iLgo+ICAKPiAgY29uZmlnIERSTV9GQkRFVl9FTVVMQVRJT04KPiAgCWJvb2wgIkVuYWJs
ZSBsZWdhY3kgZmJkZXYgc3VwcG9ydCBmb3IgeW91ciBtb2Rlc2V0dGluZyBkcml2ZXIiCj4gQEAg
LTIzNCw4ICsyMzQsOCBAQCBjb25maWcgRFJNX1JBREVPTgo+ICAJdHJpc3RhdGUgIkFUSSBSYWRl
b24iCj4gIAlkZXBlbmRzIG9uIERSTSAmJiBQQ0kgJiYgTU1VCj4gIAlzZWxlY3QgRldfTE9BREVS
Cj4gLSAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gLSAgICAgICAgc2VsZWN0IERSTV9U
VE0KPiArCXNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ICsJc2VsZWN0IERSTV9UVE0KPiAgCXNlbGVj
dCBQT1dFUl9TVVBQTFkKPiAgCXNlbGVjdCBIV01PTgo+ICAJc2VsZWN0IEJBQ0tMSUdIVF9DTEFT
U19ERVZJQ0UKPiBAQCAtMjk0LDcgKzI5NCw3IEBAIGNvbmZpZyBEUk1fVktNUwo+ICAJICBJZiBN
IGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgdmttcy4KPiAgCj4gIGNvbmZp
ZyBEUk1fQVRJX1BDSUdBUlQKPiAtICAgICAgICBib29sCj4gKwlib29sCgpUaGlzIGh1bmsgaXMg
Z29uZSBpbiBkcm0tbWlzYy4KCk90aGVyIHRoYW4gdGhhdCwKClJldmlld2VkLWJ5OiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKCgo+ICAKPiAgc291cmNlICJkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL0tjb25maWciCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNl
IEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
