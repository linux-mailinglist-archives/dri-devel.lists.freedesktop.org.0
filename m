Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF93B10B23A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 16:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA906E31D;
	Wed, 27 Nov 2019 15:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6596E31D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 15:17:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 07:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="221009990"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 27 Nov 2019 07:17:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 27 Nov 2019 17:17:03 +0200
Date: Wed, 27 Nov 2019 17:17:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: [PATCH] drm: fix HDR static metadata type field numbering
Message-ID: <20191127151703.GJ1208@intel.com>
References: <1574865719-24490-1-git-send-email-laurentiu.palcu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574865719-24490-1-git-send-email-laurentiu.palcu@nxp.com>
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

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDI6NDI6MzVQTSArMDAwMCwgTGF1cmVudGl1IFBhbGN1
IHdyb3RlOgo+IEFjY29yZGluZyB0byBDVEEtODYxIHNwZWNpZmljYXRpb24sIEhEUiBzdGF0aWMg
bWV0YWRhdGEgZGF0YSBibG9jayBhbGxvd3MgYQo+IHNpbmsgdG8gaW5kaWNhdGUgd2hpY2ggSERS
IG1ldGFkYXRhIHR5cGVzIGl0IHN1cHBvcnRzIGJ5IHNldHRpbmcgdGhlIFNNXzAgdG8KPiBTTV83
IGJpdHMuIEN1cnJlbnRseSwgb25seSBTdGF0aWMgTWV0YWRhdGEgVHlwZSAxIGlzIHN1cHBvcnRl
ZCBhbmQgdGhpcyBpcwo+IGluZGljYXRlZCBieSBzZXR0aW5nIHRoZSBTTV8wIGJpdCB0byAxLgo+
IAo+IEhvd2V2ZXIsIHRoZSBjb25uZWN0b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEu
bWV0YWRhdGFfdHlwZSBpcyBhbHdheXMKPiAwLCBiZWNhdXNlIGhkcl9tZXRhZGF0YV90eXBlKCkg
aW4gZHJtX2VkaWQuYyBjaGVja3MgdGhlIHdyb25nIGJpdC4KPiAKPiBUaGlzIHBhdGNoIGNvcnJl
Y3RzIHRoZSBIRE1JX1NUQVRJQ19NRVRBREFUQV9UWVBFMSBiaXQgcG9zaXRpb24uCgpXYXMgY29u
ZnVzZWQgZm9yIGEgd2hpbGUgd2h5IHRoaXMgaGFzIGV2ZW4gYmVlbiB3b3JrbmluZywgYnV0IEkg
Z3Vlc3MgCnRoYXQncyBkdWUgdG8gdXNlcnNwYWNlIHBvcHVsYXRpbmcgdGhlIG1ldGFkYXRhIGlu
Zm9mcmFtZSBibG9iIGNvcnJlY3RseQpldmVuIGlmIHdlIG1pc3JlcG9ydGVkIHRoZSBtZXRhZGF0
YSB0eXBlcyBpbiB0aGUgcGFyc2VkIEVESUQgbWV0YWRhdGEKYmxvYi4KCkhtbS4gQWN0dWFsbHkg
b24gZnVydGhlciBpbnNwZWN0aW9uIHRoaXMgYWxsIHNlZW1zIHRvIGJlIGRlYWQgY29kZS4gVGhl
Cm9ubHkgdGhpbmcgd2Ugc2VlbSB0byB1c2UgZnJvbSB0aGUgcGFyc2VkIEVESUQgbWV0YWRhdGEg
c3R1ZmYgaXMKZW90ZiBiaXRtYXNrLiBXZSBjaGVjayB0aGF0IGluIGRybV9oZG1pX2luZm9mcmFt
ZV9zZXRfaGRyX21ldGFkYXRhKCkKYnV0IHdlIGRvbid0IGNoZWNrIHRoZSBtZXRhZGF0YSB0eXBl
LgoKTWF5YmUgd2Ugc2hvdWxkIGp1c3QgbnVrZSB0aGlzIEVESUQgcGFyc2luZyBzdHVmZiBlbnRp
cmVseT8gU2VlbXMKcHJldHR5IG11Y2ggcG9pbnRsZXNzLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50aXUgUGFsY3UgPGxhdXJlbnRpdS5wYWxjdUBueHAuY29tPgo+IC0tLQo+ICBpbmNsdWRl
L2xpbnV4L2hkbWkuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaGRtaS5oIGIvaW5j
bHVkZS9saW51eC9oZG1pLmgKPiBpbmRleCA5OTE4YTZjLi4yMTZlMjVlIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvbGludXgvaGRtaS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9oZG1pLmgKPiBAQCAt
MTU1LDcgKzE1NSw3IEBAIGVudW0gaGRtaV9jb250ZW50X3R5cGUgewo+ICB9Owo+ICAKPiAgZW51
bSBoZG1pX21ldGFkYXRhX3R5cGUgewo+IC0JSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQRTEgPSAx
LAo+ICsJSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQRTEgPSAwLAo+ICB9Owo+ICAKPiAgZW51bSBo
ZG1pX2VvdGYgewo+IC0tIAo+IDIuNy40CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
