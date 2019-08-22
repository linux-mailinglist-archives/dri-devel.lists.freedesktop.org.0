Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A94993FC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 14:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215D16E40A;
	Thu, 22 Aug 2019 12:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F9B6E40A;
 Thu, 22 Aug 2019 12:40:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 05:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="186555689"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2019 05:40:16 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 05:40:16 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.181]) by
 FMSMSX112.amr.corp.intel.com ([169.254.5.162]) with mapi id 14.03.0439.000;
 Thu, 22 Aug 2019 05:40:16 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Merge in the drm-intel tree
Thread-Topic: Merge in the drm-intel tree
Thread-Index: AQHVWNNCO/g8AZ8toEOAfPWv7gRsnqcHkTCA
Date: Thu, 22 Aug 2019 12:40:16 +0000
Message-ID: <F703D5D3-8CBF-4D43-9176-F987EEC41FD3@intel.com>
References: <20190822202020.5c1f83e0@canb.auug.org.au>
In-Reply-To: <20190822202020.5c1f83e0@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.251.157.42]
Content-ID: <284843DF9F1C684193431855C818378A@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3V0Y2gsIGl0IHJlYXBhcmVkIG9uIHRoZSBiYWNrbWVyZ2UgSSBkaWQgeWVzdGVyZGF5IGFuZCBJ
IGRpZG4ndCBub3RpY2VkLiBTb3JyeQoKQ2hyaXMgaGFzIGZpeGVkIHRoaXMgbm93LgoKVGhhbmsg
eW91IGJvdGguCgo+IE9uIEF1ZyAyMiwgMjAxOSwgYXQgMzoyMCBBTSwgU3RlcGhlbiBSb3Rod2Vs
bCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+IAo+IEhpIGFsbCwKPiAKPiBJIG5vdGlj
ZWQgdGhhdCB0aGUgZHJtIHRyZWUgaGFzIGJlZW4gYmFjayBtZXJnZSBpbnRvIHRoZSBkcm0taW50
ZWwKPiB0cmVlLiAgVW5mb3J0dW5hdGVseSwgaXQgc2VlbXMgdGhhdCB0aGUgZmlsZQo+IGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2JhdGNoX3Bvb2wuYyBoYXMgYmVlbiByZXN1cnJlY3Rl
ZC4KPiAKPiBJdCB3YXMgcmVtb3ZlZCBpbiBjb21taXQKPiAKPiAgYjQwZDczNzg0ZmZjICgiZHJt
L2k5MTU6IFJlcGxhY2Ugc3RydWN0X211dGV4IGZvciBiYXRjaCBwb29sIHNlcmlhbGlzYXRpb24i
KQo+IAo+IGJ1dCBoYXMgY29tZSBiYWNrIGR1ZSB0byBhIGNvbmZsaWN0IHdpdGggY29tbWl0Cj4g
Cj4gIDUyNzkxZWVlYzFkOSAoImRtYS1idWY6IHJlbmFtZSByZXNlcnZhdGlvbl9vYmplY3QgdG8g
ZG1hX3Jlc3YiKQo+IAo+IGZyb20gdGhlIGRybSB0cmVlLgo+IC0tIAo+IENoZWVycywKPiBTdGVw
aGVuIFJvdGh3ZWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
