Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F52892B5
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 18:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D516E38A;
	Sun, 11 Aug 2019 16:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6286E38A
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 16:56:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 83BEF803BA;
 Sun, 11 Aug 2019 18:55:59 +0200 (CEST)
Date: Sun, 11 Aug 2019 18:55:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
Message-ID: <20190811165558.GE14660@ravnborg.org>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190810231048.1921-4-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=gEfo2CItAAAA:8 a=BV6WD_pGniE4cI7BCpoA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCk15IG1ldGEtc2NoZW1hcyBmb28gaXMgdmVyeSBsaW1pdGVkLCBidXQgSSBu
b3RpY2VkIGEgZmV3IHRoaW5ncy4KSG9wZWZ1bGx5IFJvYiBmaW5kcyB0aW1lIHNvb24gdG8gcmV2
aWV3LgoKCVNhbQoKT24gU3VuLCBBdWcgMTEsIDIwMTkgYXQgMDI6MTA6NDJBTSArMDMwMCwgTGF1
cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgTkVDIE5MODA0OEhMMTEgaXMgYSAxMC40Y20gV1ZH
QSAoODAweDQ4MCkgcGFuZWwgd2l0aCBhIDI0LWJpdCBSR0IKPiBwYXJhbGxlbCBkYXRhIGludGVy
ZmFjZSBhbmQgYW4gU1BJIGNvbnRyb2wgaW50ZXJmYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0K
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+IAo+IC0gQ29udmVydCB0byBZQU1MCj4gLS0tCj4gIC4uLi9k
aXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwgICAgICAgICB8IDQ5ICsrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L25lYyxubDgwNDhobDExLnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbmVjLG5sODA0OGhsMTEueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDEx
LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2MzZDQw
OTc1ODI4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwKPiBAQCAtMCwwICsxLDQ5
IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArJVlBTUwgMS4yCj4g
Ky0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwv
bmVjLG5sODA0OGhsMTEueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogTkVDIE5MODA0OEhMMTEgNC4xIiBX
VkdBIFRGVCBMQ0QgcGFuZWwKPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFRoZSBORUMgTkw4MDQ4
SEwxMSBpcyBhIDQuMSIgV1ZHQSBURlQgTENEIHBhbmVsIHdpdGggYSAyNC1iaXQgUkdCIHBhcmFs
bGVsCj4gKyAgZGF0YSBpbnRlcmZhY2UgYW5kIGFuIFNQSSBjb250cm9sIGludGVyZmFjZS4KPiAr
Cj4gK21haW50YWluZXJzOgo+ICsgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiBwYW5lbC1jb21t
b24ueWFtbCMKSSAqdGhpbmsqIHdlIGFyZSBtaXNzaW5nIGEgcmVmZXJlbmNlIHRvIHNwaS1jb250
cm9sbGVyLnlhbWwgaGVyZS4KCgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+
ICsgICAgY29uc3Q6IG5lYyxubDgwNDhobDExCj4gKwo+ICsgIGxhYmVsOiB0cnVlCj4gKyAgcmVz
ZXQtZ3Bpb3M6IHRydWUKPiArICBwb3J0OiB0cnVlCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNv
bXBhdGlibGUKPiArICAtIHJlc2V0LWdwaW9zCj4gKyAgLSBwb3J0Cj4gKwo+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgbGNkX3Bh
bmVsOiBwYW5lbCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAibmVjLG5sODA0OGhsMTEiOwo+ICsg
ICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMD47Ck5vdCBzdXJlLCBidXQgc2hvdWxk
IHRoZXJlIGJlIGEgcmVnIHByb3BlcnR5IGhlcmUgZm9yIHNwaSB0b28/Cgo+ICsKPiArICAgICAg
cmVzZXQtZ3Bpb3MgPSA8JmdwaW83IDcgR1BJT19BQ1RJVkVfTE9XPjsKPiArCj4gKyAgICAgIHBv
cnQgewo+ICsgICAgICAgIGxjZF9pbjogZW5kcG9pbnQgewo+ICsgICAgICAgICAgcmVtb3RlLWVu
ZHBvaW50ID0gPCZkcGlfb3V0PjsKPiArICAgICAgICB9Owo+ICsgICAgICB9Owo+ICsgICAgfTsK
PiArCj4gKy4uLgo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
