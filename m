Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBF104C8B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F466EB2A;
	Thu, 21 Nov 2019 07:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19EE6EB2A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:29:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id DD3A028DB43
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: display: add IMX MIPI DSI host
 controller doc
In-Reply-To: <e19aca1f-842d-a5b4-6fc1-02f7f6dd136d@baylibre.com>
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-5-adrian.ratiu@collabora.com>
 <e19aca1f-842d-a5b4-6fc1-02f7f6dd136d@baylibre.com>
Date: Thu, 21 Nov 2019 09:29:39 +0200
Message-ID: <87a78p7km4.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
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
Cc: Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBOb3YgMjAxOSwgTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPiAKd3JvdGU6Cj4gSGksIAo+IAo+IE9uIDE4LzExLzIwMTkgMTY6MjUsIEFkcmlhbiBSYXRp
dSB3cm90ZTogCj4gCj4gQSBzbWFsbCBjb21taXQgbG9nIHdvdWxkIGJlIHdlbGNvbWUgaGVyZS4g
Cj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNqb2VyZCBTaW1vbnMgPHNqb2VyZC5zaW1vbnNAY29sbGFi
b3JhLmNvbT4gCj4+IFNpZ25lZC1vZmYtYnk6IE1hcnR5biBXZWxjaCA8bWFydHluLndlbGNoQGNv
bGxhYm9yYS5jb20+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUmF0aXUgPGFkcmlhbi5yYXRp
dUBjb2xsYWJvcmEuY29tPiAtLS0gCj4+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1k
c2kudHh0ICAgICAgICAgfCA1NiAKPj4gICsrKysrKysrKysrKysrKysrKysgMSBmaWxlIGNoYW5n
ZWQsIDU2IGluc2VydGlvbnMoKykgY3JlYXRlIAo+PiAgbW9kZSAxMDA2NDQgCj4+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0IAo+PiAg
ZGlmZiAtLWdpdCAKPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9pbXgvbWlwaS1kc2kudHh0IAo+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2lteC9taXBpLWRzaS50eHQgCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4
IDAwMDAwMDAwMDAwMC4uM2YwNWMzMmVmOTYzIC0tLSAKPj4gL2Rldi9udWxsICsrKyAKPj4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0
IAo+IAo+IE5ldyBiaW5kaW5ncyBzaG91bGQgdXNlIHRoZSB5YW1sIGR0LXNjaGVtYSBmb3JtYXQs
IGNvdWxkIHlvdSAKPiBjb252ZXJ0IGl0ID8KClllcywgSSB3aWxsIGNvbnZlcnQgdG8geWFtbCBh
bmQgYWRkIGEgY29tbWl0IGxvZyBpbiB0aGUgbmV4dCAKdmVyc2lvbi4KCldpbGwgbGVhdmUgdGhl
IGN1cnJlbnQgcGF0Y2hlcyBhIGxpdHRsZSBtb3JlIG9uIHJldmlldyB0byBnaXZlIApvdGhlcnMg
YSBjaGFuY2UgdG8gc2VlIHRoZW0uCgpUaGFuayB5b3UhCgo+Cj4gTmVpbAo+Cj4+IEBAIC0wLDAg
KzEsNTYgQEAKPj4gK0ZyZWVzY2FsZSBpLk1YNiBEVyBNSVBJIERTSSBIb3N0IENvbnRyb2xsZXIK
Pj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gKwo+PiAr
VGhlIERTSSBob3N0IGNvbnRyb2xsZXIgaXMgYSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJ
IHYxLjAxIElQCj4+ICt3aXRoIGEgY29tcGFuaW9uIFBIWSBJUC4KPj4gKwo+PiArVGhlc2UgRFQg
YmluZGluZ3MgZm9sbG93IHRoZSBTeW5vcHN5cyBEVyBNSVBJIERTSSBiaW5kaW5ncyBkZWZpbmVk
IGluCj4+ICtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
ZHdfbWlwaV9kc2kudHh0IHdpdGgKPj4gK3RoZSBmb2xsb3dpbmcgZGV2aWNlLXNwZWNpZmljIHBy
b3BlcnRpZXMuCj4+ICsKPj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+ICsKPj4gKy0gI2FkZHJl
c3MtY2VsbHM6IFNob3VsZCBiZSA8MT4uCj4+ICstICNzaXplLWNlbGxzOiBTaG91bGQgYmUgPDA+
Lgo+PiArLSBjb21wYXRpYmxlOiAiZnNsLGlteDZxLW1pcGktZHNpIiwgInNucHMsZHctbWlwaS1k
c2kiLgo+PiArLSByZWc6IFNlZSBkd19taXBpX2RzaS50eHQuCj4+ICstIGludGVycnVwdHM6IFRo
ZSBjb250cm9sbGVyJ3MgQ1BVIGludGVycnVwdC4KPj4gKy0gY2xvY2tzLCBjbG9jay1uYW1lczog
UGhhbmRsZXMgdG8gdGhlIGNvbnRyb2xsZXIncyBwbGwgcmVmZXJlbmNlCj4+ICsgIGNsb2NrKHJl
ZikgYW5kIEFQQiBjbG9jayhwY2xrKSwgYXMgZGVzY3JpYmVkIGluIFsxXS4KPj4gKy0gcG9ydHM6
IGEgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5lZCBpbiBbMl0u
Cj4+ICstIGdwcjogU2hvdWxkIGJlIDwmZ3ByPi4KPj4gKyAgICAgICBQaGFuZGxlIHRvIHRoZSBp
b211eGMtZ3ByIHJlZ2lvbiBjb250YWluaW5nIHRoZSBtdWx0aXBsZXhlcgo+PiArICAgICAgIGNv
bnRyb2wgcmVnaXN0ZXIuCj4+ICsKPj4gK1sxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0Cj4+ICtbMl0gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Cj4+ICsKPj4gK0V4YW1w
bGU6Cj4+ICsKPj4gKwltaXBpX2RzaTogbWlwaUAyMWUwMDAwIHsKPj4gKwkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4+ICsJCSNzaXplLWNlbGxzID0gPDA+Owo+PiArCQljb21wYXRpYmxlID0gImZz
bCxpbXg2cS1taXBpLWRzaSIsICJzbnBzLGR3LW1pcGktZHNpIjsKPj4gKwkJcmVnID0gPDB4MDIx
ZTAwMDAgMHg0MDAwPjsKPj4gKwkJaW50ZXJydXB0cyA9IDwwIDEwMiBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKPj4gKwkJZ3ByID0gPCZncHI+Owo+PiArCQljbG9ja3MgPSA8JmNsa3MgSU1YNlFETF9D
TEtfTUlQSV9DT1JFX0NGRz4sCj4+ICsJCQkgPCZjbGtzIElNWDZRRExfQ0xLX01JUElfSVBHPjsK
Pj4gKwkJY2xvY2stbmFtZXMgPSAicmVmIiwgInBjbGsiOwo+PiArCQlzdGF0dXMgPSAib2theSI7
Cj4+ICsKPj4gKwkJcG9ydHMgewo+PiArCQkJcG9ydEAwIHsKPj4gKwkJCQlyZWcgPSA8MD47Cj4+
ICsJCQkJbWlwaV9tdXhfMDogZW5kcG9pbnQgewo+PiArCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
JmlwdTFfZGkwX21pcGk+Owo+PiArCQkJCX07Cj4+ICsJCQl9Owo+PiArCQkJcG9ydEAxIHsKPj4g
KwkJCQlyZWcgPSA8MT47Cj4+ICsJCQkJbWlwaV9tdXhfMTogZW5kcG9pbnQgewo+PiArCQkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmlwdTFfZGkxX21pcGk+Owo+PiArCQkJCX07Cj4+ICsJCQl9Owo+
PiArCQl9Owo+PiArICAgICAgICB9Owo+PiAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
