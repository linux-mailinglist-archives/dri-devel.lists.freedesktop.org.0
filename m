Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD09DD14
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 07:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C73889B49;
	Tue, 27 Aug 2019 05:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96289B45;
 Tue, 27 Aug 2019 05:19:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 22:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; d="scan'208";a="187811309"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 22:19:40 -0700
Date: Tue, 27 Aug 2019 10:49:06 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Sharma, Shashank" <shashank.sharma@intel.com>
Subject: Re: [PATCH v9 3/6] drm: Extend I915 mei interface for transcoder info
Message-ID: <20190827051905.GC3428@intel.com>
References: <20190822151904.17919-1-ramalingam.c@intel.com>
 <20190822151904.17919-4-ramalingam.c@intel.com>
 <4d2a0d7a-e364-bbc8-071c-d4bbd887479d@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d2a0d7a-e364-bbc8-071c-d4bbd887479d@intel.com>
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

T24gMjAxOS0wOC0yNyBhdCAxMDoxODowNyArMDUzMCwgU2hhcm1hLCBTaGFzaGFuayB3cm90ZToK
PiAKPiBPbiA4LzIyLzIwMTkgODo0OSBQTSwgUmFtYWxpbmdhbSBDIHdyb3RlOgo+ID4gSTkxNSBu
ZWVkcyB0byBzZW5kIHRoZSBpbmRleCBvZiB0aGUgdHJhbnNjb2RlciBhcyBwZXIgTUUgRlcuCj4g
PiBUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md19kZGkgYW5kIGFkZCBhcyBhIG1l
bWJlciBpbnRvCj4gPiB0aGUgc3RydWN0IGhkY3BfcG9ydF9kYXRhLgo+IAo+IFRoZSBjb21taXQg
bWVzc2FnZSBzYXlzIHlvdSBhcmUgZGVmaW5pbmcgZW51bSBtZWlfZndfZGRpLCBidXQgeW91IGFy
ZQo+IGFjdHVhbGx5IGRlZmluaW5nIGVudW0gbWVpX2Z3X3RjOwpkYW5nZXJvdXMgdHlwbyA6KSBJ
IHdpbGwgZml4IGl0LiBUaGFua3MKCi1SYW0KPiAKPiAtIFNoYXNoYW5rCj4gCj4gPiBTaWduZWQt
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
YW5zY29kZXIgZm9yIERTSTEgKi8KPiA+ICsJTUVJX1RDX0EgPSAweDEwLAkJLyogVHJhbnNjb2Rl
ciBUQ0EgKi8KPiA+ICsJTUVJX1RDX0IsCQkJLyogVHJhbnNjb2RlciBUQ0IgKi8KPiA+ICsJTUVJ
X1RDX0MsCQkJLyogVHJhbnNjb2RlciBUQ0MgKi8KPiA+ICsJTUVJX1RDX0QJCQkvKiBUcmFuc2Nv
ZGVyIFRDRCAqLwo+ID4gK307Cj4gPiArCj4gPiAgIC8qKgo+ID4gICAgKiBzdHJ1Y3QgaGRjcF9w
b3J0X2RhdGEgLSBpbnRlbCBzcGVjaWZpYyBIRENQIHBvcnQgZGF0YQo+ID4gICAgKiBAZndfZGRp
OiBkZGkgaW5kZXggYXMgcGVyIE1FIEZXCj4gPiArICogQGZ3X3RjOiB0cmFuc2NvZGVyIGluZGV4
IGFzIHBlciBNRSBGVwo+ID4gICAgKiBAcG9ydF90eXBlOiBIRENQIHBvcnQgdHlwZSBhcyBwZXIg
TUUgRlcgY2xhc3NpZmljYXRpb24KPiA+ICAgICogQHByb3RvY29sOiBIRENQIGFkYXB0YXRpb24g
YXMgcGVyIE1FIEZXCj4gPiAgICAqIEBrOiBObyBvZiBzdHJlYW1zIHRyYW5zbWl0dGVkIG9uIGEg
cG9ydC4gT25seSBvbiBEUCBNU1QgdGhpcyBpcyAhPSAxCj4gPiBAQCAtNjksNiArODEsNyBAQCBl
bnVtIG1laV9md19kZGkgewo+ID4gICAgKi8KPiA+ICAgc3RydWN0IGhkY3BfcG9ydF9kYXRhIHsK
PiA+ICAgCWVudW0gbWVpX2Z3X2RkaSBmd19kZGk7Cj4gPiArCWVudW0gbWVpX2Z3X3RjIGZ3X3Rj
Owo+ID4gICAJdTggcG9ydF90eXBlOwo+ID4gICAJdTggcHJvdG9jb2w7Cj4gPiAgIAl1MTYgazsK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
