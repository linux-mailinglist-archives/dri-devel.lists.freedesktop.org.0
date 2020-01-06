Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E701320E7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F83789885;
	Tue,  7 Jan 2020 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F516E219
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 09:54:37 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 414202000D;
 Mon,  6 Jan 2020 09:54:33 +0000 (UTC)
Date: Mon, 6 Jan 2020 10:54:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: Add Satoz panel
Message-ID: <20200106105432.0621bc86@xps13>
In-Reply-To: <20200104000957.GA17750@bogus>
References: <20191224141905.22780-1-miquel.raynal@bootlin.com>
 <20191224141905.22780-2-miquel.raynal@bootlin.com>
 <20200104000957.GA17750@bogus>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gRnJpLCAzIEph
biAyMDIwIDE3OjA5OjU3IC0wNzAwOgoKPiBPbiBUdWUsIERlYyAyNCwgMjAxOSBhdCAwMzoxOTow
NFBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gU2F0b3ogaXMgYSBDaGluZXNlIFRG
VCBtYW51ZmFjdHVyZXIuCj4gPiBXZWJzaXRlOiBodHRwOi8vd3d3LnNhdC1zei5jb20vRW5nbGlz
aC9pbmRleC5odG1sCj4gPiAKPiA+IEFkZCAoc2ltcGxlKSBiaW5kaW5ncyBmb3IgaXRzIFNBVDA1
MEFUNDBIMTJSMiA1LjAgaW5jaCBMQ0QgcGFuZWwuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+IAo+ID4g
Q2hhbmdlcyBzaW5jZSB2MjoKPiA+ICogTm9uZS4KPiA+IAo+ID4gQ2hhbmdlcyBzaW5jZSB2MToK
PiA+ICogTmV3IHBhdGNoCj4gPiAKPiA+ICAuLi4vZGlzcGxheS9wYW5lbC9zYXRveixzYXQwNTBh
dDQwaDEycjIueWFtbCAgfCAyNyArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2F0b3osc2F0MDUwYXQ0MGgxMnIy
LnlhbWwgIAo+IAo+IE5vdGUgdGhhdCB0aGlzIG1heSBiZWNvbWUgb2Jzb2xldGUgaWYgd2UgbW92
ZSBhbGwgc2ltcGxlIHBhbmVscyB0byBhIAo+IHNpbmdsZSBzY2hlbWEuCgpBYnNvbHV0ZWx5LgoK
PiAKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3NhdG96LHNhdDA1MGF0NDBoMTJyMi55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2F0b3osc2F0MDUwYXQ0MGgxMnIy
LnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU2
N2IzMmE1NDRmMwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2F0b3osc2F0MDUwYXQ0MGgxMnIyLnlhbWwK
PiA+IEBAIC0wLDAgKzEsMjcgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3NhdG96LHNhdDA1MGF0NDBoMTJyMiMgIAo+IAo+IE1p
c3NpbmcgJy55YW1sJwo+IAo+IFJ1biAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyB3aGljaCB3aWxs
IGNoZWNrIHRoaXMgYW5kIG90aGVyIHRoaW5ncy4KClJpZ2h0LCBjb3JyZWN0ZWQuCgo+IAo+ID4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
ID4gKwo+ID4gK3RpdGxlOiBTYXRveiBTQVQwNTBBVDQwSDEyUjIgcGFuZWwKPiA+ICsKPiA+ICtt
YWludGFpbmVyczoKPiA+ICsgIC0gVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbT4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfCsKPiA+ICsgIExDRCA1LjAgaW5jaCA4MDB4
NDgwIFJHQiBwYW5lbC4gIAo+IAo+IEFueSBwdWJsaWMgc3BlYyBmb3IgdGhpcyBwYW5lbD8KClVu
Zm9ydHVuYXRlbHksIG5vLiBJIG1lbnRpb25lZCBpdCBpbiB0aGUgdjMuCgo+IAo+ID4gKwo+ID4g
KyAgVGhpcyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRp
bmcsIHdoaWNoIGlzIHNwZWNpZmllZAo+ID4gKyAgaW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlz
IGRpcmVjdG9yeS4KPiA+ICsKPiA+ICthbGxPZjoKPiA+ICsgIC0gJHJlZjogcGFuZWwtY29tbW9u
LnlhbWwjCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAg
IGNvbnRhaW5zOiAgCj4gCj4gRHJvcCAnY29udGFpbnMnLiBJdCBtdXN0IGJlIGV4YWN0bHkgdGhl
IGJlbG93IHN0cmluZywgbm90IHRoZSBiZWxvdyAKPiBzdHJpbmcgYW5kICphbnkqIG90aGVyIHN0
cmluZ3MuCgpPay4KCj4gCj4gPiArICAgICAgY29uc3Q6IHNhdG96LHNhdDA1MGF0NDBoMTJyMgo+
ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiAtLSAKPiA+IDIuMjAu
MQo+ID4gICAKClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
