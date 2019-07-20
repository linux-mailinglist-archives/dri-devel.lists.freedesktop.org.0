Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604BF6F0BB
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 23:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D102B6E8BE;
	Sat, 20 Jul 2019 21:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32A6E8BE
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6A16EFB03;
 Sat, 20 Jul 2019 23:09:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lt3q_07BvhWh; Sat, 20 Jul 2019 23:09:23 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id ABB364017E; Sat, 20 Jul 2019 23:09:22 +0200 (CEST)
Date: Sat, 20 Jul 2019 23:09:22 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [EXT] Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM
 driver
Message-ID: <20190720210922.GA464@bogon.m.sigxcpu.org>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
 <20190711150403.GB23195@bogon.m.sigxcpu.org>
 <1562919331.3209.11.camel@nxp.com>
 <20190716145450.GA609@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716145450.GA609@bogon.m.sigxcpu.org>
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
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LApPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAwNDo1NDo1MFBNICswMjAwLCBHdWlk
byBHw7xudGhlciB3cm90ZToKPiBIaSBSb2JlcnQsCj4gT24gRnJpLCBKdWwgMTIsIDIwMTkgYXQg
MDg6MTU6MzJBTSArMDAwMCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPiA+IEhpIEd1aWRvLAo+ID4g
Cj4gPiBPbiBKbywgMjAxOS0wNy0xMSBhdCAxNzowNCArMDIwMCwgR3VpZG8gR8O8bnRoZXIgd3Jv
dGU6Cj4gPiA+IEhpIFJvYmVydCwKPiA+ID4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDQ6MzI6
MDhQTSArMDMwMCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBUaGlzIHBh
dGNoLXNldCBpbXByb3ZlcyB0aGUgdXNlIG9mIGVMQ0RJRiBibG9jayBvbiBpTVggOCBTb0NzIChs
aWtlCj4gPiA+ID4gOE1RLCA4TU0KPiA+ID4gPiBhbmQgOFFYUCkuIEZvbGxvd2luZywgYXJlIHRo
ZSBuZXcgZmVhdHVyZXMgYWRkZWQgYW5kIGZpeGVzIGZyb20KPiA+ID4gPiB0aGlzCj4gPiA+ID4g
cGF0Y2gtc2V0Ogo+ID4gPiA+IAo+ID4gPiA+IDEuIEFkZCBzdXBwb3J0IGZvciBkcm1fYnJpZGdl
Cj4gPiA+ID4gT24gOE1RIGFuZCA4TU0sIHRoZSBMQ0RJRiBibG9jayBpcyBub3QgZGlyZWN0bHkg
Y29ubmVjdGVkIHRvIGEKPiA+ID4gPiBwYXJhbGxlbAo+ID4gPiA+IGRpc3BsYXkgY29ubmVjdG9y
LCB3aGVyZSBhbiBMQ0QgcGFuZWwgY2FuIGJlIGF0dGFjaGVkLCBidXQgaW5zdGVhZAo+ID4gPiA+
IGl0IGlzCj4gPiA+ID4gY29ubmVjdGVkIHRvIERTSSBjb250cm9sbGVyLiBTaW5jZSB0aGlzIERT
SSBzdGFuZHMgYmV0d2VlbiB0aGUKPiA+ID4gPiBkaXNwbGF5Cj4gPiA+ID4gY29udHJvbGxlciAo
ZUxDRElGKSBhbmQgdGhlIHBoeXNpY2FsIGNvbm5lY3RvciwgdGhlIERTSSBjYW4gYmUKPiA+ID4g
PiBpbXBsZW1lbnRlZAo+ID4gPiA+IGFzIGEgRFJNIGJyaWRnZS4gU28sIGluIG9yZGVyIHRvIGJl
IGFibGUgdG8gY29ubmVjdCB0aGUgbXhzZmIKPiA+ID4gPiBkcml2ZXIgdG8KPiA+ID4gPiB0aGUg
RFNJIGRyaXZlciwgdGhlIHN1cHBvcnQgZm9yIGEgZHJtX2JyaWRnZSB3YXMgbmVlZGVkIGluIG14
c2ZiCj4gPiA+ID4gRFJNCj4gPiA+ID4gZHJpdmVyICh0aGUgYWN0dWFsIGRyaXZlciBmb3IgdGhl
IGVMQ0RJRiBibG9jaykuCj4gPiA+IFNvIEkgd2FudGVkIHRvIHRlc3QgdGhpcyBidXQgd2l0aCBi
b3RoIG15IHNvbWV3aGF0IGNsZWFuZWQgdXAgbndsCj4gPiA+IGRyaXZlcsK5IGFuZCB0aGUgbnds
IGRyaXZlciBmb3J3YXJkIHBvcnRlZCBmcm9tIHRoZSBueHAgdmVuZG9yIHRyZWUKPiA+ID4gSSdt
Cj4gPiA+IGxvb2tpbmcgYXQgYSBibGFjayBzY3JlZW4gd2l0aCBjdXJyZW50IG1haW5saW5lIC0g
d2hpbGUgbXkgZGNzcwo+ID4gPiBmb3J3YXJkCj4gPiA+IHBvcnQgZ2l2ZXMgbWUgbmljZSBvdXRw
dXQgb24gbWlwaSBkc2kuIERvIHlvdSBoYXZlIGEgdHJlZSB0aGF0IHVzZXMKPiA+ID4gbWlwaQo+
ID4gPiBkc2kgb24gaW14OG1xIHdoZXJlIEkgY291bGQgbG9vayBhdCB0byBjaGVjayBmb3IgZGlm
ZmVyZW5jZXM/Cj4gPiBTb21ld2hlcmUgb24gdGhlIHBpeGVsIHBhdGggKGJldHdlZW4gdGhlIGRp
c3BsYXkgY29udHJvbGxlciBhbmQgdGhlCj4gPiBEU0kpIHRoZXJlIGlzIGEgYmxvY2sgdGhhdCBp
bnZlcnRzIHRoZSBwb2xhcml0eS4gSSBjYW4ndCByZW1lbWJlcgo+ID4gZXhhY3RseSB3aGF0IHdh
cyB0aGUgcm9sZSBvZiB0aGlzIGJsb2NrLCBidXQgdGhlIHBvbGFyaXR5IGlzIGludmVydGVkCj4g
PiB3aGVuIGVMQ0RJRiBpcyB1c2VkIGluIGNvbWJpbmF0aW9uIHdpdGggdGhlIERTSS4KPiA+IElm
IHlvdSB0YWtlIGEgbG9vayBhdCBteSBEU0kgZHJpdmVyIGZyb20gTlhQIHJlbGVhc2VzIChJIGd1
ZXNzIHlvdSBoYXZlCj4gPiB0aGVtKSwgeW91IHdpbGwgc2VlIHRoZXJlIGlzIGEgaGFjayBpbiBt
b2RlX2ZpeHVwOgo+ID4gCj4gPiB1bnNpZ25lZCBpbnQgKmZsYWdzID0gJm1vZGUtPmZsYWdzOwo+
ID4gaWYgKGRzaS0+c3luY19wb2wgewo+ID4gCSpmbGFncyB8PSBEUk1fTU9ERV9GTEFHX1BIU1lO
QzsKPiA+IAkqZmxhZ3MgfD0gRFJNX01PREVfRkxBR19QVlNZTkM7Cj4gPiAJKmZsYWdzICY9IH5E
Uk1fTU9ERV9GTEFHX05IU1lOQzsKPiA+IAkqZmxhZ3MgJj0gfkRSTV9NT0RFX0ZMQUdfTlZTWU5D
Owo+ID4gfSBlbHNlIHsKPiA+IAkqZmxhZ3MgJj0gfkRSTV9NT0RFX0ZMQUdfUEhTWU5DOwo+ID4g
CSpmbGFncyAmPSB+RFJNX01PREVfRkxBR19QVlNZTkM7Cj4gPiAJKmZsYWdzIHw9IERSTV9NT0RF
X0ZMQUdfTkhTWU5DOwo+ID4gCSpmbGFncyB8PSBEUk1fTU9ERV9GTEFHX05WU1lOQzsKPiA+IH0K
PiAKPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uISBJJ2xsIHRyeSB0aGF0Lgo+Cj4gPiAKPiA+
IEkga25vdyBpdCdzIG5vdCBjbGVhbiwgYnV0IGl0IHdvcmtzIGZvciBub3cuIFlvdSBjYW4gdHJ5
IHRoaXMgaW4geW91cgo+ID4gZHJpdmVyIGFuZCBzZWUgaWYgaXQgaGVscHMuCj4gPiBUaGVzZSBk
YXlzIEkgd2lsbCBhbHNvIHRha2UgeW91ciBud2wtZHNpIGRyaXZlciBhbmQgdGVzdCBpdCwgYW5k
IGFsc28KPiA+IGFkZCBzdXBwb3J0IGZvciBicmlkZ2UgYW5kIGVMQ0RJRiB0byBzZWUgaWYgSSBj
YW4gbWFrZSBpdCB3b3JrLgo+IAo+IEkgaGF2ZSBoYWNreSBicmlkZ2Ugc3VwcG9ydCBvdmVyIGhl
cmUgYWxyZWFkeS4gR2l2ZSBtZSBzb21lIGRheXMgdG8KPiBjbGVhbiBpdCB1cCBhbmQgaXQgbWln
aHQgc2FmZSB5b3Ugc29tZSB3b3JrLgoKWW91ciBzdWdnZXN0aW9uIGFib3ZlIChwbHVzIHNvbWUg
b3RoZXIgZml4ZXMpIHdvcmtlZCBhbmQKbXhzZmIrbndsK21peGVsLWRwaHkgd29ya3Mgb3ZlciBo
ZXJlLiBJJ2xsIHRyeSB0byBzZW5kIGEgdjEgb2YgdGhlIG53bApkcml2ZXIgb3V0IGR1cmluZyB0
aGUgd2Vlay4KQ2hlZXJzLAogLS0gR3VpZG8KCj4gQ2hlZXJzLAo+ICAtLSBHdWlkbwo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
