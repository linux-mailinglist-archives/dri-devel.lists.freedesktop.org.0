Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC158504
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 16:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5944C6E038;
	Thu, 27 Jun 2019 14:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50566E038
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:59:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 07:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,424,1557212400"; d="scan'208";a="183472155"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2019 07:59:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: KMS documentation for userspace
In-Reply-To: <CAKMK7uFCKH5ydzRF8AsNDuFmva+1LWa70FhMGUiFTh3ka80C1w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <13b7wY-2xuVr-7VBZKIUaV5hr_T03akw4sBL_zlsLRxksg5UZGpAYRKSq8_VmBRAvODmSISqGda2YU332G9O9IaJluDJFsc6R8uWkQeQT1o=@emersion.fr>
 <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
 <87fto5pbvv.fsf@intel.com>
 <CAKMK7uFCKH5ydzRF8AsNDuFmva+1LWa70FhMGUiFTh3ka80C1w@mail.gmail.com>
Date: Thu, 27 Jun 2019 18:02:01 +0300
Message-ID: <87mui3oyvq.fsf@intel.com>
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
Cc: Simon Ser <contact@emersion.fr>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMiBKdW4gMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAxMDoxNiBQTSBKYW5pIE5pa3VsYQo+IDxqYW5p
Lm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIDE5IEp1biAyMDE5
LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+PiA+IC0gZmlndXJlIG91
dCB3aGF0IHRvIGRvIHdpdGggdGhlIGxpYmRybSBtYW5wYWdlcy4gU29tZSBzdHVmZiB3ZSByZWFs
bHkKPj4gPiB3YW50IHRvIGFsc28gZG9jdW1lbnQgdGhlcmUuIEJ1dCBnZWV6IG5yb2ZmLiBNYXli
ZSB3ZSBuZWVkIHRvIHN0dWZmCj4+ID4gbGliZHJtIGludG8gdGhlIGtlcm5lbCwgZHVubm8uCj4+
Cj4+IEhvdyB3b3VsZCBwZW9wbGUgZmVlbCBhYm91dCBjb252ZXJ0aW5nIGxpYmRybSBtYW4gcGFn
ZXMgdG8gcnN0LCBhbmQKPj4gdXNpbmcgcnN0Mm1hbiBpbiB0aGUgYnVpbGQ/IFdlIGRpZCB0aGF0
IGZvciBpZ3QgbWFuIHBhZ2VzIFsxXS4gTG9va2luZwo+PiBhdCB0aGUgZGlmZiwgSSB0aGluayBp
dCdzIHBsYWluIHRvIHNlZSBob3cgdGhhdCBjb3VsZCBsb3dlciB0aGUgYmFyIGZvcgo+PiBjb250
cmlidXRpbmcuIEFuZCBwZXJoYXBzIGl0IHdvdWxkIGJlIGVhc2llciB0byByZWZhY3RvciBhbmQg
bW92ZQo+PiBkb2N1bWVudGF0aW9uIGFyb3VuZCB0b28uCj4KPiBJIHRoaW5rIHRoYXQnZCBiZSB2
ZXJ5IG5pY2UuCj4KPj4gSSBmb3JnZXQsIEkgcHJvYmFibHkgdXNlZCBwYW5kb2Mgb3Igc29tZXRo
aW5nIHRvIGRvIHRoZSBidWxrIG9mIHRoZSBpZ3QKPj4gY29udmVyc2lvbiwgYW5kIGFkZGVkIHNv
bWUgbWFudWFsIHBvbGlzaCBvbiB0b3AuIEknbSBub3Qgdm9sdW50ZWVyaW5nCj4+IGZvciB0aGUg
bGliZHJtIG1hbiBwYWdlIGNvbnZlcnNpb24gdGhvdWdoLiA7KQo+Cj4gSG0sIG1heWJlIGRpZyBv
dXQgdGhlIG9sZCB0b29scyB5b3UgdXNlZCBhbmQgcG9pbnQgU2ltb24gYXQgdGhlbT8KCkkgY291
bGQgc3dlYXIgSSBkaWQgaXQgd2l0aCBwYW5kb2Mgb25seSwgYnV0IHRoZSBwYW5kb2MgSSBoYXZl
IG9uIG15CmRpc3RybyByaWdodCBub3cgZG9lcyBub3Qgc3VwcG9ydCBtYW4gaW5wdXQuIFVwc3Ry
ZWFtIGRvY3VtZW50YXRpb24KY2xhaW1zIGl0IGRvZXMsIHNvIEkgZG9uJ3Qga25vdyB3aGF0IGdp
dmVzLgoKSWYgdGhhdCBmYWlscywgZmlyc3QgbWFuMmh0bWwgYW5kIHRoZW4gcGFuZG9jIGZyb20g
aHRtbCB0byByc3Qgd29ya3MgdG8KYW4gZXh0ZW50LgoKUmVnYXJkbGVzcywgSSB0aGluayB0aGUg
aGFyZGVzdCBwYXJ0IGlzIGRlY2lkaW5nIHdoYXQgc3R5bGUgdG8gdXNlIGluCnRoZSByc3QgZmls
ZXMgKGFsbCB0aGUgaGVhZGluZ3MgYW5kIHN5bm9wc2lzIGFuZCByZWZlcmVuY2VzIGV0Yy4pIGFu
ZAp0aGVuIHRlZGlvdXNseSBkbyB0aGUgbWFudWFsIGNsZWFudXAgYWZ0ZXIgdGhlIGNvbnZlcnNp
b24uIEl0J3MgYQpvbmUtdGltZSBlZmZvcnQsIHNvIHRoZXJlIGFyZSBsaW1pdHMgdG8gdGhlIFJP
SSBvbiBwb2xpc2hpbmcgdGhlCnRvb2xjaGFpbi4KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3Vs
YSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
