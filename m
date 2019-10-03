Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F0CB54D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872516EAC7;
	Fri,  4 Oct 2019 07:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3310E6E132
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:04:25 +0000 (UTC)
Received: from [199.195.250.187] (port=36041 helo=hermes.aosc.io)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iG0mG-0003Lf-AW; Thu, 03 Oct 2019 14:04:20 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 6FBCB8236F;
 Thu,  3 Oct 2019 13:04:12 +0000 (UTC)
Date: Thu, 03 Oct 2019 21:04:03 +0800
In-Reply-To: <20191003114733.56mlar666l76uoyb@gilmour>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-5-jagan@amarulasolutions.com>
 <20191003114733.56mlar666l76uoyb@gilmour>
MIME-Version: 1.0
Subject: Re: [PATCH v11 4/7] dt-bindings: sun6i-dsi: Add VCC-DSI supply
 property
To: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <0086CD40-F161-4B33-8D76-8DCA20E7DB07@aosc.io>
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 michael@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAxOeW5tDEw5pyIM+aXpSBHTVQrMDg6MDAg5LiL5Y2INzo0NzozMywgTWF4aW1lIFJp
cGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPiDlhpnliLA6Cj5PbiBUaHUsIE9jdCAwMywgMjAxOSBh
dCAxMjoxNToyNFBNICswNTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+PiBBbGx3aW5uZXIgTUlQSSBE
U0kgY29udHJvbGxlcnMgYXJlIHN1cHBsaWVkIHdpdGggU29DIERTSQo+PiBwb3dlciByYWlscyB2
aWEgVkNDLURTSSBwaW4uCj4+Cj4+IFNvbWUgYm9hcmQgc3RpbGwgd29yayB3aXRob3V0IHN1cHBs
eWluZyB0aGlzIGJ1dCBnaXZlIG1vcmUKPj4gZmFpdGggb24gZGF0YXNoZWV0IGFuZCBoYXJkd2Fy
ZSBzY2hlbWF0aWNzIGFuZCBkb2N1bWVudCB0aGlzCj4+IHN1cHBseSBwcm9wZXJ0eSBpbiByZXF1
aXJlZCBwcm9wZXJ0eSBsaXN0Lgo+Pgo+PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPj4gVGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJsaWpuQHdpenp1cC5v
cmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+PiAtLS0KPj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEt
bWlwaS1kc2kueWFtbCAgICAgICAgIHwgMwo+KysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQKPmEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sCj5iL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEt
bWlwaS1kc2kueWFtbAo+PiBpbmRleCA0Nzk1MGZjZWQyOGQuLjlkNGMyNWIxMDRmNiAxMDA2NDQK
Pj4gLS0tCj5hL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdp
bm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFtbAo+PiArKysKPmIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1s
Cj4+IEBAIC0zNiw2ICszNiw5IEBAIHByb3BlcnRpZXM6Cj4+ICAgIHJlc2V0czoKPj4gICAgICBt
YXhJdGVtczogMQo+Pgo+PiArICB2Y2MtZHNpLXN1cHBseToKPj4gKyAgICBkZXNjcmlwdGlvbjog
VkNDLURTSSBwb3dlciBzdXBwbHkgb2YgdGhlIERTSSBlbmNvZGVyCj4+ICsKPgo+VGhlIGRyaXZl
ciB0cmVhdHMgaXQgYXMgbWFuZGF0b3J5LCBzbyBJJ3ZlIGFkZGVkIGl0IHRvIHRoZSBiaW5kaW5n
LCBhcwo+c3VnZ2VzdGVkIGJ5IHRoZSBjb21taXQgbG9nLgoKTm8uIFRoZSByZWd1bGF0b3JfZ2V0
IGZ1bmN0aW9uIHdpbGwgcmV0dXJuIGR1bW15IHJlZ3VsYXRvciwgcmF0aGVyIHRoYW4KZmFpbCwg
aWYgdGhlIHJlZ3VsYXRvciBpcyBub3Qgc3BlY2lmaWVkLgoKPgo+TWF4aW1lCgotLSAK5L2/55So
IEstOSBNYWlsIOWPkemAgeiHquaIkeeahEFuZHJvaWTorr7lpIfjgIIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
