Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F738FB90
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 08:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EA56EAB8;
	Fri, 16 Aug 2019 06:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0246EAB8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 06:56:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 23:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; d="scan'208";a="182101092"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.113])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2019 23:55:29 -0700
Date: Fri, 16 Aug 2019 14:55:48 +0800
From: Feng Tang <feng.tang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
Message-ID: <20190816065548.GA67708@shbuild999.sh.intel.com>
References: <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813093616.GA65475@shbuild999.sh.intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 lkp@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDU6MzY6MTZQTSArMDgwMCwgRmVu
ZyBUYW5nIHdyb3RlOgo+IEhpIFRob21hcywgCj4gCj4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQg
MDM6MjU6NDVQTSArMDgwMCwgRmVuZyBUYW5nIHdyb3RlOgo+ID4gSGkgVGhvbWFzLAo+ID4gCj4g
PiBPbiBGcmksIEF1ZyAwOSwgMjAxOSBhdCAwNDoxMjoyOVBNICswODAwLCBSb25nIENoZW4gd3Jv
dGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gPj5BY3R1YWxseSB3ZSBydW4gdGhlIGJlbmNobWFy
ayBhcyBhIGJhY2tncm91bmQgcHJvY2VzcywgZG8gd2UgbmVlZCB0bwo+ID4gPiA+PmRpc2FibGUg
dGhlIGN1cnNvciBhbmQgdGVzdCBhZ2Fpbj8KPiA+ID4gPlRoZXJlJ3MgYSB3b3JrZXIgdGhyZWFk
IHRoYXQgdXBkYXRlcyB0aGUgZGlzcGxheSBmcm9tIHRoZSBzaGFkb3cgYnVmZmVyLgo+ID4gPiA+
VGhlIGJsaW5raW5nIGN1cnNvciBwZXJpb2RpY2FsbHkgdHJpZ2dlcnMgdGhlIHdvcmtlciB0aHJl
YWQsIGJ1dCB0aGUKPiA+ID4gPmFjdHVhbCB1cGRhdGUgaXMganVzdCB0aGUgc2l6ZSBvZiBvbmUg
Y2hhcmFjdGVyLgo+ID4gPiA+Cj4gPiA+ID5UaGUgcG9pbnQgb2YgdGhlIHRlc3Qgd2l0aG91dCBv
dXRwdXQgaXMgdG8gc2VlIGlmIHRoZSByZWdyZXNzaW9uIGNvbWVzCj4gPiA+ID5mcm9tIHRoZSBi
dWZmZXIgdXBkYXRlIChpLmUuLCB0aGUgbWVtY3B5IGZyb20gc2hhZG93IGJ1ZmZlciB0byBWUkFN
KSwgb3IKPiA+ID4gPmZyb20gdGhlIHdvcmtlciB0aHJlYWQuIElmIHRoZSByZWdyZXNzaW9uIGdv
ZXMgYXdheSBhZnRlciBkaXNhYmxpbmcgdGhlCj4gPiA+ID5ibGlua2luZyBjdXJzb3IsIHRoZW4g
dGhlIHdvcmtlciB0aHJlYWQgaXMgdGhlIHByb2JsZW0uIElmIGl0IGFscmVhZHkKPiA+ID4gPmdv
ZXMgYXdheSBpZiB0aGVyZSdzIHNpbXBseSBubyBvdXRwdXQgZnJvbSB0aGUgdGVzdCwgdGhlIHNj
cmVlbiB1cGRhdGUKPiA+ID4gPmlzIHRoZSBwcm9ibGVtLiBPbiBteSBtYWNoaW5lIEkgaGF2ZSB0
byBkaXNhYmxlIHRoZSBibGlua2luZyBjdXJzb3IsIHNvCj4gPiA+ID5JIHRoaW5rIHRoZSB3b3Jr
ZXIgY2F1c2VzIHRoZSBwZXJmb3JtYW5jZSBkcm9wLgo+ID4gPiAKPiA+ID4gV2UgZGlzYWJsZWQg
cmVkaXJlY3Rpbmcgc3Rkb3V0L3N0ZGVyciB0byAvZGV2L2ttc2cswqAgYW5kIHRoZSByZWdyZXNz
aW9uIGlzCj4gPiA+IGdvbmUuCj4gPiA+IAo+ID4gPiBjb21taXQ6Cj4gPiA+IMKgIGYxZjg1NTVk
ZmI5IGRybS9ib2NoczogVXNlIHNoYWRvdyBidWZmZXIgZm9yIGJvY2hzIGZyYW1lYnVmZmVyIGNv
bnNvbGUKPiA+ID4gwqAgOTBmNDc5YWU1MWEgZHJtL21nYWcyMDA6IFJlcGxhY2Ugc3RydWN0IG1n
YV9mYmRldiB3aXRoIGdlbmVyaWMgZnJhbWVidWZmZXIKPiA+ID4gZW11bGF0aW9uCj4gPiA+IAo+
ID4gPiBmMWY4NTU1ZGZiOWE3MGEywqAgOTBmNDc5YWU1MWFmYTQ1ZWZhYjk3YWZkZGUgdGVzdGNh
c2UvdGVzdHBhcmFtcy90ZXN0Ym94Cj4gPiA+IC0tLS0tLS0tLS0tLS0tLS3CoCAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoCAlc3RkZGV2wqDCoMKgwqDCoCBjaGFuZ2XCoMKgwqDCoMKgwqDCoMKgICVzdGRk
ZXYKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFzCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+IMKgwqDCoMKgIDQzNzg1wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNDQ0ODEKPiA+ID4gdm0tc2Nh
bGFiaWxpdHkvMzAwcy04VC1hbm9uLWNvdy1zZXEtaHVnZXRsYi9sa3Ata25tMDEKPiA+ID4gwqDC
oMKgwqAgNDM3ODXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0
NDQ4McKgwqDCoMKgwqDCoMKgIEdFTy1NRUFOIHZtLXNjYWxhYmlsaXR5Lm1lZGlhbgo+ID4gCj4g
PiBUaWxsIG5vdywgZnJvbSBSb25nJ3MgdGVzdHM6Cj4gPiAxLiBEaXNhYmxpbmcgY3Vyc29yIGJs
aW5raW5nIGRvZXNuJ3QgY3VyZSB0aGUgcmVncmVzc2lvbi4KPiA+IDIuIERpc2FibGluZyBwcmlu
dGludCB0ZXN0IHJlc3VsdHMgdG8gY29uc29sZSBjYW4gd29ya2Fyb3VuZCB0aGUKPiA+IHJlZ3Jl
c3Npb24uCj4gPiAKPiA+IEFsc28gaWYgd2Ugc2V0IHRoZSBwZXJmZXJfc2hhZG93biB0byAwLCB0
aGUgcmVncmVzc2lvbiBpcyBhbHNvCj4gPiBnb25lLgo+IAo+IFdlIGFsc28gZGlkIHNvbWUgZnVy
dGhlciBicmVhayBkb3duIGZvciB0aGUgdGltZSBjb25zdW1lZCBieSB0aGUKPiBuZXcgY29kZS4K
PiAKPiBUaGUgZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKCkgY2FsbHMgc2VxdWVudGlhbGx5IAo+
IDEuIGRybV9jbGllbnRfYnVmZmVyX3ZtYXAJICAoMjkwIHVzKQo+IDIuIGRybV9mYl9oZWxwZXJf
ZGlydHlfYmxpdF9yZWFsICAoMTkyNDAgdXMpCj4gMy4gaGVscGVyLT5mYi0+ZnVuY3MtPmRpcnR5
KCkgICAgLS0tPiBOVUxMIGZvciBtZ2FnMjAwIGRyaXZlcgo+IDQuIGRybV9jbGllbnRfYnVmZmVy
X3Z1bm1hcCAgICAgICAoMjE1IHVzKQo+IAo+IFRoZSBhdmVyYWdlIHJ1biB0aW1lIGlzIGxpc3Rl
ZCBhZnRlciB0aGUgZnVuY3Rpb24gbmFtZXMuCj4gCj4gRnJvbSBpdCwgd2UgY2FuIHNlZSBkcm1f
ZmJfaGVscGVyX2RpcnR5X2JsaXRfcmVhbCgpIHRha2VzIHRvbyBsb25nCj4gdGltZSAoYWJvdXQg
MjBtcyBmb3IgZWFjaCBydW4pLiBJIGd1ZXNzIHRoaXMgaXMgdGhlIHJvb3QgY2F1c2UKPiBvZiB0
aGlzIHJlZ3Jlc3Npb24sIGFzIHRoZSBvcmlnaW5hbCBjb2RlIGRvZXNuJ3QgdXNlIHRoaXMgZGly
dHkgd29ya2VyLgo+IAo+IEFzIHNhaWQgaW4gbGFzdCBlbWFpbCwgc2V0dGluZyB0aGUgcHJlZmVy
X3NoYWRvdyB0byAwIGNhbiBhdm9pZAo+IHRoZSByZWdyc3Npb24uIENvdWxkIGl0IGJlIGFuIG9w
dGlvbj8KCkFueSBjb21tZW50cyBvbiB0aGlzPyB0aGFua3MKCi0gRmVuZwoKPiAKPiBUaGFua3Ms
Cj4gRmVuZwo+IAo+ID4gCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X21haW4uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMK
PiA+IEBAIC0xNjcsNyArMTY3LDcgQEAgaW50IG1nYWcyMDBfZHJpdmVyX2xvYWQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBmbGFncykKPiA+ICAJCWRldi0+bW9kZV9jb25m
aWcucHJlZmVycmVkX2RlcHRoID0gMTY7Cj4gPiAgCWVsc2UKPiA+ICAJCWRldi0+bW9kZV9jb25m
aWcucHJlZmVycmVkX2RlcHRoID0gMzI7Cj4gPiAtCWRldi0+bW9kZV9jb25maWcucHJlZmVyX3No
YWRvdyA9IDE7Cj4gPiArCWRldi0+bW9kZV9jb25maWcucHJlZmVyX3NoYWRvdyA9IDA7Cj4gPiAK
PiA+IEFuZCBmcm9tIHRoZSBwZXJmIGRhdGEsIG9uZSBvYnZpb3VzIGRpZmZlcmVuY2UgaXMgZ29v
ZCBjYXNlIGRvbid0Cj4gPiBjYWxsIGRybV9mYl9oZWxwZXJfZGlydHlfd29yaygpLCB3aGlsZSBi
YWQgY2FzZSBjYWxscy4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gRmVuZwo+ID4gCj4gPiA+IEJlc3Qg
UmVnYXJkcywKPiA+ID4gUm9uZyBDaGVuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMS1AgbWFpbGluZyBsaXN0Cj4gTEtQQGxpc3RzLjAxLm9yZwo+
IGh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGtwCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
