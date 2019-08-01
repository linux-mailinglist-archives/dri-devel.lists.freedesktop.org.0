Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966567DCBF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 15:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A986E5F3;
	Thu,  1 Aug 2019 13:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650BE6E5F3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 13:45:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 06:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; d="scan'208";a="256650694"
Received: from aramdahl-mobl.ger.corp.intel.com (HELO [10.252.36.196])
 ([10.252.36.196])
 by orsmga001.jf.intel.com with ESMTP; 01 Aug 2019 06:45:14 -0700
Subject: Re: [PATCH] drm/syncobj: remove boring message
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20190729082039.23837-1-david1.zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <9c4f887f-b561-f751-cdcf-d773a9fd7e91@intel.com>
Date: Thu, 1 Aug 2019 16:45:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729082039.23837-1-david1.zhou@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBoYWQgYSBmZXcgZXhjaGFuZ2VzIHdpdGggQ2hyaXMgYWJvdXQgdGhpcy4KQ2hyaXMgc3Vn
Z2VzdHMgdGhhdCBpZiB3ZSdyZSBhYm91dCB0byBhZGQgYSBwb2ludCB0byB0aGUgdGltZWxpbmUg
aW4gYW4gCnVub3JkZXJlZCBmYXNoaW9uLCBhY3R1YWxseSBiZXR0ZXIgbm90IGFkZCBpdCBhdCBh
bGwuCgpXaGF0J3MgeW91ciB0YWtlIG9uIHRoaXM/CkknbSBmaW5lIHdpdGggdGhpcywgYnV0IHJh
dGhlciB0aGFuIGFkZCBhbm90aGVyIHZhcmlhbnQgb2YgYWRkX3BvaW50KCkgCm1heWJlIHdlIGNo
YW5nZSBjaGFuZ2UgdGhlIGV4aXN0aW5nLgoKVGhhbmtzLAoKLUxpb25lbAoKT24gMjkvMDcvMjAx
OSAxMToyMCwgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiBJdCBpcyBub3JtYWwgdGhhdCBiaW5hcnkg
c3luY29iaiByZXBsYWNlcyB0aGUgdW5kZXJseWluZyBmZW5jZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vZHJtX3N5bmNvYmouYyB8IDMgLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4gaW5kZXggOTI5ZjdjNjRmOWEyLi5iYzdlYzE2
NzllNGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+IEBAIC0xNTEsOSArMTUxLDYgQEAgdm9p
ZCBkcm1fc3luY29ial9hZGRfcG9pbnQoc3RydWN0IGRybV9zeW5jb2JqICpzeW5jb2JqLAo+ICAg
CXNwaW5fbG9jaygmc3luY29iai0+bG9jayk7Cj4gICAKPiAgIAlwcmV2ID0gZHJtX3N5bmNvYmpf
ZmVuY2VfZ2V0KHN5bmNvYmopOwo+IC0JLyogWW91IGFyZSBhZGRpbmcgYW4gdW5vcmRlciBwb2lu
dCB0byB0aW1lbGluZSwgd2hpY2ggY291bGQgY2F1c2UgcGF5bG9hZCByZXR1cm5lZCBmcm9tIHF1
ZXJ5X2lvY3RsIGlzIDAhICovCj4gLQlpZiAocHJldiAmJiBwcmV2LT5zZXFubyA+PSBwb2ludCkK
PiAtCQlEUk1fRVJST1IoIllvdSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxp
bmUhXG4iKTsKPiAgIAlkbWFfZmVuY2VfY2hhaW5faW5pdChjaGFpbiwgcHJldiwgZmVuY2UsIHBv
aW50KTsKPiAgIAlyY3VfYXNzaWduX3BvaW50ZXIoc3luY29iai0+ZmVuY2UsICZjaGFpbi0+YmFz
ZSk7Cj4gICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
