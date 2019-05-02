Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF111AD3
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 16:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600208928B;
	Thu,  2 May 2019 14:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACEF8928B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 14:07:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16429874-1500050 for multiple; Thu, 02 May 2019 15:07:22 +0100
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190502135603.20413-1-daniel.vetter@ffwll.ch>
References: <20190502072727.32159-1-daniel.vetter@ffwll.ch>
 <20190502135603.20413-1-daniel.vetter@ffwll.ch>
Message-ID: <155680604075.9023.3644212041279778396@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm: Some ocd in drm_file.c
Date: Thu, 02 May 2019 15:07:20 +0100
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA1LTAyIDE0OjU2OjAzKQo+IE1vdmUgdGhlIG9w
ZW4gaGVscGVyIGFyb3VuZCB0byBhdm9pZCB0aGUgZm9yd2FyZCBkZWNsLCBhbmQgZ2l2ZQo+IGRy
bV9zZXR1cCBhIGRybV9sZWdhY3lfIHByZWZpeCBzaW5jZSBpdCdzIGFsbCBsZWdhY3kgc3R1ZmYg
aW4gdGhlcmUuCj4gCj4gdjI6IE1vdmUgZHJtX2xlZ2FjeV9zZXR1cCBpbnRvIGRybV9sZWdhY3lf
bWlzYy5jIChDaHJpcykuIFRoZQo+IGNvdW50ZXJwYXJ0IGluIHRoZSBmb3JtIG9mIGRybV9sZWdh
Y3lfZGV2X3JlaW5pdCBpcyB0aGVyZSBhbHJlYWR5IHRvbywKPiBwbHVzIGl0IGZpdHMgcGVyZmVj
dGx5IGludG8gRGF2ZSdzIHdvcmsgb2YgbWFraW5nIERSSVZFUl9MRUdBQ1kgY29kZQo+IGNvbXBp
bGUtdGltZSBvcHRpb25hbC4KPiAKPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
