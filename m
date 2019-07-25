Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA8B75250
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 17:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965CA6E76B;
	Thu, 25 Jul 2019 15:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04E226E76B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:15:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99079344;
 Thu, 25 Jul 2019 08:15:18 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C78E3F71A;
 Thu, 25 Jul 2019 08:15:17 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: fast models: Increase clcd's
 max-memory-bandwidth
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20190725145040.42182-1-kevin.brodsky@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
Date: Thu, 25 Jul 2019 16:15:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725145040.42182-1-kevin.brodsky@arm.com>
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2V2aW4sCgpPbiAyNS8wNy8yMDE5IDE1OjUwLCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+IEl0
IG1heSBiZSBkZXNpcmFibGUgb24gY2VydGFpbiBwbGF0Zm9ybXMsIHN1Y2ggYXMgQW5kcm9pZCwg
dG8KPiB1c2UgMzJicHAgYnVmZmVycy4gU2luY2UgdGhlcmUgaXMgbm8gY2xlYXIgYmFuZHdpZHRo
IGxpbWl0IGZvciB0aGUKPiBDTENEIGNvbXBvbmVudCBvbiB0aGUgZmFzdCBtb2RlbCwgbGV0J3Mg
aW5jcmVhc2UKPiBtYXgtbWVtb3J5LWJhbmR3aWR0aCB0byBhbGxvdyB1c2luZyAzMmJwcCBidWZm
ZXJzLgoKR2l2ZW4gdGhhdCB0aGUgcHJvcGVydHkgaXMgb3B0aW9uYWwgYW55d2F5LCB3b3VsZCBp
dCBodXJ0IHRvIGp1c3QgcmVtb3ZlIAppdD8gQWZ0ZXIgdHJ5aW5nIHRvIGRpZyB1cCBhbnkgcmVs
ZXZhbnQgaW50ZXJuYWwgZW1haWwgaGlzdG9yeSwgaXQncyAKc3RpbGwgZmFyIGZyb20gY2xlYXIg
aG93IGFuZCB3aHkgaXQgZ290IGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKUm9iaW4uCgo+IFJl
cG9ydGVkLWJ5OiBSdWJlbiBBeXJhcGV0eWFuIDxydWJlbi5heXJhcGV0eWFuQGFybS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogS2V2aW4gQnJvZHNreSA8a2V2aW4uYnJvZHNreUBhcm0uY29tPgo+IC0t
LQo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hcm0vZnZwLWJhc2UtcmV2Yy5kdHMgfCAyICstCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hcm0vZnZwLWJhc2UtcmV2Yy5kdHMgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFzZS1yZXZjLmR0cwo+IGluZGV4IDY4NzcwNzAyMGVj
MS4uM2FlZTQ5ZWQ2ZDg4IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYXJtL2Z2
cC1iYXNlLXJldmMuZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hcm0vZnZwLWJhc2Ut
cmV2Yy5kdHMKPiBAQCAtMjY5LDcgKzI2OSw3IEBACj4gICAJCW1vdGhlcmJvYXJkIHsKPiAgIAkJ
CWlvZnBnYUAzLDAwMDAwMDAwIHsKPiAgIAkJCQljbGNkQDFmMDAwMCB7Cj4gLQkJCQkJbWF4LW1l
bW9yeS1iYW5kd2lkdGggPSA8MTMwMDAwMDAwPjsgLyogMTZicHAgQCA2My41TUh6ICovCj4gKwkJ
CQkJbWF4LW1lbW9yeS1iYW5kd2lkdGggPSA8MjYwMDAwMDAwPjsgLyogMzJicHAgQCA2My41TUh6
ICovCj4gICAJCQkJfTsKPiAgIAkJCX07Cj4gICAJCX07Cj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
