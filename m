Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED0FE587
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6436E7AD;
	Fri, 15 Nov 2019 19:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B629F6E7AD;
 Fri, 15 Nov 2019 19:22:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 11:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="214831405"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 15 Nov 2019 11:22:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Nov 2019 21:22:47 +0200
Date: Fri, 15 Nov 2019 21:22:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH 2/2] drm/edid: Add alternate clock for SMPTE 4K
Message-ID: <20191115192247.GL1208@intel.com>
References: <20191112075307.12574-1-Wayne.Lin@amd.com>
 <20191112075307.12574-2-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112075307.12574-2-Wayne.Lin@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDM6NTM6MDdQTSArMDgwMCwgV2F5bmUgTGluIHdyb3Rl
Ogo+IFtXaHldCj4gSW4gaGRtaV9tb2RlX2FsdGVybmF0ZV9jbG9jaygpLCBpdCBhZGRzIGFuIGV4
Y2VwdGlvbiBmb3IgVklDIDQKPiBtb2RlICg0MDk2eDIxNjBAMjQpIGR1ZSB0byB0aGVyZSBpcyBu
byBhbHRlcm5hdGUgY2xvY2sgZGVmaW5lZCBmb3IKPiB0aGF0IG1vZGUgaW4gSERNSTEuNGIuIEJ1
dCBIRE1JMi4wIGFkZHMgMjMuOThIeiBmb3IgdGhhdCBtb2RlLgo+IAo+IFtIb3ddCj4gUmVtb3Zl
IHRoZSBleGNlcHRpb24KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4gPFdheW5lLkxpbkBh
bWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMgLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXggZmNk
N2FlMjkwNDlkLi5lZDI3ODJjNTNhOTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC0zMTI2LDkg
KzMxMjYsNiBAQCBzdGF0aWMgZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IGRybV9nZXRfaGRtaV9h
c3BlY3RfcmF0aW8oY29uc3QgdTggdmlkZW9fY29kZSkKCl4gdGhlIGNvbW1lbnQgYWJvdmUgd291
bGQgbm8gbG9uZ2VyIG1hdGNoIHRoZSBjb2RlLiBQbHMgZml4IGl0IHVwLgoKPiAgc3RhdGljIHVu
c2lnbmVkIGludAo+ICBoZG1pX21vZGVfYWx0ZXJuYXRlX2Nsb2NrKGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICpoZG1pX21vZGUpCj4gIHsKPiAtCWlmIChoZG1pX21vZGUtPnZkaXNwbGF5
ID09IDQwOTYgJiYgaGRtaV9tb2RlLT5oZGlzcGxheSA9PSAyMTYwKQo+IC0JCXJldHVybiBoZG1p
X21vZGUtPmNsb2NrOwo+IC0KPiAgCXJldHVybiBjZWFfbW9kZV9hbHRlcm5hdGVfY2xvY2soaGRt
aV9tb2RlKTsKPiAgfQo+ICAKPiAtLSAKPiAyLjE3LjEKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
