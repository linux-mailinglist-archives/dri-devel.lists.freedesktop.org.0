Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02551EBEFE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DC46F767;
	Fri,  1 Nov 2019 08:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B08B6EEC2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 14:52:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 0102D68BE1; Thu, 31 Oct 2019 15:52:24 +0100 (CET)
Date: Thu, 31 Oct 2019 15:52:24 +0100
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-ID: <20191031145224.GA5973@lst.de>
References: <20191029153815.C631668C4E@verein.lst.de>
 <20191029153953.8EE9B68D04@verein.lst.de>
 <20191031125100.qprbdaaysg3tmhif@hendrix>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031125100.qprbdaaysg3tmhif@hendrix>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
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

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDE6NTE6MDBQTSArMDEwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBPbiBUdWUsIE9jdCAyOSwgMjAxOSBhdCAwMToxNjo1N1BNICswMTAwLCBUb3JzdGVu
IER1d2Ugd3JvdGU6Cj4gPiArCj4gPiArICBwb3J0czoKPiA+ICsgICAgYW55T2Y6Cj4gPiArICAg
ICAgLSBwb3J0QDA6Cj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogVmlkZW8gcG9ydCBmb3IgTFZU
VEwgaW5wdXQKPiA+ICsgICAgICAtIHBvcnRAMToKPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBW
aWRlbyBwb3J0IGZvciBlRFAgb3V0cHV0IChwYW5lbCBvciBjb25uZWN0b3IpLgo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIE1heSBiZSBvbWl0dGVkIGlmIEVESUQgd29ya3MgcmVsaWFibHkuCj4g
PiArICAgIHJlcXVpcmVkOgo+ID4gKyAgICAgIC0gcG9ydEAwCj4gCj4gSGF2ZSB5b3UgdHJpZWQg
dG8gdmFsaWRhdGUgdGhvc2UgdHdvIHBvcnRzIGluIGEgRFQ/CgpZZXMsIGl0IHZhbGlkYXRlcyBh
cyBleHBlY3RlZCwgbGlrZSBJIHdyb3RlLiBWYXJpb3VzIHNvdXJjZXMgdG9sZCBtZSB0aGF0Cmpz
b24tc2NoZW1hIGlzIG5vdCBhbHdheXMgc3RyYWlnaHRmb3J3YXJkIHNvIEkgYXNzdW1lZCBhbnlP
ZiB3YXMgT0suCgo+IEknbSBub3QgcXVpdGUgc3VyZSB3aGF0IHlvdSB3YW50ZWQgdG8gZXhwcmVz
cyB3aXRoIHRoYXQgYW55T2YsIGJ1dCBpZgo+IGl0IHdhcyBzb21ldGhpbmcgbGlrZSBwb3J0QDAg
aXMgbWFuZGF0b3J5LCBhbmQgcG9ydEAxIGlzIG9wdGlvbmFsLCBpdAo+IHNob3VsZCBiZSBzb21l
dGhpbmcgbGlrZSB0aGlzOgo+IAo+IHByb3BlcnRpZXM6Cj4gCj4gICAuLi4KPiAKPiAgIHBvcnRz
Ogo+ICAgICB0eXBlOiBvYmplY3QKPiAKPiAgICAgcHJvcGVydGllczoKPiAgICAgICBwb3J0QDA6
Cj4gICAgICAgICB0eXBlOiBvYmplY3QKPiAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gCSAgVmlk
ZW8gcG9ydCBmb3IgTFZUVEwgaW5wdXQKPiAKPiAgICAgICBwb3J0QDE6Cj4gICAgICAgICB0eXBl
OiBvYmplY3QKPiAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gCSAgVmlkZW8gcG9ydCBmb3IgZURQ
IG91dHB1dCAoLi4pCj4gCj4gICAgIHJlcXVpcmVkOgo+ICAgICAgIC0gcG9ydEAwCj4gCj4gVGhp
cyB3YXksIHlvdSBleHByZXNzIHRoYXQgYm90aCBwb3J0QDAgYW5kIHBvcnRAMSBtdXN0IGJ5IG5v
ZGVzLCB1bmRlcgo+IGEgbm9kZSBjYWxsZWQgcG9ydHMsIGFuZCBwb3J0QDAgaXMgbWFuZGF0b3J5
LgoKVGhhdCB2YWxpZGF0ZXMsIHRvby4gTG9va3MgYmV0dGVyLCBhZG1pdHRlZGx5LiBJIGRvbid0
IGhhdmUgYSBzdHJvbmcKb3BpbmlvbiBoZXJlLiBJdCdzIGp1c3QgdGhhdCBSb2Igd3JvdGUgaW4K
PENBTF9Kc3FLQVUzV0czTD1LUDhBOHU0dlc9cV9CUVdQTi1tX2MrQURPd1Rpb0oyLWNtZ0BtYWls
LmdtYWlsLmNvbT46Cgp8IEZvciB0aGlzIGNhc2Ugc3BlY2lmaWNhbGx5LCB3ZSBkbyBuZWVkIHRv
IGRlZmluZSBhIGNvbW1vbiBncmFwaAp8IHNjaGVtYSwgYnV0IGhhdmVuJ3QgeWV0LiBZb3UgY2Fu
IGFzc3VtZSB3ZSBkbyBhbmQgb25seSByZWFsbHkgbmVlZCB0byAgICAKfCBjYXB0dXJlIHdoYXQg
TWF4aW1lIHNhaWQgYWJvdmUuCih5b3VyIHBvaW50cyBiYWNrIHRoZW4gd2VyZSBwb3J0QE4gZGVz
Y3JpcHRpb25zIGFuZCBuZWNjZXNzaXR5IGZvciBwb3J0QDApCgpBcmUgeW91IHN1cmUgdGhhdCAi
b2JqZWN0IiBpcyBzcGVjaWZpYyBlbm91Z2g/Cgo+IFlvdSBzaG91bGQgZXZlbiBwdXNoIHRoaXMg
YSBiaXQgZnVydGhlciBieSBhZGRpbmcKPiBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UgdG8g
cHJldmVudCBhIERUIGZyb20gaGF2aW5nIHVuZG9jdW1lbnRlZAo+IHByb3BlcnRpZXMgYW5kIGNo
aWxkcmVuIGZvciB0aGUgbWFpbiBub2RlIGFuZCBwb3J0cyBub2RlLgoKWW91IG1lYW4gbGlrZQoK
fCBqc29uc2NoZW1hLmV4Y2VwdGlvbnMuU2NoZW1hRXJyb3I6IEFkZGl0aW9uYWwgcHJvcGVydGll
cyBhcmUgbm90IGFsbG93ZWQgKCd1bmV2YWx1YXRlZFByb3BlcnRpZXMnIHdhcyB1bmV4cGVjdGVk
KQpbLi4uXQp8IE9uIHNjaGVtYToKfCAgICB7JyRpZCc6ICdodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy93YXRjaGRvZy9hbGx3aW5uZXIsc3VuNGktYTEwLXdkdC55YW1sIycsClsuLi5dCnwg
ICAgICAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJzogRmFsc2V9Cgo/IDstKQoKQnV0IHllcywgdGhp
cyBwYXRjaCBzZXJpZXMgcGFzc2VzIGV2ZW4gd2l0aCBhZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UuCgpJbiB3aGljaCBmb3JtIHdvdWxkIHlvdSBsaWtlIHRvIHJlY2VpdmUgdGhlIHVwZGF0ZT8K
CglUb3JzdGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
