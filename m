Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC773A5A6
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4938289307;
	Sun,  9 Jun 2019 12:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB4489B9F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 09:40:59 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 931BF68C65; Fri,  7 Jun 2019 11:40:30 +0200 (CEST)
Date: Fri, 7 Jun 2019 11:40:30 +0200
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345
 bridge on Teres-I
Message-ID: <20190607094030.GA12373@lst.de>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
 <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
 <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
 <20190607062802.m5wslx3imiqooq5a@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607062802.m5wslx3imiqooq5a@flea>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDg6Mjg6MDJBTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBPbiBUaHUsIEp1biAwNiwgMjAxOSBhdCAwMzo1OToyN1BNICswMjAwLCBIYXJhbGQg
R2V5ZXIgd3JvdGU6Cj4gPgo+ID4gSWYgdGhpbmsgdmFsaWQgY29tcGF0aWJsZSBwcm9wZXJ0aWVz
IHdvdWxkIGJlOgo+ID4gY29tcGF0aWJsZSA9ICJpbm5vbHV4LG4xMTZiZ2UiLCAic2ltcGxlLXBh
bmVsIjsKPiA+IGNvbXBhdGlibGUgPSAiZWRwLWNvbm5lY3RvciIsICJzaW1wbGUtcGFuZWwiOwo+
IAo+IEEgY29ubmVjdG9yIGlzbid0IGEgcGFuZWwuCj4gCj4gPiBjb21wYXRpYmxlID0gImlubm9s
dXgsbjExNmJnZSIsICJlZHAtY29ubmVjdG9yIiwgInNpbXBsZS1wYW5lbCI7Cj4gCj4gQW5kIHRo
ZSBpbm5vbHV4LG4xMTZiZ2UgaXMgY2VydGFpbmx5IG5vdCBhIGNvbm5lY3RvciBlaXRoZXIuCj4g
Cj4gPiBjb21wYXRpYmxlID0gImVkcC1jb25uZWN0b3IiLCAiaW5ub2x1eCxuMTE2YmdlIiwgInNp
bXBsZS1wYW5lbCI7Cj4gPgo+ID4gSSBjYW4ndCBtYWtlIHVwIG15IG1pbmQgd2hpY2ggb25lIEkg
cHJlZmVyZS4gSG93ZXZlciBuZWl0aGVyIG9mIHRoZXNlCj4gPiB2YXJpYW50cyByZXF1aXJlcyBh
Y3R1YWxseSBpbXBsbWVudGluZyBhbiBlZHAtY29ubmVjdG9yIGRyaXZlci4KPiAKPiBOby1vbmUg
YXNrZWQgdG8gZG8gYW4gZWRwLWNvbm5lY3RvciBkcml2ZXIuIFlvdSBzaG91bGQgdXNlIGl0IGlu
IHlvdXIKPiBEVCwgYnV0IGlmIHlvdSB3YW50IHRvIGhhdmUgc29tZSBjb2RlIGluIHlvdXIgZHJp
dmVyIHRoYXQgcGFyc2VzIHRoZQo+IERUIGRpcmVjdGx5LCBJJ20gdG90YWxseSBmaW5lIHdpdGgg
dGhhdC4KCkkgbXVzdCBhZG1pdCBJIGZhaWwgdG8gdW5kZXJzdGFuZCB3aGF0IHRoYXQgZXh0cmEg
bm9kZSB3b3VsZCBiZSBnb29kIGZvci4KTG9naWNhbGx5LCB0aGUgZURQIGZhciBzaWRlIGlzIGNv
bm5lY3RlZCB0byB0aGUgd2VsbC1rbm93biBuMTE2YmdlLgpJbnNpZGUgdGhlIGxhcHRvcCBjYXNl
IGl0IG1pZ2h0IGFzIHdlbGwgYmUgYSBmbGF0IHJpYmJvbiBjYWJsZSBvcgpzb2xkZXJlZCBkaXJl
Y3RseS4KSW4gZ29vZCBpbnRlbnRpb24sIHRoYXQncyBhbGwgSSB3YW50ZWQgdG8gZXhwcmVzcyBp
biB0aGUgRFQuIEkgZG9uJ3QKa25vdyB3aGV0aGVyIHRoZSByZWxldmFudCBtZWNoYW5pY2FsIGRp
bWVuc2lvbnMgb2YgdGhlIHBhbmVsIGFuZCB0aGUKY29ubmVjdG9yIGFyZSBzdGFuZGFyZGlzZWQs
IHNvIHdoZXRoZXIgb25lIGNvdWxkIGluIHRoZW9yeSBhc3NlbWJsZSBpdAp3aXRoIGEgZGlmZmVy
ZW50IHBhbmVsIHRoYW4gdGhlIG9uZSBpdCBjYW1lIHdpdGguCgpPVE9ILCBhcyBJIGNoZWNrZWQg
ZHVyaW5nIHRoZSBkaXNjdXNzaW9uIHdpdGggYW5hcnNvdWwsIHRoZSBwYW5lbCdzCnN1cHBseSB2
b2x0YWdlIGlzIHBlcm1hbmVudGx5IGNvbm5lY3RlZCB0byB0aGUgbWFpbiAzLjNWIHJhaWwuCldl
IGFscmVhZHkgYWdyZWVkIHRoYXQgdGhlIGVEUCBvdXRwdXQgcG9ydCBtdXN0IG5vdCBuZWNjZXNz
YXJpbHkgYmUKc3BlY2lmaWVkLCB0aGlzIHNldHVwIGlzIGEgZ29vZCBleGFtcGxlIHdoeTogYmVj
YXVzZSB0aGUgcGFuZWwgaXMKYWx3YXlzIHBvd2VyZWQsIHRoZSBhbng2MzQ1IGNhbiBhbHdheXMg
cHVsbCB2YWxpZCBFRElEIGRhdGEgZnJvbSBpdApzbyBhdCB0aGlzIHN0YWdlIHRoZXJlJ3Mgbm8g
bmVlZCBmb3IgYW55IE9TIGRyaXZlciB0byByZWFjaCBiZXlvbmQKdGhlIGJyaWRnZS4gSUlSQyBl
dmVuIHRoZSBiYWNrbGlnaHQgZ290IHN3aXRjaGVkIG9mZiBmb3IgdGhlIGJsYW5rCnNjcmVlbiB3
aXRob3V0LgoKQWxsIEkgd2FudGVkIHRvIHNheSBpcyB0aGF0ICJ0aGVyZSdzIHVzdWFsbHkgYW4g
bjExNmJnZSBiZWhpbmQgaXQiOwpidXQgdGhpcyBpcyBtb3N0bHkgcmVkdW5kYW50LgoKU28sIHNo
YWxsIHdlIGp1c3QgZHJvcCB0aGUgb3V0cHV0IHBvcnQgc3BlY2lmaWNhdGlvbiAoYWxvbmcgd2l0
aCB0aGUKcGFuZWwgbm9kZSkgaW4gb3JkZXIgdG8gZ2V0IG9uZSBzdGVwIGZ1cnRoZXI/Cgo+IEkg
Z3Vlc3MgeW91IHNob3VsZCBkZXNjcmliZSB3aHkgZG8geW91IHRoaW5rIGl0J3MgImNsZWFyIiwg
YmVjYXVzZSBJJ20KPiBub3Qgc3VyZSB0aGlzIGlzIG9idmlvdXMgZm9yIGV2ZXJ5b25lIGhlcmUu
IGVEUCBhbGxvd3MgdG8gZGlzY292ZXIKPiB3aGljaCBkZXZpY2UgaXMgb24gdGhlIG90aGVyIHNp
ZGUgYW5kIGl0cyBzdXBwb3J0ZWQgdGltaW5ncywganVzdCBsaWtlCj4gSERNSSBmb3IgZXhhbXBs
ZSAob3IgcmVndWxhciBEUCwgZm9yIHRoYXQgbWF0dGVyKS4gV291bGQgeW91IHRoaW5rCj4gaXQn
cyBjbGVhcmx5IHByZWZlcmFibGUgdG8gc2hpcCBhIERUIHdpdGggdGhlIERQL0hETUkgbW9uaXRv
cgo+IGNvbm5lY3RlZCBvbiB0aGUgb3RoZXIgc2lkZSBleHBvc2VkIGFzIGEgcGFuZWwgYXMgd2Vs
bD8KCldlbGwsIGFzIEkgd3JvdGU6ICJpbiBnb29kIGludGVudGlvbiIuIFRoYXQncyB0aGUgcGFu
ZWwgdGhhdCBjb21lcyB3aXRoCnRoZSBraXQgYnV0IGl0IGlzIHZlcnkgd2VsbCBkZXRlY3RlZCBh
dXRvbWF0aWNhbGx5LCBqdXN0IGxpa2UgeW91IGRlc2NyaWJlLgoKU28sIGp1c3QgbGVhdmUgaXQg
b3V0PwoKCVRvcnN0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
