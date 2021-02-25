Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD43258C4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 22:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEFB6E423;
	Thu, 25 Feb 2021 21:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826D76E423
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 21:37:34 +0000 (UTC)
Received: (qmail 16533 invoked by uid 1000); 25 Feb 2021 21:37:29 -0000
Message-ID: <20210225213729.16532.qmail@stuge.se>
Date: Thu, 25 Feb 2021 21:37:29 +0000
From: Peter Stuge <peter@stuge.se>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210225095825.6196.qmail@stuge.se>
 <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
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

Tm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4gSSBmb3Jnb3QsIGJ1dCBJIGhhdmUgYSB0d28tdG9u
ZSAoYmxhY2svcmVkKSBlLWluayBkaXNwbGF5IGhlcmUsIGFuZCBJCj4gPiBhbHNvIGhhdmUgYSAz
LWJwcCBSR0IgVEZUIGRpc3BsYXkuCj4gCj4gSSd2ZSBiZWVuIGFudGljaXBhdGluZyB0aGUgbmVl
ZCBmb3IgbW9yZSBmb3JtYXRzLCBidXQgSSBkaWRuJ3Qgd2FudCB0bwo+IGFkZCB0aGVtIHdpdGhv
dXQgaGF2aW5nIGEgdXNlci4gT3RoZXJ3aXNlIEkgY291bGQgZW5kIHVwIGFkZGluZyBzdHVmZgo+
IHRoYXQgd291bGQgbmV2ZXIgYmUgdXNlZC4gSWYgeW91IGNhbiB0ZXN0LCB0aGVyZSdzIG5vIHBy
b2JsZW0gYWRkaW5nCj4gc3VwcG9ydCBmb3IgbW9yZSBmb3JtYXRzIG5vdy4KClRoYXQncyBncmVh
dCEgSSBjYW4ndCBwcm9taXNlIHRvIHRvIHRlc3QgdGhlIHRocmVlLWNvbG9yIChiL3cvcikgZS1p
bmsKYnV0IEknbGwgcHJlcGFyZSBhIHRlc3Qgc2V0dXAgZm9yIHRoZSBSR0ItVEZUIG9uIHRoZSB3
ZWVrZW5kLgoKCj4gQnVpbGRpbmcgb24gdGhhdCBJIHdvdWxkIGRlZmluZSBhIDIgYnBwIFJHIGZv
cm1hdCBsaWtlIHRoaXMgaW4gdGhlIGRyaXZlcjoKPiAKPiBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9mb3JtYXRfaW5mbyBndWRfZHJtX2Zvcm1hdF9yZzExID0gewo+IAkuZm9ybWF0ID0gR1VEX0RS
TV9GT1JNQVRfUkcxMSwKPiAJLm51bV9wbGFuZXMgPSAxLAo+IAkuY2hhcl9wZXJfYmxvY2sgPSB7
IDEsIDAsIDAgfSwKPiAJLmJsb2NrX3cgPSB7IDQsIDAsIDAgfSwgLyogNCBwaXhlbHMgcGVyIGJs
b2NrL2J5dGUgKi8KPiAJLmJsb2NrX2ggPSB7IDEsIDAsIDAgfSwKPiAJLmhzdWIgPSAxLAo+IAku
dnN1YiA9IDEsCj4gfTsKPiAKPiBBbmQgYSAzIGJwcCBSR0IgZm9ybWF0IGxpa2UgdGhpczoKPiAK
PiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyBndWRfZHJtX2Zvcm1hdF9yZ2Ix
MTEgPSB7Cj4gCS5mb3JtYXQgPSBHVURfRFJNX0ZPUk1BVF9SR0IxMTEsCj4gCS5udW1fcGxhbmVz
ID0gMSwKPiAJLmNoYXJfcGVyX2Jsb2NrID0geyAxLCAwLCAwIH0sCj4gCS5ibG9ja193ID0geyAy
LCAwLCAwIH0sIC8qIDIgcGl4ZWxzIHBlciBibG9jay9ieXRlICovCj4gCS5ibG9ja19oID0geyAx
LCAwLCAwIH0sCj4gCS5oc3ViID0gMSwKPiAJLnZzdWIgPSAxLAo+IH07CgpJIGNhbid0IHJlYWxs
eSBjb21tZW50OyBJIGtub3cgbmV4dCB0byBub3RoaW5nIGFib3V0IHRoZSBkcm0gc3Vic3lzdGVt
LiA6KQoKCj4gVGhlIE1JUEkgREJJIHN0YW5kYXJkIGRlZmluZXMgMiB3YXlzIHRvIHRyYW5zbWl0
IDJ4IDMtYnBwIHBpeGVscyBpbiBvbmUKPiBieXRlIChYPXBhZCBiaXQpOgo+IC0gT3B0aW9uIDE6
IFggIFggIFIxIEcxIEIxIFIyIEcyIEIyCj4gLSBPcHRpb24gMjogWCAgUjEgRzEgQjEgWCAgUjIg
RzIgQjIKPiAKPiBTbyBtYXliZSB3ZSBzaG91bGQgaGF2ZSBHVURfRFJNX0ZPUk1BVF9SR0IxMTFf
T1BUSU9OMSBhbmQKPiBHVURfRFJNX0ZPUk1BVF9SR0IxMTFfT1BUSU9OMj8KPiBPciBqdXN0IHVz
ZSBvcHRpb24gMiBhbmQgbGV0IHRoZSBkaXNwbGF5IGZpeCBpdCB1cCBpZiBuZWVkZWQ/CgpJdCB3
b3VsZCBvZiBjb3Vyc2UgYmUgbG92ZWx5IHRvIGJlIGFibGUgdG8gc2V0IHVwIGFuIGF1dG9tYXRl
ZCBETUEgZnJvbQphIFVTQiBlbmRwb2ludCB0byB0aGUgcGFuZWwgaW4gdGhlIGRldmljZSBhbmQg
bm90IGhhdmUgdG8gdG91Y2ggdGhlIGRhdGEsCmJ1dCB0aGF0IHdvdWxkIHJlcXVpcmUgdGhlIERS
TSBkcml2ZXIgdG8gc3VwcG9ydCBhbGwgdGhlIGNvbWJpbmF0aW9ucywKd2hpY2ggcXVpY2tseSBi
ZWNvbWVzIGNvbXBsaWNhdGVkLgoKCj4gV2hhdCBmb3JtYXQgZG9lcyB5b3VyIDMgYnBwIGRpc3Bs
YXkgdXNlPwoKSXQgc3VwcG9ydHMgdGhyZWUgZm9ybWF0czoKCi0gUjEgRzEgQjEgUjIgRzIgQjIK
LSBSMSBHMSBCMSBYIFIyIEcyIEIyIFggKHlvdXIgb3B0aW9uIDIpCi0gUjEgUjIgUjMgKHNpbXVs
YXRlZCBtb25vY2hyb21lLCBzYW1lIGRhdGEgYml0IHRvIGFsbCB0aHJlZSBzdWJwaXhlbHMpCgoK
PiBBbmQgdGhlbiBzb21ldGhpbmcgbGlrZSB0aGlzIGZvciB0aGUgY29udmVyc2lvbiBmdW5jdGlv
bjoKPiAKPiBzdGF0aWMgc2l6ZV90IGd1ZF94cmdiODg4OF90b19jb2xvcih1OCAqZHN0LCBjb25z
dCBzdHJ1Y3QKCkFsbCByaWdodCEKCgovL1BldGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
