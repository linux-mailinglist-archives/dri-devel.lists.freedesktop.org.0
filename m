Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5594675C4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 22:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760256E390;
	Fri, 12 Jul 2019 20:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72D46E391
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 20:15:50 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5BEF640002;
 Fri, 12 Jul 2019 20:15:44 +0000 (UTC)
Date: Fri, 12 Jul 2019 22:15:43 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190712201543.krhsfjepd3cqndla@flea>
References: <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
 <CA+E=qVdsYV2Bxk245=Myq=otd7-7WHzUnSJN8_1dciAzvSOG8g@mail.gmail.com>
 <20190709085532.cdqv7whuesrjs64c@flea>
 <CA+E=qVdz4vfU3rtTTKjYdM+4UA+=FWheJfWOMaDtFMnWQ1rHbw@mail.gmail.com>
 <20190710114042.ybgavnxb4hgqrtor@flea>
 <CA+E=qVdFoT137pADfxz3uMwhOqjqrA9+6hBeOfbJxuH-M-3Pjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+E=qVdFoT137pADfxz3uMwhOqjqrA9+6hBeOfbJxuH-M-3Pjw@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
 devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6MTE6MDRQTSAtMDcwMCwgVmFzaWx5IEtob3J1emhp
Y2sgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgNDo0MCBBTSBNYXhpbWUgUmlwYXJk
IDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4gPiA+IFRoZXJlJ3MgYW5v
dGhlciBpc3N1ZTogaWYgd2UgaW50cm9kdWNlIGVkcC1jb25uZWN0b3Igd2UnbGwgaGF2ZSB0bwo+
ID4gPiA+ID4gc3BlY2lmeSBwb3dlciB1cCBkZWxheXMgc29tZXdoZXJlIChpbiBkdHM/IG9yIGlu
IHBsYXRmb3JtIGRyaXZlcj8pLCBzbwo+ID4gPiA+ID4gZWRwLWNvbm5lY3RvciBkb2Vzbid0IHJl
YWxseSBzb2x2ZSB0aGUgaXNzdWUgb2YgbXVsdGlwbGUgcGFuZWxzIHdpdGgKPiA+ID4gPiA+IHNh
bWUgbW90aGVyYm9hcmQuCj4gPiA+ID4KPiA+ID4gPiBBbmQgdGhhdCdzIHdoYXQgdGhhdCBjb21w
YXRpYmxlIGlzIGFib3V0IDopCj4gPiA+Cj4gPiA+IFNvcnJ5LCBJIGZhaWwgdG8gc2VlIGhvdyBp
dCB3b3VsZCBiZSBkaWZmZXJlbnQgZnJvbSB1c2luZyBleGlzdGluZwo+ID4gPiBwYW5lbHMgaW5m
cmFzdHJ1Y3R1cmUgYW5kIGRpZmZlcmVudCBwYW5lbHMgY29tcGF0aWJsZXMuIEkgdGhpbmsgUm9i
J3MKPiA+ID4gaWRlYSB3YXMgdG8gaW50cm9kdWNlIGdlbmVyaWMgZWRwLWNvbm5lY3Rvci4KPiA+
Cj4gPiBBZ2FpbiwgdGhlcmUncyBubyBzdWNoIHRoaW5nIGFzIGEgZ2VuZXJpYyBlZHAtY29ubmVj
dG9yLiBUaGUgc3BlYwo+ID4gZG9lc24ndCBkZWZpbmUgYW55dGhpbmcgcmVsYXRlZCB0byB0aGUg
cG93ZXIgc2VxdWVuY2UgZm9yIGV4YW1wbGUuCj4gPgo+ID4gPiBJZiB3ZSBjYW4ndCBtYWtlIGl0
IGdlbmVyaWMgdGhlbiBsZXQncyB1c2UgcGFuZWwgaW5mcmFzdHJ1Y3R1cmUuCj4gPgo+ID4gV2hp
Y2ggdXNlcyBhIGRldmljZSBzcGVjaWZpYyBjb21wYXRpYmxlLiBSZWFsbHksIEknbSBub3Qgc3Vy
ZSB3aGF0Cj4gPiB5b3VyIG9iamVjdGlvbiBhbmQgLyBvciBhcmd1bWVudCBpcyBoZXJlLgo+ID4K
PiA+IEluIGFkZGl0aW9uLCB3aGVuIHRoYXQgd2FzIGJyb3VnaHQgdXAgaW4gdGhlIGRpc2N1c3Np
b24sIHlvdSByZWplY3RlZAo+ID4gaXQgYmVjYXVzZSBpdCB3YXMgaW5jb252ZW5pZW50Ogo+ID4g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI4MzAxMi8/c2VyaWVzPTU2
MTYzJnJldj0xI2NvbW1lbnRfNTM1MjA2Cj4KPiBJdCBpcyBpbmNvbnZlbmllbnQsIGJ1dCBJIGRv
bid0IHVuZGVyc3RhbmQgaG93IGhhdmluZyBib2FyZC1zcGVjaWZpYwo+IGNvbm5lY3RvcnMgZml4
ZXMgaXQuCgpIb3cgaXQgd291bGQgbm90IGZpeCBpdD8KCllvdSdsbCBoYXZlIG9uZSBjb25uZWN0
b3IsIHdpdGhvdXQgdGhlIG5lZWQgdG8gZGVzY3JpYmUgZWFjaCBhbmQgZXZlcnkKcGFuZWwgaW4g
dGhlIGRldmljZSB0cmVlIGFuZCByZWx5IG9uIHRoZSBFRElEIGluc3RlYWQsIGFuZCB5b3UnbGwg
aGF2ZQp0aGUgb3B0aW9uIHRvIHBvd2VyIHVwIHRoZSByZWd1bGF0b3IgeW91IG5lZWQuCgpJIHJl
YWxseSBkb24ndCB1bmRlcnN0YW5kIHdoYXQncyB0aGUgaXNzdWUgaGVyZSwgc28gbGV0J3MgdGFr
ZSBhIHN0ZXAKYmFjay4gV2hhdCBhcmUgaXMgdGhlIGlzc3VlICwgd2hhdCBhcmUgeW91ciByZXF1
aXJlbWVudHMsIGFuZCBob3cKd291bGQgeW91IGxpa2UgdGhhdCB0byBiZSBkZXNjcmliZWQgPwoK
TWF4aW1lCgotLQpNYXhpbWUgUmlwYXJkLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
