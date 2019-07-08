Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C007362629
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE7689E3F;
	Mon,  8 Jul 2019 16:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93989DF9;
 Mon,  8 Jul 2019 16:25:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="192365304"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2019 09:21:31 -0700
Date: Mon, 8 Jul 2019 14:52:43 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v8 6/6] drm/hdcp: reference for srm file format
Message-ID: <20190708092243.GC31930@intel.com>
References: <20190705004642.15822-1-ramalingam.c@intel.com>
 <20190705004642.15822-7-ramalingam.c@intel.com>
 <20190708131623.72f3ac45@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708131623.72f3ac45@eldfell.localdomain>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wOCBhdCAxMzoxNjoyMyArMDMwMCwgUGVra2EgUGFhbGFuZW4gd3JvdGU6Cj4g
T24gRnJpLCAgNSBKdWwgMjAxOSAwNjoxNjo0MiArMDUzMAo+IFJhbWFsaW5nYW0gQyA8cmFtYWxp
bmdhbS5jQGludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiBJbiB0aGUga2VybmVsIGRvY3VtZW50YXRp
b24sIEhEQ1Agc3BlY2lmaWNhdGlvbnMgbGlua3MgYXJlIHNoYXJlZCBhcyBhCj4gPiByZWZlcmVu
Y2UgZm9yIFNSTSB0YWJsZSBmb3JtYXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJhbWFsaW5n
YW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1faGRjcC5jIHwgNyArKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYwo+ID4gaW5kZXggNzc0MzNlZTNkNjUyLi44MDNiZjgy
ODNiODMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMKPiA+IEBAIC0yNzEsNiArMjcxLDEzIEBAIHN0
YXRpYyB2b2lkIGRybV9oZGNwX3JlcXVlc3Rfc3JtKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
KQo+ID4gICAqCj4gPiAgICogU1JNIHNob3VsZCBiZSBwcmVzZW50ZWQgaW4gdGhlIG5hbWUgb2Yg
ImRpc3BsYXlfaGRjcF9zcm0uYmluIi4KPiA+ICAgKgo+ID4gKyAqIEZvcm1hdCBvZiB0aGUgU1JN
IHRhYmxlIHRoYXQgdXNlcnNwYWNlIG5lZWRzIHRvIHdyaXRlIGludG8gdGhlIGJpbmFyeSBmaWxl
Cj4gPiArICogaXMgZGVmaW5lZCBhdAo+ID4gKyAqIDEuIFJlbmV3YWJpbGl0eSBjaGFwdGVyIG9u
IDU1dGggcGFnZSBvZiBIRENQIDEuNCBzcGVjaWZpY2F0aW9uCj4gPiArICogaHR0cHM6Ly93d3cu
ZGlnaXRhbC1jcC5jb20vc2l0ZXMvZGVmYXVsdC9maWxlcy9zcGVjaWZpY2F0aW9ucy9IRENQJTIw
U3BlY2lmaWNhdGlvbiUyMFJldjFfNF9TZWN1cmUucGRmCj4gPiArICogMi4gUmVuZXdhYmlsaXR5
IGNoYXB0ZXIgb24gNjNyZCBwYWdlIG9mIEhEQ1AgMi4yIHNwZWNpZmljYXRpb24KPiA+ICsgKiBo
dHRwczovL3d3dy5kaWdpdGFsLWNwLmNvbS9zaXRlcy9kZWZhdWx0L2ZpbGVzL3NwZWNpZmljYXRp
b25zL0hEQ1AlMjBvbiUyMEhETUklMjBTcGVjaWZpY2F0aW9uJTIwUmV2Ml8yX0ZpbmFsMS5wZGYK
PiA+ICsgKgo+ID4gICAqIFJldHVybnM6Cj4gPiAgICogVFJVRSBvbiBhbnkgb2YgdGhlIEtTViBp
cyByZXZva2VkLCBlbHNlIEZBTFNFLgo+ID4gICAqLwo+IAo+IEhpLAo+IAo+IHRoaXMgbG9vayBn
b29kLCBwdWJsaWNseSBhY2Nlc3NpYmxlIHNwZWMgbGlua3MgZXZlbi4gSSdtIGhhcHB5IHdpdGgK
PiB0aGlzLCBidXQgSSByZXBlYXQgdGhhdCB0aGUgV2VzdG9uIHdvcmtbMV0gZG9lcyBub3QgZGly
ZWN0bHkgcHJvdmUgdGhpcwo+IFVBUEkgKHBlcmhhcHMgbm90IG5lY2Vzc2FyeSBlaXRoZXI/KS4K
VGhhbmtzIGZvciBoZWxwaW5nIHRvIGltcHJvdmUgdGhpcyBwYXJ0LgoKLVJhbQo+IAo+IAo+IFsx
XSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vbWVyZ2VfcmVx
dWVzdHMvNDgKPiAKPiBUaGFua3MsCj4gcHEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
