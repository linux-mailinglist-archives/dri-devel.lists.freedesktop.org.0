Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A319CFE58A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6756EA47;
	Fri, 15 Nov 2019 19:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F156E7DC;
 Fri, 15 Nov 2019 19:23:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 11:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="217188853"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 15 Nov 2019 11:23:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 21:23:05 +0200
Date: Fri, 15 Nov 2019 21:23:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] drm/edid: Add alternate clock for SMPTE 4K
Message-ID: <20191115192305.GM1208@intel.com>
References: <20191112075307.12574-1-Wayne.Lin@amd.com>
 <20191112075307.12574-2-Wayne.Lin@amd.com>
 <75d0e827-25b2-ceae-0484-a98af7b8b693@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75d0e827-25b2-ceae-0484-a98af7b8b693@baylibre.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTA6MzY6NTRBTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gT24gMTIvMTEvMjAxOSAwODo1MywgV2F5bmUgTGluIHdyb3RlOgo+ID4gW1doeV0K
PiA+IEluIGhkbWlfbW9kZV9hbHRlcm5hdGVfY2xvY2soKSwgaXQgYWRkcyBhbiBleGNlcHRpb24g
Zm9yIFZJQyA0Cj4gPiBtb2RlICg0MDk2eDIxNjBAMjQpIGR1ZSB0byB0aGVyZSBpcyBubyBhbHRl
cm5hdGUgY2xvY2sgZGVmaW5lZCBmb3IKPiA+IHRoYXQgbW9kZSBpbiBIRE1JMS40Yi4gQnV0IEhE
TUkyLjAgYWRkcyAyMy45OEh6IGZvciB0aGF0IG1vZGUuCj4gPiAKPiA+IFtIb3ddCj4gPiBSZW1v
dmUgdGhlIGV4Y2VwdGlvbgo+IAo+IFNob3VsZG4ndCBpdCBiZSBvbmx5IGJ5cGFzc2VkIHdoZW4g
dGhlIHNpbmsgaXMgSERNSTIgPwoKSU1PIGp1c3QgbnVrZSB0aGUgY2hlY2suIENhbid0IHNlZSBt
dWNoIGhhcm0gY29taW5nCmZyb20gYWRkaW5nIHRoZSAyMy45OEh6IG1vZGUgb24gSERNSSAxLjQg
YXMgd2VsbC4KCj4gCj4gTmVpbAo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4g
PFdheW5lLkxpbkBhbWQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMgfCAzIC0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYwo+ID4gaW5kZXggZmNkN2FlMjkwNDlkLi5lZDI3ODJjNTNhOTMgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMKPiA+IEBAIC0zMTI2LDkgKzMxMjYsNiBAQCBzdGF0aWMgZW51bSBoZG1p
X3BpY3R1cmVfYXNwZWN0IGRybV9nZXRfaGRtaV9hc3BlY3RfcmF0aW8oY29uc3QgdTggdmlkZW9f
Y29kZSkKPiA+ICBzdGF0aWMgdW5zaWduZWQgaW50Cj4gPiAgaGRtaV9tb2RlX2FsdGVybmF0ZV9j
bG9jayhjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqaGRtaV9tb2RlKQo+ID4gIHsKPiA+
IC0JaWYgKGhkbWlfbW9kZS0+dmRpc3BsYXkgPT0gNDA5NiAmJiBoZG1pX21vZGUtPmhkaXNwbGF5
ID09IDIxNjApCj4gPiAtCQlyZXR1cm4gaGRtaV9tb2RlLT5jbG9jazsKPiA+IC0KPiA+ICAJcmV0
dXJuIGNlYV9tb2RlX2FsdGVybmF0ZV9jbG9jayhoZG1pX21vZGUpOwo+ID4gIH0KPiA+ICAKPiA+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
