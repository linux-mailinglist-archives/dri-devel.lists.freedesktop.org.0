Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E142B444
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CAB89D1D;
	Mon, 27 May 2019 12:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A1B6E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:14:26 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id E333268B02; Fri, 24 May 2019 14:13:59 +0200 (CEST)
Date: Fri, 24 May 2019 14:13:59 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190524121359.GE15685@lst.de>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065404.BB60F68B20@newverein.lst.de>
 <CA+E=qVdh-=C5zOYWYj95jLN51EaXFS6B+CQ101-f64q5QmgN3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+E=qVdh-=C5zOYWYj95jLN51EaXFS6B+CQ101-f64q5QmgN3g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDc6NDg6MDNBTSAtMDcwMCwgVmFzaWx5IEtob3J1emhp
Y2sgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTE6NTQgUE0gVG9yc3RlbiBEdXdl
IDxkdXdlQGxzdC5kZT4gd3JvdGU6Cj4gPgo+ID4KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKPiA+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKPiA+IEBAIC02NSw2ICs2
NSwyMSBAQAo+ID4gICAgICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgIH07Cj4gPgo+ID4gKyAg
ICAgICBwYW5lbDogcGFuZWwgewo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSJpbm5v
bHV4LG4xMTZiZ2UiLCAic2ltcGxlLXBhbmVsIjsKPiAKPiBJSVJDIFJvYiB3YW50ZWQgaXQgdG8g
YmUgZWRwLWNvbm5lY3Rvciwgbm90IHNpbXBsZS1wYW5lbC4gQWxzbyB5b3UKPiBuZWVkIHRvIGlu
dHJvZHVjZSBlZHAtY29ubmVjdG9yIGJpbmRpbmcuCgpUaGlzIGxpbmUgaXMgaWRlbnRpY2FsbHkg
Zm91bmQgaW4KYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZleXJvbi1jaHJvbWVib29rLmR0c2kg
YW5kCmFyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTMyLW5vcnJpbi5kdHMKCj4gPiAr
ICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gKyAgICAgICAgICAgICAgIHBvd2Vy
LXN1cHBseSA9IDwmcmVnX2RjZGMxPjsKPiA+ICsgICAgICAgICAgICAgICBiYWNrbGlnaHQgPSA8
JmJhY2tsaWdodD47Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgcG9ydHMgewo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcGFuZWxfaW46IHBvcnQgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmFueDYzNDVfb3V0
PjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIH07Cj4gPiArICAgICAgICAgICAgICAgfTsKClRoZSB3aG9sZSBub2RlIGlz
IHRoZSBzYW1lIGFzIGluIHJrMzI4OC12ZXlyb24tY2hyb21lYm9vay5kdHNpOyBJIG9ubHkgYWRh
cHRlZAp0aGUgcG93ZXItc3VwcGx5IGFuZCByZW1vdGUtZW5kcG9pbnQgcHJvcGVydGllcy4KCklz
IHRoZXJlIGFueXRoaW5nIHdyb25nIHdpdGggdGhhdD8KCglUb3JzdGVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
