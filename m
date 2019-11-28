Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAFF10C7CA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 12:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292496E7B0;
	Thu, 28 Nov 2019 11:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7D06E7B0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 11:14:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 03:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="221298377"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 28 Nov 2019 03:14:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Nov 2019 13:14:18 +0200
Date: Thu, 28 Nov 2019 13:14:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: [EXT] Re: [PATCH] drm: fix HDR static metadata type field
 numbering
Message-ID: <20191128111418.GP1208@intel.com>
References: <1574865719-24490-1-git-send-email-laurentiu.palcu@nxp.com>
 <20191127151703.GJ1208@intel.com>
 <20191128083940.GC10251@fsr-ub1664-121>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128083940.GC10251@fsr-ub1664-121>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Uma Shankar <uma.shankar@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDg6Mzk6NDFBTSArMDAwMCwgTGF1cmVudGl1IFBhbGN1
IHdyb3RlOgo+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDA1OjE3OjAzUE0gKzAyMDAsIFZpbGxl
IFN5cmrDpGzDpCB3cm90ZToKPiA+IENhdXRpb246IEVYVCBFbWFpbAo+ID4gCj4gPiBPbiBXZWQs
IE5vdiAyNywgMjAxOSBhdCAwMjo0MjozNVBNICswMDAwLCBMYXVyZW50aXUgUGFsY3Ugd3JvdGU6
Cj4gPiA+IEFjY29yZGluZyB0byBDVEEtODYxIHNwZWNpZmljYXRpb24sIEhEUiBzdGF0aWMgbWV0
YWRhdGEgZGF0YSBibG9jayBhbGxvd3MgYQo+ID4gPiBzaW5rIHRvIGluZGljYXRlIHdoaWNoIEhE
UiBtZXRhZGF0YSB0eXBlcyBpdCBzdXBwb3J0cyBieSBzZXR0aW5nIHRoZSBTTV8wIHRvCj4gPiA+
IFNNXzcgYml0cy4gQ3VycmVudGx5LCBvbmx5IFN0YXRpYyBNZXRhZGF0YSBUeXBlIDEgaXMgc3Vw
cG9ydGVkIGFuZCB0aGlzIGlzCj4gPiA+IGluZGljYXRlZCBieSBzZXR0aW5nIHRoZSBTTV8wIGJp
dCB0byAxLgo+ID4gPgo+ID4gPiBIb3dldmVyLCB0aGUgY29ubmVjdG9yLT5oZHJfc2lua19tZXRh
ZGF0YS5oZG1pX3R5cGUxLm1ldGFkYXRhX3R5cGUgaXMgYWx3YXlzCj4gPiA+IDAsIGJlY2F1c2Ug
aGRyX21ldGFkYXRhX3R5cGUoKSBpbiBkcm1fZWRpZC5jIGNoZWNrcyB0aGUgd3JvbmcgYml0Lgo+
ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGNvcnJlY3RzIHRoZSBIRE1JX1NUQVRJQ19NRVRBREFUQV9U
WVBFMSBiaXQgcG9zaXRpb24uCj4gPiAKPiA+IFdhcyBjb25mdXNlZCBmb3IgYSB3aGlsZSB3aHkg
dGhpcyBoYXMgZXZlbiBiZWVuIHdvcmtuaW5nLCBidXQgSSBndWVzcwo+ID4gdGhhdCdzIGR1ZSB0
byB1c2Vyc3BhY2UgcG9wdWxhdGluZyB0aGUgbWV0YWRhdGEgaW5mb2ZyYW1lIGJsb2IgY29ycmVj
dGx5Cj4gPiBldmVuIGlmIHdlIG1pc3JlcG9ydGVkIHRoZSBtZXRhZGF0YSB0eXBlcyBpbiB0aGUg
cGFyc2VkIEVESUQgbWV0YWRhdGEKPiA+IGJsb2IuCj4gPiAKPiA+IEhtbS4gQWN0dWFsbHkgb24g
ZnVydGhlciBpbnNwZWN0aW9uIHRoaXMgYWxsIHNlZW1zIHRvIGJlIGRlYWQgY29kZS4gVGhlCj4g
PiBvbmx5IHRoaW5nIHdlIHNlZW0gdG8gdXNlIGZyb20gdGhlIHBhcnNlZCBFRElEIG1ldGFkYXRh
IHN0dWZmIGlzCj4gPiBlb3RmIGJpdG1hc2suIFdlIGNoZWNrIHRoYXQgaW4gZHJtX2hkbWlfaW5m
b2ZyYW1lX3NldF9oZHJfbWV0YWRhdGEoKQo+ID4gYnV0IHdlIGRvbid0IGNoZWNrIHRoZSBtZXRh
ZGF0YSB0eXBlLgo+ID4gCj4gPiBNYXliZSB3ZSBzaG91bGQganVzdCBudWtlIHRoaXMgRURJRCBw
YXJzaW5nIHN0dWZmIGVudGlyZWx5PyBTZWVtcwo+ID4gcHJldHR5IG11Y2ggcG9pbnRsZXNzLgo+
IAo+IEkndmUgYmVlbiB0aGlua2luZyBhYm91dCB0aGF0IGJ1dCB3ZSBtYXkgbmVlZCB0aGUgcmVz
dCBvZiB0aGUgZmllbGRzIGFzCj4gd2VsbCwgZXZlbiB0aG91Z2ggdGhleSdyZSBub3QgY3VycmVu
dGx5IHVzZWQuIEknbSByZWZlcnJpbmcgdG8gc2luaydzCj4gbWluL21heCBsdW1pbmFuY2UgZGF0
YS4gU2hvdWxkbid0IHdlIGFsc28gY2hlY2sgbWluL21heCBjbGwsIGJlc2lkZXMKPiBlb3RmLCB0
byBtYWtlIHN1cmUgdGhlIHNvdXJjZSBkb2VzIG5vdCBwYXNzIGhpZ2hlci9sb3dlciBsdW1pbmFu
Y2UKPiB2YWx1ZXMsIHRoYW4gdGhlIHNpbmsgc3VwcG9ydHMsIGZvciBvcHRpbWFsIGNvbnRlbnQg
cmVuZGVyaW5nPwo+IAo+IEhvd2V2ZXIsIENUQS04NjEgaXMgbm90IHZlcnkgY2xlYXIgb24gaG93
IGEgc2luayBzaG91bGQgYmVoYXZlIGlmCj4gdGhlIENMTCB2YWx1ZXMgZXhjZWVkIHRoZSBhbGxv
d2VkIHJhbmdlLi4uIDovIEFsc28sIGlmIHRoZSBDTEwgcmFuZ2Ugb3IKPiB0aGUgRkFMTCB2YWx1
ZXMgcGFzc2VkIGluIHRoZSBEUk0gaW5mb2ZyYW1lIGV4Y2VlZCB0aGUgc2luaydzIGFkdmVydGlz
ZWQKPiBtaW4vbWF4IHZhbHVlcywgSSBndWVzcyB0aGUgc2luayBjYW5ub3QgZ28gbG93ZXIvaGln
aGVyIHRoYW4gaXQgY2FuCj4gYW55d2F5LiBJbiB3aGljaCBjYXNlLCB3ZSBkb24ndCByZWFsbHkg
bmVlZCB0aGUgcmVzdCBvZiB0aGUgSERSIHN0YXRpYwo+IG1ldGFkYXRhIGJsb2NrIGFuZCBudWtp
bmcgdGhhdCBwYXJ0IHNob3VsZCBiZSBvay4KCkknbSB0aGlua2luZyB3ZSBzaG91bGQganVzdCBj
b25jbHVkZSB0aGF0IHN1Y2ggdXNlcnNwYWNlIGlzIGEgCmJ1Z2d5IG1lc3MgYW5kIGRlc2VydmVz
IHdoYXRldmVyIGl0IGdldHMuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
