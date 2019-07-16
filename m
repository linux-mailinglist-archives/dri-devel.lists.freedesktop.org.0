Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237546AB0C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 16:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847EC6E136;
	Tue, 16 Jul 2019 14:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675FB6E136
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 14:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id AE3A1FB03;
 Tue, 16 Jul 2019 16:54:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rc1dG7eD4j4M; Tue, 16 Jul 2019 16:54:51 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 08B5141140; Tue, 16 Jul 2019 16:54:50 +0200 (CEST)
Date: Tue, 16 Jul 2019 16:54:50 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [EXT] Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM
 driver
Message-ID: <20190716145450.GA609@bogon.m.sigxcpu.org>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
 <20190711150403.GB23195@bogon.m.sigxcpu.org>
 <1562919331.3209.11.camel@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562919331.3209.11.camel@nxp.com>
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
Cc: "marex@denx.de" <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LApPbiBGcmksIEp1bCAxMiwgMjAxOSBhdCAwODoxNTozMkFNICswMDAwLCBSb2Jl
cnQgQ2hpcmFzIHdyb3RlOgo+IEhpIEd1aWRvLAo+IAo+IE9uIEpvLCAyMDE5LTA3LTExIGF0IDE3
OjA0ICswMjAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToKPiA+IEhpIFJvYmVydCwKPiA+IE9uIFdl
ZCwgSnVuIDI2LCAyMDE5IGF0IDA0OjMyOjA4UE0gKzAzMDAsIFJvYmVydCBDaGlyYXMgd3JvdGU6
Cj4gPiA+IAo+ID4gPiBUaGlzIHBhdGNoLXNldCBpbXByb3ZlcyB0aGUgdXNlIG9mIGVMQ0RJRiBi
bG9jayBvbiBpTVggOCBTb0NzIChsaWtlCj4gPiA+IDhNUSwgOE1NCj4gPiA+IGFuZCA4UVhQKS4g
Rm9sbG93aW5nLCBhcmUgdGhlIG5ldyBmZWF0dXJlcyBhZGRlZCBhbmQgZml4ZXMgZnJvbQo+ID4g
PiB0aGlzCj4gPiA+IHBhdGNoLXNldDoKPiA+ID4gCj4gPiA+IDEuIEFkZCBzdXBwb3J0IGZvciBk
cm1fYnJpZGdlCj4gPiA+IE9uIDhNUSBhbmQgOE1NLCB0aGUgTENESUYgYmxvY2sgaXMgbm90IGRp
cmVjdGx5IGNvbm5lY3RlZCB0byBhCj4gPiA+IHBhcmFsbGVsCj4gPiA+IGRpc3BsYXkgY29ubmVj
dG9yLCB3aGVyZSBhbiBMQ0QgcGFuZWwgY2FuIGJlIGF0dGFjaGVkLCBidXQgaW5zdGVhZAo+ID4g
PiBpdCBpcwo+ID4gPiBjb25uZWN0ZWQgdG8gRFNJIGNvbnRyb2xsZXIuIFNpbmNlIHRoaXMgRFNJ
IHN0YW5kcyBiZXR3ZWVuIHRoZQo+ID4gPiBkaXNwbGF5Cj4gPiA+IGNvbnRyb2xsZXIgKGVMQ0RJ
RikgYW5kIHRoZSBwaHlzaWNhbCBjb25uZWN0b3IsIHRoZSBEU0kgY2FuIGJlCj4gPiA+IGltcGxl
bWVudGVkCj4gPiA+IGFzIGEgRFJNIGJyaWRnZS4gU28sIGluIG9yZGVyIHRvIGJlIGFibGUgdG8g
Y29ubmVjdCB0aGUgbXhzZmIKPiA+ID4gZHJpdmVyIHRvCj4gPiA+IHRoZSBEU0kgZHJpdmVyLCB0
aGUgc3VwcG9ydCBmb3IgYSBkcm1fYnJpZGdlIHdhcyBuZWVkZWQgaW4gbXhzZmIKPiA+ID4gRFJN
Cj4gPiA+IGRyaXZlciAodGhlIGFjdHVhbCBkcml2ZXIgZm9yIHRoZSBlTENESUYgYmxvY2spLgo+
ID4gU28gSSB3YW50ZWQgdG8gdGVzdCB0aGlzIGJ1dCB3aXRoIGJvdGggbXkgc29tZXdoYXQgY2xl
YW5lZCB1cCBud2wKPiA+IGRyaXZlcsK5IGFuZCB0aGUgbndsIGRyaXZlciBmb3J3YXJkIHBvcnRl
ZCBmcm9tIHRoZSBueHAgdmVuZG9yIHRyZWUKPiA+IEknbQo+ID4gbG9va2luZyBhdCBhIGJsYWNr
IHNjcmVlbiB3aXRoIGN1cnJlbnQgbWFpbmxpbmUgLSB3aGlsZSBteSBkY3NzCj4gPiBmb3J3YXJk
Cj4gPiBwb3J0IGdpdmVzIG1lIG5pY2Ugb3V0cHV0IG9uIG1pcGkgZHNpLiBEbyB5b3UgaGF2ZSBh
IHRyZWUgdGhhdCB1c2VzCj4gPiBtaXBpCj4gPiBkc2kgb24gaW14OG1xIHdoZXJlIEkgY291bGQg
bG9vayBhdCB0byBjaGVjayBmb3IgZGlmZmVyZW5jZXM/Cj4gU29tZXdoZXJlIG9uIHRoZSBwaXhl
bCBwYXRoIChiZXR3ZWVuIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgYW5kIHRoZQo+IERTSSkgdGhl
cmUgaXMgYSBibG9jayB0aGF0IGludmVydHMgdGhlIHBvbGFyaXR5LiBJIGNhbid0IHJlbWVtYmVy
Cj4gZXhhY3RseSB3aGF0IHdhcyB0aGUgcm9sZSBvZiB0aGlzIGJsb2NrLCBidXQgdGhlIHBvbGFy
aXR5IGlzIGludmVydGVkCj4gd2hlbiBlTENESUYgaXMgdXNlZCBpbiBjb21iaW5hdGlvbiB3aXRo
IHRoZSBEU0kuCj4gSWYgeW91IHRha2UgYSBsb29rIGF0IG15IERTSSBkcml2ZXIgZnJvbSBOWFAg
cmVsZWFzZXMgKEkgZ3Vlc3MgeW91IGhhdmUKPiB0aGVtKSwgeW91IHdpbGwgc2VlIHRoZXJlIGlz
IGEgaGFjayBpbiBtb2RlX2ZpeHVwOgo+IAo+IHVuc2lnbmVkIGludCAqZmxhZ3MgPSAmbW9kZS0+
ZmxhZ3M7Cj4gaWYgKGRzaS0+c3luY19wb2wgewo+IAkqZmxhZ3MgfD0gRFJNX01PREVfRkxBR19Q
SFNZTkM7Cj4gCSpmbGFncyB8PSBEUk1fTU9ERV9GTEFHX1BWU1lOQzsKPiAJKmZsYWdzICY9IH5E
Uk1fTU9ERV9GTEFHX05IU1lOQzsKPiAJKmZsYWdzICY9IH5EUk1fTU9ERV9GTEFHX05WU1lOQzsK
PiB9IGVsc2Ugewo+IAkqZmxhZ3MgJj0gfkRSTV9NT0RFX0ZMQUdfUEhTWU5DOwo+IAkqZmxhZ3Mg
Jj0gfkRSTV9NT0RFX0ZMQUdfUFZTWU5DOwo+IAkqZmxhZ3MgfD0gRFJNX01PREVfRkxBR19OSFNZ
TkM7Cj4gCSpmbGFncyB8PSBEUk1fTU9ERV9GTEFHX05WU1lOQzsKPiB9CgpUaGFua3MgZm9yIHRo
ZSBzdWdnZXN0aW9uISBJJ2xsIHRyeSB0aGF0LgoKPiAKPiBJIGtub3cgaXQncyBub3QgY2xlYW4s
IGJ1dCBpdCB3b3JrcyBmb3Igbm93LiBZb3UgY2FuIHRyeSB0aGlzIGluIHlvdXIKPiBkcml2ZXIg
YW5kIHNlZSBpZiBpdCBoZWxwcy4KPiBUaGVzZSBkYXlzIEkgd2lsbCBhbHNvIHRha2UgeW91ciBu
d2wtZHNpIGRyaXZlciBhbmQgdGVzdCBpdCwgYW5kIGFsc28KPiBhZGQgc3VwcG9ydCBmb3IgYnJp
ZGdlIGFuZCBlTENESUYgdG8gc2VlIGlmIEkgY2FuIG1ha2UgaXQgd29yay4KCkkgaGF2ZSBoYWNr
eSBicmlkZ2Ugc3VwcG9ydCBvdmVyIGhlcmUgYWxyZWFkeS4gR2l2ZSBtZSBzb21lIGRheXMgdG8K
Y2xlYW4gaXQgdXAgYW5kIGl0IG1pZ2h0IHNhZmUgeW91IHNvbWUgd29yay4KQ2hlZXJzLAogLS0g
R3VpZG8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
