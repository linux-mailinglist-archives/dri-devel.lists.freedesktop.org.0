Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D36434D33
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 18:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0D58922E;
	Tue,  4 Jun 2019 16:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFE68922E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 16:25:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 09:25:57 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 04 Jun 2019 09:25:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Jun 2019 19:25:53 +0300
Date: Tue, 4 Jun 2019 19:25:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Linking ALSA playback devices and DRM connectors
Message-ID: <20190604162553.GG5942@intel.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
 <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Ser,
 Simon" <simon.ser@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDU6MjQ6MzVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEp1biA0LCAyMDE5IGF0IDU6MTUgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQW0gMDQu
MDYuMTkgdW0gMTc6MDUgc2NocmllYiBTZXIsIFNpbW9uOgo+ID4gPiBIaSwKPiA+ID4KPiA+ID4g
SSdtIHRyeWluZyB0byBsaW5rIEFMU0EgcGxheWJhY2sgZGV2aWNlcyBhbmQgRFJNIGNvbm5lY3Rv
cnMuIEluIG90aGVyCj4gPiA+IHdvcmRzLCBJJ2QgbGlrZSB0byBiZSBhYmxlIHRvIGtub3cgd2hp
Y2ggQUxTQSBkZXZpY2UgSSBzaG91bGQgb3BlbiB0bwo+ID4gPiBwbGF5IGF1ZGlvIG9uIGEgZ2l2
ZW4gY29ubmVjdG9yLgo+ID4gPgo+ID4gPiBVbmZvcnR1bmF0ZWx5LCBJIGhhdmVuJ3QgZm91bmQg
YSB3YXkgdG8gZXh0cmFjdCB0aGlzIGluZm9ybWF0aW9uLiBJCj4gPiA+IGtub3cgL3Byb2MvYXNv
dW5kL2NhcmROL2VsZCogZXhwb3NlIHRoZSBFRElELWxpa2UgZGF0YS4gSG93ZXZlciBieQo+ID4g
PiBsb29raW5nIGF0IHRoZSBBTFNBIEFQSSAoYWxzbzogYXBsYXkgLWwgYW5kIC1MKSBJIGNhbid0
IGZpbmQgYSB3YXkgdG8KPiA+ID4gZmlndXJlIG91dCB3aGljaCBQQ00gZGV2aWNlIG1hcHMgdG8g
dGhlIEVMRC4KPiA+ID4KPiA+ID4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiA+Cj4gPiBJcyB0
aGF0IGFjdHVhbGx5IGZpeGVkIG9uIGFsbCBoYXJkd2FyZT8gT3IgZG8gd2UgbWF5YmUgaGF2ZSBz
b21lCj4gPiBoYXJkd2FyZSB3aXRoIG9ubHkgb25lIGF1ZGlvIGNvZGVjIGFuZCBtdWx0aXBsZSBj
b25uZWN0b3JzPwoKQ2VydGFpbiBvbGQgaTkxNSBoYXJkd2FyZSBpcyBsaWtlIHRoYXQuIFlvdSBj
YW4gZHJpdmUKbXVsdGlwbGUgSERNSSBjb25uZWN0b3JzIGF0IG9uY2UgYnV0IG9ubHkgb25lIG9m
IHRoZW0gCmNhbiBnZXQgdGhlIGF1ZGlvLiBJZiB5b3UgdHJ5IHRvIG91dHB1dCBhdWRpbyB0byBt
dWx0aXBsZQpwb3J0cyBhdCBvbmNlIHlvdSBnZXQgbm8gYXVkaW8gd2hhdHNvZXZlci4gQVRNIHdl
IGRvbid0CnJlYWxseSBoYW5kbGUgdGhhdCBjYXNlIHByb3Blcmx5LgoKPiA+Cj4gPiA+Cj4gPiA+
IElmIG5vdCwgd2hhdCB3b3VsZCBiZSB0aGUgYmVzdCB3YXkgdG8gZXhwb3NlIHRoaXM/Cj4gPiA+
Cj4gPiA+IC0gQSBzeW1saW5rIHRvIHRoZSBBTFNBIGF1ZGlvIFBDTSBkZXZpY2UgaW4KPiA+ID4g
ICAgL3N5cy9jbGFzcy9kcm0vY2FyZE4tQ09OTkVDVE9SPwo+ID4gPiAtIEEgc3ltbGluayB0byB0
aGUgRFJNIGNvbm5lY3RvciBpbiAvc3lzL2NsYXNzL3NvdW5kL3BjbSo/Cj4gPgo+ID4gSWYgaXQn
cyBmaXhlZCB0aGFuIHRob3NlIHR3byBvcHRpb25zIHNvdW5kIHNhbmUgdG8gbWUuCj4gPgo+ID4g
PiAtIEEgRFJNIGNvbm5lY3RvciBwcm9wZXJ0eT8KPiA+Cj4gPiBJZiBpdCdzIGNvbmZpZ3VyYWJs
ZSB0aGFuIHRoYXQgc291bmRzIGxpa2UgYSBnb29kIG9wdGlvbiB0byBtZS4KPiA+Cj4gPiBBbnl3
YXkgYWRkZWQgb3VyIERDIHRlYW0sIHN0dWZmIGxpa2UgdGhhdCBpcyB0aGVpciBjb25zdHJ1Y3Rp
b24gc2l0ZS4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQ2hyaXN0aWFuLgo+ID4KPiA+ID4gLSBTb21l
aG93IGV4cG9zZSB0aGUgY29ubmVjdG9yIG5hbWUgdmlhIHRoZSBBTFNBIEFQST8KPiA+ID4gLSBF
eHBvc2UgdGhlIGNvbm5lY3RvciBFRElEIHZpYSBBTFNBPwo+ID4gPiAtIE90aGVyIGlkZWFzPwo+
IAo+IEkgdGhpbmsgb24gb3VyIE1TVCBodyB5b3UgZ2V0IGEgY29tYmluYXRpb24gb2YgQ1JUQ3Mg
eCBDT05ORUNUT1JzIG9uCj4gdGhlIGFsc2Egc2lkZS4gSS5lLiBmb3IgZXZlcnkgcGFpciBvZiBj
b25uZWN0b3IgYW5kIGNydGMgeW91IGdldCBhCj4gc2VwYXJhdGUgYWxzYSBwaW4uIFRoaXMgaXMg
YmVjYXVzZSB3aXRoIG1zdCwgeW91IGNvdWxkIGhhdmUgdXAgdG8KPiBudW1fY3J0Y3Mgc3RyZWFt
cyBvbiBhIHNpbmdsZSBjb25uZWN0b3IuIE5vdCBzdXJlIGhvdyB0byBtb2RlbCB0aGF0LgoKSUlS
QyB0aGUgY3VycmVudCBpOTE1IHZzLiBhbHNhIG1vZGVsIGlzIHRoYXQgZm9yIFNTVC9IRE1JIHlv
dSBoYXZlCmEgMToxIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZSBwb3J0IGFuZCB0aGUgcGNtIGRl
dmljZSwgYnV0IHdpdGggTVNUCnlvdSBuYXZlIGEgMToxIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRo
ZSBwaXBlIGFuZCB0aGUgcGNtIGRldmljZS4KCkkgdGhpbmsgdGhlIG9ubHkgd2F5IHRvIGhhdmUg
YW55IGtpbmQgb2Ygc3RhdGljIGNvbm5lY3RvcjwtPnBjbQpyZWxhdGlvbnNoaXAgd2l0aCBNU1Qg
d291bGQgaW52b2x2ZSBkeW5hbWljYWxseSBhZGRpbmcvcmVtb3ZpbmcKcGNtIGRldmljZXMgd2hl
biB0aGUgY29ycmVjcG9uZGluZyBkcm0gY29ubmVjdG9yIGlzIGFkZGVkL3JlbW92ZWQuCklmIHdl
IGRvbid0IHdhbnQgdG8vY2FuJ3QgYWRkIHN1Y2ggcGNtIGRldmljZXMgdGhlbiB3ZSdkIG5lZWQg
dG8KZHluYW1pY2FsbHkgY2hhbmdlIHRoZSBzeW1saW5rcy93aGF0ZXZlciB3aGVuZXZlciBhbiBN
U1Qgc3RyZWFtCmlzIHN0YXJ0ZWQvc3RvcHBlZC4gQW5kIHByb2JhYmx5IHdlIHNob3VsZCBkbyB0
aGUgc2FtZSBmb3IgU1NUL0hETUkKYXMgd2VsbCwgaWYgZm9yIG5vIG90aGVyIHJlYXNvbiB0aGFu
IHRvIG1ha2Ugc3VyZSB1c2Vyc3BhY2UgaXMKcHJlcGFyZWQgZm9yIGl0IGV2ZW4gaWYgdGhleSBk
aWRuJ3QgdGVzdCB3aXRoIE1TVC4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
