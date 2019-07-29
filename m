Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6C97A294
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8116E42E;
	Tue, 30 Jul 2019 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4061A89B0D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 14:23:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id E55C468AEF; Mon, 29 Jul 2019 16:22:58 +0200 (CEST)
Date: Mon, 29 Jul 2019 16:22:58 +0200
From: Torsten Duwe <duwe@lst.de>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 6a/7] dt-bindings: Add ANX6345 DP/eDP transmitter
 binding
Message-ID: <20190729142258.GB7946@lst.de>
References: <20190722150414.9F97668B20@verein.lst.de>
 <20190725151829.DC20968B02@verein.lst.de>
 <20190726163601.o32bxqew5xavjgyi@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726163601.o32bxqew5xavjgyi@flea>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDY6MzY6MDFQTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiA+ICsKPiA+ICsgIGR2ZGQxMi1zdXBwbHk6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4g
PiArICAgIGRlc2NyaXB0aW9uOiBSZWd1bGF0b3IgZm9yIDEuMlYgZGlnaXRhbCBjb3JlIHBvd2Vy
Lgo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxl
Cj4gPiArCj4gPiArICBkdmRkMjUtc3VwcGx5Ogo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKyAg
ICBkZXNjcmlwdGlvbjogUmVndWxhdG9yIGZvciAyLjVWIGRpZ2l0YWwgY29yZSBwb3dlci4KPiA+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+IAo+
IFRoZXJlJ3Mgbm8gbmVlZCB0byBzcGVjaWZ5IHRoZSB0eXBlIGhlcmUsIGFsbCB0aGUgcHJvcGVy
dGllcyBlbmRpbmcgaW4KPiAtc3VwcGx5IGFyZSBhbHJlYWR5IGNoZWNrZWQgZm9yIHRoYXQgdHlw
ZQoKT2ssIHRoYW5rcyBmb3IgdGhlIGhpbnQuCgo+ID4gKyAgcG9ydHM6Cj4gPiArICAgIHR5cGU6
IG9iamVjdAo+ID4gKyAgICBtaW5JdGVtczogMQo+ID4gKyAgICBtYXhJdGVtczogMgo+ID4gKyAg
ICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIFZpZGVvIHBvcnQgMCBmb3IgTFZUVEwgaW5wdXQs
Cj4gPiArICAgICAgVmlkZW8gcG9ydCAxIGZvciBlRFAgb3V0cHV0IChwYW5lbCBvciBjb25uZWN0
b3IpCj4gPiArICAgICAgdXNpbmcgdGhlIERUIGJpbmRpbmdzIGRlZmluZWQgaW4KPiA+ICsgICAg
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNl
cy50eHQKPiAKPiBZb3Ugc2hvdWxkIHByb2JhYmx5IGRlc2NyaWJlIHRoZSBwb3J0QDAgYW5kIHBv
cnRAMSBub2RlcyBoZXJlIGFzCj4gd2VsbC4gSXQgd291bGQgYWxsb3cgeW91IHRvIGV4cHJlc3Mg
dGhhdCB0aGUgcG9ydCAwIGlzIG1hbmRhdG9yeSBhbmQKPiB0aGUgcG9ydCAxIG9wdGlvbmFsLCB3
aGljaCBnb3QgZHJvcHBlZCBpbiB0aGUgY29udmVyc2lvbi4KCkkgd291bGQgaGF2ZSBsaWtlZCB0
bywgYnV0IGhhdmUgbm90IGRpc2NvdmVyZWQgeWV0IGEgY29tcHJlaGVuc2l2ZSBzb3VyY2UKb2Yg
aW5mb3JtYXRpb24gYWJvdXQgcmVjb21tZW5kZWQgc3ludGF4IGFuZCBzZW1hbnRpY3Mgb2YgdGhl
IFlBTUwgc2NoZW1lcy4KCklzIHRoZXJlIHNvbWUgY2VudHJhbCByZWZlcmVuY2UgZm9yIHRoZXNl
IHR5cGVzIG9mIGlzc3Vlcz8gSSBtZWFuIG5vdCB0aGUKImhlcmUgaXMgYSBnaXQgcmVwbyB3aXRo
IHRoZSBtZXRhLXNjaGVtZXMiIGJ1dCBzb3J0IG9mIGEgY29va2Jvb2s/CgoJVG9yc3RlbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
