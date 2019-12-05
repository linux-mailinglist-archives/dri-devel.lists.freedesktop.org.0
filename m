Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B56113DA6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDCD6E995;
	Thu,  5 Dec 2019 09:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498226F60B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 09:18:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB59HxAX042783;
 Thu, 5 Dec 2019 03:17:59 -0600
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB59Hx3k025565;
 Thu, 5 Dec 2019 03:17:59 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 03:17:57 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 03:17:57 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB59Hrh8023911;
 Thu, 5 Dec 2019 03:17:55 -0600
Subject: Re: [PATCH 2/2] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <cover.1575481630.git.jsarha@ti.com>
 <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
 <20191205084626.GB4734@pendragon.ideasonboard.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6f1d616d-e471-5175-c291-034d6afe7509@ti.com>
Date: Thu, 5 Dec 2019 11:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205084626.GB4734@pendragon.ideasonboard.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575537479;
 bh=twH5nXu7lsQ9zBEHwt/3LsBFeRUyBY49DIchsv7HVFo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=m8rGFEhRd9DVEQ8ZWrG6q5r4n9qQmseX1KM53vYU0+cHVi/fMTyrItX2KTZ1DSQMK
 TtNt9iEKkIK/vt02xvzk/4PoAS5cWpbudhk1lcA94Jt5MzzE4fY9dPwbJodOPFRz/w
 rJXaQbFc22esEmkrHfANyFDS0b5zykojLnJyXKJ4=
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
Cc: devicetree@vger.kernel.org, tony@atomide.com, tomi.valkeinen@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMTIvMjAxOSAxMDo0NiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBKeXJpLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFdlZCwgRGVjIDA0LCAyMDE5IGF0
IDA3OjUzOjExUE0gKzAyMDAsIEp5cmkgU2FyaGEgd3JvdGU6Cj4+IFRoZSAidGksdGlsY2RjLHBh
bmVsIiBiaW5kaW5nIHNob3VsZCBub3QgYmUgdXNlZCBhbnltb3JlLCBzaW5jZSB0aWxjZGMKPj4g
aXMgZnVsbHkgY2FwYWJsZSBvZiB1c2luZyBnZW5lcmljIGRybSBwYW5lbHMgbGlrZSBwYW5lbC1z
aW1wbGUgYW5kCj4+IHBhbmVsLWNvbW1vbiBiaW5kaW5nLiBIb3dldmVyLCB0aGUgb2Jzb2xldGUg
YmluZGluZyBpcyBzdGlsbCB3aWRlbHkKPj4gdXNlZCBpbiBtYW55IG1haW5saW5lIHN1cHBvcnRl
ZCBwbGF0Zm9ybXMgdGhhdCBJIGRvIG5vdCBoYXZlIGFjY2VzcyB0bwo+PiBhbmQgd2hvIGtub3dz
IGhvdyBtYW55IGN1c3RvbSBwbGF0Zm9ybXMuIFNvIEkgYW0gYWZyYWlkIHdlIGhhdmUgdG8KPj4g
a2VlcCB0aGUgb2xkIGJ1bmRsZWQgdGlsY2RjIHBhbmVsIGRyaXZlciBhcm91bmQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4+IC0tLQo+PiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4dCB8IDYg
KysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFu
ZWwudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2Rj
L3BhbmVsLnR4dAo+PiBpbmRleCA4MDgyMTYzMTBlYTIuLjU0OTYzZjkxNzNjYyAxMDA2NDQKPj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3Bh
bmVsLnR4dAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS90aWxjZGMvcGFuZWwudHh0Cj4+IEBAIC0xLDUgKzEsMTEgQEAKPj4gIERldmljZS1UcmVlIGJp
bmRpbmdzIGZvciB0aWxjZGMgRFJNIGdlbmVyaWMgcGFuZWwgb3V0cHV0IGRyaXZlcgo+PiAgCj4+
ICtOT1RFOiBUaGlzIGJpbmRpbmcgKGFuZCB0aGUgcmVsYXRlZCBkcml2ZXIpIGlzIG9ic29sZXRl
IGFuZCBzaG91bGQgbm90Cj4+ICsgICAgICBiZSB1c2VkIGFueW1vcmUuIFBsZWFzZSByZWZlciB0
byBkcm0gcGFuZWwtY29tbW9uIGJpbmRpbmcgKGFuZAo+PiArICAgICAgdG8gYSBnZW5lcmljIGRy
bSBwYW5lbCBkcml2ZXIgbGlrZSBwYW5lbC1zaW1wbGUpLgo+PiArICAgICAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnlhbWwKPj4g
KyAgICAgIChkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMpCj4+ICsKPiAKPiBI
b3cgYWJvdXQgYWRkaW5nIGEgV0FSTl9PTigpIGluIHRoZSBjb2RlIHdoZW4gdGhpcyBiaW5kaW5n
IGlzIHVzZWQgPwo+IFRoaXMgY291bGQgaGVscCBnZXR0aW5nIHRob3NlIHBsYXRmb3JtcyBjb252
ZXJ0ZWQuCj4gCgpJIGRvbid0IHNlZSB3aHkgbm90LCBJJ2xsIGFkZCB0aGF0LgoKVGhhbmtzCkp5
cm8KCj4+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+PiAgIC0gY29tcGF0aWJsZTogdmFsdWUgc2hv
dWxkIGJlICJ0aSx0aWxjZGMscGFuZWwiLgo+PiAgIC0gcGFuZWwtaW5mbzogY29uZmlndXJhdGlv
biBpbmZvIHRvIGNvbmZpZ3VyZSBMQ0RDIGNvcnJlY3RseSBmb3IgdGhlIHBhbmVsCj4gCgoKLS0g
ClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhl
bHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWlj
aWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
