Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3666767A71
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FB1897F5;
	Sat, 13 Jul 2019 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AE3894C5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 12:43:16 +0000 (UTC)
Received: from [167.98.27.226] (helo=[10.35.6.255])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hlutK-0005qb-Ha; Fri, 12 Jul 2019 13:43:10 +0100
Subject: Re: [PATCH v1 03/11] dt-bindings: display/bridge: Add config property
 for ti948
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-4-michael.drake@codethink.co.uk>
 <20190611180710.GT5016@pendragon.ideasonboard.com>
From: Michael Drake <michael.drake@codethink.co.uk>
Message-ID: <80e585a3-222a-5b98-7835-85b721a3beb1@codethink.co.uk>
Date: Fri, 12 Jul 2019 13:43:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190611180710.GT5016@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@lists.codethink.co.uk,
 Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDExLzA2LzIwMTkgMTk6MDcsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gSGkgTWljaGFlbCwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk15IHBsZWFzdXJl
LCBhbmQgdGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2shCgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5
IGF0IDAzOjA0OjA0UE0gKzAxMDAsIE1pY2hhZWwgRHJha2Ugd3JvdGU6Cj4+IFRoZSBjb25maWcg
cHJvcGVydHkgY2FuIGJlIHVzZWQgdG8gcHJvdmlkZSBhbiBhcnJheSBvZgo+PiByZWdpc3RlciBh
ZGRyZXNzZXMgYW5kIHZhbHVlcyB0byBiZSB3cml0dGVuIHRvIGNvbmZpZ3VyZQo+PiB0aGUgZGV2
aWNlIGZvciB0aGUgYm9hcmQuCj4gCj4gUGxlYXNlIGRvbid0LiBEVCBkZXNjcmliZXMgdGhlIGhh
cmR3YXJlIChvciBtb3JlIGFjY3VyYXRlbHkgdGhlIHN5c3RlbSksCj4gaXQncyBub3QgbWVhbnQg
dG8gc3RvcmUgYXJiaXRyYXJ5IGNvbmZpZ3VyYXRpb24gZGF0YS4gQWxsIHRoZSByZWdpc3RlcnMK
PiBzcGVjaWZpZWQgYmVsb3cgc2hvdWxkIGluc3RlYWQgYmUgc2V0IGJ5IHRoZSBkcml2ZXIgYmFz
ZWQgb24gYQo+IGNvbWJpbmF0aW9uIG9mIGhhcmR3YXJlIGRlc2NyaXB0aW9uIGFuZCBpbmZvcm1h
dGlvbiBvYnRhaW5lZCBhdCBydW50aW1lLgoKT0ssIHVuZGVyc3Rvb2QuICBJJ2xsIHdvcmsgb24g
dGhpcy4gIEZvciBzb21lIG9mIHRoZW0KZXhwbGljaXQgZmlybXdhcmUgcHJvcGVydGllcyB3b3Vs
ZCBiZSBhcHByb3ByaWF0ZS4KCkknbGwgZ28gdGhyb3VnaCBpdCB0byBhc2NlcnRhaW4gd2hhdCBj
YW4gYmUgZGV0ZXJtaW5lZAphdCBydW50aW1lLgoKPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBE
cmFrZSA8bWljaGFlbC5kcmFrZUBjb2RldGhpbmsuY28udWs+Cj4+IENjOiBQYXRyaWNrIEdsYXNl
ciA8cGdsYXNlckB0ZXNsYS5jb20+Cj4+IENjOiBOYXRlIENhc2UgPG5jYXNlQHRlc2xhLmNvbT4K
Pj4gLS0tCj4+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ4LnR4dCAg
fCAyMSArKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ4LnR4dAo+PiBpbmRleCBmOWU4
NmNiMjI5MDAuLjFlNzAzM2IwZjNiNyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OC50eHQKPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1
Yjk0OC50eHQKPj4gQEAgLTEyLDYgKzEyLDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPj4gIE9w
dGlvbmFsIHByb3BlcnRpZXM6Cj4+ICAKPj4gIC0gcmVndWxhdG9yczogTGlzdCBvZiByZWd1bGF0
b3IgbmFtZSBzdHJpbmdzIHRvIGVuYWJsZSBmb3Igb3BlcmF0aW9uIG9mIGRldmljZS4KPj4gKy0g
Y29uZmlnOiBMaXN0IG9mIDxyZWdpc3RlciBhZGRyZXNzPiw8dmFsdWU+IHBhaXJzIHRvIGJlIHNl
dCB0byBjb25maWd1cmUKPj4gKyAgZGV2aWNlIG9uIHBvd2VydXAuICBUaGUgcmVnaXN0ZXIgYWRk
cmVzc2VzIGFuZCB2YWx1ZXMgYXJlIDhiaXQuCj4+ICAKPj4gIEV4YW1wbGUKPj4gIC0tLS0tLS0K
Pj4gQEAgLTIxLDQgKzIzLDIzIEBAIHRpOTQ4OiBkczkwdWI5NDhAMCB7Cj4+ICAKPj4gIAlyZWd1
bGF0b3JzOiAidmNjIiwKPj4gIAkgICAgICAgICAgICAidmNjX2Rpc3AiOwo+PiArCWNvbmZpZzoK
Pj4gKwkgICAgICAgIC8qIHNldCBlcnJvciBjb3VudCB0byBtYXggKi8KPj4gKwkgICAgICAgIDww
eDQxPiwgPDB4MWY+LAo+PiArCSAgICAgICAgLyogc2V0cyBvdXRwdXQgbW9kZSwgbm8gY2hhbmdl
IG5vdGljZWQgKi8KPj4gKwkgICAgICAgIDwweDQ5PiwgPDB4ZTA+LAo+PiArCSAgICAgICAgLyog
c3BlZWQgdXAgSTJDLCAweEUgaXMgYXJvdW5kIDQ4MEtIeiAqLwo+PiArCSAgICAgICAgPDB4MjY+
LCA8MHgwZT4sCj4+ICsJICAgICAgICAvKiBzcGVlZCB1cCBJMkMsIDB4RSBpcyBhcm91bmQgNDgw
S0h6ICovCj4+ICsJICAgICAgICA8MHgyNz4sIDwweDBlPiwKPj4gKwkgICAgICAgIC8qIHNldHMg
R1BJTzAgYXMgYW4gaW5wdXQgKi8KPj4gKwkgICAgICAgIDwweDFEPiwgPDB4MTM+LAo+PiArCSAg
ICAgICAgLyogc2V0IEdQSU8yIGhpZ2gsIGJhY2tsaWdodCBQV00gKHNldCB0byAweDUwIGZvciBu
b3JtYWwgdXNlKSAqLwo+PiArCSAgICAgICAgPDB4MUU+LCA8MHg1MD4sCj4+ICsJICAgICAgICAv
KiBzZXRzIEdQSU8zIGFzIGFuIG91dHB1dCB3aXRoIHJlbW90ZSBjb250cm9sIGZvciB0b3VjaCBY
UkVTICovCj4+ICsJICAgICAgICA8MHgxRj4sIDwweDA1PiwKPj4gKwkgICAgICAgIC8qIHNldCBH
UElPNSBoaWdoLCBiYWNrbGlnaHQgZW5hYmxlIG9uIG5ldyBkaXNwbGF5ICovCj4+ICsJICAgICAg
ICA8MHgyMD4sIDwweDA5PiwKPj4gKwkgICAgICAgIC8qIHNldCBHUElPNyBhbmQgR1BJTzggaGln
aCB0byBlbmFibGUgdG91Y2ggcG93ZXIgYW5kIHByb3ggc2Vuc2UgKi8KPj4gKwkgICAgICAgIDww
eDIxPiwgPDB4OTE+Owo+PiAgfTsKPiAKCi0tIApNaWNoYWVsIERyYWtlICAgICAgICAgICAgICAg
ICBodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
