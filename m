Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE9F1FB03
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 21:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221ED891F4;
	Wed, 15 May 2019 19:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE514891F4;
 Wed, 15 May 2019 19:36:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 12:36:23 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 15 May 2019 12:36:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 May 2019 22:36:17 +0300
Date: Wed, 15 May 2019 22:36:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v10 03/12] drm: Parse HDR metadata info from EDID
Message-ID: <20190515193617.GI24299@intel.com>
References: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
 <1557855394-12214-4-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557855394-12214-4-git-send-email-uma.shankar@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTE6MDY6MjVQTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gSERSIG1ldGFkYXRhIGJsb2NrIGlzIGludHJvZHVjZWQgaW4gQ0VBLTg2MS4zIHNwZWMu
Cj4gUGFyc2luZyB0aGUgc2FtZSB0byBnZXQgdGhlIHBhbmVsJ3MgSERSIG1ldGFkYXRhLgo+IAo+
IHYyOiBSZWJhc2UgYW5kIGFkZGVkIFZpbGxlJ3MgUE9DIGNoYW5nZXMgdG8gdGhlIHBhdGNoLgo+
IAo+IHYzOiBObyBDaGFuZ2UKPiAKPiB2NDogQWRkcmVzc2VkIFNoYXNoYW5rJ3MgcmV2aWV3IGNv
bW1lbnRzCj4gCj4gdjU6IEFkZHJlc3NlZCBTaGFzaGFuaydzIGNvbW1lbnQgYW5kIGFkZGVkIGhp
cyBSQi4KPiAKPiB2NjogQWRkcmVzc2VkIEpvbmFzIEthcmxtYW4gcmV2aWV3IGNvbW1lbnRzLgo+
IAo+IHY3OiBBZHJlc3NlZCBWaWxsZSdzIHJldmlldyBjb21tZW50cyBhbmQgZml4ZWQgdGhlIGlz
c3VlCj4gd2l0aCBsZW5ndGggaGFuZGxpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5r
YXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogU2hhc2hhbmsgU2hhcm1h
IDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWQuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+
IGluZGV4IDg1MmJkZDguLjJlMGI1YmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC0yODUyLDYg
KzI4NTIsNyBAQCBzdGF0aWMgaW50IGRybV9jdnRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciwKPiAgI2RlZmluZSBWSURFT19CTE9DSyAgICAgMHgwMgo+ICAjZGVmaW5lIFZF
TkRPUl9CTE9DSyAgICAweDAzCj4gICNkZWZpbmUgU1BFQUtFUl9CTE9DSwkweDA0Cj4gKyNkZWZp
bmUgSERSX1NUQVRJQ19NRVRBREFUQV9CTE9DSwkweDYKPiAgI2RlZmluZSBVU0VfRVhURU5ERURf
VEFHIDB4MDcKPiAgI2RlZmluZSBFWFRfVklERU9fQ0FQQUJJTElUWV9CTE9DSyAweDAwCj4gICNk
ZWZpbmUgRVhUX1ZJREVPX0RBVEFfQkxPQ0tfNDIwCTB4MEUKPiBAQCAtMzgzNCw2ICszODM1LDUy
IEBAIHN0YXRpYyB2b2lkIGZpeHVwX2RldGFpbGVkX2NlYV9tb2RlX2Nsb2NrKHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlKQo+ICAJbW9kZS0+Y2xvY2sgPSBjbG9jazsKPiAgfQo+ICAKPiAr
c3RhdGljIGJvb2wgY2VhX2RiX2lzX2hkbWlfaGRyX21ldGFkYXRhX2Jsb2NrKGNvbnN0IHU4ICpk
YikKPiArewo+ICsJaWYgKGNlYV9kYl90YWcoZGIpICE9IFVTRV9FWFRFTkRFRF9UQUcpCj4gKwkJ
cmV0dXJuIGZhbHNlOwo+ICsKPiArCWlmIChkYlsxXSAhPSBIRFJfU1RBVElDX01FVEFEQVRBX0JM
T0NLKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gKwlyZXR1cm4gdHJ1ZTsKPiArfQo+ICsKPiAr
c3RhdGljIHVpbnQ4X3QgZW90Zl9zdXBwb3J0ZWQoY29uc3QgdTggKmVkaWRfZXh0KQo+ICt7Cj4g
KwlyZXR1cm4gZWRpZF9leHRbMl0gJgo+ICsJCShCSVQoSERNSV9FT1RGX1RSQURJVElPTkFMX0dB
TU1BX1NEUikgfAo+ICsJCSBCSVQoSERNSV9FT1RGX1RSQURJVElPTkFMX0dBTU1BX0hEUikgfAo+
ICsJCSBCSVQoSERNSV9FT1RGX1NNUFRFX1NUMjA4NCkpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdWlu
dDhfdCBoZHJfbWV0YWRhdGFfdHlwZShjb25zdCB1OCAqZWRpZF9leHQpCj4gK3sKPiArCXJldHVy
biBlZGlkX2V4dFszXSAmCj4gKwkJQklUKEhETUlfU1RBVElDX01FVEFEQVRBX1RZUEUxKTsKPiAr
fQo+ICsKPiArc3RhdGljIHZvaWQKPiArZHJtX3BhcnNlX2hkcl9tZXRhZGF0YV9ibG9jayhzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBjb25zdCB1OCAqZGIpCj4gK3sKPiArCXUxNiBs
ZW47Cj4gKwo+ICsJbGVuID0gY2VhX2RiX3BheWxvYWRfbGVuKGRiKTsKPiArCWlmIChsZW4gPj0g
MykgewoKSSBiZWxpZXZlIGluIG90aGVyIGNhc2VzIHdlJ3ZlIHB1dCB0aGUgbGVuZ3RoIGNoZWNr
IGZvciB0aGUKbWFuZGF0b3J5IGJ5dGVzIGludG8gdGhlIGNlYV9kYl9pc19mb28oKSBmdW5jdGlv
bi4gV291bGQgYmUKZ29vZCB0byBmb2xsb3cgdGhlIHBhdGggbGFpZCBvdXQgYnkgZXhpc3Rpbmcg
Y29kZSBoZXJlIHRvby4KCj4gKwkJY29ubmVjdG9yLT5oZHJfc2lua19tZXRhZGF0YS5oZG1pX3R5
cGUxLmVvdGYgPQo+ICsJCQkJCQllb3RmX3N1cHBvcnRlZChkYik7Cj4gKwkJY29ubmVjdG9yLT5o
ZHJfc2lua19tZXRhZGF0YS5oZG1pX3R5cGUxLm1ldGFkYXRhX3R5cGUgPQo+ICsJCQkJCQloZHJf
bWV0YWRhdGFfdHlwZShkYik7Cj4gKwl9Cj4gKwo+ICsJaWYgKGxlbiA+PSA0KQo+ICsJCWNvbm5l
Y3Rvci0+aGRyX3NpbmtfbWV0YWRhdGEuaGRtaV90eXBlMS5tYXhfY2xsID0gZGJbNF07Cj4gKwlp
ZiAobGVuID49IDUpCj4gKwkJY29ubmVjdG9yLT5oZHJfc2lua19tZXRhZGF0YS5oZG1pX3R5cGUx
Lm1heF9mYWxsID0gZGJbNV07Cj4gKwlpZiAobGVuID49IDYpCj4gKwkJY29ubmVjdG9yLT5oZHJf
c2lua19tZXRhZGF0YS5oZG1pX3R5cGUxLm1pbl9jbGwgPSBkYls2XTsKPiArfQo+ICsKPiAgc3Rh
dGljIHZvaWQKPiAgZHJtX3BhcnNlX2hkbWlfdnNkYl9hdWRpbyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLCBjb25zdCB1OCAqZGIpCj4gIHsKPiBAQCAtNDQ2MSw2ICs0NTA4LDggQEAg
c3RhdGljIHZvaWQgZHJtX3BhcnNlX2NlYV9leHQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwKPiAgCQkJZHJtX3BhcnNlX3k0MjBjbWRiX2JpdG1hcChjb25uZWN0b3IsIGRiKTsKPiAg
CQlpZiAoY2VhX2RiX2lzX3ZjZGIoZGIpKQo+ICAJCQlkcm1fcGFyc2VfdmNkYihjb25uZWN0b3Is
IGRiKTsKPiArCQlpZiAoY2VhX2RiX2lzX2hkbWlfaGRyX21ldGFkYXRhX2Jsb2NrKGRiKSkKPiAr
CQkJZHJtX3BhcnNlX2hkcl9tZXRhZGF0YV9ibG9jayhjb25uZWN0b3IsIGRiKTsKPiAgCX0KPiAg
fQo+ICAKPiAtLSAKPiAxLjkuMQoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
