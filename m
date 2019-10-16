Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B2D8DF3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFFA6E92D;
	Wed, 16 Oct 2019 10:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ED96E92D;
 Wed, 16 Oct 2019 10:33:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 03:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; d="scan'208";a="189639979"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 16 Oct 2019 03:33:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Oct 2019 13:33:06 +0300
Date: Wed, 16 Oct 2019 13:33:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jian-Hong Pan <jian-hong@endlessm.com>
Subject: Re: [PATCH] drm/i915/hdmi: enable resolution 3840x2160 for type 1 HDMI
Message-ID: <20191016103306.GL1208@intel.com>
References: <20191016095757.4919-1-jian-hong@endlessm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016095757.4919-1-jian-hong@endlessm.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux@endlessm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDU6NTc6NThQTSArMDgwMCwgSmlhbi1Ib25nIFBhbiB3
cm90ZToKPiBUeXBlIDEgSERNSSBtYXkgYmUgdmVyc2lvbiAxLjMgb3IgdXBwZXIsIHdoaWNoIHN1
cHBvcnRzIGhpZ2hlciBtYXggVE1EUwo+IGNsb2NrIGZvciBoaWdoZXIgcmVzb2x1dGlvbnMsCgpT
cGVjIHNheXMgIlR5cGUgMSBhZGFwdG9ycyBjYW4gc3VwcG9ydCBEVkkgb3IgSERNSSB1cCB0byBh
IDE2NU1IeiBUTURTIGNsb2NrIHJhdGUuIgoKQW5kIEkndmUgZGVmaW5pdGVseSBzZWVuIEhETUkg
ZG9uZ2xlcyB0aGF0IGNhbid0IGRlYWwgd2l0aAplZy4gMTA4MHAgMTJicGMgQDIyNU1Iei4gV2Ug
ZG9uJ3Qgd2FudCB1c2VycyB3aXRoIGJsYWNrIHNjcmVlbnMKb3V0IG9mIHRoZSBib3gsIHNvIE5B
Sy4KCklmIHlvdSB3YW50IHRvICJvdmVyY2xvY2siIHlvdXIgaGFyZHdhcmUgeW91IGNhbiBkbyBz
byBieSBzZXR0aW5nIHVwCnRoZSBtb2RlbGluZSBtYW51YWxseS4KCj4gbGlrZSAzODQweDIxNjAu
IFRoaXMgcGF0Y2ggc2V0cyBtYXggVE1EUwo+IGNsb2NrIGFjY29yZGluZyB0byB0aGUgY2hpcCwg
aWYgdGhlIGFkYXB0ZXIgaXMgdHlwZSAxIEhETUkuCj4gCj4gQnVnbGluazogaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEyMDE4Cj4gRml4ZXM6IGIxYmExMjRk
OGU5NSAoImRybS9pOTE1OiBSZXNwZWN0IERQKysgYWRhcHRvciBUTURTIGNsb2NrIGxpbWl0IikK
PiBTaWduZWQtb2ZmLWJ5OiBKaWFuLUhvbmcgUGFuIDxqaWFuLWhvbmdAZW5kbGVzc20uY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyB8IDEzICsr
KysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKPiBp
bmRleCBlMDJmMGZhZWNmMDIuLjc0ZTQ0MjZmZmNhZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4gQEAgLTI0NTQsNiArMjQ1NCw3IEBAIGludGVsX2hk
bWlfZHBfZHVhbF9tb2RlX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBi
b29sIGhhc19lZGlkKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYg
PSB0b19pOTE1KGNvbm5lY3Rvci0+ZGV2KTsKPiAgCXN0cnVjdCBpbnRlbF9oZG1pICpoZG1pID0g
aW50ZWxfYXR0YWNoZWRfaGRtaShjb25uZWN0b3IpOwo+ICsJc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIgPSAmaGRtaV90b19kaWdfcG9ydChoZG1pKS0+YmFzZTsKPiAgCWVudW0gcG9ydCBw
b3J0ID0gaGRtaV90b19kaWdfcG9ydChoZG1pKS0+YmFzZS5wb3J0Owo+ICAJc3RydWN0IGkyY19h
ZGFwdGVyICphZGFwdGVyID0KPiAgCQlpbnRlbF9nbWJ1c19nZXRfYWRhcHRlcihkZXZfcHJpdiwg
aGRtaS0+ZGRjX2J1cyk7Cj4gQEAgLTI0ODgsOCArMjQ4OSwxNiBAQCBpbnRlbF9oZG1pX2RwX2R1
YWxfbW9kZV9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBoYXNf
ZWRpZCkKPiAgCQlyZXR1cm47Cj4gIAo+ICAJaGRtaS0+ZHBfZHVhbF9tb2RlLnR5cGUgPSB0eXBl
Owo+IC0JaGRtaS0+ZHBfZHVhbF9tb2RlLm1heF90bWRzX2Nsb2NrID0KPiAtCQlkcm1fZHBfZHVh
bF9tb2RlX21heF90bWRzX2Nsb2NrKHR5cGUsIGFkYXB0ZXIpOwo+ICsJLyogVHlwZSAxIEhETUkg
bWF5IGJlIHZlcnNpb24gMS4zIG9yIHVwcGVyLCB3aGljaCBzdXBwb3J0cyBoaWdoZXIgbWF4Cj4g
KwkgKiBUTURTIGNsb2NrIGZvciBoaWdoZXIgcmVzb2x1dGlvbnMsIGxpa2UgMzg0MHgyMTYwLiBT
bywgc2V0IGl0Cj4gKwkgKiBhY2NvcmRpbmcgdG8gdGhlIGNoaXAsIGlmIHRoZSBhZGFwdGVyIGlz
IHR5cGUgMSBIRE1JLgo+ICsJICovCj4gKwlpZiAodHlwZSA9PSBEUk1fRFBfRFVBTF9NT0RFX1RZ
UEUxX0hETUkpCj4gKwkJaGRtaS0+ZHBfZHVhbF9tb2RlLm1heF90bWRzX2Nsb2NrID0KPiArCQkJ
aW50ZWxfaGRtaV9zb3VyY2VfbWF4X3RtZHNfY2xvY2soZW5jb2Rlcik7Cj4gKwllbHNlCj4gKwkJ
aGRtaS0+ZHBfZHVhbF9tb2RlLm1heF90bWRzX2Nsb2NrID0KPiArCQkJZHJtX2RwX2R1YWxfbW9k
ZV9tYXhfdG1kc19jbG9jayh0eXBlLCBhZGFwdGVyKTsKPiAgCj4gIAlEUk1fREVCVUdfS01TKCJE
UCBkdWFsIG1vZGUgYWRhcHRvciAoJXMpIGRldGVjdGVkIChtYXggVE1EUyBjbG9jazogJWQga0h6
KVxuIiwKPiAgCQkgICAgICBkcm1fZHBfZ2V0X2R1YWxfbW9kZV90eXBlX25hbWUodHlwZSksCj4g
LS0gCj4gMi4yMy4wCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
