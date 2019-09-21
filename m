Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521ADBA278
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351C46E155;
	Sun, 22 Sep 2019 12:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EEE6E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 19:07:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8458B2002D;
 Sat, 21 Sep 2019 21:07:09 +0200 (CEST)
Date: Sat, 21 Sep 2019 21:07:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20190921190708.GB32133@ravnborg.org>
References: <20190917161214.2913-1-aford173@gmail.com>
 <20190917161214.2913-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917161214.2913-2-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=TaQvIJAheEgyp50s76YA:9 a=CjuIK1q_8ugA:10
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 adam.ford@logicpd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbS4KCkdvb2Qgd2l0aCBldmVuIG1vcmUgcGFuZWxzLgpCdXQgZm9yIG5ldyBiaW5kaW5n
cyBwbGVhc2UgdXNlIG1ldGEtc2NoZW1hICgueWFtbCkgZm9ybWF0LgpUaGlzIGlzIHdoYXQgd2Ug
dXNlIGZvciBuZXcgYmluZGluZ3MgYXMgaXQgYWxsb3dzIGJldHRlcgp2YWxpZGF0aW9uLgoKCVNh
bQoKT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTE6MTI6MTJBTSAtMDUwMCwgQWRhbSBGb3JkIHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIG9mIGRldmljZSB0cmVlIGJpbmRp
bmdzIGZvciB0aGUgV1ZHQSBwYW5lbAo+IExvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbG9n
aWNwZCx0eXBlMjgudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvbG9naWNwZCx0eXBlMjgudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjgyOWZjNTIxMGUwNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5cGUy
OC50eHQKPiBAQCAtMCwwICsxLDI2IEBACj4gK0xvZ2ljIFBEIFR5cGUgMjggNC4zIiBXUVZHQSBU
RlQgTENEIHBhbmVsCj4gKwo+ICtUaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBz
aW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVkCj4gK2luIHNpbXBsZS1wYW5l
bC50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICst
IGNvbXBhdGlibGU6IHNob3VsZCBiZSAibG9naWNwZCx0eXBlMjgiCj4gKwo+ICtPcHRpb25hbCBw
cm9wZXJ0aWVzOgo+ICstIHBvd2VyLXN1cHBseTogcmVndWxhdG9yIHRvIHByb3ZpZGUgdGhlIHN1
cHBseSB2b2x0YWdlCj4gKy0gZW5hYmxlLWdwaW9zOiBHUElPIHBpbiB0byBlbmFibGUgb3IgZGlz
YWJsZSB0aGUgcGFuZWwKPiArLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBk
ZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCklzIGl0IGNvcnJlY3QgdGhhdCB0aGVzZSBhcmUg
b3B0aW9uYWwgZm9yIHRoZSBkZXNjcml2YmVkIHBhbmVsPwoKPiArCj4gK09wdGlvbmFsIG5vZGVz
Ogo+ICstIFZpZGVvIHBvcnQgZm9yIFJHQiBpbnB1dC4KPiArCj4gK0V4YW1wbGU6Cj4gKwlsY2Qw
OiBkaXNwbGF5IHsKPiArCQljb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IjsKPiArCQllbmFi
bGUtZ3Bpb3MgPSA8JmdwaW81IDI3IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsJCXBvcnQgewo+ICsJ
CQlsY2RfaW46IGVuZHBvaW50IHsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47
Cj4gKwkJCX07Cj4gKwkJfTsKPiArCX07Cj4gLS0gCj4gMi4xNy4xCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
