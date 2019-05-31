Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049F3091A
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 09:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A5389139;
	Fri, 31 May 2019 07:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0176890EF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 07:00:30 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8ECD020000D;
 Fri, 31 May 2019 07:00:24 +0000 (UTC)
Date: Fri, 31 May 2019 09:00:23 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v9 2/9] dt-bindings: sun6i-dsi: Add A64 DPHY compatible
 (w/ A31 fallback)
Message-ID: <20190531070023.2vj4sq4kk3aji25d@flea>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
 <20190529105615.14027-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529105615.14027-3-jagan@amarulasolutions.com>
User-Agent: NeoMutt/20180716
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
Cc: devicetree@vger.kernel.org, Ryan Pannell <ryan@osukl.com>,
 bshah@mykolab.com, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDQ6MjY6MDhQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiBUaGUgTUlQSSBEU0kgUEhZIGNvbnRyb2xsZXIgb24gQWxsd2lubmVyIEE2NCBpcyBzaW1p
bGFyCj4gb24gdGhlIG9uZSBvbiBBMzEuCj4KPiBBZGQgQTY0IGNvbXBhdGlibGUgYW5kIGFwcGVu
ZCBBMzEgY29tcGF0aWJsZSBhcyBmYWxsYmFjay4KPgo+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRl
a2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0Cj4gaW5kZXggOTg3
NzM5OGJlNjlhLi5kMGNlNTFmZWExMDMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQK
PiBAQCAtMzgsNiArMzgsNyBAQCBELVBIWQo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAgIC0g
Y29tcGF0aWJsZTogdmFsdWUgbXVzdCBiZSBvbmUgb2Y6Cj4gICAgICAqIGFsbHdpbm5lcixzdW42
aS1hMzEtbWlwaS1kcGh5Cj4gKyAgICAqIGFsbHdpbm5lcixzdW41MGktYTY0LW1pcGktZHBoeSwg
YWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkKPiAgICAtIHJlZzogYmFzZSBhZGRyZXNzIGFu
ZCBzaXplIG9mIG1lbW9yeS1tYXBwZWQgcmVnaW9uCj4gICAgLSBjbG9ja3M6IHBoYW5kbGVzIHRv
IHRoZSBjbG9ja3MgZmVlZGluZyB0aGUgRFNJIGVuY29kZXIKPiAgICAgICogYnVzOiB0aGUgRFNJ
IGludGVyZmFjZSBjbG9jawoKQW5kIHRoaXMgb25lIHNob3VsZCBiZToKCmNvbXBhdGlibGU6CiAg
b25lT2Y6CiAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeQogICAgLSBp
dGVtczoKICAgICAgLSBjb25zdDogYWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kcGh5CiAgICAg
IC0gY29uc3Q6IGFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kcGh5CgpNYXhpbWUKCi0tCk1heGlt
ZSBSaXBhcmQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
