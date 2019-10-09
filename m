Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B2D08BD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAC46E90C;
	Wed,  9 Oct 2019 07:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492526E90C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 07:47:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 00:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="192808331"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
 by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2019 00:47:10 -0700
Received: from ahiler-desk1.fi.intel.com (10.237.68.141) by
 IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 9 Oct 2019 08:47:02 +0100
Date: Wed, 9 Oct 2019 10:47:00 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
Message-ID: <20191009074700.ieujxt3ueads2cbt@ahiler-desk1.fi.intel.com>
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
 <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
 <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
 <CADnq5_O0QjK0gecUiO0K6Tm7UVY7aF4uuBcj_uvHPKJBtAyEPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_O0QjK0gecUiO0K6Tm7UVY7aF4uuBcj_uvHPKJBtAyEPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Patchwork-Hint: comment
User-Agent: NeoMutt/20180716
X-Originating-IP: [10.237.68.141]
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Huang, 
 Ray" <Ray.Huang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDk6MTM6NDFBTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgNDowNCBBTSBLb2VuaWcsIENocmlzdGlhbgo+
IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4KPiA+IE15IGdpdCB2ZXJzaW9u
IHNob3VsZCBiZSByZWxhdGl2ZSBuZXcsIGJ1dCBJJ20gdXN1YWxseSB1c2luZyB0aHVuZGVyYmly
ZAo+ID4gdG8gc2VuZCBwdWxsIHJlcXVlc3RzIG5vdCBnaXQgaXRzZWxmIHNpbmNlIEkgd2FudCB0
byBlZGl0IHRoZSBtZXNzYWdlCj4gPiBiZWZvcmUgc2VuZGluZy4KPiA+Cj4gPiBIb3cgd291bGQg
SSBkbyB0aGlzIGluIGEgd2F5IHBhdGNod29yayBsaWtlcyBpdCB3aXRoIGdpdD8KPiAKPiBGV0lX
LCBJIHVzdWFsbHkgZ2VuZXJhdGUgdGhlIGVtYWlsIGZpcnN0IGFuZCB0aGVuIHVzZSBnaXQtc2Vu
ZC1lbWFpbAo+IHRvIGFjdHVhbGx5IHNlbmQgaXQuCj4gCj4gQWxleAoKSGV5LAoKRkRPIHBhdGNo
d29yayBtYWludGFpbmVyIGhlcmUuCgpJIGhhdmUgdHJpZWQgZmV3IHRoaW5ncyBxdWlja2x5IHdp
dGggbm8gbHVjay4gVGhlcmUgaXMgc29tZXRoaW5nIGZpc2h5CmFib3V0IEZETyBkZXBsb3ltZW50
IG9mIHBhdGNod29yayAtIHlvdSBlbWFpbCB3b3JrcyBqdXN0IGZpbmUgb24gbXkKZGV2ZWxvcG1l
bnQgaW5zdGFuY2UuCgpJIGhhdmUgY3JlYXRlZCBpc3N1ZSBmb3IgdGhpczoKaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL3BhdGNod29yay1mZG8vcGF0Y2h3b3JrLWZkby9pc3N1ZXMvMjgK
ClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4KCkNoZWVycywKQXJlawoKPiA+IFRoYW5rcywK
PiA+IENocmlzdGlhbi4KPiA+Cj4gPiBBbSAwNy4xMC4xOSB1bSAyMTo1OCBzY2hyaWViIERhdmUg
QWlybGllOgo+ID4gPiBGb3Igc29tZSByZWFzb24gdGhpcyBkaWRuJ3QgZW5kIHVwIGluIHBhdGNo
d29yayB3aGljaCBtYWtlcyBpdCBoYXJkCj4gPiA+IGZvciBtZSB0byBwcm9jZXNzLgo+ID4gPgo+
ID4gPiBVc3VhbCBzdXNwZWN0cyBhcmUgdXNpbmcgdG9vIG9sZCBhIGdpdCB0byBzZW5kIGl0IG9y
IG1heWJlIGl0IGdvdCBjdHJsLU1zIGluIGl0Lgo+ID4gPgo+ID4gPiBEYXZlLgo+ID4gPgo+ID4g
PiBPbiBUaHUsIDMgT2N0IDIwMTkgYXQgMDE6NDQsIENocmlzdGlhbiBLw7ZuaWcKPiA+ID4gPGNr
b2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+ID4+IEhpIERhdmUsIERh
bmllbCwKPiA+ID4+Cj4gPiA+PiB3ZSBoYWQgc29tZSBwcm9ibGVtcyB0aGlzIGN5Y2xlIHNlbmRp
bmcgb3V0IFRUTSBmaXhlcyBiZWNhdXNlIG9mIGxhY2sgb2YKPiA+ID4+IHRpbWUgdG8gcmViYXNl
IGFtZC1zdGFnaW5nLWRybS1uZXh0Lgo+ID4gPj4KPiA+ID4+IEJlY2F1c2Ugb2YgdGhpcyBBbGV4
IGFuZCBJIGRlY2lkZWQgdGhhdCBJJ20gZ29pbmcgdG8gc2VuZCBvdXQgVFRNIHB1bGwKPiA+ID4+
IHJlcXVlc3RzIHNlcGFyYXRlbHkgbm93LiBTbyB0aGlzIGlzIHRoZSBmaXJzdCBzbWFsbCBidW5j
aCBvZiBmaXhlcyBmb3IgNS40Lgo+ID4gPj4KPiA+ID4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgNTRlY2I4ZjcwMjhjNWViM2Q3NDBiYjgyYjBmMWQ5MGYyZGY2M2M1YzoKPiA+
ID4+Cj4gPiA+PiAgICAgTGludXggNS40LXJjMSAoMjAxOS0wOS0zMCAxMDozNTo0MCAtMDcwMCkK
PiA+ID4+Cj4gPiA+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+
ID4+Cj4gPiA+PiAgICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Nrb2VuaWcvbGlu
dXgtZHJtLmdpdCBkcm0tdHRtLWZpeGVzCj4gPiA+Pgo+ID4gPj4gZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDNlZWZjZmU5YTY0NGJlNDQwOTY5MWI0NGMzYjJkNjI5ZDE3N2ZiOWE6Cj4g
PiA+Pgo+ID4gPj4gICAgIGRybS90dG06IFJlc3RvcmUgdHRtIHByZWZhdWx0aW5nICgyMDE5LTEw
LTAyIDE1OjU3OjM0ICswMjAwKQo+ID4gPj4KPiA+ID4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4+IENocmlzdGlh
biBLw7ZuaWcgKDEpOgo+ID4gPj4gICAgICAgICBkcm0vdHRtOiBmaXggYnVzeSByZWZlcmVuY2Ug
aW4gdHRtX21lbV9ldmljdF9maXJzdAo+ID4gPj4KPiA+ID4+IFRob21hcyBIZWxsc3Ryb20gKDEp
Ogo+ID4gPj4gICAgICAgICBkcm0vdHRtOiBSZXN0b3JlIHR0bSBwcmVmYXVsdGluZwo+ID4gPj4K
PiA+ID4+ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgfCAgNCArKy0tCj4gPiA+
PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgMTYgKysrKysrKy0tLS0tLS0t
LQo+ID4gPj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQo+ID4gPj4KPiA+ID4+IFJlZ2FyZHMsCj4gPiA+PiBDaHJpc3RpYW4uCj4gPgo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
