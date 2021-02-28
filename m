Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF41327002
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 02:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26CA6E1CF;
	Sun, 28 Feb 2021 01:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2952C6E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 01:52:14 +0000 (UTC)
Received: (qmail 3253 invoked by uid 1000); 28 Feb 2021 01:52:09 -0000
Message-ID: <20210228015209.3252.qmail@stuge.se>
Date: Sun, 28 Feb 2021 01:52:09 +0000
From: Peter Stuge <peter@stuge.se>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210219214243.11330.qmail@stuge.se>
 <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
 <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IFBldGVyLCBwbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhp
cyBkaWZmIGFuZCBzZWUgaWYgSSdtIG9uIHRoZSByaWdodCB0cmFjawo+IGhlcmU6IGh0dHBzOi8v
Z2lzdC5naXRodWIuY29tL25vdHJvL2E0M2E5M2EzYWEwY2M3NWQ5MzA4OTBiN2IyNTRmYzBhCgpZ
ZXMgdGhhdCdzIGV4YWN0bHkgd2hhdCBJIG1lYW50OyB0aGlzIHdheSB0aGUgcG9zc2liaWxpdHkg
Zm9yIGNvbnRyYWRpY3RpbmcKc2l6ZXMgaXMgZWxpbWluYXRlZCBieSBwcm90b2NvbCBhbmQgbm90
IGp1c3QgYnkgaW1wbGVtZW50YXRpb24gLSB2ZXJ5IG5pY2UhCgpTb21lIG1vcmUgY29tbWVudHMs
IHNvcnJ5IGlmIHRoaXMgaXMganVzdCBiZWNhdXNlIG9mIG9uZ29pbmcgd29yazoKClBlcmhhcHMg
dGhlIGZ1bmN0aW9ucyB0YWtpbmcgdXNiX2RldmljZSArIGlmbnVtIGNvdWxkIHRha2UgdXNiX2lu
dGVyZmFjZQppbnN0ZWFkIC0gYnV0IEkgZG9uJ3Qga25vdyBpZiB0aGF0IHdvdWxkIHNpbXBsaWZ5
IG9yIGNvbXBsaWNhdGUgdGhpbmdzLgpBbGFuIG1lbnRpb25lZCB0aGlzIGlkZWEgaW4gc2ltaWxh
ciBjaXJjdW1zdGFuY2VzIGluIGFub3RoZXIgdGhyZWFkLgpJIGRvbid0IGZlZWwgc3Ryb25nbHks
IGJ1dCBwZXJoYXBzIGl0J3MgY2xlYW5lci4KCmd1ZF91c2JfY29udHJvbF9tc2coKSBub3cgc2Vl
bXMgYWxtb3N0IHJlZHVuZGFudCwgbWF5YmUgaXQgY291bGQgYmUgcmVtb3ZlZC4KCkluIGd1ZF91
c2Jfc2V0KCkgaWYgTlVMTCA9PSBidWYgdGhlbiB0aGF0J3MgcGFzc2VkIHRvIHVzYl9jb250cm9s
X21zZygpCmFsb25nIHdpdGggbGVuLCB3aGljaCBsaWtlbHkgY3Jhc2hlcyBpZiBsZW4gPiAwLCBz
byBpdCBtYXkgYmUgZ29vZCB0bwpjaGVjayBvciBlbmZvcmNlIHRoYXQsIG1heWJlIHdpdGggZWxz
ZSBsZW49MDsgYmVmb3JlIHRoZSBndWRfdXNiX3RyYW5zZmVyKCkKY2FsbC4KCkZpbmFsbHkgYSBz
bWFsbCBzdHlsZSBub3RlIHRoYXQgSSdkIHBlcnNvbmFsbHkgY2hhbmdlIGEgZmV3IGlmIChyZXQg
PiAwKSB7CmJsb2NrcyB0byBoYXZlIG9uZSBpbmRlbnQgbGV2ZWwgbGVzcyBhbmQgZG8gZWFjaCBj
aGVjayByaWdodCBhd2F5LCBlLmcuIGluCmd1ZF9jb25uZWN0b3JfZ2V0X21vZGVzKCk6CgpyZXQg
PSBndWRfdXNiX2dldCgpCmlmIChyZXQgJSBFRElEX0xFTkdUSCkgewoJZHJtX2VycigpOwp9IGVs
c2UgaWYgKHJldCA+IDApIHsKCWVkaWRfY3R4LmxlbiA9IHJldDsKCWVkaWQgPSBkcm1fZG9fZ2V0
X2VkaWQoKTsKfQoKYW5kIGxhdGVyIG9uIGluIHRoZSBmdW5jdGlvbiBieSB0aGUgZGlzcGxheSBt
b2RlcyBvbmUgaW5kZW50IGxldmVsCmNvdWxkIGJlIHNhdmVkIHdpdGggYSBnb3RvOgoKaWYgKHJl
dCA8PSAwKQoJZ290byBvdXQ7CgpidXQgb2J2aW91c2x5IG5vIGh1Z2UgZGVhbC4KCgpJbiBnZW5l
cmFsIGl0J3MgcmVhbGx5IGhlbHBmdWwgZm9yIGRldmljZSBkZXZlbG9wbWVudCB0byBzZWUgZXJy
b3IgbWVzc2FnZXMKd2hlbiB0aGUgZGV2aWNlIGJlaGF2ZXMgaW5jb3JyZWN0bHksIHRoZSAiSW52
YWxpZCAuLiBzaXplIiBlcnJvcnMgYXJlIGdyZWF0CmV4YW1wbGVzIG9mIHRoaXMsIGJ1dCBlLmcu
IGd1ZF9nZXRfZGlzcGxheV9kZXNjcmlwdG9yKCkgcmV0dXJucyAtRUlPIHdpdGhvdXQKYSBtZXNz
YWdlLiBNYXliZSB0aGVyZSBhcmUgb3Bwb3J0dW5pdGllcyBmb3IgZnVydGhlciBoZWxwZnVsIGVy
cm9yIG1lc3NhZ2VzPwoKClRoYW5rcyBhIGxvdCBhbmQga2luZCByZWdhcmRzCgovL1BldGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
