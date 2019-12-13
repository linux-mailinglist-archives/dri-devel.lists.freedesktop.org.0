Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FC11F247
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCCD6E3CB;
	Sat, 14 Dec 2019 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466F6EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:38:51 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 75350C0002;
 Fri, 13 Dec 2019 18:38:47 +0000 (UTC)
Date: Fri, 13 Dec 2019 19:38:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Subject: Re: [PATCH 10/12] arm64: dts: rockchip: Add PX30 CRTCs graph LVDS
 endpoints
Message-ID: <20191213193846.5d28cc97@xps13>
In-Reply-To: <1933192.L6hp5CucIl@diego>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-11-miquel.raynal@bootlin.com>
 <1933192.L6hp5CucIl@diego>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa28sCgpIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZSBvbiBGcmks
IDEzIERlYyAyMDE5IDE5OjI4OjIxCiswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gQW0gRnJlaXRh
ZywgMTMuIERlemVtYmVyIDIwMTksIDE5OjEwOjQ5IENFVCBzY2hyaWViIE1pcXVlbCBSYXluYWw6
Cj4gPiBBZGQgdGhlIGRpc3BsYXkgc3Vic3lzdGVtIHJvdXRlcyB3aXRoIHRoZSB0d28gYXZhaWxh
YmxlIENSVENzOiB2b3BiCj4gPiBhbmQgdm9wbCAoYmlnIGFuZCBsaXR0bGUpLiBGb3IgZWFjaCBD
UlRDLCBhZGQgdGhlIExWRFMgZW5kcG9pbnRzLiBNSVBJCj4gPiBEU0kgZW5kcG9pbnRzIHdpbGwg
Y29tZSBsYXRlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9j
a2NoaXAvcHgzMC5kdHNpIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9weDMwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlw
L3B4MzAuZHRzaQo+ID4gaW5kZXggYjJhZjBmMDJlY2JlLi4xYzk2YmE1NTZkYWYgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3B4MzAuZHRzaQo+ID4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9weDMwLmR0c2kKPiA+IEBAIC0xOTAsNiArMTkw
LDE2IEBACj4gPiAgCQljb21wYXRpYmxlID0gInJvY2tjaGlwLGRpc3BsYXktc3Vic3lzdGVtIjsK
PiA+ICAJCXBvcnRzID0gPCZ2b3BiX291dD4sIDwmdm9wbF9vdXQ+Owo+ID4gIAkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiA+ICsKPiA+ICsJCXJvdXRlIHsKPiA+ICsJCQlyb3V0ZV92b3BiX2x2ZHM6
IHJvdXRlLXZvcGItbHZkcyB7Cj4gPiArCQkJCWNvbm5lY3QgPSA8JnZvcGJfb3V0X2x2ZHM+Owo+
ID4gKwkJCX07Cj4gPiArCj4gPiArCQkJcm91dGVfdm9wbF9sdmRzOiByb3V0ZS12b3BsLWx2ZHMg
ewo+ID4gKwkJCQljb25uZWN0ID0gPCZ2b3BsX291dF9sdmRzPjsKPiA+ICsJCQl9Owo+ID4gKwkJ
fTsgIAo+IAo+IHdoZXJlIGRvZXMgdGhpcyByb3V0ZS1zdHVmZiBjb21lIGZyb20/Cj4gVGhlIHZl
bmRvciB0cmVlPyBCZWNhdXNlIHNvIGZhciBJJ3ZlIG5vdCBzZWVuIHRoaXMgaW4gbWFpbmxpbmUt
ZHJtCj4gaW4gZ2VuZXJhbCBub3IgdGhlIFJvY2tjaGlwIGRybSBkcml2ZXIgaXRzZWxmLgoKWWVz
IGl0IGNvbWVzIGZyb20gdGhlIHZlbmRvciB0cmVlLCBJIGFkZGVkIGEgZmV3IHRoaW5ncyBmcm9t
IHRoZSB2ZW5kb3IKdHJlZSBpbiB0aGUgIkkgcmVhbGx5IHdhbnQgdGhpcyBwYW5lbCB0byB3b3Jr
IiBwaGFzZSBhbmQgSSBmb3Jnb3QgdG8KY2hlY2sgaWYgaXQgY291bGQgYmUgcmVtb3ZlZCwgSSds
bCBwcm9iYWJseSBkcm9wIHRoaXMuCiAKPiAKPiAKPiA+ICAJfTsKPiA+ICAKPiA+ICAJZ21hY19j
bGtpbjogZXh0ZXJuYWwtZ21hYy1jbG9jayB7Cj4gPiBAQCAtOTc2LDYgKzk4NiwxMSBAQAo+ID4g
IAkJdm9wYl9vdXQ6IHBvcnQgewo+ID4gIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gIAkJ
CSNzaXplLWNlbGxzID0gPDA+Owo+ID4gKwo+ID4gKwkJCXZvcGJfb3V0X2x2ZHM6IGVuZHBvaW50
QDAgewo+ID4gKwkJCQlyZWcgPSA8MD47Cj4gPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZk
c192b3BiX2luPjsKPiA+ICsJCQl9OyAgCj4gCj4gVGhpcyAoYW5kIHRoZSBvbmUgYmVsb3cpIHdv
dWxkIGNyZWF0ZSBkYW5nbGluZyBwaGFuZGxlIHJlZmVyZW5jZXMKPiBhbmQgY29tcGlsZSBlcnJv
cnMsIGJlY2F1c2UgdGhlIHJlZmVyZW5jZWQgcGhhbmRsZXMgb25seSBnZXQgaW50cm9kdWNlZAo+
IGluIHBhdGNoMTIuIFNvIGlkZWFsbHkgbWVyZ2UgdGhpcyBpbnRvIHRoZSBsYXN0IHBhdGNoLgoK
QWN0dWFsbHkgcGF0Y2ggMTIgYWxzbyByZWZlcmVuY2VzIHRoZXNlIG5vZGVzIHNvIEkgc2hvdWxk
IG1lcmdlIHRoZW0uCgo+IAo+IAo+IEhlaWtvCj4gCj4gPiAgCQl9Owo+ID4gIAl9Owo+ID4gIAo+
ID4gQEAgLTEwMDgsNiArMTAyMywxMSBAQAo+ID4gIAkJdm9wbF9vdXQ6IHBvcnQgewo+ID4gIAkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gIAkJCSNzaXplLWNlbGxzID0gPDA+Owo+ID4gKwo+
ID4gKwkJCXZvcGxfb3V0X2x2ZHM6IGVuZHBvaW50QDAgewo+ID4gKwkJCQlyZWcgPSA8MD47Cj4g
PiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc192b3BsX2luPjsKPiA+ICsJCQl9Owo+ID4g
IAkJfTsKPiA+ICAJfTsKPiA+ICAKPiA+ICAgCj4gCj4gCj4gCj4gCgpUaGFua3MgZm9yIHRoZSBy
ZXZpZXchCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
