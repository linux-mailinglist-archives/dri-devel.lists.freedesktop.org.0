Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471889267C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEFF6E140;
	Mon, 19 Aug 2019 14:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
 [195.159.176.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61CC6E140
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:20:03 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
 (envelope-from <sf-dri-devel@m.gmane.org>) id 1hziVt-00026g-V9
 for dri-devel@lists.freedesktop.org; Mon, 19 Aug 2019 16:20:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: dri-devel@lists.freedesktop.org
From: James <bjlockie@lockie.ca>
Subject: Re: nouveau: System crashes with NVIDIA GeForce 8600 GT
Date: Mon, 19 Aug 2019 09:55:20 -0400
Message-ID: <03ec19b7-0a54-39cc-5bb2-1b09bb8fccc6@lockie.ca>
References: <20190817125033.p3vdkq3xzz45aidz@alex-chromebook>
 <201908181727.04076.linux@zary.sk>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
In-Reply-To: <201908181727.04076.linux@zary.sk>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0xOCAxMToyNyBhLm0uLCBPbmRyZWogWmFyeSB3cm90ZToKPiBPbiBTYXR1cmRh
eSAxNyBBdWd1c3QgMjAxOSAxNDo1MDozMyBBbGV4IERld2FyIHdyb3RlOgo+PiBIaSBhbGwsCj4+
Cj4+IEknbSBnZXR0aW5nIGZyZXF1ZW50IHN5c3RlbSBjcmFzaGVzIChldmVyeSBmZXcgaG91cnMg
b3Igc28pIGFuZCBpdCBzZWVtcwo+PiB0aGF0IHRoZSBub3V2ZWF1IGRyaXZlciBpcyBjYXVzaW5n
IHRoZSBpc3N1ZSAoZG1lc2cgb3V0cHV0IGJlbG93KS4gSSBzZWUgaXQKPj4gd2l0aCBib3RoIHY1
LjIuOCBhbmQgdGhlIHY0LjE5IExUUyBrZXJuZWwuIFNvbWV0aW1lcyB0aGUgc3lzdGVtCj4+IGNv
bXBsZXRlbHkgZnJlZXplcyBhbmQgc29tZXRpbWVzIHNlZW1pbmdseSBqdXN0IHRoZSBub3V2ZWF1
IGRyaXZlciBnb2VzCj4+IGRvd24uIFRoZSBzY3JlZW4gZnJlZXplcyBhbmQgY29sb3VycyBzdHJl
YW0gYWNyb3NzIGl0LiBPZnRlbiBhZnRlciBJCj4+IHJlYm9vdCB0aGUgQklPUyBsb2dvIGlzIG1h
bmdsZWQgdG9vIHVudGlsIHRoZSBmaXJzdCBtb2Rlc2V0LiBUaGUgY3Jhc2gKPj4gc2VlbXMgdG8g
YmUgaGFwcGVuaW5nIGluIG52NTBfZmJfaW50cigpIGluIG52NTAuYy4KPj4KPj4gSSdtIG5vdCBz
dXJlIGlmIHRoaXMgaXMgcmVsYXRlZCwgYnV0IHRoZSBzeXN0ZW0gbm93IG9mdGVuIGZyZWV6ZXMg
b24KPj4gc3VzcGVuZCBvciByZXN1bWUgc2luY2UgSSBzd2l0Y2hlZCBmcm9tIHVzaW5nIHRoZSBv
bGQgKHJlY2VudGx5Cj4+IGFiYW5kb25lZCkgcHJvcHJpZXRyeSBOVklESUEgZHJpdmVycywgYWdh
aW4gYm90aCB3aXRoIDUuMiBhbmQgNC4xOQo+PiBrZXJuZWxzLiBCbGFja2xpc3RpbmcgdGhlIG5v
dXZlYXUgZHJpdmVyIGRvZXNuJ3Qgc2VlbSB0byBmaXggaXQgaG93ZXZlciwKPj4gdGhvdWdoIEkg
Z3Vlc3MgdGhlIGdyYXBoaWNzIGNhcmQgY291bGQgc3RpbGwgYmUgY2F1c2luZyBpc3N1ZXMgaW4g
c29tZQo+PiBvdGhlciB3YXk/IEkgbmV2ZXIgaGFkIHByb2JsZW1zIHdpdGggc3VzcGVuZCBhbmQg
cmVzdW1lIGJlZm9yZS4KPj4KPj4gQW55IHN1Z2dlc3Rpb25zIGFib3V0IGhvdyBJIGNvdWxkIGRl
YnVnIHRoaXMgZnVydGhlcj8KPiAKPiBJcyBpdCByZWFsbHkgYSBzb2Z0d2FyZSBwcm9ibGVtIChk
b2VzIGl0IHN0aWxsIHdvcmsgZmluZSB3aXRoIHByb3ByaWV0YXJ5Cj4gZHJpdmVyKT8KPiBUaGVz
ZSBuVmlkaWEgY2hpcHMgYXJlIGtub3duIHRvIGZhaWwgYW5kIGNvcnJ1cHQgQklPUyBsb2dvIHN1
Z2dlc3RzIHRoYXQuCj4gCgpJdCdzIGludGVyZXN0aW5nIHRoZSBwcm9wcmlldGFyeSBkcml2ZXIg
c3RpbGwgc2VlbXMgdG8gaGF2ZSBzdXBwb3J0IGZvciAKc2VyaWVzIDYgYW5kIHNlcmllcyA3IChq
dXN0IHNlcmllcyA4IGJlY2FtZSB1bnN1cHBvcnRlZCkuCgpJIHdvdWxkIHRyeSBhIGxpdmUgaXNv
IHdpdGggYSByZWNlbnQga2VybmVsLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
