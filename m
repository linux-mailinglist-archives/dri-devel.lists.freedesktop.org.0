Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E89812E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 19:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B666E34E;
	Wed, 21 Aug 2019 17:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23506E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 17:24:26 +0000 (UTC)
Received: from wsip-184-188-36-2.sd.sd.cox.net ([184.188.36.2]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1i0ULQ-0003jl-3C; Wed, 21 Aug 2019 19:24:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Wed, 21 Aug 2019 19:24:19 +0200
Message-ID: <174045783.D6yh98NvXX@phil>
In-Reply-To: <20190820195959.6126-1-robh@kernel.org>
References: <20190820195959.6126-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRGllbnN0YWcsIDIwLiBBdWd1c3QgMjAxOSwgMjE6NTk6NTYgQ0VTVCBzY2hyaWViIFJvYiBI
ZXJyaW5nOgo+IFRoaXMgc2VyaWVzIGNvbnZlcnRzIHRoZSB2YXJpb3VzIEFybSBNYWxpIEdQVSBi
aW5kaW5ncyB0byB1c2UgdGhlIERUCj4gc2NoZW1hIGZvcm1hdC4KPiAKPiBUaGUgTWlkZ2FyZCBh
bmQgQmlmcm9zdCBiaW5kaW5ncyBnZW5lcmF0ZSB3YXJuaW5ncyBvbiAnaW50ZXJydXB0LW5hbWVz
Jwo+IGJlY2F1c2UgdGhlcmUncyBhbGwgZGlmZmVyZW50IG9yZGVyaW5nLiBUaGUgVXRnYXJkIGJp
bmRpbmcgZ2VuZXJhdGVzIAo+IHdhcm5pbmdzIG9uIFJvY2tjaGlwIHBsYXRmb3JtcyBiZWNhdXNl
ICdjbG9jay1uYW1lcycgb3JkZXIgaXMgcmV2ZXJzZWQuCgpBcmUgeW91IHBsYW5uaW5nIG9uIHNl
bmRpbmcgZml4ZXMgZm9yIHRoZXNlLCBzaG91bGQgSSBqdXN0IGNoYW5nZSB0aGUKb3JkZXJpbmcg
bXlzZWxmPwoKCj4gUm9iIEhlcnJpbmcgKDMpOgo+ICAgZHQtYmluZGluZ3M6IENvbnZlcnQgQXJt
IE1hbGkgTWlkZ2FyZCBHUFUgdG8gRFQgc2NoZW1hCj4gICBkdC1iaW5kaW5nczogQ29udmVydCBB
cm0gTWFsaSBCaWZyb3N0IEdQVSB0byBEVCBzY2hlbWEKPiAgIGR0LWJpbmRpbmdzOiBDb252ZXJ0
IEFybSBNYWxpIFV0Z2FyZCBHUFUgdG8gRFQgc2NoZW1hCgpBY2tlZC1ieTogSGVpa28gU3R1ZWJu
ZXIgPGhlaWtvQHNudGVjaC5kZT4KCgpUaGFua3MgZm9yIGRvaW5nIHRoZSBjb252ZXJzaW9uCkhl
aWtvCgoKPiAgLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnR4dCAgICAgICAgIHwg
IDkyIC0tLS0tLS0tLS0KPiAgLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwg
ICAgICAgIHwgMTE1ICsrKysrKysrKysrKwo+ICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1p
ZGdhcmQudHh0ICAgICAgICAgfCAxMTkgLS0tLS0tLS0tLS0tLQo+ICAuLi4vYmluZGluZ3MvZ3B1
L2FybSxtYWxpLW1pZGdhcmQueWFtbCAgICAgICAgfCAxNjUgKysrKysrKysrKysrKysrKysKPiAg
Li4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQudHh0ICAgICAgICAgIHwgMTI5IC0tLS0t
LS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnlhbWwgICAgICAg
ICB8IDE2NiArKysrKysrKysrKysrKysrKysKPiAgNiBmaWxlcyBjaGFuZ2VkLCA0NDYgaW5zZXJ0
aW9ucygrKSwgMzQwIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnR4dAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0s
bWFsaS1iaWZyb3N0LnlhbWwKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlk
Z2FyZC55YW1sCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnlhbWwK
PiAKPiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
