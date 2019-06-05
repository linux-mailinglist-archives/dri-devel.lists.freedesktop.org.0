Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393F363AD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79033896A3;
	Wed,  5 Jun 2019 18:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD6F896A3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 18:59:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9DF558041D;
 Wed,  5 Jun 2019 20:59:42 +0200 (CEST)
Date: Wed, 5 Jun 2019 20:59:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dingchen Zhang <dingchen.zhang@amd.com>
Subject: Re: [PATCH] drm: actually remove the newline for CRC source name.
Message-ID: <20190605185941.GA31325@ravnborg.org>
References: <20190605183556.3006-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605183556.3006-1-dingchen.zhang@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=zd2uoN0lAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=0a8QvSxe86ArwVS-wJEA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGluZ2NoZW4uCgpUaGFua3MgZm9yIHRoZSBxdWljayBmb2xsb3ctdXAuCgpPbiBXZWQsIEp1
biAwNSwgMjAxOSBhdCAwMjozNTo1NlBNIC0wNDAwLCBEaW5nY2hlbiBaaGFuZyB3cm90ZToKPiAn
bi0xJyBpcyB0aGUgaW5kZXggdG8gcmVwbGFjZSB0aGUgbmV3bGluZSBjaGFyYWN0ZXIgb2YgQ1JD
IHNvdXJjZSBuYW1lLgoKc3ViamVjdCBpcyBtdWNoIGJldHRlciBub3cuCkl0IHdvdWxkIGJlIGZp
bmUgaWYgdGhlIGJvZHkgb2YgdGhlIGNoYW5nZWxvZyBjb252ZXllZCB0aGUgc2FtZSBtZXNzYWdl
LgpUaGUgYm9keSBleHBsYWlucyB3aGF0IHRoZSBwYXRjaCBkb2VzLCBpdCBpcyBiZXR0ZXIgdG8g
Zm9jdXMgb24gd2h5IHRoZQpwYXRjaCBkb2VzIHdoYXQgaXMgZG8uCgpTbyBtYXliZSBhIHNob3J0
IGV4cGxhbmF0aW9uIHRoYXQgdXNlcnNwYWNlIG1heSB0cmFuc2ZlciBhIG5ld2luZSwgYW5kCnRo
YXQgdGhpcyB0ZXJtaW5hdGluZyBuZXdsaW5lIGlzIHJlcGxhY2VkIGJ5IGEgJ1wwJyB0byBhdm9p
ZCBmb2xsb3d1cAppc3Nlcy4KCj4gCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+
IENjOiBIYXJyeSBXZW50bGFuZDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgpQbGVhc2UgYWRkIGEg
c3BhY2UgYWZ0ZXIgdGhlIG5hbWUsIGJlZm9yZSB0aGUgJzwnLgpUaGlzIGlzIGFsc28gc3VnZ2Vz
dGVkIGJ5IGNoZWNrcGF0Y2gucGwuCgoKPiBTaWduZWQtb2ZmLWJ5OiBEaW5nY2hlbiBaaGFuZyA8
ZGluZ2NoZW4uemhhbmdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1
Z2ZzX2NyYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
c19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+IGluZGV4IDU4NTE2
OWYwZGNjNS4uZTIwYWRlZjlkNjIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZGVidWdmc19jcmMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+
IEBAIC0xMzEsOCArMTMxLDggQEAgc3RhdGljIHNzaXplX3QgY3JjX2NvbnRyb2xfd3JpdGUoc3Ry
dWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIgX191c2VyICp1YnVmLAo+ICAJaWYgKElTX0VSUihz
b3VyY2UpKQo+ICAJCXJldHVybiBQVFJfRVJSKHNvdXJjZSk7Cj4gIAo+IC0JaWYgKHNvdXJjZVts
ZW5dID09ICdcbicpCj4gLQkJc291cmNlW2xlbl0gPSAnXDAnOwo+ICsJaWYgKHNvdXJjZVtsZW4t
MV0gPT0gJ1xuJykKPiArCQlzb3VyY2VbbGVuLTFdID0gJ1wwJzsKWW91IGRpZCBub3QgYWRkIHNw
YWNlcyBhcm91bmQgb3BlcmF0b3JzIGFzIHJlcXVlc3RlZC4KCldoaXRoIHRoZSBhYm92ZSB0aGlu
Z3MgZml4ZWQ6ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cgo+
ICAKPiAgCXJldCA9IGNydGMtPmZ1bmNzLT52ZXJpZnlfY3JjX3NvdXJjZShjcnRjLCBzb3VyY2Us
ICZ2YWx1ZXNfY250KTsKPiAgCWlmIChyZXQpCj4gLS0gCj4gMi4xNy4xCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
