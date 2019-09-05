Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356AAA6C3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 17:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC9B6E104;
	Thu,  5 Sep 2019 15:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B266E0BA;
 Thu,  5 Sep 2019 15:06:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 08:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="199297366"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 05 Sep 2019 08:06:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Sep 2019 18:06:27 +0300
Date: Thu, 5 Sep 2019 18:06:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] drm/drm_connector: add additional aspect ratio values
Message-ID: <20190905150627.GM7482@intel.com>
References: <20190822215002.17836-1-waynelin@amd.com>
 <20190823184141.GW5942@intel.com>
 <MN2PR12MB2941AFD5BE06C7B10E01B3C1FCA00@MN2PR12MB2941.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR12MB2941AFD5BE06C7B10E01B3C1FCA00@MN2PR12MB2941.namprd12.prod.outlook.com>
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDI6NTk6NTNQTSArMDAwMCwgTGluLCBXYXluZSB3cm90
ZToKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gU2VudDogU2F0dXJk
YXksIEF1Z3VzdCAyNCwgMjAxOSAwMjo0MQo+IFRvOiBMaW4sIFdheW5lIDxXYXluZS5MaW5AYW1k
LmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5M
aUBhbWQuY29tPjsgS2F6bGF1c2thcywgTmljaG9sYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1k
LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vZHJtX2Nvbm5lY3RvcjogYWRkIGFkZGl0
aW9uYWwgYXNwZWN0IHJhdGlvIHZhbHVlcwo+IAo+IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDA1
OjUwOjAyUE0gLTA0MDAsIFdheW5lIExpbiB3cm90ZToKPiA+IEZvciBIRE1JMi4wIENUUyBpdGVt
IC0gSEYxLTM1LCBpdCB2ZXJpZmllcyBpZiB0aGUgc291cmNlIGdlbmVyYXRlcwo+ID4gdmlkZW8g
dGltaW5nICI2NDoyNyIgdmlkZW8gZm9ybWF0IGNvcnJlY3RseS4KPiA+Cj4gPiBlZzogKHZpYy03
NikgMTkyMHgxMDgwcEA2MEh6LDI0YnBwCj4gPgo+ID4gVGhpcyBwYXRjaCBhZGQgb24gIjY0OjI3
IiBhbmQgIjI1NjoxMzUiIHRvIGRybV9hc3BlY3RfcmF0aW9fZW51bV9saXN0Lgo+ID4gVGhlcmVh
ZnRlciwgb25lIGNhbiBzcGVjaWZ5IHRoZSBhc3BlY3QgcmF0aW8gdG8gIjY0OjI3IiBvciAiMjU2
OjEzNSIKPiA+IGFmdGVyIGNyZWF0aW5nIGFzcGVjdCByYXRpbyBwcm9wZXJ0eS4KPiA+Cj4gPiBD
aGFuZ2UtSWQ6IElmYzlkZjU0ZThlOGY3OGU3MDk2MGZjZDczN2EzYTU3ZTQ5YzgxMTUyCj4gPiBT
aWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4gPHdheW5lbGluQGFtZC5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiA+IGluZGV4
IDNhMGNhY2I3MTIzNS4uYzA2MjlhMDFkMDhlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb25uZWN0b3IuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0
b3IuYwo+ID4gQEAgLTc3Miw2ICs3NzIsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcm9w
X2VudW1fbGlzdCBkcm1fYXNwZWN0X3JhdGlvX2VudW1fbGlzdFtdID0gewo+ID4gICAgICAgIHsg
RFJNX01PREVfUElDVFVSRV9BU1BFQ1RfTk9ORSwgIkF1dG9tYXRpYyIgfSwKPiA+ICAgICAgICB7
IERSTV9NT0RFX1BJQ1RVUkVfQVNQRUNUXzRfMywgIjQ6MyIgfSwKPiA+ICAgICAgICB7IERSTV9N
T0RFX1BJQ1RVUkVfQVNQRUNUXzE2XzksICIxNjo5IiB9LAo+ID4gKyAgICAgeyBEUk1fTU9ERV9Q
SUNUVVJFX0FTUEVDVF82NF8yNywgIjY0OjI3IiB9LAo+ID4gKyAgICAgeyBEUk1fTU9ERV9QSUNU
VVJFX0FTUEVDVF8yNTZfMTM1LCAiMjU2OjEzNSIgfSwKPiAKPiA+IE5vdCAxMDAlIHN1cmUgd2Ug
d2FudCB0byBleHBvc2UgdGhlc2UgdmlhIHRoZSBwcm9wZXJ0eSBiZWNhdXNlIHRoZQo+ID4gaW5m
b2ZyYW1lIGNhbid0IGNvbnZleSB0aGVzZSBpbmRlcGVuZGVudGx5IGZyb20gdGhlIFZJQy4KPiAK
PiBBZ3JlZSB3aXRoIHRoYXQgaXQgY2FuJ3QgYmUgaW5kZXBlbmRlbnQgZnJvbSB0aGUgVklDLgo+
IFdoZW4gYnVpbGRpbmcgdXAgaGRtaSBhdmkgaW5mb2ZyYW1lIGJ5IHVzaW5nICJkcm1faGRtaV9h
dmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlIiBpbiBkcm1fZWRpZCwKPiBpdCB3aWxsIHJl
ZmVyIHRvIHRoZSBWSUMgdG8gc2V0IHVwIHRoZSBhc3BlY3QgcmF0aW8gaWYgdGhlIGFzcGVjdCBy
YXRpbyBpcyBub3Qgc3BlY2lmaWVkIGluIG1vZGUuCj4gSG93ZXZlciwgaWYgdGhlIGFzcGVjdCBy
YXRpbyBpcyBzcGVjaWZpZWQgdG8gYSB2YWx1ZSBvdGhlciB0aGFuIG5vbmUsIGN1cnJlbnQgbG9n
aWMgb2YgY29kZSB3aWxsIHVzZSB0aGUgc3BlY2lmaWVkIHZhbHVlLgo+IAo+IFRoZSBtYWluIHJl
YXNvbiBvZiB0aGlzIHBhdGNoIGlzIGZvciBjYXBhYmxlIGluZGljYXRpbmcgdGhlIGV4YWN0IFZJ
QyB3YW50ZWQuCj4gVGhlcmUgYXJlIHNvbWUgbW9kZXMgZGVmaW5lZCBpbiBDVEEtODYxIHdpdGgg
c2FtZSB0aW1pbmcgYnV0IGRpZmZlcmVudCBhc3BlY3QgcmF0aW8uCj4gZWc6IFZJQyAxMDMgJiBW
SUMgOTMKPiBXaXRob3V0IHRoZXNlIG5ldyBkZWZpbml0aW9ucywgd2UgY2Fubm90IGRpc3Rpbmd1
aXNoIHRoZXNlIGRpZmZlcmVudCBtb2RlcyBhbmQgbWlnaHQgc2V0IGEgd3JvbmcgVklDIGluIEFW
SSBpbmZvZnJhbWUuCgpUaGUgbW9kZSBmbGFncyBhbHJlYWR5IGNvbnRhaW4gdGhlIGFzcGVjdCBy
YXRpbyBpbmZvcm1hdGlvbi4KWW91IGp1c3QgbmVlZCB0aGUgYXBwcm9wcmlhdGUgY2xpZW50IGNh
cCB0byB1c2UgdGhlbS4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
