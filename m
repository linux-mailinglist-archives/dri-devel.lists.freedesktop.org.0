Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B113E5C4A6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C5889B9A;
	Mon,  1 Jul 2019 20:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35E689B69
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 11:44:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jul 2019 04:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,439,1557212400"; d="scan'208";a="184232621"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 01 Jul 2019 04:44:54 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 01 Jul 2019 14:44:53 +0300
Date: Mon, 1 Jul 2019 14:44:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
Message-ID: <20190701114453.GR2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <20190628125346.GM2640@lahna.fi.intel.com>
 <c5545128e27cbcce5888f9972ff066fb4979fd28.camel@gmail.com>
 <20190628141455.GO2640@lahna.fi.intel.com>
 <29c0d7a01f5b233ff3b68ad215f7ac9308f860db.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29c0d7a01f5b233ff3b68ad215f7ac9308f860db.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDQ6NTM6MDJQTSArMDIwMCwgVGltdXIgS3Jpc3TDs2Yg
d3JvdGU6Cj4gT24gRnJpLCAyMDE5LTA2LTI4IGF0IDE3OjE0ICswMzAwLCBNaWthIFdlc3RlcmJl
cmcgd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAyOCwgMjAxOSBhdCAwMzozMzo1NlBNICswMjAwLCBU
aW11ciBLcmlzdMOzZiB3cm90ZToKPiA+ID4gSSBoYXZlIHR3byBtb3JlIHF1ZXN0aW9uczoKPiA+
ID4gCj4gPiA+IDEuIFdoYXQgaXMgdGhlIGJlc3Qgd2F5IHRvIHRlc3QgdGhhdCB0aGUgdmlydHVh
bCBsaW5rIGlzIGluZGVlZAo+ID4gPiBjYXBhYmxlCj4gPiA+IG9mIDQwIEdiaXQgLyBzZWM/IFNv
IGZhciBJJ3ZlIGJlZW4gdW5hYmxlIHRvIGZpZ3VyZSBvdXQgaG93IHRvCj4gPiA+IG1lYXN1cmUK
PiA+ID4gaXRzIG1heGltdW0gdGhyb3VnaHB1dC4KPiA+IAo+ID4gSSBkb24ndCB0aGluayB0aGVy
ZSBpcyBhbnkgZ29vZCB3YXkgdG8gdGVzdCBpdCBidXQgdGhlIFRodW5kZXJib2x0Cj4gPiBnZW4g
Mwo+ID4gbGluayBpcyBwcmV0dHkgbXVjaCBhbHdheXMgNDAgR2IvcyAoMjAgR2IvcyB4IDIpIGZy
b20gd2hpY2ggdGhlCj4gPiBiYW5kd2lkdGggaXMgc2hhcmVkIGR5bmFtaWNhbGx5IGJldHdlZW4g
ZGlmZmVyZW50IHR1bm5lbHMgKHZpcnR1YWwKPiA+IGxpbmtzKS4KPiAKPiBUaGF0J3MgdW5mb3J0
dW5hdGUsIEkgd291bGQgaGF2ZSBleHBlY3RlZCB0aGVyZSB0byBiZSBzb21lIHNvcnQgb2YgUENJ
ZQo+IHNwZWVkIHRlc3QgdXRpbGl0eS4KPiAKPiBOb3cgdGhhdCBJIGdhdmUgaXQgYSB0cnksIEkg
Y2FuIG1lYXN1cmUgfjIwIEdiaXQvc2VjIHdoZW4gSSBydW4gR25vbWUKPiBXYXlsYW5kIG9uIHRo
aXMgc3lzdGVtICh3aGljaCBmb3JjZXMgdGhlIGVHUFUgdG8gc2VuZCB0aGUgZnJhbWVidWZmZXIK
PiBiYWNrIGFuZCBmb3J0aCBhbGwgdGhlIHRpbWUgLSBmb3IgdHdvIDRLIG1vbml0b3JzKS4gQnV0
IGl0IHN0aWxsCj4gZG9lc24ndCBnaXZlIG1lIDQwIEdiaXQvc2VjLgoKSG93IGRvIHlvdSBtZWFz
dXJlIHRoYXQ/IElzIHRoZXJlIGEgRFAgc3RyZWFtIGFsc28/IEFzIEkgc2FpZCB0aGUKYmFuZHdp
ZHRoIGlzIGR5bmFtaWNhbGx5IHNoYXJlZCBiZXR3ZWVuIHRoZSBjb25zdW1lcnMgc28geW91IHBy
b2JhYmx5IGRvCm5vdCBnZXQgdGhlIGZ1bGwgYmFuZHdpZHRoIGZvciBQQ0llIG9ubHkgYmVjYXVz
ZSBpdCBuZWVkcyB0byByZXNlcnZlCnNvbWV0aGluZyBmb3IgcG9zc2libGUgRFAgc3RyZWFtcyBh
bmQgc28gb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
