Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C331D7639
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 13:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84E56E057;
	Mon, 18 May 2020 11:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C65816E057
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:10:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A28A106F;
 Mon, 18 May 2020 04:10:45 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068903F52E;
 Mon, 18 May 2020 04:10:45 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id AEA59682B74; Mon, 18 May 2020 12:10:43 +0100 (BST)
Date: Mon, 18 May 2020 12:10:43 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/3] drm/arm: Kconfig annotate drivers as COMPILE_TEST
Message-ID: <20200518111043.GR159988@e110455-lin.cambridge.arm.com>
References: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Mali DP Maintainers <malidp@foss.arm.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMTcsIDIwMjAgYXQgMDg6MzY6NTNQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEFkZCB0aGUgQ09NUElMRV9URVNUIGNvbmRpdGlvbmFsLCBzbyB0aGF0IHBlb3BsZSBj
YW4gYXQgbGVhc3QgYnVpbGQgdGVzdAo+IHRoZSBkcml2ZXJzLgo+IAo+IENjOiBMaXZpdSBEdWRh
dSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVk
YXVAYXJtLmNvbT4KCj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4K
PiBDYzogTWFsaSBEUCBNYWludGFpbmVycyA8bWFsaWRwQGZvc3MuYXJtLmNvbT4KPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtv
diA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+IC0tLQo+IFBsZWFzZSBtZXJnZSB0aHJvdWdo
IHRoZSBBUk0gdHJlZS4KCldlJ3JlIG5vdCB1c2luZyB0aGUgQVJNIHRyZWUgYW55bW9yZSwgd2Ug
cHVzaCBwYXRjaGVzIHRocm91Z2ggZHJtLW1pc2MuCgpJJ20gaGFwcHkgaWYgeW91IHdhbnQgdG8g
cHVzaCB0aGUgd2hvbGUgc2VyaWVzIG9yIEkgY2FuIGRvIHRoZSAyIHBhdGNoZXMKdGhhdCBJJ3Zl
IGJlZW4gQ2MtZWQgb24uCgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IAo+IEFzaWRlOiB3b3VsZCBt
YWtlIHNlbnNlIHRvIGhhdmUgdGhlIHRyZWUgZHJpdmVycyBpbiBzZXBhcmF0ZSBmb2xkZXJzCj4g
YWxvbmdzaWRlIGVhY2ggb3RoZXIuCj4gCj4gV2l0aCBsaW1hIGFuZCBwYW5mcm9zdCBpbi10cmVl
LCB0aGVyZSdzIGxpdHRsZSBwb2ludCBpbiB0aGUgZXh0cmEKPiAiZGlzcGxheSIgZm9yIGtvbWVk
YS4gTWlnaHQgYXMgd2VsbCByZW1vdmUgdGhhdCBvbmUuCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hcm0vS2NvbmZpZyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL0tj
b25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL0tjb25maWcKPiBpbmRleCBhMjA0MTAzYjNlZmIu
LjNhOWU5NjZlMGU3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL0tjb25maWcK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL0tjb25maWcKPiBAQCAtMyw3ICszLDcgQEAgbWVu
dSAiQVJNIGRldmljZXMiCj4gIAo+ICBjb25maWcgRFJNX0hETENECj4gIAl0cmlzdGF0ZSAiQVJN
IEhETENEIgo+IC0JZGVwZW5kcyBvbiBEUk0gJiYgT0YgJiYgKEFSTSB8fCBBUk02NCkKPiArCWRl
cGVuZHMgb24gRFJNICYmIE9GICYmIChBUk0gfHwgQVJNNjQgfHwgQ09NUElMRV9URVNUKQo+ICAJ
ZGVwZW5kcyBvbiBDT01NT05fQ0xLCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgCXNlbGVj
dCBEUk1fS01TX0NNQV9IRUxQRVIKPiBAQCAtMjQsNyArMjQsNyBAQCBjb25maWcgRFJNX0hETENE
X1NIT1dfVU5ERVJSVU4KPiAgCj4gIGNvbmZpZyBEUk1fTUFMSV9ESVNQTEFZCj4gIAl0cmlzdGF0
ZSAiQVJNIE1hbGkgRGlzcGxheSBQcm9jZXNzb3IiCj4gLQlkZXBlbmRzIG9uIERSTSAmJiBPRiAm
JiAoQVJNIHx8IEFSTTY0KQo+ICsJZGVwZW5kcyBvbiBEUk0gJiYgT0YgJiYgKEFSTSB8fCBBUk02
NCB8fCBDT01QSUxFX1RFU1QpCj4gIAlkZXBlbmRzIG9uIENPTU1PTl9DTEsKPiAgCXNlbGVjdCBE
Uk1fS01TX0hFTFBFUgo+ICAJc2VsZWN0IERSTV9LTVNfQ01BX0hFTFBFUgo+IC0tIAo+IDIuMjUu
MQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhl
IHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291
cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
