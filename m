Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3BA8B446
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82AE6E0D5;
	Tue, 13 Aug 2019 09:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FE76E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:36:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 02:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="260076487"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.113])
 by orsmga001.jf.intel.com with ESMTP; 13 Aug 2019 02:35:57 -0700
Date: Tue, 13 Aug 2019 17:36:16 +0800
From: Feng Tang <feng.tang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
Message-ID: <20190813093616.GA65475@shbuild999.sh.intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812072545.GA63191@shbuild999.sh.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen <rong.a.chen@intel.com>,
 michel@daenzer.net, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLCAKCk9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDAzOjI1OjQ1UE0gKzA4MDAsIEZl
bmcgVGFuZyB3cm90ZToKPiBIaSBUaG9tYXMsCj4gCj4gT24gRnJpLCBBdWcgMDksIDIwMTkgYXQg
MDQ6MTI6MjlQTSArMDgwMCwgUm9uZyBDaGVuIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+ID4+QWN0
dWFsbHkgd2UgcnVuIHRoZSBiZW5jaG1hcmsgYXMgYSBiYWNrZ3JvdW5kIHByb2Nlc3MsIGRvIHdl
IG5lZWQgdG8KPiA+ID4+ZGlzYWJsZSB0aGUgY3Vyc29yIGFuZCB0ZXN0IGFnYWluPwo+ID4gPlRo
ZXJlJ3MgYSB3b3JrZXIgdGhyZWFkIHRoYXQgdXBkYXRlcyB0aGUgZGlzcGxheSBmcm9tIHRoZSBz
aGFkb3cgYnVmZmVyLgo+ID4gPlRoZSBibGlua2luZyBjdXJzb3IgcGVyaW9kaWNhbGx5IHRyaWdn
ZXJzIHRoZSB3b3JrZXIgdGhyZWFkLCBidXQgdGhlCj4gPiA+YWN0dWFsIHVwZGF0ZSBpcyBqdXN0
IHRoZSBzaXplIG9mIG9uZSBjaGFyYWN0ZXIuCj4gPiA+Cj4gPiA+VGhlIHBvaW50IG9mIHRoZSB0
ZXN0IHdpdGhvdXQgb3V0cHV0IGlzIHRvIHNlZSBpZiB0aGUgcmVncmVzc2lvbiBjb21lcwo+ID4g
PmZyb20gdGhlIGJ1ZmZlciB1cGRhdGUgKGkuZS4sIHRoZSBtZW1jcHkgZnJvbSBzaGFkb3cgYnVm
ZmVyIHRvIFZSQU0pLCBvcgo+ID4gPmZyb20gdGhlIHdvcmtlciB0aHJlYWQuIElmIHRoZSByZWdy
ZXNzaW9uIGdvZXMgYXdheSBhZnRlciBkaXNhYmxpbmcgdGhlCj4gPiA+YmxpbmtpbmcgY3Vyc29y
LCB0aGVuIHRoZSB3b3JrZXIgdGhyZWFkIGlzIHRoZSBwcm9ibGVtLiBJZiBpdCBhbHJlYWR5Cj4g
PiA+Z29lcyBhd2F5IGlmIHRoZXJlJ3Mgc2ltcGx5IG5vIG91dHB1dCBmcm9tIHRoZSB0ZXN0LCB0
aGUgc2NyZWVuIHVwZGF0ZQo+ID4gPmlzIHRoZSBwcm9ibGVtLiBPbiBteSBtYWNoaW5lIEkgaGF2
ZSB0byBkaXNhYmxlIHRoZSBibGlua2luZyBjdXJzb3IsIHNvCj4gPiA+SSB0aGluayB0aGUgd29y
a2VyIGNhdXNlcyB0aGUgcGVyZm9ybWFuY2UgZHJvcC4KPiA+IAo+ID4gV2UgZGlzYWJsZWQgcmVk
aXJlY3Rpbmcgc3Rkb3V0L3N0ZGVyciB0byAvZGV2L2ttc2cswqAgYW5kIHRoZSByZWdyZXNzaW9u
IGlzCj4gPiBnb25lLgo+ID4gCj4gPiBjb21taXQ6Cj4gPiDCoCBmMWY4NTU1ZGZiOSBkcm0vYm9j
aHM6IFVzZSBzaGFkb3cgYnVmZmVyIGZvciBib2NocyBmcmFtZWJ1ZmZlciBjb25zb2xlCj4gPiDC
oCA5MGY0NzlhZTUxYSBkcm0vbWdhZzIwMDogUmVwbGFjZSBzdHJ1Y3QgbWdhX2ZiZGV2IHdpdGgg
Z2VuZXJpYyBmcmFtZWJ1ZmZlcgo+ID4gZW11bGF0aW9uCj4gPiAKPiA+IGYxZjg1NTVkZmI5YTcw
YTLCoCA5MGY0NzlhZTUxYWZhNDVlZmFiOTdhZmRkZSB0ZXN0Y2FzZS90ZXN0cGFyYW1zL3Rlc3Ri
b3gKPiA+IC0tLS0tLS0tLS0tLS0tLS3CoCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgJXN0ZGRldsKgwqDC
oMKgwqAgY2hhbmdlwqDCoMKgwqDCoMKgwqDCoCAlc3RkZGV2Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiA+IMKgwqDCoMKgIDQzNzg1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgNDQ0ODEKPiA+IHZtLXNjYWxhYmlsaXR5LzMwMHMtOFQtYW5vbi1jb3ctc2Vx
LWh1Z2V0bGIvbGtwLWtubTAxCj4gPiDCoMKgwqDCoCA0Mzc4NcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDQ0NDgxwqDCoMKgwqDCoMKgwqAgR0VPLU1FQU4gdm0t
c2NhbGFiaWxpdHkubWVkaWFuCj4gCj4gVGlsbCBub3csIGZyb20gUm9uZydzIHRlc3RzOgo+IDEu
IERpc2FibGluZyBjdXJzb3IgYmxpbmtpbmcgZG9lc24ndCBjdXJlIHRoZSByZWdyZXNzaW9uLgo+
IDIuIERpc2FibGluZyBwcmludGludCB0ZXN0IHJlc3VsdHMgdG8gY29uc29sZSBjYW4gd29ya2Fy
b3VuZCB0aGUKPiByZWdyZXNzaW9uLgo+IAo+IEFsc28gaWYgd2Ugc2V0IHRoZSBwZXJmZXJfc2hh
ZG93biB0byAwLCB0aGUgcmVncmVzc2lvbiBpcyBhbHNvCj4gZ29uZS4KCldlIGFsc28gZGlkIHNv
bWUgZnVydGhlciBicmVhayBkb3duIGZvciB0aGUgdGltZSBjb25zdW1lZCBieSB0aGUKbmV3IGNv
ZGUuCgpUaGUgZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKCkgY2FsbHMgc2VxdWVudGlhbGx5IAox
LiBkcm1fY2xpZW50X2J1ZmZlcl92bWFwCSAgKDI5MCB1cykKMi4gZHJtX2ZiX2hlbHBlcl9kaXJ0
eV9ibGl0X3JlYWwgICgxOTI0MCB1cykKMy4gaGVscGVyLT5mYi0+ZnVuY3MtPmRpcnR5KCkgICAg
LS0tPiBOVUxMIGZvciBtZ2FnMjAwIGRyaXZlcgo0LiBkcm1fY2xpZW50X2J1ZmZlcl92dW5tYXAg
ICAgICAgKDIxNSB1cykKClRoZSBhdmVyYWdlIHJ1biB0aW1lIGlzIGxpc3RlZCBhZnRlciB0aGUg
ZnVuY3Rpb24gbmFtZXMuCgpGcm9tIGl0LCB3ZSBjYW4gc2VlIGRybV9mYl9oZWxwZXJfZGlydHlf
YmxpdF9yZWFsKCkgdGFrZXMgdG9vIGxvbmcKdGltZSAoYWJvdXQgMjBtcyBmb3IgZWFjaCBydW4p
LiBJIGd1ZXNzIHRoaXMgaXMgdGhlIHJvb3QgY2F1c2UKb2YgdGhpcyByZWdyZXNzaW9uLCBhcyB0
aGUgb3JpZ2luYWwgY29kZSBkb2Vzbid0IHVzZSB0aGlzIGRpcnR5IHdvcmtlci4KCkFzIHNhaWQg
aW4gbGFzdCBlbWFpbCwgc2V0dGluZyB0aGUgcHJlZmVyX3NoYWRvdyB0byAwIGNhbiBhdm9pZAp0
aGUgcmVncnNzaW9uLiBDb3VsZCBpdCBiZSBhbiBvcHRpb24/CgpUaGFua3MsCkZlbmcKCj4gCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwo+IEBAIC0xNjcsNyArMTY3LDcgQEAg
aW50IG1nYWcyMDBfZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQg
bG9uZyBmbGFncykKPiAgCQlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDE2Owo+
ICAJZWxzZQo+ICAJCWRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMzI7Cj4gLQlk
ZXYtPm1vZGVfY29uZmlnLnByZWZlcl9zaGFkb3cgPSAxOwo+ICsJZGV2LT5tb2RlX2NvbmZpZy5w
cmVmZXJfc2hhZG93ID0gMDsKPiAKPiBBbmQgZnJvbSB0aGUgcGVyZiBkYXRhLCBvbmUgb2J2aW91
cyBkaWZmZXJlbmNlIGlzIGdvb2QgY2FzZSBkb24ndAo+IGNhbGwgZHJtX2ZiX2hlbHBlcl9kaXJ0
eV93b3JrKCksIHdoaWxlIGJhZCBjYXNlIGNhbGxzLgo+IAo+IFRoYW5rcywKPiBGZW5nCj4gCj4g
PiBCZXN0IFJlZ2FyZHMsCj4gPiBSb25nIENoZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
