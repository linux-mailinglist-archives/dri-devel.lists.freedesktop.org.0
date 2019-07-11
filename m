Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C371659EA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 17:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACBB6E142;
	Thu, 11 Jul 2019 15:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E6F6E142
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6BEB8FB03;
 Thu, 11 Jul 2019 17:04:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vble_Z4Bb27E; Thu, 11 Jul 2019 17:04:04 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id D10E042CB4; Thu, 11 Jul 2019 17:04:03 +0200 (CEST)
Date: Thu, 11 Jul 2019 17:04:03 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM driver
Message-ID: <20190711150403.GB23195@bogon.m.sigxcpu.org>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LApPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwNDozMjowOFBNICswMzAwLCBSb2Jl
cnQgQ2hpcmFzIHdyb3RlOgo+IFRoaXMgcGF0Y2gtc2V0IGltcHJvdmVzIHRoZSB1c2Ugb2YgZUxD
RElGIGJsb2NrIG9uIGlNWCA4IFNvQ3MgKGxpa2UgOE1RLCA4TU0KPiBhbmQgOFFYUCkuIEZvbGxv
d2luZywgYXJlIHRoZSBuZXcgZmVhdHVyZXMgYWRkZWQgYW5kIGZpeGVzIGZyb20gdGhpcwo+IHBh
dGNoLXNldDoKPiAKPiAxLiBBZGQgc3VwcG9ydCBmb3IgZHJtX2JyaWRnZQo+IE9uIDhNUSBhbmQg
OE1NLCB0aGUgTENESUYgYmxvY2sgaXMgbm90IGRpcmVjdGx5IGNvbm5lY3RlZCB0byBhIHBhcmFs
bGVsCj4gZGlzcGxheSBjb25uZWN0b3IsIHdoZXJlIGFuIExDRCBwYW5lbCBjYW4gYmUgYXR0YWNo
ZWQsIGJ1dCBpbnN0ZWFkIGl0IGlzCj4gY29ubmVjdGVkIHRvIERTSSBjb250cm9sbGVyLiBTaW5j
ZSB0aGlzIERTSSBzdGFuZHMgYmV0d2VlbiB0aGUgZGlzcGxheQo+IGNvbnRyb2xsZXIgKGVMQ0RJ
RikgYW5kIHRoZSBwaHlzaWNhbCBjb25uZWN0b3IsIHRoZSBEU0kgY2FuIGJlIGltcGxlbWVudGVk
Cj4gYXMgYSBEUk0gYnJpZGdlLiBTbywgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjb25uZWN0IHRo
ZSBteHNmYiBkcml2ZXIgdG8KPiB0aGUgRFNJIGRyaXZlciwgdGhlIHN1cHBvcnQgZm9yIGEgZHJt
X2JyaWRnZSB3YXMgbmVlZGVkIGluIG14c2ZiIERSTQo+IGRyaXZlciAodGhlIGFjdHVhbCBkcml2
ZXIgZm9yIHRoZSBlTENESUYgYmxvY2spLgoKU28gSSB3YW50ZWQgdG8gdGVzdCB0aGlzIGJ1dCB3
aXRoIGJvdGggbXkgc29tZXdoYXQgY2xlYW5lZCB1cCBud2wKZHJpdmVywrkgYW5kIHRoZSBud2wg
ZHJpdmVyIGZvcndhcmQgcG9ydGVkIGZyb20gdGhlIG54cCB2ZW5kb3IgdHJlZSBJJ20KbG9va2lu
ZyBhdCBhIGJsYWNrIHNjcmVlbiB3aXRoIGN1cnJlbnQgbWFpbmxpbmUgLSB3aGlsZSBteSBkY3Nz
IGZvcndhcmQKcG9ydCBnaXZlcyBtZSBuaWNlIG91dHB1dCBvbiBtaXBpIGRzaS4gRG8geW91IGhh
dmUgYSB0cmVlIHRoYXQgdXNlcyBtaXBpCmRzaSBvbiBpbXg4bXEgd2hlcmUgSSBjb3VsZCBsb29r
IGF0IHRvIGNoZWNrIGZvciBkaWZmZXJlbmNlcz8KCkNoZWVycywKIC0tIEd1aWRvCgo+IAo+IDIu
IEFkZCBzdXBwb3J0IGZvciBhZGRpdGlvbmFsIHBpeGVsIGZvcm1hdHMKPiBTb21lIG9mIHRoZSBw
aXhlbCBmb3JtYXRzIG5lZWRlZCBieSBBbmRyb2lkIHdlcmUgbm90IGltcGxlbWVudGVkIGluIHRo
aXMKPiBkcml2ZXIsIGJ1dCB0aGV5IHdlcmUgYWN0dWFsbHkgc3VwcG9ydGVkLiBTbywgYWRkIHN1
cHBvcnQgZm9yIHRoZW0uCj4gCj4gMy4gQWRkIHN1cHBvcnQgZm9yIGhvcml6b250YWwgc3RyaWRl
Cj4gSGF2aW5nIHN1cHBvcnQgZm9yIGhvcml6b250YWwgc3RyaWRlIGFsbG93cyB0aGUgdXNlIG9m
IGVMQ0RJRiB3aXRoIGEgR1BVCj4gKGZvciBleGFtcGxlKSB0aGF0IGNhbiBvbmx5IG91dHB1dCBy
ZXNvbHV0aW9uIHNpemVzIG11bHRpcGxlIG9mIGEgcG93ZXIgb2YKPiA4LiBGb3IgZXhhbXBsZSwg
MTA4MCBpcyBub3QgYSBwb3dlciBvZiAxNiwgc28gaW4gb3JkZXIgdG8gc3VwcG9ydCAxOTIweDEw
ODAKPiBvdXRwdXQgZnJvbSBHUFVzIHRoYXQgY2FuIHByb2R1Y2UgbGluZWFyIGJ1ZmZlcnMgb25s
eSBpbiBzaXplcyBtdWx0aXBsZSB0byAxNiwKPiB0aGlzIGZlYXR1cmUgaXMgbmVlZGVkLgo+IAo+
IDMuIEZldyBtaW5vciBmZWF0dXJlcyBhbmQgYnVnLWZpeGluZwo+IFRoZSBhZGRpdGlvbiBvZiBt
YXgtcmVzIERUIHByb3BlcnR5IHdhcyBhY3R1YWxseSBuZWVkZWQgaW4gb3JkZXIgdG8gbGltaXQK
PiB0aGUgYmFuZHdpZHRoIHVzYWdlIG9mIHRoZSBlTENESUYgYmxvY2suIFRoaXMgaXMgbmVlZCBv
biBzeXN0ZW1zIHdoZXJlCj4gbXVsdGlwbGUgZGlzcGxheSBjb250cm9sbGVycyBhcmUgcHJlc2Vu
ZCBhbmQgdGhlIG1lbW9yeSBiYW5kd2lkdGggaXMgbm90Cj4gZW5vdWdoIHRvIGhhbmRsZSBhbGwg
b2YgdGhlbSBhdCBtYXhpbXVtIGNhcGFjaXR5IChsaWtlIGl0IGlzIHRoZSBjYXNlIG9uCj4gOE1R
LCB3aGVyZSB0aGVyZSBhcmUgdHdvIGRpc3BsYXkgY29udHJvbGxlcnM6IERDU1MgYW5kIGVMQ0RJ
RikuCj4gVGhlIHJlc3Qgb2YgdGhlIHBhdGNoZXMgYXJlIGJ1Zy1maXhlcy4KPiAKPiBNaXJlbGEg
UmFidWxlYSAoMSk6Cj4gICBkcm0vbXhzZmI6IFNpZ25hbCBtb2RlIGNoYW5nZWQgd2hlbiBicHAg
Y2hhbmdlZAo+IAo+IFJvYmVydCBDaGlyYXMgKDkpOgo+ICAgZHJtL214c2ZiOiBVcGRhdGUgbXhz
ZmIgdG8gc3VwcG9ydCBhIGJyaWRnZQo+ICAgZHJtL214c2ZiOiBVcGRhdGUgbXhzZmIgd2l0aCBh
ZGRpdGlvbmFsIHBpeGVsIGZvcm1hdHMKPiAgIGRybS9teHNmYjogRml4IHRoZSB2YmxhbmsgZXZl
bnRzCj4gICBkdC1iaW5kaW5nczogZGlzcGxheTogQWRkIG1heC1yZXMgcHJvcGVydHkgZm9yIG14
c2ZiCj4gICBkcm0vbXhzZmI6IEFkZCBtYXgtcmVzIHByb3BlcnR5IGZvciBNWFNGQgo+ICAgZHJt
L214c2ZiOiBVcGRhdGUgbXhzZmIgdG8gc3VwcG9ydCBMQ0QgcmVzZXQKPiAgIGRybS9teHNmYjog
SW1wcm92ZSB0aGUgYXhpIGNsb2NrIHVzYWdlCj4gICBkcm0vbXhzZmI6IENsZWFyIE9VVFNUQU5E
SU5HX1JFUVMgYml0cwo+ICAgZHJtL214c2ZiOiBBZGQgc3VwcG9ydCBmb3IgaG9yaXpvbnRhbCBz
dHJpZGUKPiAKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQgICAg
ICAgICAgfCAgIDYgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jICAgICAg
ICAgICAgICAgICB8IDI5MCArKysrKysrKysrKysrKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJt
L214c2ZiL214c2ZiX2Rydi5jICAgICAgICAgICAgICAgICAgfCAxODkgKysrKysrKysrKystLS0K
PiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5oICAgICAgICAgICAgICAgICAgfCAg
MTAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jICAgICAgICAgICAgICAg
ICAgfCAgMjYgKy0KPiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX3JlZ3MuaCAgICAgICAg
ICAgICAgICAgfCAxMjggKysrKysrLS0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgNTMxIGluc2VydGlv
bnMoKyksIDExOCBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjcuNAo+IAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwKPiAKCsK5IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZl
bC8yMDE5LU1hcmNoLzIwOTY4NS5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
