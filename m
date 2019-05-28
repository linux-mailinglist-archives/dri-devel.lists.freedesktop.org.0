Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114862C353
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395DC89F06;
	Tue, 28 May 2019 09:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B4989F06
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E9D62FB03;
 Tue, 28 May 2019 11:33:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-4oJATyhInW; Tue, 28 May 2019 11:33:00 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3E5DB4930C; Tue, 28 May 2019 11:33:00 +0200 (CEST)
Date: Tue, 28 May 2019 11:33:00 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: [EXT] Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller
 support
Message-ID: <20190528093300.GA5118@bogon.m.sigxcpu.org>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de>
 <20190528013800.GB6885@dragon>
 <20190528070353.GA14871@fsr-ub1664-121>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528070353.GA14871@fsr-ub1664-121>
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudGl1LApPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNzowMzo1NEFNICswMDAwLCBM
YXVyZW50aXUgUGFsY3Ugd3JvdGU6Cj4gSGkgU2hhd24sIEx1Y2FzLAo+IAo+IE9uIFR1ZSwgTWF5
IDI4LCAyMDE5IGF0IDA5OjM4OjAyQU0gKzA4MDAsIFNoYXduIEd1byB3cm90ZToKPiA+IENhdXRp
b246IEVYVCBFbWFpbAo+ID4gCj4gPiBIaSBMdWNhcywKPiA+IAo+ID4gT24gTW9uLCBNYXkgMjcs
IDIwMTkgYXQgMDM6MzY6NTNQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gPiA+IFdlIGhh
dmUgYmVlbiBsb29raW5nIGF0IGhvdyB0byBzdXBwb3J0IERDU1MgaW4gbWFpbmxpbmUgZm9yIGEg
d2hpbGUsCj4gPiA+IGJ1dCBtb3N0IG9mIHRoZSBhY3R1YWwgd29yayBnb3QgcHVzaGVkIGJlaGlu
ZCBpbiBzY2hlZHVsZSBkdWUgdG8gb3RoZXIKPiA+ID4gcHJpb3JpdGllcy4KPiA+IAo+ID4gSSBo
YXZlIHNvbWUgdGltZSB0byBjb250cmlidXRlLiAgV291bGQgeW91IHN1Z2dlc3QgaG93IEkgc2hv
dWxkIGhlbHAKPiA+IGhlcmU/Cj4gPiAKPiA+IDEuIFlvdSBndXlzIGFscmVhZHkgaGF2ZSBzb21l
dGhpbmcgY2xvc2UgdG8gY29tcGxldGlvbiBhbmQgZG8gbm90IG5lZWQKPiA+ICAgIG1vcmUgaGFu
ZHMuCj4gPiAyLiBZb3UgZ3V5cyBhbHJlYWR5IGhhdmUgc29tZSBwcmVsaW1pbmFyeSBjb2RlIGFu
ZCBjYW4gdXNlIGhlbHAgZnJvbQo+ID4gICAgb3RoZXJzLgo+ID4gMy4gWW91IGd1eXMgaGF2ZW4n
dCBnb3QgYW55dGhpbmcgdG8gc3RhcnQgd2l0aCwgYnV0IGp1c3Qgc29tZSBkZXNpZ24KPiA+ICAg
IHByaW5jaXBsZXMgdGhhdCBhbnlvbmUgd2hvIHdhbnRzIHRvIHdvcmsgb24gaXQgc2hvdWxkIGNv
bnNpZGVyLgo+ID4gCj4gPiBXaGljaCBpcyB0aGUgb25lIHRoYXQgeW91IHdhbnQgbWUgdG8gcmVh
ZD8KPiAKPiBXZSdyZSBhbHJlYWR5IHdvcmtpbmcgb24gY2xlYXJpbmcgdXAgdGhlIERDU1MgY29k
ZSBhbmQgcHJlcGFyaW5nIGl0IGZvcgo+IHVwc3RyZWFtaW5nLiBJdCBzaG91bGQgYmUgZG9uZSBp
biB0aGUgZm9sbG93aW5nIHdlZWtzLiBUaGUgcmVhc29uIHdlJ3ZlCj4gYmVlbiBkZWxheWluZyB0
aGlzIGlzIGJlY2F1c2UgbmVpdGhlciBIRE1JIG5vciBNSVBJIHN1cHBvcnQgd2FzIHByZXNlbnQK
PiBhbmQsIHVudGlsIHRoZXNlIGFyZSB1cHN0cmVhbSwgdGVzdGluZyBEQ1NTIHdvdWxkIGJlIHF1
aXRlIGltcG9zc2libGUuCgpNSVBJIHN1cHBvcnQgaXMgaGVyZToKCiAgbWl4ZWw6ICBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4ODE3LwogIG53bDogIGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTc2ODYvCgpUaGUgTldMIGRyaXZlciBu
ZWVkcyB0byBiZSBhZGp1c3RlZCBkZXBlbmRpbmcgb24gd2hldGhlciB3ZSBob29rIGludG8KaW14
LWRpc3BsYXktc3Vic3lzdGVtIG9yIG5vdCAoYW5kIHRoZW4gbGlrZWx5IG1vdmVkIHRvIHRoZSBy
aWdodApzdWJkaXIpLiBDYW4gd2Ugc29tZWhvdyBnZXQgdGhpcyBtb3ZpbmcgaW4gc3luYyAoZXZl
biBpbiBhIG5vbiBwdWJsaWMKdHJlZSBpZiBuZWNlc3NhcnkpLgpDaGVlcnMsCiAtLSBHdWlkbwoK
Cj4gPiA+IE9uZSB0aGluZyBJIGNhbiBjYW4gc2F5IGZvciBjZXJ0YWluIGlzIHRoYXQgRENTUyBz
aG91bGQgbm90IGJlCj4gPiA+IGludGVncmF0ZWQgaW50byBpbXgtZHJtLiBJdCdzIGEgdG90YWxs
eSBkaWZmZXJlbnQgaGFyZHdhcmUgYW5kCj4gPiA+IGRvd25zdHJlYW0gY2xlYXJseSBzaG93cyB0
aGF0IGl0J3Mgbm90IGEgZ29vZCBpZGVhIHRvIGNyYW0gaXQgaW50byBpbXgtCj4gPiA+IGRybS4K
PiA+IAo+ID4gSSBoYXZlbid0IGdvbmUgZGVlcGVyIGludG8gdGhlIHZlbmRvciBjb2RlLCBidXQg
ZnJvbSBhIGJyaWVmIGxvb2tpbmcgSQo+ID4gZGlkbid0IHNlZSBzbyBtYW55IHByb2JsZW1zIHdp
dGggaW50ZWdyYXRpbmcgRENTUyBpbnRvIGlteC1kcm0uICBJdCdzCj4gPiBub3Qgc28gdW5yZWFz
b25hYmxlIHRvIHRha2UgaW14LWRybSBhcyBhbiBpbXgtZGlzcGxheS1zdWJzeXN0ZW0gd2hpY2gK
PiA+IGNhbiBoYXZlIG11bHRpcGxlIENSVENzLiAgU28gY2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRl
IGEgYml0IG9uIHdoeSBpdCdzCj4gPiByZWFsbHkgYSBiYWQgaWRlYT8KPiAKPiBJJ2QgYmUgaW50
ZXJlc3RlZCB0byBoZWFyIGFib3V0IHRoaXMgYXMgd2VsbC4KPiAKPiA+IAo+ID4gPiBBbHNvIHRo
ZSBhcnRpZmljaWFsIHNwbGl0IGJldHdlZW4gaGFyZHdhcmUgY29udHJvbCBpbgo+ID4gPiBkcml2
ZXJzL2dwdS9pbXgvZGNzcyBhbmQgdGhlIERSTSBkcml2ZXIgaXMganVzdCBjYXJnby1jdWx0IGZy
b20gdGhlCj4gPiA+IElQVS9pbXgtZHJtIHNwbGl0LiBGb3IgdGhlIElQVSB3ZSBkaWQgaXQgYXMg
dGhlIElQVSBoYXMgbGVncyBpbiBib3RoCj4gPiA+IERSTSBmb3IgdGhlIG91dHB1dCBwYXJ0cyBh
bmQgVjRMMiBmb3IgdGhlIGlucHV0IHBhcnRzLiBBcyB0aGUgRENTUyBoYXMKPiA+ID4gbm8gdmlk
ZW8gaW5wdXQgY2FwYWJpbGl0aWVzIHRoZSBkcml2ZXIgY291bGQgYmUgc2ltcGxpZmllZCBhIGxv
dCBieQo+ID4gPiBtb3ZpbmcgaXQgYWxsIGludG8gYSBzaW5nbGUgRFJNIGRyaXZlci4KPiA+IAo+
ID4gQWdyZWVkIG9uIHRoaXMuCj4gCj4gSSBhbHNvIGFncmVlIG9uIHRoaXMuIERDU1MgY29yZSBj
b2RlIHdpbGwgcHJvYmFibHkgYmUgbW92ZWQgaW5zaWRlIHRoZQo+IHNhbWUgZGlyZWN0b3J5OiBk
cml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MuCj4gCj4gVGhhbmtzLAo+IGxhdXJlbnRpdQo+IAo+ID4g
Cj4gPiBTaGF3bgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4l
MkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wMiU3QzAxJTdDbGF1cmVudGl1LnBhbGN1
JTQwbnhwLmNvbSU3Q2RhN2U2MmM2YjY5ZjRlMGM4MDA0MDhkNmUzMGQ0ZGZjJTdDNjg2ZWExZDNi
YzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNjk0NjA0MzYxOTczNzEwMyZhbXA7
c2RhdGE9Ym5yOUVKRzV5NEhxciUyRlVUNVQzRWZ2V0lRS0F2a1ZDWkdoZFB3RVBKUU93JTNEJmFt
cDtyZXNlcnZlZD0wCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
