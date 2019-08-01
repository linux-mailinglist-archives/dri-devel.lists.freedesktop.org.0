Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDF37D994
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 12:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91E96E49F;
	Thu,  1 Aug 2019 10:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC296E48D;
 Thu,  1 Aug 2019 10:43:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="172876015"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2019 03:43:54 -0700
Date: Thu, 1 Aug 2019 16:13:49 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Sharma, Shashank" <shashank.sharma@intel.com>
Subject: Re: [PATCH v10 6/6] drm/hdcp: reference for srm file format
Message-ID: <20190801104349.GD16303@intel.com>
References: <20190712070026.13088-1-ramalingam.c@intel.com>
 <20190712070026.13088-7-ramalingam.c@intel.com>
 <FF3DDC77922A8A4BB08A3BC48A1EA8CB8DF8FE8F@BGSMSX101.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FF3DDC77922A8A4BB08A3BC48A1EA8CB8DF8FE8F@BGSMSX101.gar.corp.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wMSBhdCAxNjowNjozNyArMDUzMCwgU2hhcm1hLCBTaGFzaGFuayB3cm90ZToK
PiBIaSBSYW0sIAo+IEp1c3QgYSBtaW5vciBuaXRwaWNrLiAKPiAKPiBSZWdhcmRzCj4gU2hhc2hh
bmsKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBkcmktZGV2ZWwgW21h
aWx0bzpkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uIEJlaGFsZiBP
Zgo+ID4gUmFtYWxpbmdhbSBDCj4gPiBTZW50OiBGcmlkYXksIEp1bHkgMTIsIDIwMTkgMTI6MzAg
UE0KPiA+IFRvOiBpbnRlbC1nZnggPGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBk
cmktZGV2ZWwgPGRyaS0KPiA+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFBla2thIFBh
YWxhbmVuIDxwcGFhbGFuZW5AZ21haWwuY29tPjsgRGFuaWVsCj4gPiBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiA+IFN1YmplY3Q6IFtQQVRDSCB2MTAgNi82XSBkcm0vaGRjcDogcmVmZXJlbmNl
IGZvciBzcm0gZmlsZSBmb3JtYXQKPiA+IAo+ID4gSW4gdGhlIGtlcm5lbCBkb2N1bWVudGF0aW9u
LCBIRENQIHNwZWNpZmljYXRpb25zIGxpbmtzIGFyZSBzaGFyZWQgYXMgYSByZWZlcmVuY2UgZm9y
Cj4gPiBTUk0gdGFibGUgZm9ybWF0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2Ft
IEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2hkY3AuYyB8IDcgKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faGRjcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9oZGNwLmMgaW5kZXgKPiA+IDc3NDMzZWUzZDY1Mi4uODAzYmY4Mjgz
YjgzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1faGRjcC5jCj4gPiBAQCAtMjcxLDYgKzI3MSwxMyBAQCBzdGF0
aWMgdm9pZCBkcm1faGRjcF9yZXF1ZXN0X3NybShzdHJ1Y3QgZHJtX2RldmljZQo+ID4gKmRybV9k
ZXYpCj4gPiAgICoKPiA+ICAgKiBTUk0gc2hvdWxkIGJlIHByZXNlbnRlZCBpbiB0aGUgbmFtZSBv
ZiAiZGlzcGxheV9oZGNwX3NybS5iaW4iLgo+ID4gICAqCj4gPiArICogRm9ybWF0IG9mIHRoZSBT
Uk0gdGFibGUgdGhhdCB1c2Vyc3BhY2UgbmVlZHMgdG8gd3JpdGUgaW50byB0aGUKPiA+ICsgYmlu
YXJ5IGZpbGUKPiA+ICsgKiBpcyBkZWZpbmVkIGF0Cj4gSSB3b3VsZCBqdXN0IHByZWZlciBhZGRp
dGlvbiBvZiAyICcsJyBhbmQgYSAnOicsIHNvbWV0aGluZyBsaWtlOgo+IEZvcm1hdCBvZiB0aGUg
U1JNIHRhYmxlLCB0aGF0IHRoZSB1c2Vyc3BhY2UgbmVlZHMgdG8gd3JpdGUgaW50byB0aGUgYmlu
YXJ5IGZpbGUsIGlzIGRlZmluZWQgYXQ6Cj4gCj4gV2l0aCB0aGlzIGNoYW5nZSwgcGxlYXNlIGZl
ZWwgZnJlZSB0byB1c2U6Cj4gUmV2aWV3ZWQtYnk6IFNoYXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsu
c2hhcm1hQGludGVsLmNvbT4KVGhhbmtzIFNoYXNoYW5rLgoKLVJhbQo+IAo+ID4gKyAqIDEuIFJl
bmV3YWJpbGl0eSBjaGFwdGVyIG9uIDU1dGggcGFnZSBvZiBIRENQIDEuNCBzcGVjaWZpY2F0aW9u
Cj4gPiArICoKPiA+ICsgaHR0cHM6Ly93d3cuZGlnaXRhbC1jcC5jb20vc2l0ZXMvZGVmYXVsdC9m
aWxlcy9zcGVjaWZpY2F0aW9ucy9IRENQJTIwUwo+ID4gKyBwZWNpZmljYXRpb24lMjBSZXYxXzRf
U2VjdXJlLnBkZgo+ID4gKyAqIDIuIFJlbmV3YWJpbGl0eSBjaGFwdGVyIG9uIDYzcmQgcGFnZSBv
ZiBIRENQIDIuMiBzcGVjaWZpY2F0aW9uCj4gPiArICoKPiA+ICsgaHR0cHM6Ly93d3cuZGlnaXRh
bC1jcC5jb20vc2l0ZXMvZGVmYXVsdC9maWxlcy9zcGVjaWZpY2F0aW9ucy9IRENQJTIwbwo+ID4g
KyBuJTIwSERNSSUyMFNwZWNpZmljYXRpb24lMjBSZXYyXzJfRmluYWwxLnBkZgo+ID4gKyAqCj4g
PiAgICogUmV0dXJuczoKPiA+ICAgKiBUUlVFIG9uIGFueSBvZiB0aGUgS1NWIGlzIHJldm9rZWQs
IGVsc2UgRkFMU0UuCj4gPiAgICovCj4gPiAtLQo+ID4gMi4xOS4xCj4gPiAKPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
