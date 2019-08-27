Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F459DD1D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 07:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3E389B66;
	Tue, 27 Aug 2019 05:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512E189B66;
 Tue, 27 Aug 2019 05:22:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 22:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; d="scan'208";a="187811781"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 22:22:03 -0700
Date: Tue, 27 Aug 2019 10:51:29 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Sharma, Shashank" <shashank.sharma@intel.com>
Subject: Re: [PATCH v9 3/6] drm: Extend I915 mei interface for transcoder info
Message-ID: <20190827052129.GD3428@intel.com>
References: <20190822151904.17919-1-ramalingam.c@intel.com>
 <20190822151904.17919-4-ramalingam.c@intel.com>
 <1b554810-f289-a5cf-4e1e-1397088fcc5f@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b554810-f289-a5cf-4e1e-1397088fcc5f@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, tomas.winkler@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNyBhdCAxMDozNjoxMSArMDUzMCwgU2hhcm1hLCBTaGFzaGFuayB3cm90ZToK
PiAKPiBPbiA4LzIyLzIwMTkgODo0OSBQTSwgUmFtYWxpbmdhbSBDIHdyb3RlOgo+ID4gSTkxNSBu
ZWVkcyB0byBzZW5kIHRoZSBpbmRleCBvZiB0aGUgdHJhbnNjb2RlciBhcyBwZXIgTUUgRlcuCj4g
PiBUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md19kZGkgYW5kIGFkZCBhcyBhIG1l
bWJlciBpbnRvCj4gPiB0aGUgc3RydWN0IGhkY3BfcG9ydF9kYXRhLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gPiBBY2tlZC1i
eTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gICBpbmNs
dWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oIHwgMTMgKysrKysrKysrKysrKwo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaCBiL2luY2x1ZGUvZHJtL2k5MTVf
bWVpX2hkY3BfaW50ZXJmYWNlLmgKPiA+IGluZGV4IGE5N2FjZjFjOTcxMC4uMGRlNjI5YmYyZjYy
IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAo+
ID4gKysrIGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAo+ID4gQEAgLTU0
LDkgKzU0LDIxIEBAIGVudW0gbWVpX2Z3X2RkaSB7Cj4gPiAgIAlNRUlfRERJX1JBTkdFX0VORCA9
IE1FSV9ERElfQSwKPiA+ICAgfTsKPiA+ICtlbnVtIG1laV9md190YyB7Cj4gPiArCU1FSV9JTlZB
TElEX1RSQU5TQ09ERVIgPSAweDAwLAkvKiBJbnZhbGlkIHRyYW5zY29kZXIgdHlwZSAqLwo+ID4g
KwlNRUlfVENfRURQLAkJCS8qIFRyYW5zY29kZXIgZm9yIGVEUCAqLwo+ID4gKwlNRUlfVENfRFNJ
MCwJCQkvKiBUcmFuc2NvZGVyIGZvciBEU0kwICovCj4gPiArCU1FSV9UQ19EU0kxLAkJCS8qIFRy
YW5zY29kZXIgZm9yIERTSTEgKi8KPiBBbHNvLCB0aGlzIGlzIGEgYml0IG9kZCwgY296IHBvcnRz
IGFib3ZlIGNhbid0IGRvIEhEQ1AsIHNvIGl0IGRvZXNuJ3QgbWFrZQo+IHNlbnNlIHRvIGhhdmUg
dGhlbSBoZXJlLiBCdXQgc2VlbXMgbGlrZSB3ZSB3YW50IHRvIGJlIGluIHN5bmMgd2l0aCBNRUkg
RlcKPiBkZWZpbml0aW9ucywgc28gd2Ugc2hvdWxkIGNoYW5nZSB0aGUgZnVuY3Rpb24KPiAKPiBp
bnRlbF9nZXRfbWVpX2Z3X2RkaV9pbmRleCB0byBhY2NlcHQgb25seSBmcm9tIHBvcnRzIEEgdG8g
RCwgbm90IGFib3ZlIG9yCj4gYmVsb3cuCkFzIHdlKEk5MTUpIHN1cHBvcnQgSERDUCBvbiBIRE1J
IGFuZCBEUCBvbmx5IHdlIHdpbGwgaGF2ZSBUQ0EgdG8gVENECm9ubHkuIFN1cmUgd2UgY2FuIGZp
eCB0aGUgaW50ZWxfZ2V0X21laV9md19kZGlfaW5kZXggdG8gZmlsbCBpbnZhbGlkIFRDCm9uIG90
aGVyIHRyYW5zY29kZXJzLgoKLVJhbQo+IAo+IC0gU2hhc2hhbmsKPiAKPiA+ICsJTUVJX1RDX0Eg
PSAweDEwLAkJLyogVHJhbnNjb2RlciBUQ0EgKi8KPiA+ICsJTUVJX1RDX0IsCQkJLyogVHJhbnNj
b2RlciBUQ0IgKi8KPiA+ICsJTUVJX1RDX0MsCQkJLyogVHJhbnNjb2RlciBUQ0MgKi8KPiA+ICsJ
TUVJX1RDX0QJCQkvKiBUcmFuc2NvZGVyIFRDRCAqLwo+ID4gK307Cj4gPiArCj4gPiAgIC8qKgo+
ID4gICAgKiBzdHJ1Y3QgaGRjcF9wb3J0X2RhdGEgLSBpbnRlbCBzcGVjaWZpYyBIRENQIHBvcnQg
ZGF0YQo+ID4gICAgKiBAZndfZGRpOiBkZGkgaW5kZXggYXMgcGVyIE1FIEZXCj4gPiArICogQGZ3
X3RjOiB0cmFuc2NvZGVyIGluZGV4IGFzIHBlciBNRSBGVwo+ID4gICAgKiBAcG9ydF90eXBlOiBI
RENQIHBvcnQgdHlwZSBhcyBwZXIgTUUgRlcgY2xhc3NpZmljYXRpb24KPiA+ICAgICogQHByb3Rv
Y29sOiBIRENQIGFkYXB0YXRpb24gYXMgcGVyIE1FIEZXCj4gPiAgICAqIEBrOiBObyBvZiBzdHJl
YW1zIHRyYW5zbWl0dGVkIG9uIGEgcG9ydC4gT25seSBvbiBEUCBNU1QgdGhpcyBpcyAhPSAxCj4g
PiBAQCAtNjksNiArODEsNyBAQCBlbnVtIG1laV9md19kZGkgewo+ID4gICAgKi8KPiA+ICAgc3Ry
dWN0IGhkY3BfcG9ydF9kYXRhIHsKPiA+ICAgCWVudW0gbWVpX2Z3X2RkaSBmd19kZGk7Cj4gPiAr
CWVudW0gbWVpX2Z3X3RjIGZ3X3RjOwo+ID4gICAJdTggcG9ydF90eXBlOwo+ID4gICAJdTggcHJv
dG9jb2w7Cj4gPiAgIAl1MTYgazsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
