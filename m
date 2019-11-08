Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF8F4409
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 10:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77F96F8F7;
	Fri,  8 Nov 2019 09:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA636F8F4;
 Fri,  8 Nov 2019 09:56:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19125519-1500050 for multiple; Fri, 08 Nov 2019 09:55:58 +0000
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191108094142.25942-1-yamada.masahiro@socionext.com>
References: <20191108094142.25942-1-yamada.masahiro@socionext.com>
Message-ID: <157320695719.9461.4158455736119200291@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v2] drm/i915: make more headers self-contained
Date: Fri, 08 Nov 2019 09:55:57 +0000
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXNhaGlybyBZYW1hZGEgKDIwMTktMTEtMDggMDk6NDE6NDIpCj4gVGhlIGhlYWRl
cnMgaW4gdGhlIGdlbS9zZWxmdGVzdHMvLCBndC9zZWxmdGVzdHMsIGd2dC8sIHNlbGZ0ZXN0cy8K
PiBkaXJlY3RvcmllcyBoYXZlIG5ldmVyIGJlZW4gY29tcGlsZS10ZXN0ZWQsIGJ1dCBpdCB3b3Vs
ZCBiZSBwb3NzaWJsZQo+IHRvIG1ha2UgdGhlbSBzZWxmLWNvbnRhaW5lZC4KPiAKPiBUaGlzIGNv
bW1pdCBvbmx5IGFkZHJlc3NlcyBtaXNzaW5nIDxsaW51eC90eXBlcy5oPiBhbmQgZm9yd2FyZAo+
IHN0cnVjdCBkZWNsYXJhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRh
IDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KClRoYW5rcyBhIGxvdCBmb3IgZG9pbmcg
dGhpcywKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
