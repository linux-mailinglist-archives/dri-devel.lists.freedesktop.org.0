Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345B4D45A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 18:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4096E5D6;
	Thu, 20 Jun 2019 16:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB7C6E5D6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 16:56:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 5FE2B26A371
Message-ID: <385c93321be1ec5875769d1a825d0fcd44677959.camel@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: rockchip: document VOP gamma
 LUT address
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jun 2019 13:56:23 -0300
In-Reply-To: <CAD=FV=UpZAjrWkQ7qj5Wo2tf2wkg5Q-34Sun0MOtYLBAwY731Q@mail.gmail.com>
References: <20190618213406.7667-1-ezequiel@collabora.com>
 <20190618213406.7667-2-ezequiel@collabora.com>
 <CAD=FV=UpZAjrWkQ7qj5Wo2tf2wkg5Q-34Sun0MOtYLBAwY731Q@mail.gmail.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip
 SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA2LTIwIGF0IDA5OjQzIC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+
IEhpLAo+IAo+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDI6NDMgUE0gRXplcXVpZWwgR2FyY2lh
IDxlemVxdWllbEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+IEFkZCB0aGUgcmVnaXN0ZXIgc3Bl
Y2lmaWVyIGRlc2NyaXB0aW9uIGZvciBhbgo+ID4gb3B0aW9uYWwgZ2FtbWEgTFVUIGFkZHJlc3Mu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFi
b3JhLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tj
aGlwLXZvcC50eHQgICAgICAgICB8IDEwICsrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12
b3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2No
aXAvcm9ja2NoaXAtCj4gPiB2b3AudHh0Cj4gPiBpbmRleCA0ZjU4YzVhMmQxOTUuLjk3YWQ3OGNj
N2UwMyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQKPiA+
IEBAIC0yMCw2ICsyMCwxMyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAg
ICAgICJyb2NrY2hpcCxyazMyMjgtdm9wIjsKPiA+ICAgICAgICAgICAgICAgICAicm9ja2NoaXAs
cmszMzI4LXZvcCI7Cj4gPiAKPiA+ICstIHJlZzogTXVzdCBjb250YWluIG9uZSBlbnRyeSBjb3Jy
ZXNwb25kaW5nIHRvIHRoZSBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aAo+ID4gKyAgICAgICBvZiB0
aGUgcmVnaXN0ZXIgc3BhY2UuIENhbiBvcHRpb25hbGx5IGNvbnRhaW4gYSBzZWNvbmQgZW50cnkK
PiA+ICsgICAgICAgY29ycmVzcG9uZGluZyB0byB0aGUgQ1JUQyBnYW1tYSBMVVQgYWRkcmVzcy4K
PiA+ICsKPiA+ICstIHJlZy1uYW1lczogImJhc2UiIGZvciB0aGUgYmFzZSByZWdpc3RlciBzcGFj
ZS4gSWYgcHJlc2VudCwgdGhlIENSVEMKPiA+ICsgICAgICAgZ2FtbWEgTFVUIG5hbWUgc2hvdWxk
IGJlICJsdXQiLgo+IAo+IEFzIHBlciBSb2IgSGVycmluZywgY3VycmVudCBzdWdnZXN0aW9uIGlz
IHRvIGF2b2lkIHJlZy1uYW1lcyB3aGVuCj4gcG9zc2libGUuICBUaGUgY29kZSBzaG91bGQganVz
dCBsb29rIGZvciB0aGUgcHJlc2VuY2Ugb2YgYSAybmQgZW50cnkKPiBhbmQgYXNzdW1lIHRoYXQg
aWYgaXQncyB0aGVyZSB0aGF0IGl0J3MgdGhlIGx1dCByYW5nZS4gIEZ1bGwgY29udGV4dDoKPiAK
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FMX0pzcStNTXVubVZXcWVXOXYyUnl6
c01LUCs9a016ZVRITk1HNEpESE03RnkwSEJnQG1haWwuZ21haWwuY29tLwo+IAoKT2gsIHRoYXQn
cyBuZXdzIHRvIG1lLiBJIHdhcyBhc3N1bWluZyBoYXZpbmcgcmVnLW5hbWVzIHdhcyBwcmVmZXJy
ZWQuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgSSdsbCBzZW5kIGEgbmV3IHZlcnNpb24uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
