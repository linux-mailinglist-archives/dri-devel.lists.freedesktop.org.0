Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EA4897BC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA036E4B6;
	Mon, 12 Aug 2019 07:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CA06E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 07:26:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 00:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,376,1559545200"; d="scan'208";a="200034700"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.113])
 by fmsmga004.fm.intel.com with ESMTP; 12 Aug 2019 00:25:27 -0700
Date: Mon, 12 Aug 2019 15:25:45 +0800
From: Feng Tang <feng.tang@intel.com>
To: Rong Chen <rong.a.chen@intel.com>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
Message-ID: <20190812072545.GA63191@shbuild999.sh.intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, lkp@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDQ6MTI6MjlQTSArMDgwMCwgUm9u
ZyBDaGVuIHdyb3RlOgo+IEhpLAo+IAo+ID4+QWN0dWFsbHkgd2UgcnVuIHRoZSBiZW5jaG1hcmsg
YXMgYSBiYWNrZ3JvdW5kIHByb2Nlc3MsIGRvIHdlIG5lZWQgdG8KPiA+PmRpc2FibGUgdGhlIGN1
cnNvciBhbmQgdGVzdCBhZ2Fpbj8KPiA+VGhlcmUncyBhIHdvcmtlciB0aHJlYWQgdGhhdCB1cGRh
dGVzIHRoZSBkaXNwbGF5IGZyb20gdGhlIHNoYWRvdyBidWZmZXIuCj4gPlRoZSBibGlua2luZyBj
dXJzb3IgcGVyaW9kaWNhbGx5IHRyaWdnZXJzIHRoZSB3b3JrZXIgdGhyZWFkLCBidXQgdGhlCj4g
PmFjdHVhbCB1cGRhdGUgaXMganVzdCB0aGUgc2l6ZSBvZiBvbmUgY2hhcmFjdGVyLgo+ID4KPiA+
VGhlIHBvaW50IG9mIHRoZSB0ZXN0IHdpdGhvdXQgb3V0cHV0IGlzIHRvIHNlZSBpZiB0aGUgcmVn
cmVzc2lvbiBjb21lcwo+ID5mcm9tIHRoZSBidWZmZXIgdXBkYXRlIChpLmUuLCB0aGUgbWVtY3B5
IGZyb20gc2hhZG93IGJ1ZmZlciB0byBWUkFNKSwgb3IKPiA+ZnJvbSB0aGUgd29ya2VyIHRocmVh
ZC4gSWYgdGhlIHJlZ3Jlc3Npb24gZ29lcyBhd2F5IGFmdGVyIGRpc2FibGluZyB0aGUKPiA+Ymxp
bmtpbmcgY3Vyc29yLCB0aGVuIHRoZSB3b3JrZXIgdGhyZWFkIGlzIHRoZSBwcm9ibGVtLiBJZiBp
dCBhbHJlYWR5Cj4gPmdvZXMgYXdheSBpZiB0aGVyZSdzIHNpbXBseSBubyBvdXRwdXQgZnJvbSB0
aGUgdGVzdCwgdGhlIHNjcmVlbiB1cGRhdGUKPiA+aXMgdGhlIHByb2JsZW0uIE9uIG15IG1hY2hp
bmUgSSBoYXZlIHRvIGRpc2FibGUgdGhlIGJsaW5raW5nIGN1cnNvciwgc28KPiA+SSB0aGluayB0
aGUgd29ya2VyIGNhdXNlcyB0aGUgcGVyZm9ybWFuY2UgZHJvcC4KPiAKPiBXZSBkaXNhYmxlZCBy
ZWRpcmVjdGluZyBzdGRvdXQvc3RkZXJyIHRvIC9kZXYva21zZyzCoCBhbmQgdGhlIHJlZ3Jlc3Np
b24gaXMKPiBnb25lLgo+IAo+IGNvbW1pdDoKPiDCoCBmMWY4NTU1ZGZiOSBkcm0vYm9jaHM6IFVz
ZSBzaGFkb3cgYnVmZmVyIGZvciBib2NocyBmcmFtZWJ1ZmZlciBjb25zb2xlCj4gwqAgOTBmNDc5
YWU1MWEgZHJtL21nYWcyMDA6IFJlcGxhY2Ugc3RydWN0IG1nYV9mYmRldiB3aXRoIGdlbmVyaWMg
ZnJhbWVidWZmZXIKPiBlbXVsYXRpb24KPiAKPiBmMWY4NTU1ZGZiOWE3MGEywqAgOTBmNDc5YWU1
MWFmYTQ1ZWZhYjk3YWZkZGUgdGVzdGNhc2UvdGVzdHBhcmFtcy90ZXN0Ym94Cj4gLS0tLS0tLS0t
LS0tLS0tLcKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+IMKgwqDCoMKgwqDCoMKgwqAgJXN0ZGRldsKgwqDCoMKgwqAgY2hhbmdlwqDCoMKg
wqDCoMKgwqDCoCAlc3RkZGV2Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFzCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqAgNDM3
ODXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0NDQ4MQo+IHZt
LXNjYWxhYmlsaXR5LzMwMHMtOFQtYW5vbi1jb3ctc2VxLWh1Z2V0bGIvbGtwLWtubTAxCj4gwqDC
oMKgwqAgNDM3ODXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0
NDQ4McKgwqDCoMKgwqDCoMKgIEdFTy1NRUFOIHZtLXNjYWxhYmlsaXR5Lm1lZGlhbgoKVGlsbCBu
b3csIGZyb20gUm9uZydzIHRlc3RzOgoxLiBEaXNhYmxpbmcgY3Vyc29yIGJsaW5raW5nIGRvZXNu
J3QgY3VyZSB0aGUgcmVncmVzc2lvbi4KMi4gRGlzYWJsaW5nIHByaW50aW50IHRlc3QgcmVzdWx0
cyB0byBjb25zb2xlIGNhbiB3b3JrYXJvdW5kIHRoZQpyZWdyZXNzaW9uLgoKQWxzbyBpZiB3ZSBz
ZXQgdGhlIHBlcmZlcl9zaGFkb3duIHRvIDAsIHRoZSByZWdyZXNzaW9uIGlzIGFsc28KZ29uZS4K
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCkBAIC0xNjcsNyArMTY3LDcgQEAgaW50
IG1nYWcyMDBfZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9u
ZyBmbGFncykKIAkJZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAxNjsKIAllbHNl
CiAJCWRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMzI7Ci0JZGV2LT5tb2RlX2Nv
bmZpZy5wcmVmZXJfc2hhZG93ID0gMTsKKwlkZXYtPm1vZGVfY29uZmlnLnByZWZlcl9zaGFkb3cg
PSAwOwoKQW5kIGZyb20gdGhlIHBlcmYgZGF0YSwgb25lIG9idmlvdXMgZGlmZmVyZW5jZSBpcyBn
b29kIGNhc2UgZG9uJ3QKY2FsbCBkcm1fZmJfaGVscGVyX2RpcnR5X3dvcmsoKSwgd2hpbGUgYmFk
IGNhc2UgY2FsbHMuCgpUaGFua3MsCkZlbmcKCj4gQmVzdCBSZWdhcmRzLAo+IFJvbmcgQ2hlbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
