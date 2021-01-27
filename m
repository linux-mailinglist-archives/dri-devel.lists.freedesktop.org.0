Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD5F30657D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 21:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3039B6E882;
	Wed, 27 Jan 2021 20:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEC96E889;
 Wed, 27 Jan 2021 20:57:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23719012-1500050 for multiple; Wed, 27 Jan 2021 20:55:38 +0000
MIME-Version: 1.0
In-Reply-To: <1f5cc867-27a4-946c-8f53-916f677cafe9@infradead.org>
References: <20210128014419.55ea9ae4@canb.auug.org.au>
 <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
 <669b3538-9edb-cb32-6746-10615d0500b0@infradead.org>
 <1f5cc867-27a4-946c-8f53-916f677cafe9@infradead.org>
Subject: Re: [Intel-gfx] linux-next: Tree for Jan 27 (drm/i915)
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 27 Jan 2021 20:55:40 +0000
Message-ID: <161178094079.2943.18414218362462908962@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSYW5keSBEdW5sYXAgKDIwMjEtMDEtMjcgMjA6Mjg6MDUpCj4gT24gMS8yNy8yMSAx
MTozMCBBTSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+ID4gT24gMS8yNy8yMSAxMTowOCBBTSwgUmFu
ZHkgRHVubGFwIHdyb3RlOgo+ID4+IE9uIDEvMjcvMjEgNjo0NCBBTSwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiA+Pj4gSGkgYWxsLAo+ID4+Pgo+ID4+PiBOb3RlOiB0aGUgcGF0Y2ggZmlsZSBo
YXMgZmFpbGVkIHRvIHVwbG9hZCA6LSgKPiA+Pj4KPiA+Pj4gQ2hhbmdlcyBzaW5jZSAyMDIxMDEy
NToKPiA+Pj4KPiA+Pgo+ID4+IG9uIHg4Nl82NDoKPiA+Pgo+ID4+IC4uL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZ2VtLmM6IEluIGZ1bmN0aW9uIOKAmGk5MTVfZ2VtX2ZyZWV6ZV9sYXRl4oCZ
Ogo+ID4+IC4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmM6MTE4MjoyOiBlcnJvcjog
aW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYd2JpbnZkX29uX2FsbF9jcHVz4oCZ
OyBkaWQgeW91IG1lYW4g4oCYd3Jtc3Jfb25fY3B1c+KAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCj4gPj4gICB3YmludmRfb25fYWxsX2NwdXMoKTsKPiA+Pgo+ID4g
Cj4gPiBNeSBhcG9sb2dpZXM6IHRoaXMgd2FzIGluIEFuZHJldydzIG1tb3RtIDIwMjEtMDEtMjUu
Cj4gPiBTb3JyeSBhYm91dCB0aGF0Lgo+IAo+IAo+IGFuZCBub3cgSSBzZWUgdGhhdCBpdCBhbHNv
IGhhcHBlbnMgaW4gdG9kYXkncyBsaW51eC1uZXh0LgoKVGhlIGZpeCBpcyBpbiB0aGUgdHJlZSB0
aGF0IHNob3VsZCBiZSBmZWVkaW5nIGludG8gbGludXgtbmV4dCwgc28gSQp0cnVzdCBpdCB3aWxs
IHJlc29sdmUgaXRzZWxmIHNob3J0bHkuIEFsb25nIHdpdGggdGhlIFdFUlJPUiBkZXBlbmRzCnNu
YWZ1LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
