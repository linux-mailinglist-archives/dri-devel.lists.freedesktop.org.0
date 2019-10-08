Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74DCF262
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 08:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E92889FD4;
	Tue,  8 Oct 2019 06:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86489E4C;
 Tue,  8 Oct 2019 06:05:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 23:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="206577319"
Received: from wpross-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.86])
 by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2019 23:05:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH TRIVIAL v2] gpu: Fix Kconfig indentation
In-Reply-To: <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191004144549.3567-1-krzk@kernel.org> <87sgo4hjii.fsf@intel.com>
 <CADnq5_MqGehpWwOAxYg0T2x3qXisqmae2uGG5dijQX+Aa4NsoQ@mail.gmail.com>
 <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
Date: Tue, 08 Oct 2019 09:05:49 +0300
Message-ID: <87v9szdb5u.fsf@intel.com>
MIME-Version: 1.0
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jiri Kosina <trivial@kernel.org>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwNyBPY3QgMjAxOSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
PiB3cm90ZToKPiBPbiBNb24sIDcgT2N0IDIwMTkgYXQgMTg6MDksIEFsZXggRGV1Y2hlciA8YWxl
eGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gT24gTW9uLCBPY3QgNywgMjAxOSBhdCA3
OjM5IEFNIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+
PiA+Cj4+ID4gT24gRnJpLCAwNCBPY3QgMjAxOSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPiB3cm90ZToKPj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnICAg
ICAgICAgICAgIHwgIDEyICstCj4+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5k
ZWJ1ZyAgICAgICB8IDE0NCArKysrKysrKysrKy0tLS0tLS0tLS0tLQo+PiA+Cj4+ID4gUGxlYXNl
IHNwbGl0IHRoZXNlIG91dCB0byBhIHNlcGFyYXRlIHBhdGNoLiBDYW4ndCBzcGVhayBmb3Igb3Ro
ZXJzLCBidXQKPj4gPiB0aGUgcGF0Y2ggbG9va3MgbGlrZSBpdCdsbCBiZSBjb25mbGljdHMgZ2Fs
b3JlIGFuZCBhIHByb2JsZW0gdG8gbWFuYWdlCj4+ID4gaWYgbWVyZ2VkIGluIG9uZSBiaWcgbHVt
cC4KPj4KPj4gWWVzLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhlIGFtZCBwYXRjaCBzZXBh
cmF0ZSBhcyB3ZWxsLgo+Cj4gSSdsbCBzcGxpdCB0aGUgQU1EIGFuZCBpOTE1IGFsdGhvdWdoIEkg
YW0gbm90IHN1cmUgaWYgaXQgaXMgc2Vuc2UgdG8KPiBzcGxpdCBzdWNoIHRyaXZpYWwgcGF0Y2gg
cGVyIGVhY2ggZHJpdmVyLgoKVGhhbmtzLgoKU2VlIE1BSU5UQUlORVJTLCBtYW55IG9mIHRoZSBk
cml2ZXJzIGFyZSBtYWludGFpbmVkIGluIHRoZSBzYW1lIGRybS1taXNjCnJlcG8sIGFuZCBpdCBt
YWtlcyBubyBkaWZmZXJlbmNlIHRvIHNwbGl0IHRob3NlLgoKSW4gZ2VuZXJhbCBpdCdzLCB3ZWxs
LCB0cml2aWFsIHRvIHNwbGl0IHVwIHBhdGNoZXMgbGlrZSB0aGlzIHBlciBkcml2ZXIKb3IgcmVw
bywgYnV0IG5vdCBzcGxpdHRpbmcgaXQgdXAgZ2VuZXJhdGVzIGV4dHJhIGJ1c3l3b3JrIGluIG1h
bmFnaW5nCmNvbmZsaWN0cyB1bnRpbCBzb21lIGNvbW1vbiBtZXJnZS9iYWNrbWVyZ2UgaGFwcGVu
cy4gV2UganVzdCB3YW50IHRvCmFwcGx5IHRoZSBwYXRjaCBhbmQgZm9yZ2V0IGFib3V0IGl0LCBp
bnN0ZWFkIG9mIGRlYWxpbmcgd2l0aCBhIHRyaXZpYWwKd2hpdGVzcGFjZSBjbGVhbnVwIG1hbnkg
dGltZXMgb3Zlci4KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
