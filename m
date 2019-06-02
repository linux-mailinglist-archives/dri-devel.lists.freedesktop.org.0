Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026183248E
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 20:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C458933D;
	Sun,  2 Jun 2019 18:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7E98933D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 18:23:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 65491803AE;
 Sun,  2 Jun 2019 20:23:21 +0200 (CEST)
Date: Sun, 2 Jun 2019 20:23:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add King Display KD035G6-54NT
 panel documentation
Message-ID: <20190602182319.GA10060@ravnborg.org>
References: <20190602164844.15659-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190602164844.15659-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=N0__P5O1gIEKdnP-nygA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCkFzIGFscmVhZHkgc2FpZCBvbiBpcmMsIG1heWJlIGFkZDoKCiJUaGUgZ2VuZXJp
YyBiaW5kaW5ncyBmb3IgdGhlIFNQSSBzbGF2ZXMgZG9jdW1lbnRlZCBpbiBbMV0gYWxzbyBhcHBs
aWVzIgphcyB3ZSBzZWUgb3RoZXIgYmluZGluZyB1c2luZyBzcGkgYWxyZWFkeSBkb2VzLgoKTG9v
a2luZyBhdDogc2l0cm9uaXgsc3Q3Nzg5di50eHQKc2hvdWxkIHJlZyBhbHNvIGJlIHNwZWNpZmll
ZCBhcyByZXF1aXJlZCBoZXJlPwoKCVNhbQoKT24gU3VuLCBKdW4gMDIsIDIwMTkgYXQgMDY6NDg6
NDNQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiBUaGUgS0QwMzVHNi01NE5UIGlzIGEg
My41IiAzMjB4MjQwIDI0LWJpdCBURlQgTENEIHBhbmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IC0tLQo+ICAuLi4vcGFuZWwva2lu
Z2Rpc3BsYXksa2QwMzVnNi01NG50LnR4dCAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9raW5nZGlz
cGxheSxrZDAzNWc2LTU0bnQudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tpbmdkaXNwbGF5LGtkMDM1ZzYtNTRudC50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9raW5n
ZGlzcGxheSxrZDAzNWc2LTU0bnQudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmE2ZTRhOWFmNDkyNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9raW5nZGlzcGxheSxrZDAz
NWc2LTU0bnQudHh0Cj4gQEAgLTAsMCArMSwyNyBAQAo+ICtLaW5nIERpc3BsYXkgS0QwMzVHNi01
NE5UIDMuNSIgKDMyMHgyNDAgcGl4ZWxzKSAyNC1iaXQgVEZUIExDRCBwYW5lbAo+ICsKPiArUmVx
dWlyZWQgcHJvcGVydGllczoKPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImtpbmdkaXNwbGF5
LGtkMDM1ZzYtNTRudCIKPiArLSBwb3dlci1zdXBwbHk6IFNlZSBwYW5lbC1jb21tb24udHh0Cj4g
Ky0gcmVzZXQtZ3Bpb3M6IFNlZSBwYW5lbC1jb21tb24udHh0Cj4gKwo+ICtPcHRpb25hbCBwcm9w
ZXJ0aWVzOgo+ICstIGJhY2tsaWdodDogc2VlIHBhbmVsLWNvbW1vbi50eHQKPiArCj4gK0V4YW1w
bGU6Cj4gKwo+ICsmc3BpIHsKPiArCWRpc3BsYXktcGFuZWwgewo+ICsJCWNvbXBhdGlibGUgPSAi
a2luZ2Rpc3BsYXksa2QwMzVnNi01NG50IjsKPiArCQlyZWcgPSA8MD47Cj4gKwo+ICsJCXNwaS1t
YXgtZnJlcXVlbmN5ID0gPDMxMjUwMDA+Owo+ICsJCXNwaS0zd2lyZTsKPiArCQlzcGktY3MtaGln
aDsKPiArCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwZSAyIEdQSU9fQUNUSVZFX0xPVz47Cj4gKwo+
ICsJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiArCQlwb3dlci1zdXBwbHkgPSA8JmxkbzY+
Owo+ICsJfTsKPiArfTsKPiAtLSAKPiAyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
