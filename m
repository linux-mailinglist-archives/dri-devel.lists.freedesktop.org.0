Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A8B6F39
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 00:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3753D7AA99;
	Wed, 18 Sep 2019 22:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103D07AAAC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 22:09:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [62.28.174.186])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5956D325;
 Thu, 19 Sep 2019 00:08:59 +0200 (CEST)
Date: Thu, 19 Sep 2019 01:08:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190918220849.GA10104@pendragon.ideasonboard.com>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906135436.10622-2-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568844539;
 bh=HcauoKt1vq8jCosZ7BbCDgBKH/ZpL1vJfjx1ykYzFxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PzmVX48AsV5HGYshrcWk1ifMgVw7JS7T6nF0dUGR9i3uMhef013eosvBslnPD+GHi
 MVySJj/QqZOyO3z4hewPIKvkZ7MIxQmhvBHObpAUnyedTVGw36c1OBobX4HwZxUjjT
 JYejYHasiTh+lopTSJVsrTbUnWoKHMdK9ZkbvyTg=
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie, mark.rutland@arm.com,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 robh+dt@kernel.org, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, Harsha.ManjulaMallikarjun@in.bosch.com,
 uli+renesas@fpond.eu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBGcmksIFNlcCAwNiwgMjAx
OSBhdCAwMzo1NDoyOFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIGRldmljZSB0
cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFItQ2FyIERpc3BsYXkK
PiBVbml0IENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlLgo+IAo+IENNTSBpcyB0aGUgaW1hZ2UgZW5o
YW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCj4gY2hhbm5l
bCBvbiBSLUNhciBHZW4yIGFuZCBHZW4zIFNvQ3MgKFYzSCBhbmQgVjNNIGV4Y2x1ZGVkKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+
CgpXaXRoIHRoZSBzbWFsbCBpc3N1ZXMgcG9pbnRlZCBvdXQgYnkgS2llcmFuIGFuZCBSb2IgZml4
ZWQsCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgoKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0u
eWFtbCAgICAgICAgIHwgNjQgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NjQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbAo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxj
bW0ueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi45ZTU5
MjI2ODljZDcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbAo+IEBAIC0wLDAgKzEsNjQgQEAKPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICslWUFNTCAxLjIKPiArLS0tCj4g
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9yZW5lc2FzLGNtbS55
YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMKPiArCj4gK3RpdGxlOiBSZW5lc2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxl
IChDTU0pCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiArICAtIEtpZXJhbiBCaW5naGFtIDxraWVy
YW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gKyAgLSBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfCsKPiArICBS
ZW5lc2FzIFItQ2FyIGNvbG9yIG1hbmFnZW1lbnQgbW9kdWxlIGNvbm5lY3RlZCB0byBSLUNhciBE
VSB2aWRlbyBjaGFubmVscy4KPiArICBJdCBwcm92aWRlcyBpbWFnZSBlbmhhbmNlbWVudCBmdW5j
dGlvbnMgc3VjaCBhcyAxLUQgbG9vay11cCB0YWJsZXMgKExVVCksCj4gKyAgMy1EIGxvb2stdXAg
dGFibGVzIChDTVUpLCAxRC1oaXN0b2dyYW0gZ2VuZXJhdGlvbiAoSEdPKSwgYW5kIGNvbG9yCj4g
KyAgc3BhY2UgY29udmVyc2lvbiAoQ1NDKS4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0
aWJsZToKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGVudW06Cj4gKyAgICAgICAgLSByZW5lc2Fz
LHI4YTc3OTUtY21tCj4gKyAgICAgICAgLSByZW5lc2FzLHI4YTc3OTYtY21tCj4gKyAgICAgICAg
LSByZW5lc2FzLHI4YTc3OTY1LWNtbQo+ICsgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk5MC1jbW0K
PiArICAgICAgICAtIHJlbmVzYXMscjhhNzc5OTUtY21tCj4gKyAgICAgIC0gZW51bToKPiArICAg
ICAgICAtIHJlbmVzYXMscmNhci1nZW4zLWNtbQo+ICsgICAgICAgIC0gcmVuZXNhcyxyY2FyLWdl
bjItY21tCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tzOgo+ICsg
ICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgcmVzZXRzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4g
KyAgcG93ZXItZG9tYWluczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICtyZXF1aXJlZDoKPiAr
ICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gY2xvY2tzCj4gKyAgLSByZXNldHMKPiAr
ICAtIHBvd2VyLWRvbWFpbnMKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsK
PiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
cjhhNzc5Ni1jcGctbXNzci5oPgo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL3I4
YTc3OTYtc3lzYy5oPgo+ICsKPiArICAgIGNtbTA6IGNtbUBmZWE0MDAwMCB7Cj4gKyAgICAgICAg
IGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2LWNtbSI7Cj4gKyAgICAgICAgIHJlZyA9IDww
IDB4ZmVhNDAwMDAgMCAweDEwMDA+Owo+ICsgICAgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNj
IFI4QTc3OTZfUERfQUxXQVlTX09OPjsKPiArICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01P
RCA3MTE+Owo+ICsgICAgICAgICByZXNldHMgPSA8JmNwZyA3MTE+Owo+ICsgICAgfTsKCi0tIApS
ZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
