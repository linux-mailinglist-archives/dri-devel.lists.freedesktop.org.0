Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C5D21708
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 12:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CD6898BE;
	Fri, 17 May 2019 10:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875E2898BE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 10:37:51 +0000 (UTC)
Received: from we0524.dip.tu-dresden.de ([141.76.178.12] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hRaFG-0001Rc-81; Fri, 17 May 2019 12:37:46 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: add #cooling-cells property to
 the ARM Mali Midgard GPU binding
Date: Fri, 17 May 2019 12:37:45 +0200
Message-ID: <13349008.xMc91k09bk@phil>
In-Reply-To: <CAD=FV=UQcv1+HC2eAk2ctBofufCi9-VvWc+OnY0mtBw3L-YG+Q@mail.gmail.com>
References: <20190516172510.181473-1-mka@chromium.org>
 <CAD=FV=UQcv1+HC2eAk2ctBofufCi9-VvWc+OnY0mtBw3L-YG+Q@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgMTYuIE1haSAyMDE5LCAxOTo0MDozOCBDRVNUIHNjaHJpZWIgRG91ZyBB
bmRlcnNvbjoKPiBIaSwKPiAKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMDoyNSBBTSBNYXR0
aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gCj4gPiBUaGUgR1BVIGNh
biBiZSB1c2VkIGFzIGEgdGhlcm1hbCBjb29saW5nIGRldmljZSwgYWRkIGFuIG9wdGlvbmFsCj4g
PiAnI2Nvb2xpbmctY2VsbHMnIHByb3BlcnR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRo
aWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYy
Ogo+ID4gLSBwYXRjaCBhZGRlZCB0byB0aGUgc2VyaWVzCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0IHwgMyArKysK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdh
cmQudHh0Cj4gPiBpbmRleCAxOGEyY2RlMmU1ZjMuLjYxZmQ0MWEyMGY5OSAxMDA2NDQKPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2Fy
ZC50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktbWlkZ2FyZC50eHQKPiA+IEBAIC0zNyw2ICszNyw4IEBAIE9wdGlvbmFsIHByb3BlcnRp
ZXM6Cj4gPiAgLSBvcGVyYXRpbmctcG9pbnRzLXYyIDogUmVmZXIgdG8gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL29wcC9vcHAudHh0Cj4gPiAgICBmb3IgZGV0YWlscy4KPiA+Cj4g
PiArLSAjY29vbGluZy1jZWxsczogUmVmZXIgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RoZXJtYWwvdGhlcm1hbC50eHQKPiA+ICsgIGZvciBkZXRhaWxzLgo+ID4KPiA+ICBF
eGFtcGxlIGZvciBhIE1hbGktVDc2MDoKPiA+Cj4gPiBAQCAtNTEsNiArNTMsNyBAQCBncHVAZmZh
MzAwMDAgewo+ID4gICAgICAgICBtYWxpLXN1cHBseSA9IDwmdmRkX2dwdT47Cj4gPiAgICAgICAg
IG9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmdwdV9vcHBfdGFibGU+Owo+ID4gICAgICAgICBwb3dl
ci1kb21haW5zID0gPCZwb3dlciBSSzMyODhfUERfR1BVPjsKPiA+ICsgICAgICAgI2Nvb2xpbmct
Y2VsbHMgPSA8Mj47Cj4gPiAgfTsKPiAKPiBZb3Ugd2lsbCBjb25mbGljdCB3aXRoIGQ1ZmYxYWRi
MzgwOSAoImR0LWJpbmRpbmdzOiBncHU6IG1hbGktbWlkZ2FyZDoKPiBBZGQgcmVzZXRzIHByb3Bl
cnR5IiksIGJ1dCBpdCdzIGVhc3kgdG8gcmViYXNlLiAgSSdsbCBsZWF2ZSBpdCB0bwo+IHdob2V2
ZXIgaXMgZ29pbmcgdG8gbGFuZCB0aGlzIHRvIGRlY2lkZSBpZiB0aGV5IHdvdWxkIGxpa2UgeW91
IHRvCj4gcmUtcG9zdCBvciBpZiB0aGV5IGNhbiBoYW5kbGUgcmVzb2x2aW5nIHRoZSBjb25mbGlj
dCB0aGVtc2VsdmVzLgo+ICtLZXZpbiB3aG8gYXBwZWFycyB0byBiZSB0aGUgb25lIHdobyBsYW5k
ZWQgdGhlIGNvbmZsaWN0aW5nIGNvbW1pdC4KCk5vIHByb2JsZW0sIEkgY2FuIHVwZGF0ZSB0aGlz
IGNvbW1lbnQgd2hlbiBhcHBseWluZwoobGlrZWx5IHRvIGRybS1taXNjIHRvIG5vdCBjcmVhdGUg
bW9yZSBjb25mbGljdHMpLApidXQgd2lsbCBnaXZlIFJvYiBhIGJpdCBtb3JlIHRpbWUgdG8gcG9z
c2libHkgb2JqZWN0IDotKQoKW3NvbWV3aGVyZSBpbiB0aGUgcmVjZW50IHBhc3QsIGhlIHNhaWQg
dG8gbm90IHdhaXQgb24gaGltIG9uIHRoZSB0aW55CnByb3BlcnR5LWFkZGl0aW9ucywgYW5kIGNv
b2xpbmctY2VsbHMgaXMgcHJldHR5IHdlbGwgdXNlZCBvbmUgYXQgdGhhdF0KCgo+IFdpdGggdGhh
dDoKPiAKPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
