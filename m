Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE0EFE7D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D856EA54;
	Tue,  5 Nov 2019 13:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0861C6E9CE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 10:58:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 820FA68B05; Tue,  5 Nov 2019 11:58:08 +0100 (CET)
Date: Tue, 5 Nov 2019 11:58:08 +0100
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v5 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-ID: <20191105105808.GA27999@lst.de>
References: <20191104110400.F319F68BE1@verein.lst.de>
 <20191104110613.C3BA468C4E@verein.lst.de> <20191105104342.GD3876@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105104342.GD3876@gilmour.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
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
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6NDM6NDJBTSArMDEwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiAKPiBPbiBUdWUsIE9jdCAyOSwgMjAxOSBhdCAwMToxNjo1N1BNICswMTAwLCBUb3Jz
dGVuIER1d2Ugd3JvdGU6Cj4gPiBUaGUgYW54NjM0NSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgRGlz
cGxheVBvcnQvZURQIHRyYW5zbWl0dGVyIGRlc2lnbmVkCj4gPiBmb3IgcG9ydGFibGUgZGV2aWNl
cy4KPiA+Cj4gPiBBZGQgYSBiaW5kaW5nIGRvY3VtZW50IGZvciBpdC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBWYXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUb3JzdGVu
IER1d2UgPGR1d2VAc3VzZS5kZT4KPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gCj4gQXBwbGllZCwgdGhhbmtzCgpS
ZS10aGFua3MhCgo+IChzdGlsbCwgdGhlcmUncyBvbmUgY29tbWVudCBiZWxvdyB0aGF0IGNhbiBi
ZSBhZGRyZXNzZWQgaW4gYQo+IHN1YnNlcXVlbnQgcGF0Y2gpLgo+IAo+ID4gKwo+ID4gKyAgcG9y
dHM6Cj4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gKwo+ID4gKyAgICBwcm9wZXJ0aWVzOgo+ID4g
KyAgICAgIHBvcnRAMDoKPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdAo+ID4gKyAgICAgICAgZGVz
Y3JpcHRpb246IHwKPiA+ICsgICAgICAgICAgVmlkZW8gcG9ydCBmb3IgTFZUVEwgaW5wdXQKPiA+
ICsKPiA+ICsgICAgICBwb3J0QDE6Cj4gPiArICAgICAgICB0eXBlOiBvYmplY3QKPiA+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiArICAgICAgICAgIFZpZGVvIHBvcnQgZm9yIGVEUCBvdXRw
dXQgKHBhbmVsIG9yIGNvbm5lY3RvcikuCj4gPiArICAgICAgICAgIE1heSBiZSBvbWl0dGVkIGlm
IEVESUQgd29ya3MgcmVsaWFibHkuCj4gPiArCj4gPiArICAgIHJlcXVpcmVkOgo+ID4gKyAgICAg
IC0gcG9ydEAwCj4gCj4gWW91IHNob3VsZCBoYXZlIHNvbWV0aGluZyBsaWtlOgo+IAo+IHBvcnRz
Ogo+ICAgdHlwZTogb2JqZWN0Cj4gICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiAKPiBh
cyB3ZWxsLi4uCgpZZXMsIGFuZCBpdCBhbHNvIHN0cnVjayBtZSB0aGF0IEkgZm9yZ290IGF0IGxl
YXN0IGFib3V0IHRoZSBob3RwbHVnLWdwaW8uCkl0J3MgdW51c2VkIG9uIHRoZSBUZXJlcyBhbmQg
dGhlIFBpbmVib29rLCBidXQgaW4gdGhlb3J5IGl0J3MgYSB2YWxpZApwcm9wZXJ0eSwgd2hpY2gg
Y2FuJ3QgYmUgYWRkZWQgYW55IG1vcmUgbm93LgoKCVRvcnN0ZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
